//
//  TopicViewController.m
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/25.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import "TopicViewController.h"
#import "TopicModel.h"
#import "AnswerModel.h"
#import "QuestionModel.h"
#import "TopicTableViewCell.h"
#import "MainManager.h"
#import "TopicMannager.h"

#import "TopicDetailViewController.h"
static NSString *identifier = @"cell";
#define topicUrl @"http://c.m.163.com/newstopic/list/expert/0-10.html"

@interface TopicViewController ()<UITableViewDataSource,UITableViewDelegate>

@end



@implementation TopicViewController

- (void)loadView{
    
    [super loadView];
    
    self.topView = [[TopicView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.view = self.topView;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

   
    
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithTitle:@"问吧" style:UIBarButtonItemStyleDone target:self action:nil];
    
    // 让按钮不能响应(下面代码也不会实现)
    //     left.enabled = NO;
    
    left.tintColor = [UIColor whiteColor];
    
    self.navigationItem.leftBarButtonItem = left;
    
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@""] style:UIBarButtonItemStylePlain target:self action:@selector(rightAction)];
    
    self.navigationItem.rightBarButtonItem = right;
    
     self.navigationController.navigationBar.barTintColor = [UIColor redColor];
    
    
    /*
     // 设置navagation的透明度，解决上下滑动问题
     self.navigationController.navigationBar.translucent = NO;
     
     */
    
    // 解决含有navagation的顶部上下滑动问题
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    self.topView.topTableView.delegate = self;
    
    self.topView.topTableView.dataSource = self;
    
    [self.topView.topTableView registerNib:[UINib nibWithNibName:@"TopicTableViewCell" bundle:nil]forCellReuseIdentifier:identifier];
    
    

    // 加载数据
    [[TopicMannager shareInstance] requestWithUrl:topicUrl didFinish:^{
        
        [self.topView.topTableView reloadData];
    }];

    
}


- (void)rightAction{
    
  
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [[TopicMannager shareInstance] countOfArray];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    TopicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    
    
    cell.topicModel = [[TopicMannager shareInstance] modelWithIndex:indexPath.row];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    return (CGRectGetHeight([UIScreen mainScreen].bounds) - 64 - 49) / 2 + 50;
}


#pragma mark 点击cell跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 获取控制器
    TopicDetailViewController *tdvc = [[TopicDetailViewController alloc] init];
    
    TopicModel *model = [[TopicMannager shareInstance] modelWithIndex:indexPath.row];

    
    // 拼接urlhttp://c.3g.163.com/newstopic/qa/EX6025502453593172562.html
    
//    NSString *urlString = [NSString stringWithFormat:@"http://c.3g.163.com/newstopic/qa/%@.html", model.expertId];
    
    NSString *urlString  = @"http://finance.ifeng.com/a/20160128/14196316_0.shtml";
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    tdvc.url = url;
    
    tdvc.model = model;
    
    [self.navigationController pushViewController:tdvc animated:YES];
    

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
