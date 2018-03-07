//
//  ViewController.m
//  MasonryLearn
//
//  Created by jinghua on 2017/5/27.
//  Copyright © 2017年 Sugar. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

#import "BasicView.h"
#import "UpdateView.h"
#import "RemakeView.h"
#import "ConstantsView.h"
#import "SidesView.h"
#import "AspectFitView.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation ViewController

- (NSMutableArray *)dataSource {
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray new];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.dataSource addObject:[self stringFromClass:[BasicView class]]];
    [self.dataSource addObject:[self stringFromClass:[UpdateView class]]];
    [self.dataSource addObject:[self stringFromClass:[RemakeView class]]];
    [self.dataSource addObject:[self stringFromClass:[ConstantsView class]]];
    [self.dataSource addObject:[self stringFromClass:[SidesView class]]];
    [self.dataSource addObject:[self stringFromClass:[AspectFitView class]]];

}

- (NSString *)stringFromClass:(Class)class {
    NSString *temp = NSStringFromClass(class);
    return temp.length ? temp : @"";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSString *className = self.dataSource[indexPath.row];
    cell.textLabel.text = className;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *className = self.dataSource[indexPath.row];
    DetailViewController *vc = [DetailViewController new];
    vc.className = className.length ? className : @"";
    [self.navigationController pushViewController:vc animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
