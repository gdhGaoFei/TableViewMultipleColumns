//
//  GFMCTableViewCell.h
//  UITableView多列展示
//
//  Created by 高得华 on 16/9/2.
//  Copyright © 2016年 GaoFei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GFMultipleColumnsTVCell.h"

@interface GFMCTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet GFMultipleColumnsTVCell *tvCellView;

@property (nonatomic,strong) NSArray * dataArray;
@property (nonatomic,strong) NSIndexPath * indexPath;

@end
