//
//  MainTableViewCell.m
//  ZhiTianXia2
//
//  Created by lanou3g on 16/1/25.
//  Copyright © 2016年 曹凯. All rights reserved.
//

#import "MainTableViewCell.h"

@interface MainTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *cellImgeView;
@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *DetailLabel;
@end

@implementation MainTableViewCell

-(void)setMainModel:(MainModel *)mainModel{
    
    _mainModel = mainModel;
    
    // 付数据
    
    _cellImgeView.image = mainModel.picImage;
    
    _TitleLabel.text = mainModel.title;
    
    _DetailLabel.text = mainModel.intro;
    
    _DetailLabel.numberOfLines = 0;
    

    
}


- (void)setTeconModel:(TeoconModel *)teconModel{
    
    
    _teconModel = teconModel;
    
    
    _cellImgeView.image = teconModel.imgsrcImage;
    
    _TitleLabel.text = teconModel.ltitle;
    
    _DetailLabel.text = teconModel.digest;
    
    _DetailLabel.numberOfLines = 0;

    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
