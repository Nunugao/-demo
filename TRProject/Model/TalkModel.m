//
//  TalkModel.m
//  TRProject
//
//  Created by leezb101 on 16/2/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TalkModel.h"

@implementation TalkModel

@end


@implementation TalkTracksModel

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [TalkListModel class]};
}

@end


@implementation TalkListModel

@end


