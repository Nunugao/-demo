//
//  TalkNetmanager.m
//  TRProject
//
//  Created by leezb101 on 16/2/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "TalkNetmanager.h"

#define kTalkPath @"http://mobile.ximalaya.com/mobile/others/ca/album/track/238474/true/%ld/20?device=iPhone"


@implementation TalkNetmanager
+ (id)getTalkWithPage:(NSInteger)page completionHandle:(void (^)(id, NSError *))completionHandle {
    NSString *path = [NSString stringWithFormat:kTalkPath, page];
    return [self GET:path parameters:nil progress:nil completionHandle:^(id responseObj, NSError *error) {
        TalkModel *model = [TalkModel parse:responseObj];
        completionHandle([TalkModel parse:responseObj], error);
    }];
}
@end
