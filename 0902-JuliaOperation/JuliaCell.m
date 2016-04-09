//
//  JuliaCell.m
//  Objective-C_iOS7PushingTheLimits
//
//  Created by Yuen on 16/4/9.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import "JuliaCell.h"
#import "JuliaOperations.h"

@interface JuliaCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic, readwrite, strong) NSMutableArray *operations;

@end

@implementation JuliaCell

- (void)configureWithSeed:(NSUInteger)seed
                    queue:(NSOperationQueue *)queue
                   scales:(NSArray *)scales {
    
}

@end
