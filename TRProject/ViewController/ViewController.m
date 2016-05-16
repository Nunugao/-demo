//
//  ViewController.m
//  TRProject
//
//  Created by jiyingxin on 16/2/4.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "ViewController.h"
#import "TalkViewModel.h"
#import "TalkNetmanager.h"
#import "TalkTableViewCell.h"
@import AVKit;
@import AVFoundation;

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic) UITableView *tableView;
@property (nonatomic) TalkViewModel *talkVM;
@property (nonatomic) AVPlayerViewController *avCL;
@end

@implementation ViewController
#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.talkVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TalkTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[TalkTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.titleLb.text = [self.talkVM titleForRow:indexPath.row];
    [cell.iconIV setImageWithURL:[self.talkVM coverUrlForRow:indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
    (NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
    
    
    AVPlayerViewController *avPlayerCL = [AVPlayerViewController new];
    
    
//    NSMutableArray *itemArr = [NSMutableArray new];
//    for (int i = 0; i < self.talkVM.dataList.count; i++) {
//        AVPlayerItem *item = [AVPlayerItem playerItemWithURL:[self.talkVM videoUrlForRow:i]];
//        [itemArr addObject:item];
//    }
//    avPlayerCL.player = [[AVQueuePlayer alloc] initWithItems:itemArr];
//    [avPlayerCL.player replaceCurrentItemWithPlayerItem:itemArr[indexPath.row]];
    
    
    avPlayerCL.player = [[AVPlayer alloc] initWithURL:[self.talkVM videoUrlForRow:indexPath.row]];
    [self presentViewController:avPlayerCL animated:YES completion:nil];
    [avPlayerCL.player play];

    
    UIImageView *coverView = [UIImageView new];
    [coverView setImageWithURL:[self.talkVM largeCoverUrlForRow:indexPath.row]];
    [avPlayerCL.contentOverlayView addSubview:coverView];
    [coverView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.equalTo([UIScreen mainScreen].bounds.size.width);
        make.centerY.equalTo(0);
    }];
    
    UILabel *titleInfoLb = [UILabel new];
    titleInfoLb.text = [self.talkVM titleForRow:indexPath.row];
    titleInfoLb.textColor = [UIColor whiteColor];
    titleInfoLb.textAlignment = NSTextAlignmentCenter;
    titleInfoLb.font = [UIFont systemFontOfSize:28];
    [titleInfoLb sizeToFit];
//    NSLog(@"title %f", titleInfoLb.frame.size.height);
    [avPlayerCL.contentOverlayView addSubview:titleInfoLb];
    [titleInfoLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(0);
        make.centerY.equalTo(250);
    }];
    
//    avPlayerCL.player.actionAtItemEnd = AVPlayerActionAtItemEndAdvance;
}
#pragma mark - 懒加载 Lazy Load
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(0);
        }];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[TalkTableViewCell class] forCellReuseIdentifier:@"Cell"];
    }
    return _tableView;
}

- (TalkViewModel *)talkVM {
    if (!_talkVM) {
        _talkVM = [TalkViewModel new];
    }
    return _talkVM;
}

//- (AVPlayerViewController *)avCL {
//    if(_avCL == nil) {
//        _avCL = [[AVPlayerViewController alloc] init];
//        NSMutableArray *itemArr = [NSMutableArray new];
//            for (int i = 0; i < self.talkVM.dataList.count; i++) {
//                AVPlayerItem *item = [AVPlayerItem playerItemWithURL:[self.talkVM videoUrlForRow:i]];
//                [itemArr addObject:item];
//            }
//            _avCL.player = [[AVQueuePlayer alloc] initWithItems:itemArr];
//
//    }
//    return _avCL;
//}

#pragma mark - 生命周期 Life Circle
- (void)viewDidLoad {
    [super viewDidLoad];
    WK(weakSelf)
    [self.tableView addHeaderRefresh:^{
        [weakSelf.talkVM getDataWithRequestMode:RequestModeRefresh completionHandle:^(NSError *error) {
            if (!error) {
                [weakSelf.tableView reloadData];
            }
            [weakSelf.tableView endHeaderRefresh];
        }];
    }];
    
    [_tableView addAutoFooterRefresh:^{
        [weakSelf.tableView getDataWithRequestMode:RequestModeRefresh completionHandle:^(NSError *error) {
            if (!error) {
                [weakSelf.tableView reloadData];
            }
            [weakSelf.tableView endFooterRefresh];
        }];
    }];
    
    [_tableView beginHeaderRefresh];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
