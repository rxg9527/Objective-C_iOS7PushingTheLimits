//
//  KVCTableViewController.m
//  Objective-C_iOS7PushingTheLimits
//
//  Created by Yuen on 16/4/10.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import "KVCTableViewController.h"
#import "KVCTableViewCell.h"

@implementation KVCTableViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"KVCTableViewCell";
    KVCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[KVCTableViewCell alloc] initWithReuseIdentifier:cellIdentifier];
        // 你需要每行 NSNumber 的 intValue 属性。
        // 每一行的这个属性都一样，所以在配置 cell 就可以设置属性的键
        cell.property = @"intValue";
    }
    
    /**
     *  每一行对象都是一个表示整型的 NSNumber。
        因为每一行都有不同的对象（NSNumber），所以配置 cell 时就应该改设置对象
     */
    cell.object = @(indexPath.row);
    
    return cell;
}

@end
