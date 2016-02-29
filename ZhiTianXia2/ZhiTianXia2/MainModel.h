//
//  MainModel.h
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/25.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface MainModel : NSObject

// 标题
@property(nonatomic,copy)NSString *title;

// cell 图片网址
@property(nonatomic,copy)NSString *pic;
@property(nonatomic,strong)UIImage *picImage;
@property(nonatomic,strong)NSString *kpic;

// 详细标题
@property(nonatomic,copy)NSString *long_title;
@property(nonatomic,copy)NSString *intro;

// 跟帖




+(instancetype)shareInstance;
@end
