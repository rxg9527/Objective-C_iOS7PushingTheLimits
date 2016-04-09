//
//  ViewController.m
//  0902-JuliaOperation
//
//  Created by Yuen on 16/4/9.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import "ViewController.h"
#import "JuliaCell.h"

@interface ViewController ()

@property (nonatomic, readwrite, strong) NSOperationQueue *queue;
@property (nonatomic, readwrite, strong) NSArray *scales;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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
@end
