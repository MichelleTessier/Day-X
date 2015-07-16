//
//  EntryController.h
//  DayX
//
//  Created by Michelle Tessier on 7/15/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"

@interface EntryController : NSObject

@property (nonatomic, strong, readonly) NSArray *entries;

+ (EntryController *) sharedInstance;

- (void) addEntry: (Entry *) entry;
- (void) removeEntry: (Entry *) entry;

- (void) saveToPersistentStorage;
- (void) loadFromPersistentStorage;
- (void) save;

@end
