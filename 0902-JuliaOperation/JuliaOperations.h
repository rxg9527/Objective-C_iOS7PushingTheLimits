//
//  JuliaOperations.h
//  Objective-C_iOS7PushingTheLimits
//
//  Created by Yuen on 16/4/9.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <complex.h>
#import <UIKit/UIKit.h>

@interface JuliaOperations : NSOperation

/**
 *  所有必需的数据都会在开始之前传递给操作。操作在运行过程中不需要和别的对象交互，所以就不需要加锁
    操作完成后结果保存在自身 ivar中，让使用者在 completionBlock中根据 operation 的对象取出结果，这样也是避免加锁。
    main 方法中定期检查 isCancelled 属性，以便在接收到取消事件的时候能够退出。这点很重要。可以在循环中检查，在任何相对容易停止 operation 的地方都可以检查。
 */
@property (nonatomic, readwrite, assign) NSUInteger width;
@property (nonatomic, readwrite, assign) NSUInteger height;
@property (nonatomic, readwrite, assign) complex long double c;
@property (nonatomic, readwrite, assign) complex long double blowup;
@property (nonatomic, readwrite, assign) CGFloat contentScaleFactor;
@property (nonatomic, readwrite, assign) NSUInteger rScale;
@property (nonatomic, readwrite, assign) NSUInteger gScale;
@property (nonatomic, readwrite, assign) NSUInteger bScale;
@property (nonatomic, readonly, strong) UIImage *image;

@end
