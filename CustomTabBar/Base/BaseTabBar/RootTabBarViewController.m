//
//  RootTabBarViewController.m
//  LuxuryJF
//
//  Created by Nycojie on 2019/4/18.
//  Copyright © 2019 Yifeng Finance leasing co.LTD. All rights reserved.
//

#import "RootTabBarViewController.h"
#import "JFTabBar.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
@interface RootTabBarViewController ()<JFTabBarDelegate>
@property (nonatomic,strong)JFTabBar *jfTabBar;

@property (nonatomic,strong)NSMutableArray *viewControllerArr;
@end

@implementation RootTabBarViewController
-(NSMutableArray *)viewControllerArr{
    if(_viewControllerArr==nil){
        _viewControllerArr = [NSMutableArray array];
    }
    return _viewControllerArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addChildVC];
    
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,ScreenWidth, TabBarHeight)];
    backView.backgroundColor = [UIColor whiteColor];
    [self.tabBar insertSubview:backView atIndex:0];
    self.tabBar.opaque = YES;
    
    //去掉分割线
//    [[UITabBar appearance] setShadowImage:[UIImage new]];
//    [[UITabBar appearance]setBackgroundImage:[UIImage new]];
}
-(void)addChildVC{
    
    FirstViewController *vc1 = [[FirstViewController alloc]init];
    vc1.navTitle = @"我是最好看的仙女";
    vc1.navBGColor = [UIColor redColor];
    vc1.titleColor = [UIColor whiteColor];
    
    SecondViewController *vc2 = [[SecondViewController alloc]init];
    vc2.navTitle = @"有一种帅叫我比你帅";
    vc2.navBGColor = [UIColor orangeColor];
    vc2.titleColor = [UIColor whiteColor];
    
    ThirdViewController *vc3 = [[ThirdViewController alloc]init];
    vc3.navTitle = @"你是哪个小可爱";
    vc3.navBGColor = [UIColor cyanColor];
    vc3.titleColor = [UIColor whiteColor];
    
    NSArray *vcs = @[vc1,vc2,vc3];
    NSArray *titleArr = @[@"首页",@"消息",@"我的"];
    NSArray *imageArr = @[@"home_icon_tablebar_nor",@"tale_icon_tablebar_nor",@"me__icon_tablebar_nor"];
    NSArray *selectedImageArr = @[@"home_icon_tablebar_press",@"talk_icon_tablebar_press",@"me__icon_tablebar_press"];
    for(UIViewController *vc in vcs){
        BaseNavViewController *nv = [[BaseNavViewController alloc]initWithRootViewController:vc];
        [self.viewControllerArr addObject:nv];
        
    }
    self.jfTabBar = [JFTabBar tabbarWithFrame:self.tabBar.bounds titileArr:titleArr imageArr:imageArr selectedImageArr:selectedImageArr];
    self.jfTabBar.tabBarDelegate = self;
    [self setValue:self.jfTabBar forKey:@"tabBar"];
    self.viewControllers = self.viewControllerArr;
    self.selectedIndex = 0;
    
}
#pragma mark -JFTabBarDelegate
-(void)selectedJFTabBarItemAtIndex:(NSInteger)index{
    self.selectedIndex = index;
}

-(void)setSelectedIndex:(NSUInteger)selectedIndex{
    [super setSelectedIndex:selectedIndex];
    self.jfTabBar.selectedIndex = selectedIndex;
}


@end
