
//
//  XJButton.m
//  XJButton
//
//  Created by LXJ on 2018/1/17.
//  Copyright © 2018年 LianLuo. All rights reserved.
//

#import "XJButton.h"

@implementation XJButton

- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    self.layer.cornerRadius = cornerRadius;
}

- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    self.layer.borderColor = borderColor.CGColor;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    self.layer.borderWidth = borderWidth;
}

- (void)setSpace:(CGFloat)space {
    _space = space;
}

- (void)setCustomButtonType:(NSInteger)customButtonType {
    _customButtonType = customButtonType;
    
    //得到imageView的和titleLabel的宽、高
    CGFloat imageWidth = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    
    //得到titleLabel的文字宽度和高度
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets titleEdgeInsets = UIEdgeInsetsZero;

    CGFloat space = self.space;
    
    switch (customButtonType) {
        case CustomButtonTypeImageTop: //图片在上文字在下
        {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight - space / 2.0, 0, 0, -labelWidth);
            titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, -imageHeight - space / 2.0, 0);
        }
            break;
        case CustomButtonTypeImageLeft: //图片在左文字在右，即默认情况
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space / 2.0, 0, 0);
            titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -space / 2.0);
        }
            break;
        case CustomButtonTypeImageBottom: //图片在下文字在上
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight - space / 2.0, -labelWidth);
            titleEdgeInsets = UIEdgeInsetsMake(-imageHeight - space / 2.0, -imageWidth, 0, 0);
        }
            break;
        case CustomButtonTypeImageRight: //图片在右文字在左
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth + space / 2.0, 0, -labelWidth - space / 2.0);
            titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth - space / 2.0, 0, imageWidth + space / 2.0);
        }
            break;
        default:
            break;
    }
    //赋值
    self.imageEdgeInsets = imageEdgeInsets;
    self.titleEdgeInsets = titleEdgeInsets;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
