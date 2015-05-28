//
//  DynamicStorageViewController.m
//  TextKitDemo
//
//  Created by limeng4 on 15-5-28.
//  Copyright (c) 2015年 Bitauto. All rights reserved.
//

#import "DynamicStorageViewController.h"

@interface DynamicStorageViewController ()

@end

@implementation DynamicStorageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        //注册观察者监听用户设置字体大小
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(preferredContentSizeDidChanged:) name:UIContentSizeCategoryDidChangeNotification object:nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Dynamic text formatting and storage";
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(didClickBack:)];
    self.navigationItem.leftBarButtonItem = backBarButtonItem;
    self.view.backgroundColor = [UIColor whiteColor];
    
    //
    [self createMarkupTextView];
}

#pragma mark - PrivateMethods

- (void)createMarkupTextView
{
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:@"Avenir Next" size:14]};
    NSString *content = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"content" ofType:@"txt"]
                                                  encoding:NSUTF8StringEncoding
                                                     error:nil];
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:content
                                                                           attributes:attributes];
    
    //1、创建一个自定义的text storage对象，并通过attributed string保存了需要显示的内容
    _textStorage = [[MarkupTextStorage alloc] init];
    [_textStorage setAttributedString:attributedString];
    
    //2、创建一个layout manager对象
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    
    //3、创建了一个text container对象并将它与layout manager关联，然后该text container再和text storage对象关联
    CGRect textViewRect = CGRectMake(20, 0, (self.view.bounds.size.width - 20*2), self.view.bounds.size.height);
    NSTextContainer *textContainer = [[NSTextContainer alloc] initWithSize:CGSizeMake(textViewRect.size.width, CGFLOAT_MAX)];
    [layoutManager addTextContainer:textContainer];
    [_textStorage addLayoutManager:layoutManager];
    
    //4、通过text container创建一个textView并显示
    self.textView = [[UITextView alloc] initWithFrame:textViewRect
                                        textContainer:textContainer];
    self.textView.delegate = self;
    [self.view addSubview:self.textView];
}

-(void)didClickBack:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)preferredContentSizeDidChanged:(NSNotification *)notification
{
    self.textView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    [_textView resignFirstResponder];
}

@end
