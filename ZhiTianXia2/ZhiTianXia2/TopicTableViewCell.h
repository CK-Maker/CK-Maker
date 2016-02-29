//
//  TopicTableViewCell.h
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/26.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopicModel.h"
#import "AnswerModel.h"
#import "QuestionModel.h"
@interface TopicTableViewCell : UITableViewCell

@property(nonatomic,strong)TopicModel *topicModel;
@property(nonatomic,strong)AnswerModel *answerModel;
@property(nonatomic,strong)QuestionModel *questionModel;

@end
