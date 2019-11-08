//
//  myView.m
//  基础动画
//
//  Created by 徐金城 on 2019/11/8.
//  Copyright © 2019 xujincheng. All rights reserved.
//

#import "myView.h"

@implementation myView

- (void)drawRect:(CGRect)rect
{
     //1.获取上下文
     CGContextRef ctx=UIGraphicsGetCurrentContext();
     //2.绘制图形
     CGContextAddEllipseInRect(ctx, CGRectMake(50, 50, 100, 100));
     //设置属性（颜色）
     //    [[UIColor yellowColor]set];
     CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);

     //3.渲染
     CGContextFillPath(ctx);
}

@end
