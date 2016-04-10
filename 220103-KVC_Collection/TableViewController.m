//
//  TableViewController.m
//  Objective-C_iOS7PushingTheLimits
//
//  Created by Yuen on 16/4/10.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import "TableViewController.h"
#import "TwoTimesArray.h"

@implementation TableViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Demonstrating valueForKeyPath:.
    return [[self valueForKeyPath:@"array.numbers"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // This is inefficient since we fetch all the values just to read one of them,
    // but demonstrates valueForKeyPath: on an array:
    NSArray *descriptions = [self.array valueForKeyPath:@"numbers.description"];
    cell.textLabel.text = descriptions[indexPath.row];
    
    return cell;
}

@end
