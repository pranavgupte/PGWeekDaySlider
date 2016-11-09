# PGWeekDaySlider

PGWeekDaySlider is a simple and flexible iOS class for presenting any custom view as selection for week days with swipe control.
It includes a variety of options for controlling how your slider appears and behaves. 
User can select multiple days by swiping or taping on it.


[![screenshot.png](https://s14.postimg.org/ygfghe869/screenshot.png)](https://postimg.org/image/h3562jcv1/)


##Usage
###Basic Setup

```objective-c
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
```
    
##Important methods which will give selected days in name and index.

```objective-c    
    // selected days by name
    NSMutableArray * daysArrByName = [[NSMutableArray alloc]init];
    daysArrByName = [self.mySlider getAllSelectedDaysByName];
    
    // selected days by index
    NSMutableArray * daysArrByNumber = [[NSMutableArray alloc]init];
    daysArrByNumber = [self.mySlider getAllSelectedDaysByNumber];
```
##Customization

In PGWeekDaySliderView.m the color for selection, non-selection and fonts can be changed as below.

```objective-c
    //set color for week day text/font
    #define PGfontColor colorWithRed:(0/255.0) green:(0/255.0) blue:(0/255.0) alpha:1.0

    //set color for selected day background
    #define PGselectedBGColor colorWithRed:(40.0/255.0) green:(190.0/255.0) blue:(230.0/255.0) alpha:1.0

    //set color for non-selected day background
    #define PGbgColor colorWithRed:(255.0/255.0) green:(255.0/255.0) blue:(255.0/255.0) alpha:1.0
```

## Contact

Pranav Gupte
* https://github.com/pranavgupte
* pranavgupte1308@gmail.com
