//
//  JMViewController.m
//  JMSegmentedView
//
//  Created by gao5822 on 01/06/2019.
//  Copyright (c) 2019 gao5822. All rights reserved.
//

#import "JMViewController.h"
#import "JMSegmentedView.h"

@interface JMViewController ()

@end

@implementation JMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *titles = @[@"首页",@"发现",@"社区",@"我的"];
    JMSegmentedView *segView = [[JMSegmentedView alloc]initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 45) WithItemTitles:titles SelectCallBack:^(NSInteger index) {
        NSLog(@"点击了%ld",index);
    }];
    [self.view addSubview:segView];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
