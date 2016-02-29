//
//  AnswerModel.h
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/27.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface AnswerModel : NSObject
// 提问者

@property(nonatomic,assign)NSString *userName;
// 内容(此处也需要判断),因为两个列表都有
@property(nonatomic,assign)NSString *content;
@property(nonatomic,assign)NSString *state;

// 头像(压迫判断，可能为空, 负占位符)
@property(nonatomic,assign)NSString *userHeadPicUrl;
@property(nonatomic,strong)UIImage *userHeadPicImage;

+(instancetype)shareInstance;
@end
