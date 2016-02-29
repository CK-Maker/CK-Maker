//
//  MainTableViewCell.h
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/25.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainModel.h"
#import "TeoconModel.h"
@interface MainTableViewCell : UITableViewCell
@property(nonatomic,strong)MainModel *mainModel;
@property(nonatomic,strong)TeoconModel *teconModel;

@end
