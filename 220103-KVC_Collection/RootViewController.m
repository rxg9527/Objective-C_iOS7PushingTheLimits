//
//  RootViewController.m
//  Objective-C_iOS7PushingTheLimits
//
//  Created by Yuen on 16/4/10.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import "RootViewController.h"
#import "TwoTimesArray.h"
#import "TableViewController.h"

@interface RootViewController ()

@property (nonatomic, readwrite, strong) TwoTimesArray *array;

@end

@implementation RootViewController

- (void)awakeFromNib {
    self.array = [TwoTimesArray new];
}

- (IBAction)performAdd:(UIButton *)sender {
    [self.array incrementCount];
    [self refresh];
}

- (void)refresh {
    /**
     *  在TwoTimesArray这个类中没有『numbers』这个属性，KVC 会自动为你生成一个代理
     */
    NSArray *items = [self.array valueForKey:@"numbers"];
    /**
     *  KVC 查找 countOfNumbers 
     */
    NSUInteger count = items.count;
    self.countLabel.text = [NSString stringWithFormat:@"%zd", count];
    self.entryLabel.text = [[items lastObject] description];
}

- (void)viewWillAppear:(BOOL)animated {
    [self refresh];
    [super viewWillAppear:animated];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [(TableViewController *)segue.destinationViewController setArray:self.array];
}

@end
