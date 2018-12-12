//
//  YDUser.h
//  YouDianAd
//
//  Created by youdian on 2018/12/12.
//  Copyright © 2018 YouDianAd. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YDUser : NSObject


/**
 ARUSer单例句柄
 @ return
 */
+(YDUser *)shareYDUser;
@end

NS_ASSUME_NONNULL_END
