//
//  PGWeekDaySliderView.m
//  PGWeekDaySlider
//
//  Created by PranavGupte on 05/11/16.
//  Copyright © 2016 PranavGupte. All rights reserved.
//

//color for week day text/font
#define PGfontColor colorWithRed:(0/255.0) green:(0/255.0) blue:(0/255.0) alpha:1.0

//color for selected day background
#define PGselectedBGColor colorWithRed:(40.0/255.0) green:(190.0/255.0) blue:(230.0/255.0) alpha:1.0

//color for non-selected day background
#define PGbgColor colorWithRed:(255.0/255.0) green:(255.0/255.0) blue:(255.0/255.0) alpha:1.0

#import "PGWeekDaySliderView.h"

@implementation PGWeekDaySliderView{
    
    float startPoint;
    float endPoint;
    float movingPoint;
    
    float height;
    float width;
    
    BOOL isMselected;
    BOOL isTselected;
    BOOL isWselected;
    BOOL isThselected;
    BOOL isFselected;
    BOOL isSselected;
    BOOL isSunselected;
}

@synthesize monLbl,tueLbl,wedLbl,thuLbl,friLbl,satLbl,sunLbl;

#pragma mark - method for initial view frame

- (id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setWeekLblFromFrame:frame]; //setting week view frame
        
        UITapGestureRecognizer * PGtapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(handleTap:)];
        PGtapRecognizer.delegate = self;
        [self addGestureRecognizer: PGtapRecognizer]; //adding tap gesture for multiple selection
        
        UIPanGestureRecognizer * PGpanRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(PanRecognizer:)];
        PGpanRecognizer.delegate = self;
        [self addGestureRecognizer:PGpanRecognizer]; //adding pan gesture for multiple selection
    }
    return self;
}

#pragma mark - method for setting initial week swipe view

-(void)setWeekLblFromFrame:(CGRect)sliderFrame{
    
    //creating label accordint to height
    
    height = sliderFrame.size.height;
    width = sliderFrame.size.height;
    
    monLbl = [[UILabel alloc]initWithFrame:CGRectMake(0,0, width, height)];
    monLbl.textAlignment = NSTextAlignmentCenter;
    monLbl.text = @"M";
    monLbl.backgroundColor = [UIColor PGbgColor];
    monLbl.textColor = [UIColor PGfontColor];
    monLbl.tag = 1;
    [self addSubview:monLbl];
    
    tueLbl = [[UILabel alloc]initWithFrame:CGRectMake(width,0, width, height)];
    tueLbl.text = @"T";
    tueLbl.textAlignment = NSTextAlignmentCenter;
    tueLbl.backgroundColor = [UIColor PGbgColor];
    tueLbl.textColor = [UIColor PGfontColor];
    tueLbl.tag = 2;
    [self addSubview:tueLbl];
    
    wedLbl = [[UILabel alloc]initWithFrame:CGRectMake(width * 2,0, width, height)];
    wedLbl.text = @"W";
    wedLbl.textAlignment = NSTextAlignmentCenter;
    wedLbl.textColor = [UIColor PGfontColor];
    wedLbl.backgroundColor = [UIColor PGbgColor];
    wedLbl.tag = 3;
    [self addSubview:wedLbl];
    
    thuLbl = [[UILabel alloc]initWithFrame:CGRectMake(width * 3,0, width, height)];
    thuLbl.text = @"Th";
    thuLbl.textAlignment = NSTextAlignmentCenter;
    thuLbl.backgroundColor = [UIColor PGbgColor];
    thuLbl.textColor = [UIColor PGfontColor];
    thuLbl.tag = 4;
    [self addSubview:thuLbl];
    
    friLbl = [[UILabel alloc]initWithFrame:CGRectMake(width * 4,0, width, height)];
    friLbl.text = @"F";
    friLbl.textAlignment = NSTextAlignmentCenter;
    friLbl.backgroundColor = [UIColor PGbgColor];
    friLbl.textColor = [UIColor PGfontColor];
    friLbl.tag = 5;
    [self addSubview:friLbl];
    
    satLbl = [[UILabel alloc]initWithFrame:CGRectMake(width * 5,0, width, height)];
    satLbl.text = @"S";
    satLbl.textAlignment = NSTextAlignmentCenter;
    satLbl.backgroundColor = [UIColor PGbgColor];
    satLbl.textColor = [UIColor PGfontColor];
    satLbl.tag = 6;
    [self addSubview:satLbl];
    
    sunLbl = [[UILabel alloc]initWithFrame:CGRectMake(width * 6,0, width, height)];
    sunLbl.text = @"Su";
    sunLbl.backgroundColor = [UIColor PGbgColor];
    sunLbl.textAlignment = NSTextAlignmentCenter;
    sunLbl.textColor = [UIColor PGfontColor];
    sunLbl.tag = 7;
    [self addSubview:sunLbl];
}

#pragma mark - method for tap gesture

- (void)handleTap:(UITapGestureRecognizer *)tapRecognizer{
    
    CGPoint touchPoint = [tapRecognizer locationInView:self];
    
    if (touchPoint.x >= 0 && touchPoint.x <= width) {
        
        if (isMselected) {
            
            monLbl.backgroundColor = [UIColor PGbgColor];
            isMselected = NO;
            
        }else{
            
            monLbl.backgroundColor = [UIColor PGselectedBGColor];
            isMselected = YES;
        }
        
    }else if (touchPoint.x >= width && touchPoint.x <= width * 2){
        
        if (isTselected) {
            
            tueLbl.backgroundColor = [UIColor PGbgColor];
            isTselected = NO;
            
        }else{
            
            tueLbl.backgroundColor = [UIColor PGselectedBGColor];
            isTselected = YES;
        }
        
    }else if(touchPoint.x >= width * 2 && touchPoint.x <= width * 3){
        
        if (isWselected) {
            
            wedLbl.backgroundColor = [UIColor PGbgColor];
            isWselected = NO;
            
        }else{
            
            wedLbl.backgroundColor = [UIColor PGselectedBGColor];
            isWselected = YES;
        }
        
    }else if(touchPoint.x >= width * 3 && touchPoint.x <= width * 4){
        
        if (isThselected) {
            
            thuLbl.backgroundColor = [UIColor PGbgColor];
            isThselected = NO;
            
        }else{
            
            thuLbl.backgroundColor = [UIColor PGselectedBGColor];
            isThselected = YES;
        }
        
    }else if(touchPoint.x >= width * 4 && touchPoint.x <= width * 5){
        
        if (isFselected) {
            
            friLbl.backgroundColor = [UIColor PGbgColor];
            isFselected = NO;
            
        }else{
            
            friLbl.backgroundColor = [UIColor PGselectedBGColor];
            isFselected = YES;
        }
        
    }else if(touchPoint.x >= width * 5 && touchPoint.x <= width * 6){
        
        if (isSselected) {
            
            satLbl.backgroundColor = [UIColor PGbgColor];
            isSselected = NO;
            
        }else{
            
            satLbl.backgroundColor = [UIColor PGselectedBGColor];
            isSselected = YES;
        }
        
    }else if(touchPoint.x >= width * 6 && touchPoint.x <= width * 7){
        
        if (isSunselected) {
            
            sunLbl.backgroundColor = [UIColor PGbgColor];
            isSunselected = NO;
            
        }else{
            
            sunLbl.backgroundColor = [UIColor PGselectedBGColor];
            isSunselected = YES;
        }
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName: @"UpdateDays" object:nil];
}

#pragma mark - method for swipe gesture

- (void)PanRecognizer:(UIPanGestureRecognizer *)recognizer {
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        
        CGPoint start = [recognizer locationInView:recognizer.view];
        
        startPoint = start.x;
        
        [self resetAllDays];
        
        [[NSNotificationCenter defaultCenter] postNotificationName: @"UpdateDays" object:nil]; //auto update selected days text
        
    }else if (recognizer.state == UIGestureRecognizerStateEnded) {
        
        CGPoint end = [recognizer locationInView:recognizer.view];
        
        endPoint = end.x;
        
         [[NSNotificationCenter defaultCenter] postNotificationName: @"UpdateDays" object:nil]; //auto update selected days text
        
    }else if (recognizer.state == UIGestureRecognizerStateChanged) {
        
        CGPoint moving = [recognizer locationInView:recognizer.view];
        
        movingPoint = moving.x;
        
        NSLog(@"%f",movingPoint);
        
        if (movingPoint >= 0 && movingPoint <= width) {
            
            monLbl.backgroundColor = [UIColor PGselectedBGColor];
            isMselected = YES;
            
        }else if (movingPoint >= width && movingPoint <= width * 2){
            
            tueLbl.backgroundColor = [UIColor PGselectedBGColor];
            isTselected = YES;
            
        }else if(movingPoint >= width * 2 && movingPoint <= width * 3){
            
            wedLbl.backgroundColor = [UIColor PGselectedBGColor];
            isWselected = YES;
            
        }else if(movingPoint >= width * 3 && movingPoint <= width * 4){
            
            thuLbl.backgroundColor = [UIColor PGselectedBGColor];
            isThselected = YES;
            
        }else if(movingPoint >= width * 4 && movingPoint <= width * 5){
            
            friLbl.backgroundColor = [UIColor PGselectedBGColor];
            isFselected = YES;
            
        }else if(movingPoint >= width * 5 && movingPoint <= width * 6){
            
            satLbl.backgroundColor = [UIColor PGselectedBGColor];
            isSselected = YES;
            
        }else if(movingPoint >= width * 6 && movingPoint<= width * 7){
            
            sunLbl.backgroundColor = [UIColor PGselectedBGColor];
            isSunselected = YES;
        }
        
        [[NSNotificationCenter defaultCenter] postNotificationName: @"UpdateDays" object:nil]; //auto update selected days text
    }
}

#pragma mark - method reset all days unselected

-(void)resetAllDays{
    
    //reset all label background color 
    
    for (UILabel * lbl in self.subviews) {
        
        if ([lbl isKindOfClass:[UILabel class]]) {
            
            lbl.backgroundColor = [UIColor PGbgColor];
        }
    }
    
    isMselected = NO;
    isTselected = NO;
    isWselected = NO;
    isThselected = NO;
    isFselected = NO;
    isSselected = NO;
    isSunselected = NO;
}

#pragma mark - method to return all selected days name array

-(NSMutableArray *)getAllSelectedDaysByName{
    
    NSMutableArray * daysArr = [[NSMutableArray alloc]init];
    
    for (UILabel * lbl in self.subviews) {
        
        if ([lbl isKindOfClass:[UILabel class]]) {
            
            if ([lbl.backgroundColor isEqual:[UIColor PGselectedBGColor]]) {
                
                [daysArr addObject:lbl.text];
            }
        }
    }
    
    return [self replaceNamesInArray:daysArr]; //return array of selected days names
}

#pragma mark - method to return all selected days number array

-(NSMutableArray *)getAllSelectedDaysByNumber{
    
    NSMutableArray * daysArr = [[NSMutableArray alloc]init];
    
    for (UILabel * lbl in self.subviews) {
        
        if ([lbl isKindOfClass:[UILabel class]]) {
            
            if ([lbl.backgroundColor isEqual:[UIColor PGselectedBGColor]]) {
                
                [daysArr addObject:[NSNumber numberWithDouble:lbl.tag]];
            }
        }
    }
    
    return daysArr; //return array of selected days numbers
}

-(NSMutableArray *)replaceNamesInArray:(NSMutableArray *)daysArr{

    for (int i = 0; i < [daysArr count]; i ++) {
        
        if      ([[daysArr objectAtIndex:i] isEqualToString:@"M"])
            [daysArr replaceObjectAtIndex:i withObject:@"Monday"];
        
        else if ([[daysArr objectAtIndex:i] isEqualToString:@"T"])
            [daysArr replaceObjectAtIndex:i withObject:@"Tuesday"];
        
        else if ([[daysArr objectAtIndex:i] isEqualToString:@"W"])
            [daysArr replaceObjectAtIndex:i withObject:@"Wednesday"];
        
        else if ([[daysArr objectAtIndex:i] isEqualToString:@"Th"])
            [daysArr replaceObjectAtIndex:i withObject:@"Thursday"];
        
        else if ([[daysArr objectAtIndex:i] isEqualToString:@"F"])
            [daysArr replaceObjectAtIndex:i withObject:@"Friday"];
        
        else if ([[daysArr objectAtIndex:i] isEqualToString:@"S"])
            [daysArr replaceObjectAtIndex:i withObject:@"Saturday"];
        
        else if ([[daysArr objectAtIndex:i] isEqualToString:@"Su"])
            [daysArr replaceObjectAtIndex:i withObject:@"Sunday"];
    }
    
    return daysArr;
}

@end
