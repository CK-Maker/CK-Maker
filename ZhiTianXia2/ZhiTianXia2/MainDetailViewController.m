//
//  MainDetailViewController.m
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/26.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import "MainDetailViewController.h"

@interface MainDetailViewController ()

@end

@implementation MainDetailViewController

- (void)loadView{
    
    [super loadView];
    
    self.mianDetailView = [[MainDetailView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.view = self.mianDetailView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem *fllow = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@""] style:UIBarButtonItemStyleDone target:self action:@selector(fllowAction)];
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@""] style:UIBarButtonItemStyleDone target:self action:@selector(rightAction)];
    
 
    
    fllow.tintColor = [UIColor redColor];
    
    self.navigationItem.rightBarButtonItems = @[fllow, right];
    
    
}

- (void)fllowAction{
    
    
}

- (void)rightAction{
    
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
