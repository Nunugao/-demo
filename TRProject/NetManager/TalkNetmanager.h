//
//  TalkNetmanager.h
//  TRProject
//
//  Created by leezb101 on 16/2/21.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TalkModel.h"

@interface TalkNetmanager : NSObject
+ getTalkWithPage:(NSInteger)page completionHandle:(void(^)(id model, NSError *error))completionHandle;
@end
