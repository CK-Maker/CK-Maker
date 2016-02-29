//
//  MainModel.m
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/25.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import "MainModel.h"
#import "MainManager.h"

static MainModel *model = nil;
@implementation MainModel

+(instancetype)shareInstance{
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
    
        model = [MainModel new];
    });
    
    return model;
    
}



- (void)setValue:(id)value forKey:(NSString *)key{
    
    
    if ([key isEqualToString:@"kpic"]) {
        
        [[MainManager shareInstance] SessionDownloadWithUrl:value revokBlock:^(UIImage *image) {
            
            self.picImage = image;
        }];
        
    }else{
        
        [super setValue:value forKey:key];
    }
    
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
       
}





@end
