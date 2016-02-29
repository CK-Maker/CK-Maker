//
//  TeoconModel.m
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/28.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import "TeoconModel.h"
#import "MainManager.h"

static TeoconModel *model = nil;
@implementation TeoconModel
+(instancetype)shareInstance{
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        model = [TeoconModel new];
    });
    
    return model;
    
}



- (void)setValue:(id)value forKey:(NSString *)key{
    
    
    if ([key isEqualToString:@"imgsrc"]) {
        
        [[MainManager shareInstance] SessionDownloadWithUrl:value revokBlock:^(UIImage *image) {
            
            self.imgsrcImage = image;
        }];
        
    }else{
        
        [super setValue:value forKey:key];
    }
    
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}


@end
