//
//  Attempt5.m
//  NSNotificationCenter_With_Blocks
//
//  Created by Drew Crawford on 10/24/13.
//  Copyright (c) 2013 DrewCrawfordApps. All rights reserved.
//

#import "Attempt5.h"
#import "shared.h"
@interface Attempt5() {
    id cleanupObj;
    __block NSNumber *counterObj;
}
@end
@implementation Attempt5
-(id)init {
    if (self = [super init]) {
        cleanupObj = [[NSNotificationCenter defaultCenter] addObserverForName:notificationName object:nil queue:nil usingBlock:^(NSNotification *note) {
            int oldCounterValue = counter;
            counter++;
            counterObj = @(counterObj.intValue + 1);
            NSAssert(counter==oldCounterValue+1, @"Atomicity guarantee violated.");

        }];
    }
    return self;
}

- (void)setLocalCounter:(int)localCounter {
    counterObj = @(localCounter);
}

- (int)localCounter {
    return counterObj.intValue;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:cleanupObj];
}
@end
