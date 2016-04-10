//
//  ZipTextView.h
//  Objective-C_iOS7PushingTheLimits
//
//  Created by Yuen on 16/4/10.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#define WEAK_SELF __weak typeof(self)weakSelf = self
#define STRONG_SELF __strong typeof(weakSelf)self = weakSelf

#import <UIKit/UIKit.h>

@interface ZipTextView : UIView

// Modify from 1 to 5 to test each revision
#define REVISION 2

- (id)initWithFrame:(CGRect)frame text:(NSString *)text;

@end
