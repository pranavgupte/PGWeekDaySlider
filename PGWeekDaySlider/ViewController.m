//
//  ViewController.m
//  PGWeekDaySlider
//
//  Created by pranavgupte on 08/11/16.
//  Copyright © 2016 pranavgupte. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getSelectedDaysName:) name:@"UpdateDays" object:nil];
    self.mySlider = [[PGWeekDaySliderView alloc]initWithFrame:CGRectMake(20, 215, 280, 40)];
    
    self.mySlider.layer.borderColor = [UIColor blackColor].CGColor;
    self.mySlider.layer.borderWidth = 1.0f;
    self.mySlider.layer.masksToBounds = YES;
    
    self.resultTextView.layer.borderColor = [UIColor darkGrayColor].CGColor;
    self.resultTextView.layer.borderWidth = 1.0f;
    self.resultTextView.layer.masksToBounds = YES;
    
    [self.view addSubview:self.mySlider];
}

-(IBAction)reset:(UIButton *)sender{
    
    self.resultTextView.text = @"";
    [self.mySlider resetAllDays];
}

-(IBAction)getSelectedDaysName:(UIButton *)sender{
    
    NSMutableArray * daysArrByName = [[NSMutableArray alloc]init];
    daysArrByName = [self.mySlider getAllSelectedDaysByName];
    self.resultTextView.text = [daysArrByName componentsJoinedByString:@","];
}

-(IBAction)getSelectedDaysNum:(UIButton *)sender{
    
    NSMutableArray * daysArrByNumber = [[NSMutableArray alloc]init];
    daysArrByNumber = [self.mySlider getAllSelectedDaysByNumber];
    self.resultTextView.text = [daysArrByNumber componentsJoinedByString:@","];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
