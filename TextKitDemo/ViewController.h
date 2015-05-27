//
//  ViewController.h
//  TextKitDemo
//
//  Created by limeng4 on 15-5-26.
//  Copyright (c) 2015年 Bitauto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExclusionPathsViewController.h"
#import "DynamicTypeViewController.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *dynamicTypeBtn;
@property (strong, nonatomic) IBOutlet UIButton *exclusionPathsBtn;

- (IBAction)didClickExclusionPathsBtn:(UIButton *)sender;
- (IBAction)didClickDynamicTypeBtn:(UIButton *)sender;

@end

