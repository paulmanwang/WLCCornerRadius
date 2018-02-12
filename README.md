# WLCCornerRadius
### A very simple but high performance way to set corner for UIImageView. 

### CocoaPods:
    pod 'WLCCornerRadius', '~> 1.0'

### Simple code:
    #import "UIImageView+WLCCornerRadius.h"
    
    ......
    
    UIImageView *headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];  
    [headerImageView wlc_setCornerRadius:20.f cornerType:UIRectCornerAllCorners];  
    [headerImageView wlc_setBorderWidth:2.f borderColor:[UIColor redColor]];  
    [headerImageView wlc_setImage:[UIImage imageNamed:@"test"]];
    
### ![The demo result](https://github.com/wanglichun/WLCCornerRadius/tree/master/ScreenShots/wangwu.PNG)

