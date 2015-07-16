//
//  Entry.m
//  DayX
//
//  Created by Michelle Tessier on 7/15/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Entry.h"

static NSString *titleKey = @"titleKey";
static NSString *bodyTextKey = @"bodyTextKey";
static NSString *timeStampKey = @"timeStampKey";

@implementation Entry

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        self.title = dictionary[titleKey];
        self.bodyText = dictionary[bodyTextKey];
        self.timeStamp = dictionary[timeStampKey];
    }
    return self;
}

- (NSDictionary *)dictionaryRepresentation{
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    if (self.title){
        [dictionary setObject:self.title forKey:titleKey];
    }
    if (self.bodyText){
        [dictionary setObject:self.bodyText forKey:bodyTextKey];
    }
    if (self.timeStamp){
        [dictionary setObject:self.timeStamp forKey:timeStampKey];
    }
    return dictionary;
}


@end
