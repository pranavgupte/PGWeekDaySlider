//
//  PGWeekDaySliderView.h
//  PGWeekDaySlider
//
//  Created by PranavGupte on 05/11/16.
//  Copyright © 2016 PranavGupte. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PGWeekDaySliderView : UIView <UIGestureRecognizerDelegate>

@property (strong, nonatomic) UILabel * monLbl;
@property (strong, nonatomic) UILabel * tueLbl;
@property (strong, nonatomic) UILabel * wedLbl;
@property (strong, nonatomic) UILabel * thuLbl;
@property (strong, nonatomic) UILabel * friLbl;
@property (strong, nonatomic) UILabel * satLbl;
@property (strong, nonatomic) UILabel * sunLbl;

-(NSMutableArray *)getAllSelectedDaysByName;
-(NSMutableArray *)getAllSelectedDaysByNumber;
-(void)resetAllDays;


@end
