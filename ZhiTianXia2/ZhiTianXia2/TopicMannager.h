//
//  TopicMannager.h
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/27.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
#import "TopicModel.h"
@interface TopicMannager : UIViewController

+ (instancetype)shareInstance;

/*
 // 滑动导航栏宽度
 - (float)mainWidth;
 */

/**
 *@param NSString url 数据接口
 *@return void
 **/

- (void)requestWithUrl:(NSString *)url didFinish:(void(^)())finish;


- (NSInteger)countOfArray;

- (TopicModel *)modelWithIndex:(NSInteger)index ;



@end
