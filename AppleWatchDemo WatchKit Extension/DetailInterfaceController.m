//
//  DetailInterfaceController.m
//  AppleWatchDemo
//
//  Created by Mohamed on 11/04/2015.
//  Copyright (c) 2015 Mohamed. All rights reserved.
//

#import "DetailInterfaceController.h"


@interface DetailInterfaceController()

@property (nonatomic, weak) IBOutlet WKInterfaceImage *moodImage;
@property (nonatomic, weak) IBOutlet WKInterfaceLabel *moodTitleLabel;
@property (nonatomic, weak) IBOutlet WKInterfaceLabel *moodDescriptionLabel;
@property (nonatomic, weak) IBOutlet WKInterfaceLabel *moodAdviceLabel;

@end


@implementation DetailInterfaceController

#pragma mark - Life Cycle
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



