//
//  XJButton.h
//  XJButton
//
//  Created by LXJ on 2018/1/17.
//  Copyright © 2018年 LianLuo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, XJCustomButtontype) {
    CustomButtonTypeImageTop = 0,
    CustomButtonTypeImageBottom,
    CustomButtonTypeImageLeft,
    CustomButtonTypeImageRight
};

IB_DESIGNABLE
@interface XJButton : UIButton

@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;
@property (nonatomic, strong) IBInspectable UIColor *borderColor;
@property (nonatomic, assign) IBInspectable CGFloat borderWidth;

@property (nonatomic, assign) IBInspectable CGFloat space;      ///布局时中间的space
@property (nonatomic, assign) IBInspectable NSInteger customButtonType;

@end
