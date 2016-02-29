//
//  QuestionModel.m
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/27.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import "QuestionModel.h"

#import "MainManager.h"

static QuestionModel *model = nil;
@implementation QuestionModel

+(instancetype)shareInstance{
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        model = [QuestionModel new];
    });
    
    return model;
    
}

- (void)setValue:(id)value forKey:(NSString *)key{
    
    
    
    if ([key isEqualToString:@"specialistHeadPicUrl"]) {
        
        [[MainManager shareInstance] SessionDownloadWithUrl:value revokBlock:^(UIImage *image) {
            
            if (image == nil) {
                self.specialistHeadPicImage = [UIImage imageNamed:@""];
            }else{
                self.specialistHeadPicImage = image;
            }
        }];
    }else{
        
        [super setValue:value forKey:key];
        
    }
    
    
}




- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}


@end
