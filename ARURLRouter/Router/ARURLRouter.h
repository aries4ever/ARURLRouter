//
//  ARURLRouter.h
//  ARCocoapods
//
//  Created by liukaibo on 2020/6/2.
//  Copyright © 2020 liukaibo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ARURLRouter : NSObject

// singleton
+ (ARURLRouter *)routerManager;

// cache table
+ (NSMutableDictionary *)ARRouter_cacheTable;

// typedef block
typedef void(^ARRouterProcessBlock)(NSDictionary *params);

// register scheme
- (void)registerScheme:(NSString *)scheme processBlock:(ARRouterProcessBlock)params;

// open scheme
- (void)openPage:(NSString *)pageUrl params:(NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END
