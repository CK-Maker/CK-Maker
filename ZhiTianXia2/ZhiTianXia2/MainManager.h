//
//  MainManager.h
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/23.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class MainModel;
// 声明匿名函数 后面参数是实参 与匿名函数声明前后都不太一样,就是把前半部分转为实参
typedef void(^DataBlock) (NSData *data);

// 这里我们已经确认就是下载图片，不用写data
typedef void(^ImageSovelBlock) (UIImage *image);

@interface MainManager : NSObject
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

- (void)tecoRequestWithUrl:(NSString *)url didFinish:(void(^)())finish;


- (NSInteger)countOfArray;

- (MainModel *)modelWithIndex:(NSInteger)index ;









//===================可以没有实例变量或属性============
// 只写到解析到数据，并不写如何操作


- (void)solveDataWith:(NSString *)StringUrl
          HttpMethod:(NSString *)method
           HttpBoday:(NSString *)StringBody
          revokBlock:(DataBlock)block;


// 新方法的
// 如果是解析
// 自己写
- (void)SessionDataWith:(NSString *)StringUrl
            HttpMethod:(NSString *)method
             HttpBoday:(NSString *)StringBody
            revokBlock:(DataBlock)block;

// 若果是下载图片(因为此方法只是为了下载图片，就不考虑post)

- (void)SessionDownloadWithUrl:(NSString *)StringUrl
                    revokBlock:(ImageSovelBlock)block;



@end
