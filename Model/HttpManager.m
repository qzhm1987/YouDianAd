
#import "HttpManager.h"


static HttpManager *manager = nil;

@implementation HttpManager

+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t one;
    dispatch_once(&one, ^{
        if (!manager) {
            manager = [super allocWithZone:zone];
        }
    });
    return manager;
}
+(HttpManager *)requestManager{
    return [[self alloc]init];
}


//请求总接口 POST

+(void)postDataWithUrl:(NSString *)urlString andParameters:(NSDictionary *)parameters success:(successBlock)success fail:(failBlock)fail {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 15.0f;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"application/x-json",@"text/html", nil];
    [manager POST:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail( task, error);
    }];
}

//请求总接口 GET
+(void)getDataWithUr:(NSString *)urlStr parameters:(NSDictionary *)parameters success:(successBlock)success fail:(failBlock)fail{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 15.0f;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"application/x-json",@"text/html", nil];
    [manager GET:urlStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail( task, error);
    }];
    
}


@end
