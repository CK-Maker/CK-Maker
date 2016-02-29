//
//  LBTView.h
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/26.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LBTView : UIView
@property(nonatomic,strong)UIScrollView *scrollView;

@property(nonatomic,strong)UIPageControl *pageControll;

-(instancetype)initWithNumbber:(NSInteger)number;

@end
