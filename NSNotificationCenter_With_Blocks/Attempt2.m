//
//  Attempt2.m
//  NSNotificationCenter_With_Blocks
//
//  Created by Drew Crawford on 10/24/13.
//  Copyright (c) 2013 DrewCrawfordApps. All rights reserved.
//

#import "Attempt2.h"
#import "shared.h"

@interface Attempt2() {
    id cleanupObj;
}
@end

@implementation Attempt2
-(id)init {
    if (self = [super init]) {
        cleanupObj = [[NSNotificationCenter defaultCenter] addObserverForName:notificationName object:nil queue:nil usingBlock:^(NSNotification *note) {
            int oldCounterValue = counter;
            counter++;
            self.localCounter++;
            NSAssert(counter==oldCounterValue+1, @"Atomicity guarantee violated.");

        }];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:cleanupObj];
}

@end
