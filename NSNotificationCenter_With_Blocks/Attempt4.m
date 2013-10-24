//
//  Attempt4.m
//  NSNotificationCenter_With_Blocks
//
//  Created by Drew Crawford on 10/24/13.
//  Copyright (c) 2013 DrewCrawfordApps. All rights reserved.
//

#import "Attempt4.h"
#import "shared.h"
@interface Attempt4() {
    id cleanupObj;
    __block int _localCounter;
}
@end
@implementation Attempt4
-(id)init {
    if (self = [super init]) {
        cleanupObj = [[NSNotificationCenter defaultCenter] addObserverForName:notificationName object:nil queue:nil usingBlock:^(NSNotification *note) {
            int oldCounterValue = counter;
            counter++;
            _localCounter++;
            NSAssert(counter==oldCounterValue+1, @"Atomicity guarantee violated.");

        }];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:cleanupObj];
}
@end
