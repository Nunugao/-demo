//
//  TalkViewModel.h
//  TRProject
//
//  Created by leezb101 on 16/2/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TalkNetmanager.h"
#import "NSObject+ViewModel.h"
@interface TalkViewModel : NSObject
@property (nonatomic) NSInteger rowNumber;
- (NSURL *)coverUrlForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSURL *)videoUrlForRow:(NSInteger)row;
- (NSURL *)largeCoverUrlForRow:(NSInteger)row;

- (TalkListModel *)dataForRow:(NSInteger)row;

@property (nonatomic) NSMutableArray *dataList;
@property (nonatomic) NSInteger page;

@end
