//
//  DetailViewController.h
//  DayX
//
//  Created by Michelle Tessier on 7/14/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entry.h"

@interface DetailViewController : UIViewController

@property (nonatomic, strong) NSString *typeHere;
@property (nonatomic, strong) Entry *entry;

@end
