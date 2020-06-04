/*  **********************************************************************
 *  Copyright @Aries4ever 2020-2030.All rights reserved.
 *  FileName   :ARURLRouter.h
 *  Author     :Aries.Liu
 *  Version    :1.0.0
 *  Date       :04/06/2020
 *  Description:A small design patten router by using url scheme.
                It's a efficiency way for decoupling control strategy.
                See the Readme.MD for more details plz.
 *  History    :
 *    1.Author :
 *    2.Version:
 *    3.Date   :
 *    4.Desc   :
 *  **********************************************************************/

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
/**
 *  ARURLRouter is the base class.
 */
@interface ARURLRouter : NSObject

/**
 *  A singleton for ARURLRouter.
 *  Method:[ARURLRouter routerManager];
 *  @return An singleton of ARURLRouter.
 */
+ (ARURLRouter *)routerManager;

/**
 *  A cache table for ARURLRouter.
 *  Method:[[ARURLRouter routerManager] ARRouter_cacheTable];
 *  @return a mutable dictionary of cacheTable.
 */
+ (NSMutableDictionary *)ARRouter_cacheTable;

/** The block with params for callback. */
typedef void(^ARRouterProcessBlock)(NSDictionary *params);

/**
 *  Scheme register.
 *  Method:[[ARURLRouter routerManager] registerScheme: processBlock:];
 *        calling in the +(void)load;
 *  @param scheme is a string, for the key of cache table.
 *  @param params is a block with NSDictionary parameters for callback.
 */
- (void)registerScheme:(NSString *)scheme processBlock:(ARRouterProcessBlock)params;

/**
 *  Open the Scheme.
 *  Method:[[ARURLRouter routerManager] openPage: params:];
 *  @param pageUrl usually is a string of scheme.
 *  @param params is a block with NSDictionary parameters for callback.
 */
- (void)openPage:(NSString *)pageUrl params:(NSDictionary *)params;

@end

NS_ASSUME_NONNULL_END


