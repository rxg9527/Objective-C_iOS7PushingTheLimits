//
//  ViewController.m
//  2102-AttributedString
//
//  Created by Yuen on 16/4/10.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *string = @"Be Bold! And a little color wouldn’t hurt either.";
    
    NSDictionary *attrs = @{NSFontAttributeName: [UIFont systemFontOfSize:14]};
    
    NSMutableAttributedString * as = [[NSMutableAttributedString alloc] initWithString:string
                                                attributes:attrs];
    
    [as addAttribute:NSFontAttributeName
               value:[UIFont boldSystemFontOfSize:14]
               range:[string rangeOfString:@"Bold!"]];
    
    [as addAttribute:NSForegroundColorAttributeName
               value:[UIColor blueColor]
               range:[string rangeOfString:@"little color"]];
    
    [as addAttribute:NSFontAttributeName
               value:[UIFont systemFontOfSize:18]
               range:[string rangeOfString:@"little"]];
    
    [as addAttribute:NSFontAttributeName
               value:[UIFont fontWithName:@"Papyrus" size:20]
               range:[string rangeOfString:@"color"]];
    
    self.label.attributedText = as;
}

- (IBAction)toggleItalic:(UIButton *)sender {
    NSMutableAttributedString *as = self.label.attributedText.mutableCopy;
    
    [as enumerateAttribute:NSFontAttributeName
                   inRange:NSMakeRange(0, as.length)
                   options:0
                usingBlock:^(id  _Nullable value, NSRange range, BOOL * _Nonnull stop) {
                    UIFont *font = value;
                    UIFontDescriptor *descriptor = font.fontDescriptor;
                    UIFontDescriptorSymbolicTraits traits = descriptor.symbolicTraits;
                    
                    UIFontDescriptor * toggledDescriptor = [descriptor fontDescriptorWithSymbolicTraits:traits];
                    UIFont *italicFont = [UIFont fontWithDescriptor:toggledDescriptor
                                                               size:15];
                    [as addAttribute:NSFontAttributeName value:italicFont range:range];
                }];
    self.label.attributedText = as;
}

@end
