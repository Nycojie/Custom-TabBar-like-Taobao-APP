//
//  ThirdViewController.m
//  CustomTabBar
//
//  Created by wubo on 2019/4/22.
//  Copyright © 2019 nycojie@gmail.com. All rights reserved.
//

#import "ThirdViewController.h"
#import "MoreViewController.h"
@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.rightButton.hidden = NO;
   
   [ self setRightButtonTitle:@"设置" withColor:[UIColor whiteColor]];
    
}
-(void)defaultRightBtnClick{
    MoreViewController *vc = [[MoreViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
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
