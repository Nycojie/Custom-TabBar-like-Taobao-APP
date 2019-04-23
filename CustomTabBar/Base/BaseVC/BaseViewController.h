//
//  BaseViewController.h
//  LuxuryJF
//
//  Created by Nycojie on 2019/4/18.
//  Copyright © 2019 Yifeng Finance leasing co.LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CustomNavView.h"

@interface BaseViewController : UIViewController

@property (nonatomic,strong)CustomNavView *navgationBar;
@property (nonatomic,copy)NSString *navTitle;
@property (nonatomic,assign)BOOL leftButtonHidden;
@property (nonatomic,assign)BOOL rightButtonHidden;
@property (nonatomic,strong)UIColor *navBGColor;
@property (nonatomic,strong)UIButton *leftButton;
@property (nonatomic,strong)UIButton *rightButton;
@property (nonatomic,strong)UILabel *centerLabel;
@property (nonatomic,strong)UIColor *titleColor;

-(void)setRightButtonTitle:(NSString*)title withColor:(UIColor *)color;
-(void)replaceDefualtNavView:(UIView*)navView;
-(void)defaultLeftBtnClick;
-(void)defaultRightBtnClick;
@end


