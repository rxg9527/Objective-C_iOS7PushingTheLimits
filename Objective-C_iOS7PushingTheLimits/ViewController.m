//
//  ViewController.m
//  Objective-C_iOS7PushingTheLimits
//
//  Created by Yuen-iMac on 16/4/5.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+ImageEffects.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;
@property (nonatomic, strong) CALayer *layer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)didTapShowButton:(UIButton *)sender {
    
    self.layer = [CALayer layer];
    self.layer.frame = CGRectMake(80, 100, 160, 160);
    [self.view.layer addSublayer:self.layer];
    
    CGFloat scale = [UIScreen mainScreen].scale;
    /**
     *       
     void UIGraphicsBeginImageContext(CGSize size);
     创建一个基于位图的上下文（context）,并将其设置为当前上下文(context)。
     参数size为新创建的位图上下文的大小。它同时是由UIGraphicsGetImageFromCurrentImageContext函数返回的图形大小。
     该函数的功能同UIGraphicsBeginImageContextWithOptions的功能相同，相当于UIGraphicsBeginImageContextWithOptions的opaque参数为NO,scale因子为1.0。
     
     UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale);
     size——同UIGraphicsBeginImageContext
     opaque—透明开关，如果图形完全不用透明，设置为YES以优化位图的存储。
     scale—–缩放因子
     
     这里需要判断一下UIGraphicsBeginImageContextWithOptions是否为NULL，因为它是iOS 4.0才加入的。
     由于JPEG图像是不透明的，所以第二个参数就设为YES。
     第三个参数是缩放比例。虽然这里可以用[UIScreen mainScreen].scale来获取，但实际上设为0后，系统就会自动设置正确的比例了。
     值得一提的是，图像本身也有缩放比例，普通的图像是1.0(除了UIImage imageNamed:外，大部分API都只能获得这种图像，而且缩放比例是不可更改的)，高清图像是2.0。图像的点和屏幕的像素就是依靠2者的缩放比例来计算的，例如普通图像在视网膜显示屏上是1:4，而高清图像在视网膜显示屏上则是1:1。
     接下来的drawInRect:把图像画到了当前的image context里，这时就完成了解压缩和重采样的工作了。然后再从image context里获取新的image，这个image的缩放比例也能正确地和设备匹配。
     */
    UIGraphicsBeginImageContextWithOptions(self.view.frame.size, YES, scale);
    /**
     *  
     有4个函数能够实现对view内容的获取
     - (void)renderInContext:(CGContextRef)ctx
     - (BOOL)drawViewHierarchyInRect:(CGRect)rect afterScreenUpdates:(BOOL)afterUpdates
     - (UIView *)snapshotViewAfterScreenUpdates:(BOOL)afterUpdates
     - (UIView *)resizableSnapshotViewFromRect:(CGRect)rect afterScreenUpdates:(BOOL)afterUpdates withCapInsets:(UIEdgeInsets)capInsets
     这些方法都是UIView提供的方法，第二个以后的方法都是iOS7以后提供的方法，第一个方法，由于对于毛玻璃等高端酷炫的效果支持不太好（容易出现黑块）并且我们都面向iOS7吧，所以就不用了。后面两个snapshot的方法，会根据当前的视图创建一个snapshot的视图（静态的，啥也不能操作）但是这两个方法没办法处理正在进行中的动画和比较复杂的效果（其实就是毛玻璃啦）。
     */
    [self.view drawViewHierarchyInRect:self.view.frame afterScreenUpdates:NO];
    
    /**
     *  
     有许多方式获得一个图形上下文，这里我介绍两种最为常用的获取方法。
     
     第一种方法就是创建一个图片类型的上下文。调用UIGraphicsBeginImageContextWithOptions函数就可获得用来处理图片的图形上下文。利用该上下文，你就可以在其上进行绘图，并生成图片。调用UIGraphicsGetImageFromCurrentImageContext函数可从当前上下文中获取一个UIImage对象。记住在你所有的绘图操作后别忘了调用UIGraphicsEndImageContext函数关闭图形上下文。
     
    第二种方法是利用cocoa为你生成的图形上下文。当你子类化了一个UIView并实现了自己的drawRect：方法后，一旦drawRect：方法被调用，Cocoa就会为你创建一个图形上下文，此时你对图形上下文的所有绘图操作都会显示在UIView上。
     
    判断一个上下文是否为当前图形上下文需要注意的几点：
     
     UIGraphicsBeginImageContextWithOptions函数不仅仅是创建了一个适用于图形操作的上下文，并且该上下文也属于当前上下文。
     当drawRect方法被调用时，UIView的绘图上下文属于当前图形上下文。
     回调方法所持有的context：参数并不会让任何上下文成为当前图形上下文。此参数仅仅是对一个图形上下文的引用罢了。
     */
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // 裁剪截图
    CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage, CGRectMake(self.layer.frame.origin.x * scale, self.layer.frame.origin.y * scale, self.layer.frame.size.width * scale, self.layer.frame.size.height * scale));
    image = [UIImage imageWithCGImage:imageRef];
    
    // 添加效果
    image = [image applyBlurWithRadius:50.0f
                             tintColor:[UIColor colorWithRed:0 green:1 blue:0 alpha:0.1]
                 saturationDeltaFactor:2.0f
                             maskImage:nil];
    
    self.layer.contents = (__bridge id)(image.CGImage);
}

@end
