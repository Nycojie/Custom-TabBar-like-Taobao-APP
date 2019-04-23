//
//  JFTabBarItem.h
//  LuxuryJF
//
//  Created by Nycojie on 2019/4/18.
//  Copyright © 2019 Yifeng Finance leasing co.LTD. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface JFTabBarItem : UIView
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UIImageView *imgView;
@property (nonatomic, strong)UIImageView *selectedImgView;
@property (nonatomic, strong)UILabel *badgeLabel;
@property (nonatomic, strong)UIColor *selectedTextColor;
@property (nonatomic, strong)UIColor *textColor;
@property (nonatomic, assign)BOOL selected;
@property (nonatomic, assign)BOOL enlargeImg;
@end


