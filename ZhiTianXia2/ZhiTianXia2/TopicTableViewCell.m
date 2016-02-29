//
//  TopicTableViewCell.m
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/26.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import "TopicTableViewCell.h"

@interface TopicTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *DetailLbel;

@property (weak, nonatomic) IBOutlet UILabel *guanzhuLabel;

@property (weak, nonatomic) IBOutlet UILabel *shiahngLabel;
@property (weak, nonatomic) IBOutlet UILabel *jinxinzhongLabel;
@property (weak, nonatomic) IBOutlet UIButton *guanzhuButton;
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
@property (weak, nonatomic) IBOutlet UIImageView *touxiangImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation TopicTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
          }

    return self;
    
}


- (void)setTopicModel:(TopicModel *)topicModel{
    
    
    _topicModel = topicModel;
    
    
    self.nameLabel.text = topicModel.name;
    
    
    self.touxiangImageView.layer.masksToBounds = YES;
    
    //边唱一半半径
    self.touxiangImageView.layer.cornerRadius = 25;
    

    
    self.touxiangImageView.image = topicModel.headpicImage;
    
    
    self.backImageView.image = topicModel.picImage;
    
    self.DetailLbel.text = topicModel.alias;
    
    self.DetailLbel.numberOfLines = 0;

    
    NSMutableString *str = [topicModel.concernCount stringValue].mutableCopy;
    
    [str appendString:@"关注"];
    
    self.guanzhuLabel.text = str;
    
    self.shiahngLabel.text = topicModel.classification;
    
    self.jinxinzhongLabel.text = @"进行中";
    
    
    
}





- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
