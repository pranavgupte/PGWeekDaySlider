//
//  ViewController.h
//  PGWeekDaySlider
//
//  Created by pranavgupte on 08/11/16.
//  Copyright © 2016 pranavgupte. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PGWeekDaySliderView.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) PGWeekDaySliderView * mySlider;

@property (strong, nonatomic) IBOutlet UITextView * resultTextView;

-(IBAction)reset:(UIButton *)sender;
-(IBAction)getSelectedDaysName:(UIButton *)sender;
-(IBAction)getSelectedDaysNum:(UIButton *)sender;

@end

