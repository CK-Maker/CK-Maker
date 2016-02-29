//
//  MainDetailView.h
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/26.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "pinLunView.h"
@interface MainDetailView : UIView

@property(nonatomic, strong)UIScrollView *detailScrollView;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UILabel *timeLabel;
@property(nonatomic,strong)UIImageView *photoView;
@property(nonatomic,strong)UILabel *detailLabel;
@property(nonatomic,strong)pinLunView *pv;
@end
