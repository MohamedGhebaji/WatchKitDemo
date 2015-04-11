//
//  DetailInterfaceController.m
//  AppleWatchDemo
//
//  Created by Mohamed on 11/04/2015.
//  Copyright (c) 2015 Mohamed. All rights reserved.
//

#import "DetailInterfaceController.h"
#import "InterfaceController.h"

@interface DetailInterfaceController()

@property (nonatomic, weak) IBOutlet WKInterfaceImage *moodImage;
@property (nonatomic, weak) IBOutlet WKInterfaceLabel *moodTitleLabel;
@property (nonatomic, weak) IBOutlet WKInterfaceLabel *moodDescriptionLabel;
@property (nonatomic, weak) IBOutlet WKInterfaceLabel *moodAdviceLabel;

@property (nonatomic, copy) NSArray *moodNames;
@property (nonatomic, assign) int currentMood;
@property (nonatomic, assign) BOOL shouldHideAdviceSection;

@end


@implementation DetailInterfaceController

#pragma mark - Life Cycle
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    self.moodNames = [NSArray arrayWithObjects:@"OK", @"Not Bad", @"Hmmm", @"Anger", @"RAWR", nil];
    self.currentMood = 0;
    
    if (context && [context isKindOfClass:[MoodeContextData class]]) {
        self.currentMood = ((MoodeContextData *)context).moodIndex;
        self.shouldHideAdviceSection = ((MoodeContextData *)context).shouldHideAdviceSection;
    }
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
    
    [self.moodImage setImageNamed:[NSString stringWithFormat:@"rage%d",self.currentMood]];
    NSString *moodName = self.moodNames[self.currentMood];
    [self.moodTitleLabel setText:moodName];
    [self.moodDescriptionLabel setText:[NSString stringWithFormat:@"You are feeling SO %@", moodName]];
    [self.moodAdviceLabel setHidden:self.shouldHideAdviceSection];
    
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



