

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^successBlock)(id responobject);
typedef void(^failBlock)(NSURLSessionDataTask *  task,NSError * error);

@interface HttpManager : NSObject

/**
 获取网络请求管理类
 *
 @return 网络管理类Manager
 */

+(HttpManager *)requestManager;


/**
 二次封装AFNetWorkng
 * @ param path API接口
 * @ param parameters 参数
 * @ success 成功Block
 * @ fail 失败回调
 @ return
 */
+(void)postDataWithUrl:(NSString *)urlString andParameters:(NSDictionary *)parameters success:(successBlock)success fail:(failBlock)fail;

/**
 二次封装AFNetWorking GET
 * @ param urlString 请求地址
 * @ param parameters 参数
 * @ success 成功Block
 * @ fail 失败回调
 * @ return
 */
+(void)getDataWithUr:(NSString *)urlString parameters:(NSDictionary *)parameters success:(successBlock)success fail:(failBlock)fail;


@end

NS_ASSUME_NONNULL_END
