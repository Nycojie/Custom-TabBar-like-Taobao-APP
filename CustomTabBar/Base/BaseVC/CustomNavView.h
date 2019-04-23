//
//  CustomNavView.h
//  LuxuryJF
//
//  Created by Nycojie on 2019/4/18.
//  Copyright © 2019 Yifeng Finance leasing co.LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^NavBtnClickBlock) (void);

@interface CustomNavView : UIView
@property (weak, nonatomic) IBOutlet UILabel *navLabel;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (nonatomic,copy) NavBtnClickBlock leftClickHandler;
@property (nonatomic,copy) NavBtnClickBlock rightClickHandler;
@property (nonatomic,strong) UIColor *textColor;

@end


