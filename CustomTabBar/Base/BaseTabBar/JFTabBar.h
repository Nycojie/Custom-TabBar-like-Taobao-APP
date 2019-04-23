//
//  JFTabBar.h
//  LuxuryJF
//
//  Created by Nycojie on 2019/4/18.
//  Copyright © 2019 Yifeng Finance leasing co.LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JFTabBarDelegate <NSObject>

-(void)selectedJFTabBarItemAtIndex:(NSInteger)index;

@end

@interface JFTabBar : UITabBar
@property (nonatomic,strong)NSMutableArray *itemArr;
@property (nonatomic,assign)NSInteger selectedIndex;
@property (nonatomic,strong)NSArray *titileArr;
@property (nonatomic,strong)NSArray *imageArr;
@property (nonatomic,strong)NSArray *selectedImageArr;
@property (nonatomic,weak)id<JFTabBarDelegate>tabBarDelegate;

+(instancetype)tabbarWithFrame:(CGRect)frame titileArr:(NSArray<NSString*>*)titileArr imageArr:(NSArray<NSString*>*)imageArr selectedImageArr:(NSArray<NSString*>*)selectedImgArr;


@end

