//
//  TopicView.m
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/25.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import "TopicView.h"
#import "TopicTableViewCell.h"
#import "TopicModel.h"
@implementation TopicView
-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    
    }
    return self;
}

- (void)setupView{
    
    self.topTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds))];
    
    [self addSubview:self.topTableView];
}

@end
