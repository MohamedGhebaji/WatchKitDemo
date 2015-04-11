//
//  InterfaceController.h
//  AppleWatchDemo WatchKit Extension
//
//  Created by Mohamed on 11/04/2015.
//  Copyright (c) 2015 Mohamed. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface MoodeContextData : NSObject
@property (nonatomic, assign) int moodIndex;
- (instancetype)initWithMoodeIndex:(int)moodIndex;
@end

@interface InterfaceController : WKInterfaceController

@end
