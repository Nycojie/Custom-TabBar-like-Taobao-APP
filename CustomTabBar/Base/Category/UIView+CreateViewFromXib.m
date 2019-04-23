//
//  UIView+CreateViewFromXib.m
//  LuxuryJF
//
//  Created by Nycojie on 2019/4/18.
//  Copyright © 2019 Yifeng Finance leasing co.LTD. All rights reserved.
//

#import "UIView+CreateViewFromXib.h"

@implementation UIView (CreateViewFromXib)
+ (instancetype)createViewFromXib{
    NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
    NSAssert(nibs && nibs.count!=0, @"获取Nib失败!");
    return nibs.firstObject;
}
@end
