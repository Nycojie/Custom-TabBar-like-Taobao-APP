//
//  CustomNavView.m
//  LuxuryJF
//
//  Created by Nycojie on 2019/4/18.
//  Copyright © 2019 Yifeng Finance leasing co.LTD. All rights reserved.
//

#import "CustomNavView.h"

@implementation CustomNavView

-(void)awakeFromNib{
    [super awakeFromNib];
    [self initView];
}
-(void)initView{
    self.rightButton.hidden = YES;
    
}
-(void)setTextColor:(UIColor *)textColor{
    _textColor = textColor;
    _navLabel.textColor = textColor;
}
#pragma mark - Action
- (IBAction)leftButtonClick:(UIButton *)sender {
    if(_leftClickHandler){
        _leftClickHandler();
    }
}

- (IBAction)rightButtonClick:(UIButton *)sender {
    if(_rightClickHandler){
        _rightClickHandler();
    }
}


@end
