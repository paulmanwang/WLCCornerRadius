//
//  WLCDemoViewController.m
//  WLCCornerRadiusDemo
//
//  Created by lichunwang on 2018/2/11.
//  Copyright © 2018年 springcome. All rights reserved.
//

#import "WLCDemoViewController.h"
#import "DemoTableViewCell.h"

@interface WLCDemoViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation WLCDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Demo";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor blueColor];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[DemoTableViewCell class] forCellReuseIdentifier:@"DemoTableViewCell"];
    tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [DemoTableViewCell heihgt];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DemoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DemoTableViewCell"];
    [cell setUserHeaderImage:[UIImage imageNamed:@"test"]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
