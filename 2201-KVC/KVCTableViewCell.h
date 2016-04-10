//
//  KVCTableViewCell.h
//  Objective-C_iOS7PushingTheLimits
//
//  Created by Yuen on 16/4/10.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KVCTableViewCell : UITableViewCell

- (instancetype)initWithReuseIdentifier:(NSString*)identifier;

// 要显示的对象
@property (nonatomic, readwrite, strong) id object;
// 要显示的对象的属性名
@property (nonatomic, readwrite, copy) NSString *property;

@end
