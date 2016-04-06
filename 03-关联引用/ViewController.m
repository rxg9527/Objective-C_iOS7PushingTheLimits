//
//  ViewController.m
//  03-关联引用
//
//  Created by Yuen-iMac on 16/4/5.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *buttonLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)doSomething:(id)sender {
}

@end
