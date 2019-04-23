//
//  BaseViewController.m
//  LuxuryJF
//
//  Created by Nycojie on 2019/4/18.
//  Copyright © 2019 Yifeng Finance leasing co.LTD. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@end

@implementation BaseViewController

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    _navgationBar.frame = CGRectMake(0, 0, ScreenWidth, 44+StatusBarHeight);
   
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
     self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    [self customView];

    
}
-(void)customView{
    if(_navgationBar==nil){
        _navgationBar = [CustomNavView createViewFromXib];
        _navgationBar.frame = CGRectMake(0, 0, ScreenWidth, 44+StatusBarHeight);
        _navgationBar.backgroundColor = self.navBGColor;
        _navgationBar.navLabel.text = _navTitle;
        _navgationBar.textColor = _titleColor;
    }
    
    [self.view addSubview:_navgationBar];
    
    
    if(self.navigationController){
        if(self.navigationController.viewControllers.firstObject==self){
            self.leftButton.hidden = YES;
        }else{
            self.leftButton.hidden = NO;
        }
    }
    
    //默认左侧返回按钮的样式
    [self.leftButton setTitle:@"返回" forState:UIControlStateNormal];
    [self.leftButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    self.leftButton.titleLabel.font = [UIFont systemFontOfSize:16];
  
    weakSelf(weakSelf);
    weakSelf.navgationBar.leftClickHandler = ^{
        [weakSelf defaultLeftBtnClick];
    };
    weakSelf.navgationBar.rightClickHandler = ^{
        [weakSelf defaultRightBtnClick];
    };
}
#pragma mark -Getter/Setter
-(void)setNavTitle:(NSString *)navTitle{
    _navTitle = navTitle;
    self.centerLabel.text = navTitle;
}
-(void)setLeftButtonHidden:(BOOL)leftButtonHidden{
    _leftButtonHidden = leftButtonHidden;
    self.leftButton.hidden = _leftButtonHidden;
}
-(void)setRightButtonHidden:(BOOL)rightButtonHidden{
    _rightButtonHidden = rightButtonHidden;
    self.rightButtonHidden = rightButtonHidden;
}
-(void)setNavBGColor:(UIColor *)navBGColor{
    _navBGColor = navBGColor;
    self.navgationBar.backgroundColor = navBGColor;
}
-(void)setTitleColor:(UIColor *)titleColor{
    _titleColor = titleColor;
    self.navgationBar.navLabel.textColor = titleColor;
}
-(UIButton *)leftButton{
    if(_leftButton==nil){
        if(_navgationBar){
            _leftButton = _navgationBar.leftButton;
            return _leftButton;
        }
        return nil;
    }
    return nil;
}
-(UIButton *)rightButton{
    if(_rightButton==nil){
        if(_navgationBar){
            _rightButton = _navgationBar.rightButton;
            return _rightButton;
        }
        return nil;
    }
  
    return nil;
}
-(UILabel *)centerLabel{
    if(_centerLabel==nil){
        if(_navgationBar){
            _centerLabel = _navgationBar.navLabel;
            return _centerLabel;
        }
        return nil;
    }
    
    return nil;
}
#pragma mark -Public
-(void)replaceDefualtNavView:(UIView *)navView{
    if(navView){
        [_navgationBar removeFromSuperview];
        [self.view addSubview:navView];
        
    }
}
-(void)defaultLeftBtnClick{
    if(self.navigationController){
        [self.navigationController popViewControllerAnimated:YES];
    }
}
-(void)defaultRightBtnClick{
   
}
-(void)setRightButtonTitle:(NSString *)title withColor:(UIColor *)color{
    [_navgationBar.rightButton setTitleColor:color forState:UIControlStateNormal];
    [_navgationBar.rightButton setTitle:title forState:UIControlStateNormal];
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.navigationController.viewControllers.count == 1)//关闭主界面的右滑返回
    {
        
        return NO;
    } else {
        
        return YES;
    }
}
@end
