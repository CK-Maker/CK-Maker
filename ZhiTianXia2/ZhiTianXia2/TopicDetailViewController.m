//
//  TopicDetailViewController.m
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/27.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import "TopicDetailViewController.h"

@interface TopicDetailViewController ()

@end

@implementation TopicDetailViewController

- (void)loadView{
    
    [super loadView];
    
    if (self) {
        
        self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden = NO;
    
    self.navigationItem.title = self.model.Description;
    
    self.webView = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    [self.view addSubview:self.webView];
    
    self.webView.scalesPageToFit = YES;
    
    self.webView.dataDetectorTypes = UIDataDetectorTypeAll;
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:self.url];
    
    [self.webView loadRequest:request];
                    
                    
                    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
