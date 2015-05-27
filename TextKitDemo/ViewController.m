//
//  ViewController.m
//  TextKitDemo
//
//  Created by limeng4 on 15-5-26.
//  Copyright (c) 2015年 Bitauto. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didClickExclusionPathsBtn:(UIButton *)sender
{
    ExclusionPathsViewController *exclusionPathsVC = [[ExclusionPathsViewController alloc] init];
    [self.navigationController pushViewController:exclusionPathsVC animated:YES];
}

- (IBAction)didClickDynamicTypeBtn:(UIButton *)sender
{
    DynamicTypeViewController *dynamicTypeVC = [[DynamicTypeViewController alloc] init];
    [self.navigationController pushViewController:dynamicTypeVC animated:YES];
}
@end
