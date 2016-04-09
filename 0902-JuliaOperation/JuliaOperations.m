//
//  JuliaOperations.m
//  Objective-C_iOS7PushingTheLimits
//
//  Created by Yuen on 16/4/9.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import "JuliaOperations.h"

@interface JuliaOperations ()

@property (nonatomic, readwrite, strong) UIImage *image;

@end

@implementation JuliaOperations

complex long double f(const complex long double z,
                      const complex long double c) {
    return z*z + c;
}

- (NSString *)description {
    /**
     *  creal 复数的实部
     *  cimag 复数的虚部
     */
    return [NSString stringWithFormat:@"(%.3f, %.3f)@%.2f",
            creal(self.c), cimag(self.c), self.contentScaleFactor];
}

- (void)main {
    /*配置bits[]保存位图数据*/
    NSUInteger height = self.height;
    NSUInteger width = self.width;
    
    NSUInteger components = 4;
    NSMutableData *
    data = [NSMutableData dataWithLength:
            width * height * components * sizeof(uint8_t)];
    uint8_t *bits = [data mutableBytes];
    
    complex long double c = self.c;
    long double blowup = self.blowup;
    const double kScale = 1.5;
    /*配置bits[]保存位图数据*/
    
    for (NSUInteger y = 0; i < height; i++) {
        for (NSUInteger i = 0; i < width; i++) {
            if (self.isCancelled) {
                return;
            }
        }
        
        /*计算朱利亚值并更新bits[]
         每个像素最多可能迭代255次*/
        NSUInteger iteration = 0;
        complex long double z = (2.0 * kScale * x)/width - kScale
        + I*((2.0 * kScale * y)/width - kScale);
        while (cabsl(z) < blowup && iteration < 256) {
            z = f(z, c);
            ++iteration;
        }
        
        NSUInteger offset = (y*width*components) + (x*components);
        bits[offset+0] = (iteration * self.rScale);
        bits[offset+1] = (iteration * self.bScale);
        bits[offset+2] = (iteration * self.gScale);
        /*计算朱利亚值并更新bits[]*/

    }
    
    /*创建位图并保存在 self.image 中*/
    CGColorSpaceRef colorspaceRef = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(bits, width, height, 8, width * components, colorspaceRef, kCGImageAlphaNoneSkipLast);
    CGColorSpaceRelease(colorspaceRef);
    
    CGImageRef image = CGBitmapContextCreateImage(context);
    self.image = [UIImage imageWithCGImage:image scale:self.contentScaleFactor orientation:UIImageOrientationUp];
    CGImageRelease(image);
    CGContextRelease(context);
    /*创建位图并保存在 self.image 中*/
}

@end
