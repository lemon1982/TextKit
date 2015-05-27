//
//  DynamicTypeViewController.m
//  TextKitDemo
//
//  Created by limeng4 on 15-5-27.
//  Copyright (c) 2015年 Bitauto. All rights reserved.
//

#import "DynamicTypeViewController.h"

@interface DynamicTypeViewController ()

@end

@implementation DynamicTypeViewController

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        //注册观察者监听用户设置字体大小
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(preferredContentSizeChanged:) name:UIContentSizeCategoryDidChangeNotification object:nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Dynamic Type";
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(didClickBack:)];
    self.navigationItem.leftBarButtonItem = backBarButtonItem;
    self.view.backgroundColor = [UIColor whiteColor];
    
    //title
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 40)];
    self.titleLabel.text = @"文章标题";
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    [self.view addSubview:self.titleLabel];
    
    //初始化textView
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0, (self.titleLabel.frame.origin.y + self.titleLabel.bounds.size.height), self.view.bounds.size.width, (self.view.bounds.size.height - self.titleLabel.frame.origin.y - self.titleLabel.bounds.size.height))];
    self.textView.text = @"我上学的座驾是一辆凤凰，黑色28脚动，买了2年零4个月，5000公里了。总的来讲，除了做工粗糙了点，的确能算一部好车！我曾经在机动车道上把一台奥迪A6.3.2超的竖大拇指。我的磨合期是跑得不错的，10公里内没超过8；20公里内没超过10；30公里内没超过12。30公里后，拉过一次高速，到了极限21公里/62转（再加就要进医院了）。后来行车都保持20转换挡，15转行车。偶尔也1、2、3挡提到45转。所以的我的脚动波显得特别的灵敏，提速比较快。（可能是脚蹬子已经习惯了我的驾驶习惯吧！）提速慢、起步肉，一直是针 对28大车的敏感话题。个人认为应该是驾驶习惯造成的。都说飞鸽、GIANT的提速快，凤凰、永久的提速肉。可是应该考虑到车子的类型不同。这几款车我都开过，FG、GIANT在正常情况下提速的确不错，不需要把转速提得很高就能提供不错的动力，但过了承重40kg以后动力就显得不够充分了。而凤凰28呢，不信你把承重提到45-50kg起步试试，看看哪辆车能超过你。大凤凰车系都是高转速发动机，需要把转速提起来才能显示其充沛的动力。我试过下坡起步，从未遇见过对手。有一次遇到一辆永久，咬上了，我硬是连续3个红绿灯超它半个车身。都是原地使劲，起步时后轮原地空转，轮胎和地面磨得青烟直冒。凤凰还是胜了。特别值得一提的是凤凰在16-18码时还有推臀感，这点在28排量的车系中是难能可贵的，这也正是高转速发动机的特点所在啊！但让我最为骄傲的，还是一次弯道超车。当时在上学路上，我被一辆奥迪A6，3.2超车。当时路况极好，车多人多，红绿灯多，于是乎童心大起，想和他玩玩。奥迪保持18的速度前进，我没去超车，就是也以18的速度隔0.2米跟着他。刚开始他还没在意，后来他发现了我。大家都是开车的，应该都知道在行车时有一辆车老是跟在后面不是很爽。奥迪开始加速了，想甩掉我。19，我跟了上去，还是保持0.2米的距离。这样跑了1分钟。奥迪又减速到18，我也减，始终保持0.2米的距离。就这样20、18、21持续了大约2分钟。在一个右转路口，我一个单脚擦地右转，超越了奥迪。奥迪减速了，打右转向灯靠边停车。车窗里一只手，伸出了大拇指朝我喊，挖掘机到底哪家强？";
    self.textView.textContainerInset = UIEdgeInsetsMake(0, 0, 8, 0);
    self.textView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    self.textView.editable = NO;
    [self.view addSubview:self.textView];
}

#pragma mark - PrivateMethods

-(void)didClickBack:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)preferredContentSizeChanged:(NSNotification *)notification
{
    self.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
    self.textView.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

@end
