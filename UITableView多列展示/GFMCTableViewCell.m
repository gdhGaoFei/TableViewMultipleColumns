//
//  GFMCTableViewCell.m
//  UITableView多列展示
//
//  Created by 高得华 on 16/9/2.
//  Copyright © 2016年 GaoFei. All rights reserved.
//

#import "GFMCTableViewCell.h"

@implementation GFMCTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setIndexPath:(NSIndexPath *)indexPath{
    _indexPath = indexPath;
}
-(void)setDataArray:(NSArray *)dataArray{
    _dataArray = dataArray;
    self.tvCellView.indexPath = self.indexPath;
    self.tvCellView.dataArray = _dataArray;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
