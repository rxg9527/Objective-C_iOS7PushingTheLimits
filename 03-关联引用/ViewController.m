//
//  ViewController.m
//  03-关联引用
//
//  Created by Yuen-iMac on 16/4/5.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *buttonLabel;

@end

@implementation ViewController

static const char kRepresentedObject;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)doSomething:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    objc_setAssociatedObject(alert, &kRepresentedObject, sender, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"%s", __func__);
    UIButton *sender = objc_getAssociatedObject(alertView, &kRepresentedObject);
    self.buttonLabel.text = sender.titleLabel.text;
}

@end
