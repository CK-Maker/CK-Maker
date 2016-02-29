//
//  MainView.m
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/23.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import "MainView.h"
#import "MainManager.h"


#define SWidth CGRectGetWidth([UIScreen mainScreen].bounds) / 6
#define lBTUrl @"http://s11.sinaimg.cn/middle/4c3c3411ta2aeef3895ea&690"




@interface MainView ()<UIScrollViewDelegate>

// 导航滑动栏的长度(动态宽度)
@property(nonatomic, assign)CGFloat mainWidth;

@end


@implementation MainView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setupView];
    }
    
    return self;
}

- (void)setupView{
    
    // 导航滑动栏
    self.navaScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, 414 - SWidth, 36)];
    
    self.backgroundColor = [UIColor greenColor];
    
    // 写个懒加载
    self.navaScrollView.contentSize = CGSizeMake(SWidth * 8, 36);
    
    self.navaScrollView.userInteractionEnabled = YES;
    self.navaScrollView.bounces = NO;
    
    // 左右滑动
    self.navaScrollView.showsHorizontalScrollIndicator = YES;
    
    self.navaScrollView.showsVerticalScrollIndicator = NO;
    
    self.nameArr = @[@"头条", @"汽车", @"社会", @"科技", @"读书", @"旅游", @"移动互联", @"数码"];
    
//    self.buttonArr = @[self.button1, self.button2, self.button3, self.button4, self.button5, self.button6, self.button7, self.button8];
    
    for (int i = 0; i < self.nameArr.count; i++) {
        
        static UIButton *button = nil;
        
        button = [UIButton buttonWithType:UIButtonTypeCustom];
            
        button.tag = 110 + i;
        
        button.frame = CGRectMake(SWidth * i, 0, SWidth, 36);
        
        NSString *buttonName = self.nameArr[i];
        
        
        // 设置button的字体和大小
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        
        
        [button setTitle:buttonName forState:UIControlStateNormal];
        
        
        
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        
        [button setBackgroundColor:[UIColor whiteColor]];
        

        
        [self.navaScrollView addSubview:button];
        
        
        
    }
    
    
     [self addSubview:self.navaScrollView];
    
    
    
    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // 解决button点击时候颜色改变的问题
    addButton.adjustsImageWhenHighlighted = YES;
    
    
    addButton.frame = CGRectMake(5 * SWidth, 64, SWidth, 36);
    
    
    [addButton setBackgroundImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    
    [addButton addTarget:self action:@selector(addAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:addButton];
    
  /*
#pragma mark -- 主页部分
#pragma mark ---  轮播图 
    
    
    // cell高度107
    
    self.tableScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, SWidth * 6, 107 * 2)];
    
    self.tableScrollView.contentSize = CGSizeMake(SWidth * 6 * 6, 107 * 2);
    
    self.tableScrollView.bounces = NO;
    
    self.tableScrollView.showsVerticalScrollIndicator = YES;
    
    self.tableScrollView.showsHorizontalScrollIndicator = NO;
    
    self.tableScrollView.pagingEnabled = YES;
    
    
    
    for (int i = 0; i < 4; i++) {
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(SWidth * (i + 1), 100, SWidth, 107 *2)];
        
        // 设置轮播图图片
        
        
        
        [[MainManager shareInstance] SessionDownloadWithUrl:lBTUrl revokBlock:^(UIImage *image) {
           
            imageView.image = image;
        }];
        
    }
    
    
    // x方向最终到394，y里20
    self.tablePage = [[UIPageControl alloc] initWithFrame:CGRectMake(274, 107 * 2 - 30, 120, 10)];
    
    self.tablePage.numberOfPages = 4;
    
    self.tablePage.currentPage = 0;
  
   
    // 剩下没选的点的颜色
//    self.tablePage.pageIndicatorTintColor = [UIColor greenColor];

    // 默认白色当前点的颜色
//    self.tablePage.currentPageIndicatorTintColor = [UIColor whiteColor];
    
    
    // 背景色
//    self.tablePage.backgroundColor = [UIColor greenColor];
    
   
     
    
    [self addSubview:self.tableScrollView];
    
    [self addSubview:self.tablePage];
    

#pragma mark --- 主页tableVeiw
    self.mainTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 284, CGRectGetWidth(self.frame), 402)];
    
    */
    
    
    
    
    
    
    
    // 中间滚动table=========================================包含轮播图
    self.mianScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) - 100 - 49)];
    
    
    self.mianScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.frame) * 8, CGRectGetHeight(self.frame) - 100 - 49);
    
    self.mianScrollView.bounces = NO;
    
    self.mianScrollView.showsVerticalScrollIndicator = YES;
    
    self.mianScrollView.showsHorizontalScrollIndicator = NO;
    
    self.mianScrollView.pagingEnabled = YES;
    
    [self addSubview:self.mianScrollView];
    

    
    // 头条
    self.headView = [[HeadLineView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    
    [self.mianScrollView addSubview:self.headView];
    
    
    // 汽车
    self.carView = [[CarView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame), 0, CGRectGetWidth(self.frame) *2, CGRectGetHeight(self.frame))];
    
    [self.mianScrollView addSubview:self.carView];
    
    // 社会
    self.societyView = [[SocietyView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame) * 3, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    
    [self.mianScrollView addSubview:self.societyView];
    
    // 科技
    
    self.technologyView = [[technologyView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame) * 4, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    
    [self.mianScrollView addSubview:self.technologyView];
    
    // 读书
    self.studyView = [[StudyView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame) * 5, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    
    [self.mianScrollView addSubview:self.studyView];
    
    
    // 旅游
    self.travelView = [[travelView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame) * 6, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    
    [self.mianScrollView addSubview:self.travelView];
    
    
    //移动互联
    self.internetView = [[InternetView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame) * 7, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    
    [self.mianScrollView addSubview:self.internetView];
    
    
    // 数码
    self.degitalView = [[DigitalView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame) * 7, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    
    [self.mianScrollView addSubview:self.degitalView];
    
    
    self.arrView = @[self.headView, self.carView, self.societyView, self.technologyView, self.studyView, self.travelView, self.internetView, self.degitalView];
    

    
    
}



//- (void)action{
//    
//    self.backgroundColor = [UIColor redColor];
//}



// 导航栏添加按钮响应事件
- (void)addAction{
    
    [self setBackgroundColor:[UIColor greenColor]];
    
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    
    UIMenuItem *item1 = [[UIMenuItem alloc] initWithTitle:@"1" action:@selector(menuItem1Action)];
    
    UIMenuItem *item2 = [[UIMenuItem alloc] initWithTitle:@"2" action:@selector(menuItem2Action)];
    
    UIMenuItem *item3 = [[UIMenuItem alloc] initWithTitle:@"3" action:@selector(menuItem3Action)];
    
    // 给菜单设置标题
    NSArray *menuItems = [NSArray arrayWithObjects:item1, item2, item3 ,nil];
    
    // 菜单加入标题
    [menuController setMenuItems:menuItems];
    
    // 菜单出现方向
    [menuController setArrowDirection:UIMenuControllerArrowDown];
    
    
    // 定位菜单:设置菜单探矿的范围,并在那个view中显示
    [menuController setTargetRect:CGRectMake(162, 195, 0, 0) inView:self];
    
    // 展示meun
    [menuController setMenuVisible:YES animated:YES];
    
    // 使view或viewController的self成为第一响应者
    [self becomeFirstResponder];
    
    
}

// 菜单选项功能

- (void)menuItem1Action{
    

    
}

- (void)menuItem2Action{
    
    
}

- (void)menuItem3Action{
    
    
}

// 设置-(BOOL) canBecomeFirstResponder的返回值为YES
- (BOOL)canBecomeFirstResponder{
    
    return YES;
}

// 重载函数-(BOOL) canPerfomAction:(SEL)action withSender:(id)sender，设置要显示的菜单项，返回值为YES。若不进行任何限制，则将显示系统自带的所有菜单项（很多的，自己可以 试一下)，在此，只显示自定义的4项，

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    
    
    if (action == @selector(menuItem1Action) || action == @selector(menuItem2Action) || action == @selector(menuItem3Action)) {
        
        return YES;
        
    }else{
        
        return NO;  //隐藏系统默认的菜单项
    }
    
    
}



// 返回滑动导航栏的宽度, 懒加载
/*

-(CGFloat)mainWidth{
    
    return  [[MainManager shareInstance] mainWidth];
}
*/
@end
