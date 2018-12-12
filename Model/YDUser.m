
#import "YDUser.h"

static YDUser *ydUser = nil;
@implementation YDUser

+(instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t one;
    dispatch_once(&one, ^{
        if (!ydUser) {
            ydUser = [super allocWithZone:zone];
        }
    });
    return ydUser;
}

+(YDUser *)shareYDUser{
    return [[self alloc]init];
}


#pragma mark - Key Value Coding

- (id)valueForUndefinedKey:(NSString *)key {
    NSLog(@"%@：获取键值出错，未定义的键：%@", NSStringFromClass([self class]), key);
    // subclass implementation should provide correct key value mappings for custom keys
    return nil;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"未定义的键：%@",key);
    // subclass implementation should set the correct key value mappings for custom keys
}

@end
