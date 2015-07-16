//
//  EntryController.m
//  DayX
//
//  Created by Michelle Tessier on 7/15/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "EntryController.h"

static NSString *entriesKey = @"entriesKey";

@interface EntryController ()

@property (nonatomic, strong) NSArray *entries;

@end

@implementation EntryController

+ (EntryController*)sharedInstance {
    static EntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [EntryController new];
        [sharedInstance loadFromPersistentStorage];
    });
   
    return sharedInstance;
}

#pragma mark - add and remove entry methods

-(void)addEntry:(Entry *)entry{
    NSMutableArray *mutableEntries = [self.entries mutableCopy];
    
    [mutableEntries addObject:entry];
    
    self.entries = mutableEntries;
    
}

-(void)removeEntry:(Entry *)entry{
    
    if (!entry){
        return;
    }
    
    NSMutableArray *mutableEntries = [self.entries mutableCopy];
    
    [mutableEntries removeObject:entry];
    
    self.entries = mutableEntries;
}

#pragma mark - methods to save and load data to persistent storage

- (void) saveToPersistentStorage{
    
    NSMutableArray *entryDictionaries = [NSMutableArray new];
    
    for (Entry *entry in self.entries) {
        [entryDictionaries addObject:[entry dictionaryRepresentation]];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:entryDictionaries forKey:entriesKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

- (void) loadFromPersistentStorage{
    
    NSArray *entryDictionaries  = [[NSUserDefaults standardUserDefaults] objectForKey:entriesKey];
    NSMutableArray *entryModelObjects = [NSMutableArray new];
    
    for (NSDictionary *entryDictionary in entryDictionaries){
        Entry *entry = [[Entry alloc] initWithDictionary:entryDictionary];
        [entryModelObjects addObject:entry];
    }
    self.entries = entryModelObjects;
}

- (void) save{
    [self saveToPersistentStorage];
}

@end
