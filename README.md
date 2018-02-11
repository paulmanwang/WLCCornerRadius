WLCCornerRadius
A very simple but high performance way to set corner for UIImageView. 

Simple code:
UIImageView *headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];

[headerImageView wlc_setCornerRadius:20.f cornerType:UIRectCornerAllCorners];

[headerImageView wlc_setBorderWidth:2.f borderColor:[UIColor redColor]];

[headerImageView wlc_setImage:[UIImage imageNamed:@"test"]];
        

