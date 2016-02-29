//
//  QuestionModel.h
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/27.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface QuestionModel : NSObject
// 回答者
@property(nonatomic,assign)NSString *specialistName;
@property(nonatomic,assign)NSString *specialistHeadPicUrl;
@property(nonatomic,strong)UIImage *specialistHeadPicImage;

// 解析数据需要判断赋值
@property(nonatomic,assign)NSString *content;
@property(nonatomic,assign)NSString *cTime1;


// 下标
// 支持数
@property(nonatomic,assign)NSString *supportCount;
// 回复数
@property(nonatomic,assign)NSString *replyCount;

+(instancetype)shareInstance;
@end
