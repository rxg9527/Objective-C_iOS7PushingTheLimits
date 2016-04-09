//
//  ViewController.m
//  0902-JuliaOperation
//
//  Created by Yuen on 16/4/9.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import "ViewController.h"
#import "JuliaCell.h"
#include <sys/sysctl.h>

@interface ViewController ()

@property (nonatomic, readwrite, strong) NSOperationQueue *queue;
@property (nonatomic, readwrite, strong) NSArray *scales;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.queue = [NSOperationQueue new];
    self.queue.maxConcurrentOperationCount = countOfCores();
    
    [self useAllScales];
}

unsigned int countOfCores() {
    unsigned int ncpu;
    size_t len = sizeof(ncpu);
    sysctlbyname("hw.ncpu", &ncpu, &len, NULL, 0);
    
    return ncpu;
}

- (void)useAllScales {
    CGFloat maxScale = [[UIScreen mainScreen] scale];
    NSUInteger kIterations = 6;
    CGFloat minScale = maxScale/pow(2, kIterations);
    
    NSMutableArray *scales = [NSMutableArray new];
    for (CGFloat scale = minScale; scale <= maxScale; scale *= 2) {
        [scales addObject:@(scale)];
    }
    self.scales = scales;
}

#pragma mark - UICollectionViewDataSource
// 返回每一组有多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1000;
}

// 返回每一个cell
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JuliaCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JuliaCell" forIndexPath:indexPath];
    [cell configureWithSeed:indexPath.row queue:self.queue scales:self.scales];
    return cell;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.queue cancelAllOperations];
    [self useMinimumScales];
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    [self useAllScales];
}

- (void)useMinimumScales {
    self.scales = [self.scales subarrayWithRange:NSMakeRange(0, 1)];
}

@end
