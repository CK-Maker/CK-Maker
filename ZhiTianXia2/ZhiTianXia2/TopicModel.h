//
//  TopicModel.h
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/26.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TopicModel : NSObject

// 首页
// 操作是否成功
@property(nonatomic,copy)NSString *message;

// 标题
@property(nonatomic,copy)NSString *alias;

// 标题背景
@property(nonatomic,copy)NSString *picurl;
@property(nonatomic,strong)UIImage *picImage;

// 头像
@property(nonatomic,copy)NSString *headpicurl;
@property(nonatomic,strong)UIImage *headpicImage;

// 姓名
@property(nonatomic,copy)NSString *name;

// 关注度
@property(nonatomic,strong)NSNumber *concernCount;

// 分类
@property(nonatomic,copy)NSString *classification;


// 详情页面
// 职业
@property(nonatomic,copy)NSString *title;

// 自我介绍(description 重复与系统)
@property(nonatomic,copy)NSString *Description;

@property(nonatomic,copy)NSString *expertId;




#pragma mrk -- 在解析数据时候选择判断赋值
// 提问数与恢复数
@property(nonatomic,assign)NSString *questionCount;
@property(nonatomic,assign)NSString *answerCount;





+(instancetype)shareInstance;



@end
