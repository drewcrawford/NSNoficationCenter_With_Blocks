//
//  BlocksObject.m
//  NSNotificationCenter_With_Blocks
//
//  Created by Drew Crawford on 10/24/13.
//  Copyright (c) 2013 DrewCrawfordApps. All rights reserved.
//

#import "Attempt1.h"
#import "shared.h"
@interface Attempt1() {
    
}
@end

@implementation Attempt1
-(id)init {
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserverForName:notificationName object:nil queue:nil usingBlock:^(NSNotification *note) {
            int oldCounterValue = counter;
            counter++;
            self.localCounter++;
            NSAssert(counter==oldCounterValue+1, @"Atomicity guarantee violated.");

        }];
    }
    return self;
}
@end
