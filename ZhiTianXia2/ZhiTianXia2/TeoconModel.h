//
//  TeoconModel.h
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/28.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TeoconModel : NSObject
// 标题
@property(nonatomic,copy)NSString *ltitle;
// 详细标题
@property(nonatomic,copy)NSString *digest;




// cell 图片网址
@property(nonatomic,copy)NSString *imgsrc;
@property(nonatomic,strong)UIImage *imgsrcImage;



#pragma mark -- 详细页面
// 详细网址
@property(nonatomic,copy)NSString *url_3w;
// 跟帖
@property(nonatomic,copy)NSNumber *replyCount;
// 详细页面标题
@property(nonatomic,copy)NSString *title;
// 来源
@property(nonatomic,copy)NSString *source;
// 时间
@property(nonatomic,copy)NSString *ptime;


+(instancetype)shareInstance;

@end
