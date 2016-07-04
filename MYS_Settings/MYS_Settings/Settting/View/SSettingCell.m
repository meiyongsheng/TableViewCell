//
//  SSettingself.m
//  01-S
//
//  Created by apple on 13-12-23.
//  Copyright (c) 2013年 S. All rights reserved.
//
#define FONT(font)  [UIFont systemFontOfSize:font]
#define kScreenWidth    [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight   [[UIScreen mainScreen] bounds].size.height

#define label_font 13
#define labelText_font 15


#define padding 10




#import "SSettingCell.h"
#import "SSettingItem.h"
#import "UIView+Extension.h"



typedef void(^callBack)();

@interface SSettingCell()<UITextFieldDelegate,UITextViewDelegate>
@property (nonatomic, strong) UIImageView *arrow;
@property (nonatomic, strong) UISwitch *switchON;
@property (nonatomic, strong) UITextField *textField;


@property (nonatomic, strong) UIImageView *imageIcon;
@property (nonatomic, strong) UILabel *textLabelC;
@property (nonatomic, strong) UILabel *dTextLabelC;


@property (nonatomic, strong) UIView *lineView;

//内容视图

@property (nonatomic, weak) UIView *sepView;
@property CGFloat keyboardHeightOffset;
@property (strong,nonatomic) UITapGestureRecognizer *tapGes;


@property (nonatomic, assign) BOOL textfieldEdit;

@property (nonatomic, assign) BOOL textViewEdit;

@end

@implementation SSettingCell

+ (id)settingCellWithTableView:(UITableView *)tableView cellType:(UITableViewCellStyle)type

{
    static NSString *ID = @"Cell";

    SSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];

    if (cell == nil) {
        if (type < 4) {
             cell = [[SSettingCell alloc] initWithStyle:type reuseIdentifier:ID];
        }else{
            cell = [[SSettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.imageIcon];
        [self.contentView addSubview:self.dTextLabelC];
        [self.contentView addSubview:self.textLabelC];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
}



- (void)setItem:(SSettingItem *)item
{
    _item = item;
    
    if (item.isArrow) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else{
        self.accessoryType = UITableViewCellAccessoryNone;
    }
    
    if (item.type == STUITableViewCellStyleDefault) {
        self.imageView.image = [UIImage imageNamed:item.iconName];
        self.textLabel.text = item.textLabelText;
        if (item.textLabelColor) {
            self.textLabel.textColor = item.textLabelColor;
        }
        
    }else if ((item.type == STUITableViewCellStyleSubtitle) || (item.type == STUITableViewCellStyleValue2)){
        self.imageView.image = [UIImage imageNamed:item.iconName];
        self.textLabel.text = item.textLabelText;
        self.detailTextLabel.text = item.detailTextLabelText;
        if (item.textLabelColor) {
            self.textLabel.textColor = item.textLabelColor;
        }
        if (item.detailLabelColor) {
            self.detailTextLabel.textColor = item.detailLabelColor;
        }
        
    }else if (item.type == STUITableViewCellStyleValue1){
        self.imageIcon.image = [UIImage imageNamed:item.iconName];
        self.imageIcon.frame = CGRectMake(padding, padding,item.rowHeight - padding * 2,item.rowHeight - padding * 2);
        
        CGFloat y = (self.height - padding * 2) * 0.5;
        
        
        self.textLabelC.text = item.textLabelText;
        self.dTextLabelC.text = item.detailTextLabelText;
        CGFloat width = (kScreenWidth - self.imageIcon.width) * 0.5;
        
        CGFloat textWidth = [self sizeWithFont:FONT(18) maxSize:CGSizeMake(width, padding * 2) text:item.textLabelText].width;
        
        CGFloat dTextWidth = [self sizeWithFont:FONT(15) maxSize:CGSizeMake(width, padding * 2) text:item.detailTextLabelText].width;
        
         self.textLabelC.frame = CGRectMake(CGRectGetMaxX(self.imageIcon.frame) + padding * 0.5, y, textWidth, padding * 2);
        
        self.dTextLabelC.frame = CGRectMake(CGRectGetMaxX(self.textLabelC.frame) + padding * 0.5, y, dTextWidth, padding * 2);
        
        if (item.textLabelColor) {
            self.textLabelC.textColor = item.textLabelColor;
        }
        if (item.detailLabelColor) {
            self.dTextLabelC.textColor = item.detailLabelColor;
        }

    } else if (item.type == SSettingItemTypeSwitch){
        self.textLabel.text = item.textLabelText;

//        self.switchON.on = item.isSwitchON;
        self.switchON.frame = CGRectMake(KScreenWidth - 60, (item.rowHeight - padding * 3) * 0.5 , 60, padding * 3);
        [self.contentView addSubview:self.switchON];
        if (item.textLabelColor) {
            self.textLabel.textColor = item.textLabelColor;
        }
    }else if (item.type == SSettingItemTypeTextField){
        self.textField.placeholder = @"占位文字";
        self.textField.frame = CGRectMake(padding, 0, KScreenWidth - padding * 2, item.rowHeight);
        [self.contentView addSubview:self.textField];
    }else{
        
    }
}

- (UIImageView *)imageIcon{
    if (_imageIcon == nil) {
        _imageIcon = [[UIImageView alloc] init];
        _imageIcon.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageIcon;
}

//创建文本
- (UITextField *)textField{
    if (_textField == nil) {
        _textField = [[UITextField alloc] init];
        _textField.font = FONT(label_font);
        [_textField sizeToFit];
        _textField.textAlignment = NSTextAlignmentLeft;
    }
    return _textField;
}

- (UILabel *)textLabelC{
    if (_textLabelC == nil) {
        _textLabelC = [[UILabel alloc] init];
        [_textLabelC sizeToFit];
        _textLabelC.font = FONT(18);
    }
    return _textLabelC;
}


- (UILabel *)dTextLabelC{
    if (_dTextLabelC == nil) {
        _dTextLabelC = [[UILabel alloc] init];
        _dTextLabelC.textColor = [UIColor lightGrayColor];
        _dTextLabelC.font = FONT(15);
        [_dTextLabelC sizeToFit];
    }
    return _dTextLabelC;
}


- (UISwitch *)switchON{
    if (_switchON == nil) {
        _switchON = [[UISwitch alloc] init];
        [_switchON sizeToFit];
        [_switchON addTarget:self action:@selector(settingSwitchClick:) forControlEvents:UIControlEventValueChanged];
    }
    return _switchON;
}

- (UIView *)lineView{
    if (_lineView == nil) {
       _lineView = [[UIView alloc] init];
        _lineView.frame =CGRectMake(0, self.height - 0.5, KScreenWidth, 0.5);
    }
    
    return _lineView;
}

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize text:(NSString *)text{
    
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrs context:nil].size;
}


- (void)settingSwitchClick:(UISwitch *)switchOn{
    if (self.switchblock) {
        self.switchblock(switchOn.isOn);
    }
}

@end
