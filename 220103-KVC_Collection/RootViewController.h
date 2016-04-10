//
//  RootViewController.h
//  Objective-C_iOS7PushingTheLimits
//
//  Created by Yuen on 16/4/10.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (weak, nonatomic) IBOutlet UILabel *entryLabel;

- (IBAction)performAdd:(UIButton *)sender;

@end
