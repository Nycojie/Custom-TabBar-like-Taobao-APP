//
//  JFTabBar.m
//  LuxuryJF
//
//  Created by Nycojie on 2019/4/18.
//  Copyright © 2019 Yifeng Finance leasing co.LTD. All rights reserved.
//

#import "JFTabBar.h"
#import "JFTabBarItem.h"
@implementation JFTabBar
#pragma mark - lazy load
-(NSMutableArray *)itemArr{
    if(_itemArr==nil){
        _itemArr = [NSMutableArray array];
    }
    return _itemArr;
}
-(NSArray *)titileArr{
    if(_titileArr==nil){
        _titileArr = [NSArray array];
    }
    return _titileArr;
}
-(NSArray *)imageArr{
    if(_imageArr == nil){
        _imageArr = [NSArray array];
    }
    return _imageArr;
}
-(NSArray *)selectedImageArr{
    if(_selectedImageArr==nil){
        _selectedImageArr = [NSArray array];
        
    }
    return _selectedImageArr;
}
#pragma mark - create view
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        
    }
    return self;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    for (UIView *view in self.subviews){
        if([view isKindOfClass:NSClassFromString(@"UITabBarButton")]){
            [view removeFromSuperview];
        }
        
    }
}
+(instancetype)tabbarWithFrame:(CGRect)frame titileArr:(NSArray<NSString *> *)titileArr imageArr:(NSArray<NSString *> *)imageArr selectedImageArr:(NSArray<NSString *> *)selectedImgArr{
    JFTabBar *tabbar = [[JFTabBar alloc]initWithFrame:frame];
    tabbar.titileArr = titileArr;
    tabbar.imageArr = imageArr;
    tabbar.selectedImageArr = selectedImgArr;
    [tabbar customView];
    return tabbar;
}
-(void)customView{
    self.backgroundColor = [UIColor whiteColor];
    for (int i =0;i<self.titileArr.count;i++){
        JFTabBarItem *item = [[JFTabBarItem alloc]initWithFrame:CGRectMake(i*(ScreenWidth/self.titileArr.count), 0, (ScreenWidth/self.titileArr.count), 49)];
        item.imgView.image = [UIImage imageNamed:self.imageArr[i]];
        item.selectedImgView.image = [UIImage imageNamed:self.selectedImageArr[i]];
        item.titleLabel.text = self.titileArr[i];
        item.selected = NO;
        item.enlargeImg = i==0?YES:NO;
        item.selectedTextColor = RGB(255, 57, 112);
        
        item.tag = i;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(itemAction:)];
        [item addGestureRecognizer:tap];
        [self addSubview:item];
        [self.itemArr addObject:item];
    }
    self.selectedIndex = 0;
}
#pragma mark - action
-(void)itemAction:(UITapGestureRecognizer*)recognizer{
    self.selectedIndex = recognizer.view.tag;
    if(self.tabBarDelegate && [self.tabBarDelegate respondsToSelector:@selector(selectedJFTabBarItemAtIndex:)]){
        [self.tabBarDelegate selectedJFTabBarItemAtIndex:self.selectedIndex];
    }
}
#pragma mark - setter
-(void)setSelectedIndex:(NSInteger)selectedIndex{
    
    JFTabBarItem *oldItem = self.itemArr[self.selectedIndex];
    oldItem.selected = NO;
    _selectedIndex = selectedIndex;
    JFTabBarItem *newItem = self.itemArr[_selectedIndex];
    newItem.selected = YES;
    
}

@end
