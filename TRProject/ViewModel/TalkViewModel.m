//
//  TalkViewModel.m
//  TRProject
//
//  Created by leezb101 on 16/2/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TalkViewModel.h"

@implementation TalkViewModel
//- (instancetype)init {
//    if (self = [super init]) {
//        _page = 0;
//    }
//    return self;
//}

- (NSMutableArray *)dataList {
    if (!_dataList) {
        _dataList = [NSMutableArray new];
    }
    return _dataList;
}

- (TalkListModel *)dataForRow:(NSInteger)row {
    return self.dataList[row];
}

- (NSInteger)rowNumber {
    return self.dataList.count;
}

- (NSURL *)coverUrlForRow:(NSInteger)row {
    return [NSURL URLWithString:[self dataForRow:row].coverMiddle];
}

- (NSString *)titleForRow:(NSInteger)row {
    return [self dataForRow:row].title;
}

- (NSURL *)videoUrlForRow:(NSInteger)row {
    return [NSURL URLWithString:[self dataForRow:row].downloadUrl];
}

- (NSURL *)largeCoverUrlForRow:(NSInteger)row {
    return [NSURL URLWithString:[self dataForRow:row].coverLarge];
}

- (void)getDataWithRequestMode:(RequestMode)requestMode completionHandle:(void (^)(NSError *))completionHandle {
    NSInteger tmpPage;
    switch (requestMode) {
        case RequestModeRefresh: {
            tmpPage = 0;
            break;
        }
        case RequestModeMore: {
            tmpPage = self.page + 1;
            break;
        }
    }
    self.dataTask = [TalkNetmanager getTalkWithPage:tmpPage completionHandle:^(TalkModel *model, NSError *error) {
        if (!error) {
            if (requestMode == RequestModeRefresh) {
                [self.dataList removeAllObjects];
            }
            [self.dataList addObjectsFromArray:model.tracks.list];
        }
        completionHandle(error);
    }];
}
@end
