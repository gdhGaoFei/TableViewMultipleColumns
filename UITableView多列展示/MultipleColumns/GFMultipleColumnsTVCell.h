//
//  GFMultipleColumnsTVCell.h
//  UITableView多列展示
//
//  Created by 高得华 on 16/9/2.
//  Copyright © 2016年 GaoFei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GFMultipleColumnsTVCell : UIView

//需要有数据源
@property (nonatomic,strong) NSArray * dataArray;
@property (nonatomic,assign) NSInteger dataArrayCount;

//点击时返回下标
@property (nonatomic,copy) void(^ReturnClickItemIndex)(NSIndexPath * itemtIP ,NSInteger itemIndex);

//高度
@property (nonatomic,assign) CGFloat cellHeight;

//单元格的下标
@property (nonatomic,strong) NSIndexPath * indexPath;

@end
