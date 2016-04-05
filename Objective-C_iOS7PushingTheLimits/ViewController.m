//
//  ViewController.m
//  Objective-C_iOS7PushingTheLimits
//
//  Created by Yuen-iMac on 16/4/5.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import "ViewController.h"

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
     第三个参数是缩放比例，iPhone 4是2.0，其他是1.0。虽然这里可以用[UIScreen mainScreen].scale来获取，但实际上设为0后，系统就会自动设置正确的比例了。
     值得一提的是，图像本身也有缩放比例，普通的图像是1.0(除了UIImage imageNamed:外，大部分API都只能获得这种图像，而且缩放比例是不可更改的)，高清图像是2.0。图像的点和屏幕的像素就是依靠2者的缩放比例来计算的，例如普通图像在视网膜显示屏上是1:4，而高清图像在视网膜显示屏上则是1:1。
     接下来的drawInRect:把图像画到了当前的image context里，这时就完成了解压缩和重采样的工作了。然后再从image context里获取新的image，这个image的缩放比例也能正确地和设备匹配。
     */
    UIGraphicsBeginImageContextWithOptions(self.view.frame.size, YES, scale);
}

@end
