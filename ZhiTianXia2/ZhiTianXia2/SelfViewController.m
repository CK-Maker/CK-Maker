//
//  SelfViewController.m
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/25.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import "SelfViewController.h"
#import <WebKit/WebKit.h>


#define headViewUrl @"http://api.iclient.ifeng.com/ClientNews?id=CJ33%2CFOCUSCJ33&page="

// 需要接受代理
// 在storyBoard里设置的只是接收代理
@interface SelfViewController ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic,strong)UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITableView *selfTabelView;
//@property (weak, nonatomic) IBOutlet UITableViewCell *selfTableViewCell;

@property(nonatomic,strong)NSArray *dataArr;


// 头像（调取本地相册）
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

//登陆
@property (weak, nonatomic) IBOutlet UIButton *dengLubutton;

// 积分
@property (weak, nonatomic) IBOutlet UIButton *JiFenButton;

// 阅读
@property (weak, nonatomic) IBOutlet UIButton *readButton;

// 收藏
@property (weak, nonatomic) IBOutlet UIButton *clloectionButton;

// 跟帖
@property (weak, nonatomic) IBOutlet UIButton *GenTieBuutton;

// 金币
@property (weak, nonatomic) IBOutlet UIButton *MoneyButton;



@end

@implementation SelfViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dataArr = @[@"我的消息", @"金币商城", @"我的任务", @"我的钱包", @"离线阅读", @"广场活动", @"游戏中心", @"我的邮箱", @"邀请好友"];
    
    
#pragma mark - 为tableView注册cell(nib 或者 storyBoard===代码)
    
//    [self.mv.headView.tableView registerNib:[UINib nibWithNibName:@"MainTableViewCell" bundle:nil]forCellReuseIdentifier:identifier];

    
    
    [self.selfTabelView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"selfCell"];
    
    
#pragma mark --通过nib或者storyBoard获得视图
#pragma mark - 从nib或者storyBoard中拿到视图
    
    //    SelfViewController1 *svc = [UINib nibWithNibName:@"SelfViewController1" bundle:@"SelfView"];
    // 我
    //    SelfViewController *svc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"selfView"];
   
    
    self.selfTabelView.estimatedSectionHeaderHeight = 20;
    
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"selfCell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.dataArr[indexPath.row];


    
    return cell;
    
}

// 系统设置右上角按钮
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
