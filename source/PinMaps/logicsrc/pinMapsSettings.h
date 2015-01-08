//
//  pinMapsSettings.h
//  PinMaps
//
//  Created by Presley on 07/01/15.
//  Copyright (c) 2015 SlaaySourceCoders. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface pinMapsSettings : UITableViewController

- (IBAction)sldDifficultyLevel:(id)sender;
@property (weak, nonatomic) IBOutlet UISlider *sldSlider;

@property (weak, nonatomic) IBOutlet UILabel *lblDifficulty;

@end
