//
//  ListTableViewDataSource.m
//  DayX
//
//  Created by Michelle Tessier on 7/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ListTableViewDataSource.h"

static NSString *entryCell = @"entryCell";

@implementation ListTableViewDataSource 

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:entryCell];
    
    cell.textLabel.text = [NSString stringWithFormat:@"Entry %ld", ((long)indexPath.row) +1];
    
    return cell;
}



@end
