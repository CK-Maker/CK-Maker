//
//  MainView.h
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/23.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeadLineView.h"
#import "CarView.h"
#import "SocietyView.h"
#import "technologyView.h"
#import "StudyView.h"
#import "travelView.h"
#import "InternetView.h"
#import "DigitalView.h"
@interface MainView : UIView

// 滚动视图的button
@property(nonatomic,strong)UIButton *button1;
@property(nonatomic,strong)UIButton *button2;
@property(nonatomic,strong)UIButton *button3;
@property(nonatomic,strong)UIButton *button4;
@property(nonatomic,strong)UIButton *button5;
@property(nonatomic,strong)UIButton *button6;
@property(nonatomic,strong)UIButton *button7;
@property(nonatomic,strong)UIButton *button8;



// 导航栏
@property(nonatomic,strong)UIScrollView *navaScrollView;


// 主页滚动视图
@property(nonatomic,strong)UIScrollView *mianScrollView;



// 中间滚动视图部分
@property(nonatomic,strong)HeadLineView *headView;
@property(nonatomic,strong)CarView *carView;
@property(nonatomic,strong)SocietyView *societyView;
@property(nonatomic,strong)technologyView *technologyView;
@property(nonatomic,strong)StudyView *studyView;
@property(nonatomic,strong)travelView *travelView;
@property(nonatomic,strong)InternetView *internetView;
@property(nonatomic,strong)DigitalView *degitalView;


// 视图数组
@property(nonatomic,strong)NSArray *arrView;
// 滚动控制器视图数组
@property(nonatomic,strong)NSArray *buttonArr;
@property(nonatomic,strong)NSArray *nameArr;

@end
