//
//  Attempt5.m
//  NSNotificationCenter_With_Blocks
//
//  Created by Drew Crawford on 10/24/13.
//  Copyright (c) 2013 DrewCrawfordApps. All rights reserved.
//

#import "Attempt7.h"
#import "shared.h"
@interface Attempt7() {
    id cleanupObj;
}
@end
@implementation Attempt7
-(id)init {
    if (self = [super init]) {
        __weak Attempt7 *mySelf = self;
        cleanupObj = [[NSNotificationCenter defaultCenter] addObserverForName:notificationName object:nil queue:nil usingBlock:^(NSNotification *note) {
            int oldCounterValue = counter;
            counter++;
            NSCAssert(counter==oldCounterValue+1, @"Atomicity guarantee violated.");
            mySelf.localCounter++;
        }];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:cleanupObj];
}
@end
