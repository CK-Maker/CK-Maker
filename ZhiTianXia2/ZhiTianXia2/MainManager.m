//
//  MainManager.m
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/23.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import "MainManager.h"
#import "MainModel.h"

static MainManager *manager = nil;

@interface MainManager ()

@property(nonatomic,strong)NSMutableArray *modelArray;

@property(nonatomic,strong)NSMutableArray *tecoArray;

@end
@implementation MainManager

// 单例必须这么写
+ (instancetype)shareInstance{
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
       
        manager = [MainManager new];
        
    });
    
    return manager;

}

/*
- (float)mainWidth{
    
 
    return  ;
}

*/

#pragma mark 根据URL请求数据，并进行回调
- (void)requestWithUrl:(NSString *)url didFinish:(void (^)())finish {
    
    // 开辟子线程请求数据
    NSURL *Stringurl = [NSURL URLWithString:url];
 
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:Stringurl];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        // 进行数据解析
        NSDictionary *dict = dic[@"data"];
        
        NSArray *listArray = dict[@"list"];
        
        
        if (!listArray) {
            
            return;
        }
        
        // 遍历数组 取出字典
        for (NSDictionary *listDic in listArray) {
            
            
#pragma mark 主页cell模型
            // 创建模型
            MainModel *model = [MainModel new];
            
            [model setValuesForKeysWithDictionary:listDic];
            
            
            // 将模型存储进数组
            [self.modelArray addObject:model];
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // block 回调
            finish();

        });
        
    }];
    
    [task resume];

}

#pragma mark 根据URL请求数据，并进行回调
- (void)tecoRequestWithUrl:(NSString *)url didFinish:(void (^)())finish {
    
    // 开辟子线程请求数据
    NSURL *Stringurl = [NSURL URLWithString:url];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:Stringurl];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        // 进行数据解析
        NSArray *listArray = dic[@"T1348649580692"];
        
        
        if (!listArray) {
            
            return;
        }
        
        // 遍历数组 取出字典
        for (int i = 0 ; i < listArray.count; i++) {
            
            NSDictionary *listDic = listArray[i];
            
            if ([listDic[@"postid"] isEqualToString:@"BEDMGKR9000915BF"]) {
                break;
            }
            
#pragma mark 主页cell模型
            // 创建模型
            MainModel *model = [MainModel new];
            
            [model setValuesForKeysWithDictionary:listDic];
            
            
            // 将模型存储进数组
            [self.modelArray addObject:model];
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            // block 回调
            finish();
            
        });
        
    }];
    
    [task resume];
    
}



// 懒加载
-(NSMutableArray *)modelArray{
    
    if (!_modelArray) {
    
        _modelArray = [NSMutableArray array];
        
    }
    
    return _modelArray;
}

- (NSMutableArray *)tecoArray{
    
    if (_tecoArray) {
        
        _tecoArray  = [NSMutableArray array];
        
    }
    
    
    return _tecoArray;
}


#pragma mark 返回数组个数
- (NSInteger)countOfArray {
    
    return self.modelArray.count;
    
}

#pragma mark 根据下标返回模型
- (MainModel *)modelWithIndex:(NSInteger)index {
    
    MainModel *model = self.modelArray[index];
    
    return model;
}


































//老版本解析方式 访问并解析到数据，然后block进行实际操作
- (void)solveDataWith:(NSString *)StringUrl
          HttpMethod:(NSString *)method
           HttpBoday:(NSString *)StringBody
          revokBlock:(DataBlock)block{
    
    NSURL *url = [NSURL URLWithString:StringUrl];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    
    // 将所有的字母转换成大写
    NSString *SMethod = [method uppercaseString];
    
    if ([@"POST"isEqualToString:SMethod]) {
        [request setHTTPMethod:SMethod];
        
        NSData *bodyData = [StringBody dataUsingEncoding:NSUTF8StringEncoding];
        
        [request setHTTPBody:bodyData];
        
    }else if ([@"GET"isEqualToString:SMethod]){
        
    }else{
        
        
        // 创建一个异常提示
        @throw [NSException exceptionWithName:@"Param Error" reason:@"方法类型参数错误" userInfo:nil];
        
        //        // 无返回值时候进行终结
        //        return;
    }
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        block(data);
        
        
    }];
    
}


- (void)SessionDataWith:(NSString *)StringUrl
            HttpMethod:(NSString *)method
             HttpBoday:(NSString *)StringBody
            revokBlock:(DataBlock)block{
    
    
    NSURL *url = [NSURL URLWithString:StringUrl];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    NSString *SMethod = [method uppercaseString];
    
    if ([@"POST"isEqualToString:SMethod]) {
        
        [request setHTTPMethod:SMethod];
        
        NSData *bodyData = [StringBody dataUsingEncoding:NSUTF8StringEncoding];
        
        [request setHTTPBody:bodyData];
        
    }else if ([@"GET"isEqualToString:SMethod]){
        
    }else{
        
        @throw [NSException exceptionWithName:@"Param Error" reason:@"方法类型参数错误" userInfo:nil];
    }
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        block(data);
    }];
    
    
    [task resume];
    
}




// IOS9.0解析方式  访问并解析到image，然后block进行实际操作, 并且这个方法是已经确定了使用GET方法，俄日切不是获得数据，是更具体的活的图片
- (void)SessionDownloadWithUrl:(NSString *)StringUrl
                    revokBlock:(ImageSovelBlock)block{
    
    NSURL *url = [NSURL URLWithString:StringUrl];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    // 4.创建任务
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        // 获取图片两步
        NSData *imageData   =[NSData dataWithContentsOfURL:location];
        
        UIImage *image = [UIImage imageWithData:imageData];
        
        
        // 从子线程回到主线程进行叶面更新(老方法里的异步加载不是多线程，新方法里就是多线程)
        
        dispatch_async(dispatch_get_main_queue(), ^{
            block(image);
        });
        
    }];
    
    [task resume];
 
    
}







@end
