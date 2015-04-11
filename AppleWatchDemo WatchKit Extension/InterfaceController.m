//
//  InterfaceController.m
//  AppleWatchDemo WatchKit Extension
//
//  Created by Mohamed on 11/04/2015.
//  Copyright (c) 2015 Mohamed. All rights reserved.
//

#import "InterfaceController.h"

@interface MoodeContextData()
@end

@implementation MoodeContextData
- (instancetype)initWithMoodeIndex:(int)moodIndex adviceSectionState:(BOOL)adviceSectionState
{
    self = [super init];
    if (self) {
        self.moodIndex = moodIndex;
        self.shouldHideAdviceSection = adviceSectionState;
    }
    return self;
}
@end


@interface InterfaceController()
@property (nonatomic, weak) IBOutlet WKInterfaceImage *moodImage;
@property (nonatomic, assign) int currentMoodIdentifier;
@property (nonatomic, assign) BOOL shouldHideAdviceSection;

- (void)_updateMoodImageWithMode:(int)currentMode;

@end


@implementation InterfaceController

#pragma mark - Life Cycle
- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    self.currentMoodIdentifier = 0;
    self.shouldHideAdviceSection = NO;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

#pragma mark - Navigation
- (id)contextForSegueWithIdentifier:(NSString *)segueIdentifier {
    if ([segueIdentifier isEqualToString:@"RecordMoodSegue"]) {
        return [[MoodeContextData alloc] initWithMoodeIndex:self.currentMoodIdentifier adviceSectionState:self.shouldHideAdviceSection];
    }
    
    return nil;
}

#pragma mark - Private Methods

- (void)_updateMoodImageWithMode:(int)currentMode {
    if (currentMode < 0 || currentMode > 4) {
        return;
    }
    
    [self.moodImage setImageNamed:[NSString stringWithFormat:@"rage%d", currentMode]];
}

#pragma mark - Actions

- (IBAction)MoodSliderChange:(float)value {
    self.currentMoodIdentifier = (int)value;
    NSLog(@"current mood %d", (int)value);
    [self _updateMoodImageWithMode:(int)value];
}

- (IBAction)AdviceSelectorChange:(BOOL)value {
    self.shouldHideAdviceSection = !value;
}

@end



