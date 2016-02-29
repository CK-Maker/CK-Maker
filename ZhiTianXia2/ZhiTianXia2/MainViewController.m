//
//  MainViewController.m
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/23.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import "MainViewController.h"
#import "MainManager.h"
#import "MainTableViewCell.h"
#import "HeadLineView.h"
#import "MainDetailViewController.h"
#define SWidth CGRectGetWidth([UIScreen mainScreen].bounds)

#define headViewUrl @"http://api.sina.cn/sinago/list.json?chwm=14010_0001&MAC=e3f5536a141811db40efd6400f1d0a4e&wm=b207&behavior=manual&city=WMXX2971&pull_times=2&platfrom_version=6.0&loading_ad_timestamp=0&pull_direction=down&from=6049295012&AndroidID=8c59c71582eb1340468eba36e1ebac71&oldchwm=14010_0001&IMEI=1181a969924fa506046aa5e43edb195d&v=1&connection_type=2&imei=865009024519808&uid=d99a7db784e77a2a&replaced_flag=0&channel=news_toutiao"

#define teconViewUrl @"http://c.m.163.com/nc/article/list/T1348649580692/0-20.html"

#define carViewUrl @"http://api.sina.cn/sinago/list.json?chwm=14010_0001&MAC=e3f5536a141811db40efd6400f1d0a4e&wm=b207&behavior=manual&city=WMXX2971&pull_times=2&platfrom_version=6.0&loading_ad_timestamp=0&pull_direction=down&from=6049295012&AndroidID=8c59c71582eb1340468eba36e1ebac71&oldchwm=14010_0001&IMEI=1181a969924fa506046aa5e43edb195d&v=1&connection_type=2&imei=865009024519808&uid=d99a7db784e77a2a&replaced_flag=0&channel=news_toutiao"


#define technologyViewUrl @"http://api.sina.cn/sinago/list.json?chwm=14010_0001&MAC=e3f5536a141811db40efd6400f1d0a4e&wm=b207&behavior=manual&city=WMXX2971&pull_times=2&platfrom_version=6.0&loading_ad_timestamp=0&pull_direction=down&from=6049295012&AndroidID=8c59c71582eb1340468eba36e1ebac71&oldchwm=14010_0001&IMEI=1181a969924fa506046aa5e43edb195d&v=1&connection_type=2&imei=865009024519808&uid=d99a7db784e77a2a&replaced_flag=0&channel=news_toutiao"


#define societyViewUrl @"http://api.sina.cn/sinago/list.json?chwm=14010_0001&MAC=e3f5536a141811db40efd6400f1d0a4e&wm=b207&behavior=manual&city=WMXX2971&pull_times=2&platfrom_version=6.0&loading_ad_timestamp=0&pull_direction=down&from=6049295012&AndroidID=8c59c71582eb1340468eba36e1ebac71&oldchwm=14010_0001&IMEI=1181a969924fa506046aa5e43edb195d&v=1&connection_type=2&imei=865009024519808&uid=d99a7db784e77a2a&replaced_flag=0&channel=news_toutiao"


#define internetViewUrl @"http://api.sina.cn/sinago/list.json?chwm=14010_0001&MAC=e3f5536a141811db40efd6400f1d0a4e&wm=b207&behavior=manual&city=WMXX2971&pull_times=2&platfrom_version=6.0&loading_ad_timestamp=0&pull_direction=down&from=6049295012&AndroidID=8c59c71582eb1340468eba36e1ebac71&oldchwm=14010_0001&IMEI=1181a969924fa506046aa5e43edb195d&v=1&connection_type=2&imei=865009024519808&uid=d99a7db784e77a2a&replaced_flag=0&channel=news_toutiao"


#define travelViewUrl @"http://api.sina.cn/sinago/list.json?chwm=14010_0001&MAC=e3f5536a141811db40efd6400f1d0a4e&wm=b207&behavior=manual&city=WMXX2971&pull_times=2&platfrom_version=6.0&loading_ad_timestamp=0&pull_direction=down&from=6049295012&AndroidID=8c59c71582eb1340468eba36e1ebac71&oldchwm=14010_0001&IMEI=1181a969924fa506046aa5e43edb195d&v=1&connection_type=2&imei=865009024519808&uid=d99a7db784e77a2a&replaced_flag=0&channel=news_toutiao"


#define studyViewUrl @"http://api.sina.cn/sinago/list.json?chwm=14010_0001&MAC=e3f5536a141811db40efd6400f1d0a4e&wm=b207&behavior=manual&city=WMXX2971&pull_times=2&platfrom_version=6.0&loading_ad_timestamp=0&pull_direction=down&from=6049295012&AndroidID=8c59c71582eb1340468eba36e1ebac71&oldchwm=14010_0001&IMEI=1181a969924fa506046aa5e43edb195d&v=1&connection_type=2&imei=865009024519808&uid=d99a7db784e77a2a&replaced_flag=0&channel=news_toutiao"


#define studyViewUrl @""

#define degitalViewUrl @"http://api.sina.cn/sinago/list.json?chwm=14010_0001&MAC=e3f5536a141811db40efd6400f1d0a4e&wm=b207&behavior=manual&city=WMXX2971&pull_times=2&platfrom_version=6.0&loading_ad_timestamp=0&pull_direction=down&from=6049295012&AndroidID=8c59c71582eb1340468eba36e1ebac71&oldchwm=14010_0001&IMEI=1181a969924fa506046aa5e43edb195d&v=1&connection_type=2&imei=865009024519808&uid=d99a7db784e77a2a&replaced_flag=0&channel=news_toutiao"


#define kMusicUrl @"http://project.lanou3g.com/teacher/UIAPI/MusicInfoList.plist"


static NSString *identifier = @"mainCell";

@interface MainViewController ()<UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>

// 用来存储数据
@property(nonatomic,strong)NSMutableArray *data;

// 用来存储网址
@property(nonatomic,strong)NSArray *urlArr;

// 滑动条数
@property(nonatomic,assign)NSInteger number;

// 控制输入number
@property(nonatomic,assign)BOOL selection;


// 刷新标志
@property(nonatomic,strong)UIRefreshControl *refresh;

@property(nonatomic,strong)UIActivityViewController *activity;

@property(nonatomic,assign)BOOL isLoading;

@end

@implementation MainViewController

- (void)loadView{
    
    [super loadView];
    
    self.mv = [[MainView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.view = self.mv;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
#pragma mark - 刷新 
    
//    UIActivityViewController
    
//    UIRefreshControl
    
    self.refresh = [[UIRefreshControl alloc] init];
    
    self.refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"刷新"];
    
    self.refresh.tintColor = [UIColor redColor];
    
    [self.refresh addTarget:self action:@selector(refreshView) forControlEvents:UIControlEventValueChanged];
    
    [self.mv.headView.tableView addSubview:self.refresh];
    
    
#pragma mark - 此处先用汉字代替，然后照图片,同时网址也是假的
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithTitle:@"知天下" style:UIBarButtonItemStyleDone target:self action:nil];
    
    // 让按钮不能响应(下面代码也不会实现)
//     left.enabled = NO;
    
    left.tintColor = [UIColor brownColor];
    
    self.navigationItem.leftBarButtonItem = left;

    /*
    // 设置navagation的透明度，解决上下滑动问题
    self.navigationController.navigationBar.translucent = NO;
     
     */
    
    // 解决含有navagation的顶部上下滑动问题
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    // 头条的轮播图的代理和中间内容部分的代理
    self.mv.headView.tableView.delegate= self;
    self.mv.headView.tableView.dataSource = self;
    self.mv.headView.lbt.scrollView.delegate = self;
    
    
    
    self.mv.carView.tableView.delegate= self;
    self.mv.carView.tableView.dataSource = self;
    self.mv.carView.lbt.scrollView.delegate = self;
    

    self.mv.technologyView.tableView.delegate= self;
    self.mv.technologyView.tableView.dataSource = self;
    self.mv.technologyView.lbt.scrollView.delegate = self;
    

    self.mv.societyView.tableView.delegate= self;
    self.mv.societyView.tableView.dataSource = self;
    self.mv.societyView.lbt.scrollView.delegate = self;

    

    self.mv.internetView.tableView.delegate= self;
    self.mv.internetView.tableView.dataSource = self;
    self.mv.internetView.lbt.scrollView.delegate = self;

    

    self.mv.travelView.tableView.delegate= self;
    self.mv.travelView.tableView.dataSource = self;
    self.mv.travelView.lbt.scrollView.delegate = self;

    

    self.mv.studyView.tableView.delegate= self;
    self.mv.studyView.tableView.dataSource = self;
    self.mv.studyView.lbt.scrollView.delegate = self;


    self.mv.degitalView.tableView.delegate= self;
    self.mv.degitalView.tableView.dataSource = self;
    self.mv.degitalView.lbt.scrollView.delegate = self;

    
    
    /*
    
    
    [self.mv.tablePage addTarget:self action:@selector(pageAction) forControlEvents:UIControlEventTouchUpInside];
        */
    
    [self.mv.headView.tableView registerNib:[UINib nibWithNibName:@"MainTableViewCell" bundle:nil]forCellReuseIdentifier:identifier];

    
    
    // 加载数据
    [[MainManager shareInstance] requestWithUrl:headViewUrl didFinish:^{
        [self.mv.headView.tableView reloadData];
    }];

    
    self.urlArr = @[headViewUrl, teconViewUrl, teconViewUrl, teconViewUrl, teconViewUrl, teconViewUrl, teconViewUrl, teconViewUrl];
    
    
    
#pragma mark button 的响应事件
    

     NSArray *viewArr = [self.mv.navaScrollView subviews];
    
    self.mv.button1 = (UIButton *)[viewArr[0] viewWithTag:110];
    
    [self.mv.button1 addTarget:self action:@selector(touchAction1) forControlEvents:UIControlEventTouchUpInside];
    
    self.mv.button2 = (UIButton *)[viewArr[1] viewWithTag:111];
    
    [self.mv.button2 addTarget:self action:@selector(touchAction2) forControlEvents:UIControlEventTouchUpInside];

    self.mv.button3 = (UIButton *)[viewArr[2] viewWithTag:112];
    
    [self.mv.button3 addTarget:self action:@selector(touchAction3) forControlEvents:UIControlEventTouchUpInside];

    self.mv.button4 = (UIButton *)[viewArr[3] viewWithTag:113];
    
    [self.mv.button4 addTarget:self action:@selector(touchAction4) forControlEvents:UIControlEventTouchUpInside];

    self.mv.button5 = (UIButton *)[viewArr[4] viewWithTag:114];
    
    [self.mv.button5 addTarget:self action:@selector(touchAction5) forControlEvents:UIControlEventTouchUpInside];

    self.mv.button6 = (UIButton *)[viewArr[5] viewWithTag:115];
    
    [self.mv.button6 addTarget:self action:@selector(touchAction6) forControlEvents:UIControlEventTouchUpInside];

    self.mv.button7 = (UIButton *)[viewArr[6] viewWithTag:116];
    
    [self.mv.button7 addTarget:self action:@selector(touchAction7) forControlEvents:UIControlEventTouchUpInside];

    self.mv.button8 = (UIButton *)[viewArr[7] viewWithTag:117];
    
    [self.mv.button8 addTarget:self action:@selector(touchAction8) forControlEvents:UIControlEventTouchUpInside];

    
    
    
    
    /*
    NSArray *array = [self.mv.navaScrollView subviews];
    
    
    for (int i = 0; i < 8; i++) {
        
        UIButton *button = (UIButton *)[array[i] viewWithTag:i + 110];
        
        [button addTarget:self action:@selector(touchAction) forControlEvents:UIControlEventTouchUpInside];
        
        self.number = i;
    }
    
    */
    
}


// 刷新加载方法
- (void)refreshView{
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self.refresh endRefreshing];
}

// 懒加载data

-(NSMutableArray *)data{
    
    dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        _data  = [NSMutableArray new];
    });
    
    return _data;
}


#pragma mark ---- 为什么不能用上面的方法

// 懒加载网址数组
-(NSArray *)urlArr{
    
    if (!_urlArr) {
        _urlArr = [NSArray array];
    }
    return _urlArr;
}


// button事件
- (void)touchAction1{
    
    
    _selection = YES;

    self.number = 0;
    
    [self scrollViewDidEndDecelerating:self.mv.mianScrollView];
    
    }

- (void)touchAction2{
    
    _selection = YES;
    
    self.number = 1;
    
    self.view.backgroundColor = [UIColor blackColor];
    
    [self scrollViewDidEndDecelerating:self.mv.mianScrollView];
    

}

- (void)touchAction3{
    
    _selection = YES;
    
    self.number = 2;
    
    [self scrollViewDidEndDecelerating:self.mv.mianScrollView];
    
    
}

- (void)touchAction4{
    
    _selection = YES;
    
    self.number = 3;
    
    [self scrollViewDidEndDecelerating:self.mv.mianScrollView];
    
    
}

- (void)touchAction5{
    
    _selection = YES;
    
    self.number = 4;
    
    [self scrollViewDidEndDecelerating:self.mv.mianScrollView];
    
    
}

- (void)touchAction6{
    
    _selection = YES;
    
    self.number = 5;
    
    [self scrollViewDidEndDecelerating:self.mv.mianScrollView];
    
    
}

- (void)touchAction7{
    
    _selection = YES;
    
    self.number = 6;
    
    [self scrollViewDidEndDecelerating:self.mv.mianScrollView];
    
    
}

- (void)touchAction8{
    
    _selection = YES;
    
    self.number = 7;
    
    [self scrollViewDidEndDecelerating:self.mv.mianScrollView];
    
    self.view.backgroundColor = [UIColor blackColor];
    
}


/*

- (void)touchAction{
    
     _selection = YES;
    
     [self scrollViewDidEndDecelerating:self.mv.mianScrollView];


}

*/
// 当开始拖动

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    _selection = NO;
}

// 当减速完成后开始加载下一页面
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    
    if (!_selection) {
        self.number = scrollView.contentOffset.x / CGRectGetWidth([UIScreen mainScreen].bounds);
        
    }
  
    switch (self.number) {
                   
               case  0:{
                [self.mv.headView.tableView registerNib:[UINib nibWithNibName:@"MainTableViewCell" bundle:nil]forCellReuseIdentifier:identifier];
                   
                [[MainManager shareInstance] requestWithUrl:self.urlArr[0] didFinish:^{
                    
                    [self.mv.headView.tableView reloadData];
                    
                }];

                
                break;
               }
                
               case  1:{
                
                [self.mv.carView.tableView registerNib:[UINib nibWithNibName:@"MainTableViewCell" bundle:nil]forCellReuseIdentifier:identifier];
                
                [[MainManager shareInstance] tecoRequestWithUrl:self.urlArr[1] didFinish:^{
                    
                    [self.mv.carView.tableView reloadData];
                    
                }];
                
                break;
               }
               case  2:{
               
                [self.mv.societyView.tableView registerNib:[UINib nibWithNibName:@"MainTableViewCell" bundle:nil]forCellReuseIdentifier:identifier];
                
                
                 [[MainManager shareInstance] tecoRequestWithUrl:self.urlArr[2] didFinish:^{
                    
                    [self.mv.societyView.tableView reloadData];

                }];
                
                
                break;
               }
            case  3:
               {
                   
                [self.mv.technologyView.tableView registerNib:[UINib nibWithNibName:@"MainTableViewCell" bundle:nil]forCellReuseIdentifier:identifier];
                
                 [[MainManager shareInstance] tecoRequestWithUrl:self.urlArr[3] didFinish:^{
                    
                    [self.mv.technologyView.tableView reloadData];
                    
                }];
                
                
                break;
                   
               }
               case  4:{
                
                [self.mv.studyView.tableView registerNib:[UINib nibWithNibName:@"MainTableViewCell" bundle:nil]forCellReuseIdentifier:identifier];
                
                
                 [[MainManager shareInstance] tecoRequestWithUrl:self.urlArr[4] didFinish:^{
                    
                    [self.mv.studyView.tableView reloadData];
                }];
                

                break;
               }
                
               case  5:{
                
                [self.mv.travelView.tableView registerNib:[UINib nibWithNibName:@"MainTableViewCell" bundle:nil]forCellReuseIdentifier:identifier];
                
                 [[MainManager shareInstance] tecoRequestWithUrl:self.urlArr[5] didFinish:^{
                    
                    [self.mv.travelView.tableView reloadData];

                }];
                
                
                break;
                   
               }
               case  6:{
                
                [self.mv.internetView.tableView registerNib:[UINib nibWithNibName:@"MainTableViewCell" bundle:nil]forCellReuseIdentifier:identifier];
                
                
                 [[MainManager shareInstance] tecoRequestWithUrl:self.urlArr[6] didFinish:^{
                    
                    [self.mv.internetView.tableView reloadData];

                    
                }];

                
                
                break;
                   
               }
            
               case  7:{
                
                [self.mv.degitalView.tableView registerNib:[UINib nibWithNibName:@"MainTableViewCell" bundle:nil]forCellReuseIdentifier:identifier];
                
                
                 [[MainManager shareInstance] tecoRequestWithUrl:self.urlArr[7] didFinish:^{
                    
                    [self.mv.degitalView.tableView reloadData];
                }];

                break;
               }
                
               default:{
                break;
               }
 
        }
        
    
}


// 主页轮播图
/*
#pragma mark -- 主页轮播图
// pageControll的响应事件

- (void)pageAction{
    
    self.mv.tableScrollView.contentOffset = CGPointMake(SWidth * (self.mv.tablePage.currentPage + 1), 0);
    
    
}

// 轮播图

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
   
    
    
    if (self.mv.tableScrollView.contentOffset.x == 0) {
        
        self.mv.tableScrollView.contentOffset = CGPointMake(SWidth * 5, 0);
        
        self.mv.tablePage.currentPage = 3;
        
    } else if (self.mv.tableScrollView.contentOffset.x == SWidth * 5){
        
        self.mv.tableScrollView.contentOffset = CGPointMake(SWidth, 0);
        
        self.mv.tablePage.currentPage = 0;
        
    }
}
*/



#pragma mark -- tableViewCell

// cell个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return [[MainManager shareInstance] countOfArray];
}


// 自定义cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    cell.mainModel = [[MainManager shareInstance] modelWithIndex:indexPath.row];

    return cell;
}


// cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 107;
}



#pragma mark 点击cell跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 获取控制器
    MainDetailViewController *mdvc = [[MainDetailViewController alloc] init];
    
    mdvc.mainDetailModel = [[MainManager shareInstance] modelWithIndex:indexPath.row];
    
    
    
    
    
    [self.navigationController pushViewController:mdvc animated:YES];
    
        
    
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
