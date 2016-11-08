# PGWeekDaySlider

PGWeekDaySlider is a simple and flexible iOS class for presenting any custom view as selection for week days with swipe control.
It includes a variety of options for controlling how your slider appears and behaves. 
User can select multiple days by swiping or taping on it.

##Usage
###Basic Setup
    
    #import "PGWeekDaySliderView.h"
    
    @property (strong, nonatomic) PGWeekDaySliderView * mySlider;

    self.mySlider = [[PGWeekDaySliderView alloc]initWithFrame:CGRectMake(20, 215, 280, 40)];
    
    self.mySlider.layer.borderColor = [UIColor blackColor].CGColor;
    self.mySlider.layer.borderWidth = 1.0f;
    self.mySlider.layer.masksToBounds = YES;
    
    self.resultTextView.layer.borderColor = [UIColor darkGrayColor].CGColor;
    self.resultTextView.layer.borderWidth = 1.0f;
    self.resultTextView.layer.masksToBounds = YES;
    
    [self.view addSubview:self.mySlider];
    
#Important methods which will give selected days in name and index.
    
    // selected days by name
    NSMutableArray * daysArrByName = [[NSMutableArray alloc]init];
    daysArrByName = [self.mySlider getAllSelectedDaysByName];
    
    // selected days by index
    NSMutableArray * daysArrByNumber = [[NSMutableArray alloc]init];
    daysArrByNumber = [self.mySlider getAllSelectedDaysByNumber];

##Contact
    
    contact me at pranavgupte1308@gmail.com
