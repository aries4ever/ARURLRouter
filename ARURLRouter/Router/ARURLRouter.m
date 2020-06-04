//
//  ARURLRouter.m
//  ARCocoapods
//
//  Created by liukaibo on 2020/6/2.
//  Copyright © 2020 liukaibo. All rights reserved.
//

#import "ARURLRouter.h"

@implementation ARURLRouter

#pragma mark - Singleton
+ (instancetype)routerManager {
    static ARURLRouter *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ARURLRouter alloc] init];
    });
    
    return manager;
}

#pragma mark - Init Methods
+ (NSMutableDictionary *)ARRouter_cacheTable {
    static NSMutableDictionary *cacheTable;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cacheTable = @{}.mutableCopy;
    });
    return cacheTable;
}

#pragma mark - register scheme into the cache table.
- (void)registerScheme:(NSString *)scheme processBlock:(ARRouterProcessBlock)params {
    if (scheme && params) {
        [[[self class] ARRouter_cacheTable] setObject:params forKey:scheme];
    }
}

#pragma mark - open scheme by using params.
- (void)openPage:(NSString *)pageUrl params:(NSDictionary *)params {
    ARRouterProcessBlock block = [[[self class] ARRouter_cacheTable] objectForKey:pageUrl];
    if (block) {
        block(params);
    }
}

@end
