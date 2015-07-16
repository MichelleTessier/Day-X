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
    return [EntryController sharedInstance].entries.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:entryCell];
    
    Entry *entry = [EntryController sharedInstance].entries[indexPath.row];
    
    cell.textLabel.text= entry.title;
    
    return cell;
}





@end
