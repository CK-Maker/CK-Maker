//
//  TopicModel.m
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/26.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import "TopicModel.h"

#import "MainManager.h"

static TopicModel *model = nil;
@implementation TopicModel

+(instancetype)shareInstance{
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        model = [TopicModel new];
    });
    
    return model;
    
}



- (void)setValue:(id)value forKey:(NSString *)key{
    
    
    if ([key isEqualToString:@"picurl"]) {
        
        [[MainManager shareInstance] SessionDownloadWithUrl:value revokBlock:^(UIImage *image) {
            
            
            
            self.picImage = image;
        }];
    }else if ([key isEqualToString:@"headpicurl"]){
        
        [[MainManager shareInstance] SessionDownloadWithUrl:value revokBlock:^(UIImage *image) {
            
            self.headpicImage = image;
        }];
    }else if ([key isEqualToString:@"description"]){
        
        self.Description = value;
    }else{
        
        [super setValue:value forKey:key];

    }
    
    
        
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}



@end
