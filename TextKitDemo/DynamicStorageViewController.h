//
//  DynamicStorageViewController.h
//  TextKitDemo
//
//  Created by limeng4 on 15-5-28.
//  Copyright (c) 2015年 Bitauto. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MarkupTextStorage.h"

@interface DynamicStorageViewController : UIViewController <UITextViewDelegate>
{
    MarkupTextStorage *_textStorage;
}

@property (nonatomic, strong) UITextView *textView;

@end
