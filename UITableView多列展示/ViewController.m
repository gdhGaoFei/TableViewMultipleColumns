//
//  ViewController.m
//  UITableView多列展示
//
//  Created by 高得华 on 16/9/2.
//  Copyright © 2016年 GaoFei. All rights reserved.
//

#import "ViewController.h"
#import "GFMCTableViewCell.h"
#import "GFMultipleColumnsTVCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableDictionary * dataDictionary;
@property (nonatomic,strong) NSArray * allkeys;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.allkeys = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"#",];

    self.dataDictionary = [NSMutableDictionary dictionary];
    
    for (NSString * keyStr in self.allkeys) {
        
        NSMutableArray * array = [NSMutableArray array];
        int count = arc4random() % 9 + 1;
        
        for (int i = 1; i <= count; i++) {
            
            [array addObject:[NSString stringWithFormat:@"%2d",i]];
        }
        
        [self.dataDictionary setObject:array forKey:keyStr];
    }
    
    UITableView * tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.allkeys.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    NSArray * array = [self.dataDictionary objectForKey:self.allkeys[section]];
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GFMCTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"GFMCTableViewCell"];
    if (cell == nil) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"GFMCTableViewCell" owner:nil options:nil] objectAtIndex:0];
//        cell.backgroundColor = [UIColor orangeColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.indexPath = indexPath;
    NSString * keyStr = self.allkeys[indexPath.section];
    NSArray * array = [self.dataDictionary objectForKey:keyStr];
    cell.dataArray = array;
    
    cell.tvCellView.ReturnClickItemIndex = ^(NSIndexPath * itemtIP ,NSInteger itemIndex){
        NSLog(@"----###----###---(%ld,%ld)----##---%ld----###-----",itemtIP.section,itemtIP.row,itemIndex);
    };
    
//    cell.textLabel.text = [NSString stringWithFormat:@"%ld -> %ld",indexPath.section,indexPath.row];
    return cell;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.allkeys[section];
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat cellHt = 0.0;
    NSString * keyStr = self.allkeys[indexPath.section];
    NSArray * array = [self.dataDictionary objectForKey:keyStr];
    if (array.count != 0) {
        GFMultipleColumnsTVCell * cellView = [[GFMultipleColumnsTVCell alloc] init];
        cellView.dataArrayCount = array.count;
        cellHt += cellView.cellHeight;
    }
    
    return cellHt;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return self.allkeys;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
