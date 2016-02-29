//
//  AnswerModel.m
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/27.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import "AnswerModel.h"

#import "MainManager.h"

static AnswerModel *model = nil;
@implementation AnswerModel

+(instancetype)shareInstance{
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        model = [AnswerModel new];
    });
    
    return model;
    
}



- (void)setValue:(id)value forKey:(NSString *)key{
    
    
    
    if ([key isEqualToString:@"userHeadPicUrl"]) {
        
        [[MainManager shareInstance] SessionDownloadWithUrl:value revokBlock:^(UIImage *image) {
            
            if (image == nil) {
                self.userHeadPicImage = [UIImage imageNamed:@""];
            }else{
                self.userHeadPicImage = image;
            }
        }];
    }else{
        
        [super setValue:value forKey:key];
        
    }
    
    
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
   }



@end
