//
//  MainViewController.m
//  WaxPatch
//
//  Created by Yimin Tu on 12-8-10.
//  Copyright (c) 2012年 dianping.com. All rights reserved.
//

#import "MainViewController.h"
#import "JPEngine.h"

@interface MainViewController ()

@end

@implementation MainViewController

-(void) viewDidLoad {
    self.navigationItem.title = @"hello patch";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"清除补丁刷新" style:UIBarButtonItemStyleBordered target:self action:@selector(closeFresh)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"下载补丁刷新" style:UIBarButtonItemStyleBordered target:self action:@selector(downloadFresh)];
}

-(void) downloadFresh {
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSString *sourcePath = [[NSBundle mainBundle] pathForResource:@"demo" ofType:@"js"];
        js_start(sourcePath);
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"show new patch view");
            [self.tableView reloadData];
        });
    });
}


-(void) closeFresh {
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        js_end();
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"clean patch and close");
            [self.tableView reloadData];
        });
    });
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 80.0f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    CGRect f_header = CGRectMake(0.0f, 0.0f, tableView.frame.size.width, 80.0f);
    UIView *view = [[UIView alloc] initWithFrame: f_header];
    UILabel *lbl = [[UILabel alloc] initWithFrame: f_header];
    lbl.font = [UIFont systemFontOfSize:14.0f];
    lbl.numberOfLines = 6;
    [lbl setTextColor:[UIColor blueColor]];
    lbl.backgroundColor = [UIColor lightGrayColor];
    lbl.text = @"1. 点击'下载补丁刷新'，将会从服务器端下载补丁，tableviewCell按照补丁显示；\n \n2. 点击'清除补丁刷新',将会关闭本地的补丁复原; ";
    [view addSubview:lbl];
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%d", indexPath.row + 1];
    if(indexPath.row == 0){
        [self log];
    }
    return cell;
}

-(void)log{
    NSLog(@">>>>>test patch call native method>>>>>>>");
}


-(id)forwardingTargetForSelector:(SEL)aSelector {
    id cls = [super forwardingTargetForSelector:aSelector];
    return cls;
}

-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    NSMethodSignature *ms = [super methodSignatureForSelector:aSelector];
    return ms;
}

-(void)forwardInvocation:(NSInvocation *)anInvocation{
    [super forwardInvocation:anInvocation];
}

@end
