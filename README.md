# XJButton
在项目中我们有时候可能会碰到一些图片和文字的不同排版方式，而且还需要这块区域可以点击，但用button的话，只有默认的图片在左文字在右的方式，所以不能满足其他的需求，这个XJButton就解决了图片和文字同时出现的四种不同方式，而且支持IB可视化编辑，具体效果看图和代码。

![](https://github.com/li125434104/XJButton/raw/master/XJButton/pic/example.jpg)

```
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
```
