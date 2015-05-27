//
//  ExclusionPathsViewController.h
//  TextKitDemo
//
//  Created by limeng4 on 15-5-26.
//  Copyright (c) 2015年 Bitauto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExclusionPathsViewController : UIViewController

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UITextView  *textView;
@property (nonatomic, assign) CGPoint     gestureStartingPoint;
@property (nonatomic, assign) CGPoint     gestureStartingCenter;

@end
