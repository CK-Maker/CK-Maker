//
//  TopicDetailViewController.h
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/27.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicModel.h"
#import <WebKit/WebKit.h>
@interface TopicDetailViewController : UIViewController
@property(nonatomic, strong)NSURL *url;
@property(nonatomic,strong)TopicModel *model;

@property(nonatomic,strong)UIWebView *webView;
@end
