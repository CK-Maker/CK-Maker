
//
//  LBTView.m
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/26.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import "LBTView.h"
#import "MainManager.h"
#define SWidth CGRectGetWidth([UIScreen mainScreen].bounds) / 6
@implementation LBTView

-(instancetype)initWithNumbber:(NSInteger)number{
    
   // 轮播图
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SWidth * 6, 107 * 2)];
    
    self.scrollView.contentSize = CGSizeMake(SWidth *6 * (number+2), 107 * 2);
    
    self.scrollView.bounces = NO;
    
    self.scrollView.showsVerticalScrollIndicator = YES;
    
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    self.scrollView.pagingEnabled = YES;
    
    
    
    for (int i = 0; i< number; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(SWidth * (i + 1), 100, SWidth, 107 *2)];
        

        
    }
    
    
    
    
    
    
    
    
    
    //页码
    self.pageControll = [[UIPageControl alloc] initWithFrame:CGRectMake(274, 107 * 2 - 30, 120, 10)];
    
    self.pageControll.numberOfPages = number;
    
    self.pageControll.currentPage = 0;
    
    /*
     // 剩下没选的点的颜色
     //    self.tablePage.pageIndicatorTintColor = [UIColor greenColor];
     
     // 默认白色当前点的颜色
     //    self.tablePage.currentPageIndicatorTintColor = [UIColor whiteColor];
     
     
     // 背景色
     //    self.tablePage.backgroundColor = [UIColor greenColor];
     
     */
    
    
    [self addSubview:self.scrollView];
    
    [self addSubview:self.pageControll];
    
   
    return self;

}






@end
