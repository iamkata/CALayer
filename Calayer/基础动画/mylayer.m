//
//  mylayer.m
//  基础动画
//
//  Created by 徐金城 on 2019/11/8.
//  Copyright © 2019 xujincheng. All rights reserved.
//

#import "mylayer.h"

@implementation mylayer

//重写该方法，在该方法内绘制图形
-(void)drawInContext:(CGContextRef)ctx
{
    //1.绘制图形
    //画一个圆
    CGContextAddEllipseInRect(ctx, CGRectMake(50, 50, 100, 100));
    //设置属性（颜色）
    //[[UIColor yellowColor]set];
    CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);
    //2.渲染
    CGContextFillPath(ctx);
}

@end
