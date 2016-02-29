//
//  MainDetailViewController.h
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/26.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainModel.h"
#import "MainDetailView.h"
@interface MainDetailViewController : UIViewController
@property(nonatomic,strong)MainModel *mainDetailModel;
@property(nonatomic,strong)MainDetailView *mianDetailView;


@end
