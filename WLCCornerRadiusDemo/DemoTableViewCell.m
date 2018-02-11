//
//  DemoTableViewCell.m
//  WLCCornerRadiusDemo
//
//  Created by lichunwang on 2018/2/11.
//  Copyright © 2018年 springcome. All rights reserved.
//

#import "DemoTableViewCell.h"
#import "UIImageView+WLCCornerRadius.h"

@interface DemoTableViewCell()

@property (strong, nonatomic) UIImageView *headerImageView;

@end

@implementation DemoTableViewCell

+ (CGFloat)heihgt
{
    return 60.f;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *headerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
        [headerImageView wlc_setCornerRadius:20.f cornerType:UIRectCornerAllCorners];
        [headerImageView wlc_setBorderWidth:2.f borderColor:[UIColor redColor]];
        [self addSubview:headerImageView];
        self.headerImageView = headerImageView;
        
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(65, 0, 100, 60)];
        nameLabel.font = [UIFont systemFontOfSize:15.f];
        nameLabel.text = @"王五";
        [self addSubview:nameLabel];
    }
    
    return self;
}

- (void)setUserHeaderImage:(UIImage *)headerImage
{
    [self.headerImageView wlc_setImage:headerImage];
}

@end
