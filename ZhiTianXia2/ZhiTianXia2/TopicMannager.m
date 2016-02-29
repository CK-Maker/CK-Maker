
//
//  TopicMannager.m
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/27.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import "TopicMannager.h"

static TopicMannager *manager = nil;
@interface TopicMannager ()
@property(nonatomic,strong)NSMutableArray *modelArray;

@end

@implementation TopicMannager

// 单例必须这么写
+ (instancetype)shareInstance{
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        manager = [TopicMannager new];
        
    });
    
    return manager;
    
}

- (void)requestWithUrl:(NSString *)url didFinish:(void (^)())finish {
    
    // 开辟子线程请求数据
    NSURL *Stringurl = [NSURL URLWithString:url];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:Stringurl];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        // 进行数据解析
        
        // 主业数据
        NSDictionary *experDic = dic[@"data"];
                
        NSArray *experArr = experDic[@"expertList"];

        for (NSDictionary *dict in experArr) {
            
            TopicModel *model = [TopicModel new];
            
            [model setValuesForKeysWithDictionary:dict];
            
            [self.modelArray  addObject:model];
            
            
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // block 回调
            finish();
            
        });
        
    }];
    [task resume];
    
}

// 懒加载
-(NSMutableArray *)modelArray{
    
    if (!_modelArray) {
        
        _modelArray = [NSMutableArray array];
    }
    
    return _modelArray;
}


#pragma mark 返回数组个数
- (NSInteger)countOfArray {
    return self.modelArray.count;
}

#pragma mark 根据下标返回模型
- (TopicModel *)modelWithIndex:(NSInteger)index {
    TopicModel *model = self.modelArray[index];
    return model;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
