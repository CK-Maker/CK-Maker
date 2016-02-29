//
//  HeadLineView.m
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/26.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import "HeadLineView.h"

@implementation HeadLineView

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setupView];
    }
    
    return self;
}

- (void)setupView{
    
//    self.lbt = [[LBTView alloc] initWithNumbber:4];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight(self.frame) ) style:UITableViewStylePlain];
    
//    [self addSubview:self.lbt];
    
    [self addSubview:self.tableView];
    
}

@end
