//
//  ViewController.m
//  基础动画
//
//  Created by 徐金城 on 2019/11/7.
//  Copyright © 2019 xujincheng. All rights reserved.
//

#import "ViewController.h"
#import "mylayer.h"
#import "myView.h"

@interface ViewController () <CALayerDelegate>

@property(nonatomic,strong)CALayer *layer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[self baseProperties];
    //[self addLayer];
    //[self aboutSublayer];
    //[self customLayer];
    [self customView];
    //[self customLayerWithDelegate];
}

- (void)customLayerWithDelegate {
    //1.创建自定义的layer
    CALayer *layer=[CALayer layer];
    //2.设置layer的属性
    layer.backgroundColor=[UIColor brownColor].CGColor;
    layer.bounds=CGRectMake(0, 0, 200, 150);
    layer.anchorPoint=CGPointZero;
    layer.position=CGPointMake(100, 100);
    layer.cornerRadius=20;
    layer.shadowColor=[UIColor blackColor].CGColor;
    layer.shadowOffset=CGSizeMake(10, 20);
    layer.shadowOpacity=0.6;
    //设置代理
    layer.delegate = self;
    [layer setNeedsDisplay];
    //3.添加layer
    [self.view.layer addSublayer:layer];
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    //1.绘制图形
    //画一个圆
    CGContextAddEllipseInRect(ctx, CGRectMake(50, 50, 100, 100));
    //设置属性（颜色）
    //    [[UIColor yellowColor]set];
    CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);

    //2.渲染
    CGContextFillPath(ctx);
}

- (void)customView {
    myView *myV = [[myView alloc] initWithFrame:CGRectMake(50, 50, 200, 200)];
    myV.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:myV];
}

- (void)customLayer {
    //1.创建自定义的layer
    mylayer *layer=[mylayer layer];
    //2.设置layer的属性
    layer.backgroundColor = [UIColor brownColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 200, 150);
    layer.anchorPoint = CGPointZero;
    layer.position = CGPointMake(100, 100);
    layer.cornerRadius = 20;
    layer.shadowColor = [UIColor blackColor].CGColor;
    layer.shadowOffset = CGSizeMake(10, 20);
    layer.shadowOpacity = 0.6;

    [layer setNeedsDisplay];
    //3.添加layer
    [self.view.layer addSublayer:layer];
}

- (void)aboutSublayer {
    NSLog(@"star-%@",self.view.layer.sublayers);
    
    CALayer *layer=[CALayer layer];
    //2.设置layer的属性(一定要设置位置，颜色属性才能显示出来)
    layer.backgroundColor=[UIColor brownColor].CGColor;
    layer.bounds=CGRectMake(0, 0, 200, 200);
    layer.position=CGPointMake(100, 100);

    //3.把layer添加到界面上
    [self.view.layer addSublayer:layer];
    
    //添加btn按钮
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(100, 100, 100, 100);
//    btn.backgroundColor = [UIColor redColor];
//    [self.view addSubview:btn];
    
    NSLog(@"end-%@",self.view.layer.sublayers);
}

- (void)addLayer {
    //创建图层
    CALayer *mylayer = [CALayer layer];
    //设置图层属性
    mylayer.backgroundColor = [UIColor brownColor].CGColor;
    mylayer.bounds = CGRectMake(0, 0, 150, 100);
    //显示位置
    mylayer.position = CGPointMake(100, 100);
    mylayer.anchorPoint = CGPointZero;
    mylayer.cornerRadius = 20;
    //添加图层
    [self.view.layer addSublayer:mylayer];
    self.layer = mylayer;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    [CATransaction setAnimationDuration:5];
    //隐式动画
    self.layer.bounds = CGRectMake(0, 0, 200, 60);
    self.layer.backgroundColor = [UIColor yellowColor].CGColor;
    [CATransaction commit];
}

- (void)baseProperties {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 150, 150)];
    view.backgroundColor = [UIColor yellowColor];
    view.layer.borderWidth = 3;
    view.layer.borderColor = [UIColor redColor].CGColor;
    view.layer.cornerRadius = 30;
    
//contents是id类型，可以接受内容，上面的实例让layer显示一张图片，仔细观察可以发现四个圆角的部分露了一个角出来。
    //那是因为设置的image不是展示在主图层上的，而是显示在子图层上的。可以通过设置一个范围，设置超出主图层的部分把它给剪切掉。
    view.layer.contents=(id)[UIImage imageNamed:@"me"].CGImage;
    
    //UI框架中使用的方法
    //view.clipsToBounds=YES;
    
    //把超过根层以外的东西都给裁剪掉(UIview自带的层,我们称它是根层)
    //view.layer.masksToBounds = YES;
    
    //设置阴影，不光需要设置阴影颜色，还应该设置阴影的偏移位和透明度。
    //因为如果不设置偏移位的话，那么阴影和layer完全重叠，且默认透明度为0（即完全透明）。
    //如果设置了超过主图层的部分减掉，则设置阴影不会有显示效果。
    
    //设置阴影的颜色
    view.layer.shadowColor=[UIColor blackColor].CGColor;
    //设置阴影的偏移量，如果为正数，则代表为往右边偏移
    view.layer.shadowOffset=CGSizeMake(15, 5);
    //设置阴影的透明度(0~1之间，0表示完全透明)
    view.layer.shadowOpacity=0.6;
    //设置阴影的模糊的半径
    view.layer.shadowRadius = 5;
    
    
    //通过UIView设置（2D效果）
    //view.transform = CGAffineTransformMakeTranslation(0, -100);
    
    //通过layer来设置（3D效果,x，y，z三个方向）
    view.layer.transform=CATransform3DMakeTranslation(100, 20, 0);
    
    //通过KVC来设置,通过KVC一般是做快速旋转,平移,缩放 - 更多关于KVC可以赋值的属性请参考官方文档
    NSValue *v=[NSValue valueWithCATransform3D:CATransform3DMakeTranslation(100, 20, 0)];
    [view.layer setValue:v forKeyPath:@"transform"];
    //如果是只需要设置在某一个方向上的移动，可以参考下面的代码
    //在x的方向上向左移动100
    [view.layer setValue:@(-100) forKeyPath:@"transform.translation.x"];
    //旋转一个弧度
    view.layer.transform = CATransform3DMakeRotation(M_PI_4, 1, 1, 0.5);
    [self.view addSubview:view];
}

@end
