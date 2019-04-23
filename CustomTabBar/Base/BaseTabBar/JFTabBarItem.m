//
//  JFTabBarItem.m
//  LuxuryJF
//
//  Created by Nycojie on 2019/4/18.
//  Copyright © 2019 Yifeng Finance leasing co.LTD. All rights reserved.
//

#import "JFTabBarItem.h"

@implementation JFTabBarItem
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(self){
        [self customView];
    }
    return self;
}
-(void)customView{
    
    _selectedTextColor = [UIColor blueColor];
    _textColor = [UIColor lightGrayColor];
    [self addSubview:self.titleLabel];
    [self addSubview:self.imgView];
    [self addSubview:self.selectedImgView];
    [self addSubview:self.badgeLabel];
    self.imgView.frame = CGRectMake(0, 0, 21.5, 22);
    self.imgView.center = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2.0 - 5);
    self.titleLabel.frame = CGRectMake(0, self.bounds.size.height-12, self.bounds.size.width, 12);
    
    self.selectedImgView.frame = CGRectMake(0, 0, 21.5, 22);
    self.selectedImgView.center = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2.0 - 5);
    
    self.badgeLabel.center = CGPointMake(CGRectGetMaxX(self.imgView.frame)-5, self.imgView.bounds.origin.y+5);
   
}
-(void)setSelected:(BOOL)selected{
    _selected = selected;
    if(_selected){
        self.selectedImgView.hidden = NO;
        [self animateWithSelectedImg];
        self.imgView.hidden = YES;
        self.titleLabel.textColor = _selectedTextColor;
        self.titleLabel.hidden = _enlargeImg?YES:NO;
        
        
    }else{
        
        self.titleLabel.textColor = _textColor;
        self.selectedImgView.hidden = YES;
        self.imgView.hidden = NO;
        self.titleLabel.hidden = NO;
        
    }
}
-(void)setEnlargeImg:(BOOL)enlargeImg{
    _enlargeImg = enlargeImg;
    if(_enlargeImg){
        self.selectedImgView.frame = CGRectMake(0, 0, 32, 32);
        self.selectedImgView.center = CGPointMake(self.bounds.size.width/2.0, self.bounds.size.height/2.0);
    }else{
       
    }
}
-(void)animateWithSelectedImg{
    
    
    if(_enlargeImg==NO){
        return;
    }
    
    CABasicAnimation*pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulse.duration = 0.15;
    pulse.repeatCount= 1;
    pulse.autoreverses= YES;
    pulse.fromValue= [NSNumber numberWithFloat:0.8];
    pulse.toValue= [NSNumber numberWithFloat:1.2];
    [self.selectedImgView.layer addAnimation:pulse forKey:nil];
}
#pragma mark - getter
-(UILabel *)titleLabel{
    if(_titleLabel==nil){
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:10];
        _titleLabel.textColor = _textColor;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
-(UIImageView *)imgView{
    if(_imgView==nil){
        _imgView = [[UIImageView alloc]init];
        _imgView.userInteractionEnabled = YES;
    }
    return _imgView;
}
-(UIImageView *)selectedImgView{
    if(_selectedImgView==nil){
        _selectedImgView = [[UIImageView alloc]init];
        _selectedImgView.userInteractionEnabled = YES;
    }
    return _selectedImgView;
}
-(UILabel *)badgeLabel{
    if(_badgeLabel==nil){
        _badgeLabel = [[UILabel alloc]init];
        _badgeLabel.font = [UIFont systemFontOfSize:12];
        _badgeLabel.textColor = [UIColor whiteColor];
        _badgeLabel.textAlignment = NSTextAlignmentCenter;
        _badgeLabel.hidden = YES;
        _badgeLabel.backgroundColor = [UIColor redColor];
    }
    return _badgeLabel;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    [self.badgeLabel sizeToFit];
    
    CGSize size = [@"#" sizeWithAttributes:@{NSFontAttributeName:self.badgeLabel.font}];
    float width = self.badgeLabel.bounds.size.width+size.width;
    float height = self.badgeLabel.bounds.size.height;
    if(width>height){
        width = height;
    }
    self.badgeLabel.layer.cornerRadius = height/2.0;
    self.badgeLabel.clipsToBounds = YES;
    CGRect frame = self.badgeLabel.frame;
    frame.size.width = width;
    frame.size.height = height;
    self.badgeLabel.frame = frame;
}
@end
