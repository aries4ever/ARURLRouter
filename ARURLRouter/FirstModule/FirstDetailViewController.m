//
//  FirstDetailViewController.m
//  ARURLRouter
//
//  Created by liukaibo on 2020/6/4.
//  Copyright © 2020 liukaibo. All rights reserved.
//

#import "FirstDetailViewController.h"
#import "ARURLRouter.h"

@interface FirstDetailViewController ()

@end

@implementation FirstDetailViewController

#pragma mark - scheme register
+ (void)load {
    [[ARURLRouter routerManager] registerScheme:@"detail://" processBlock:^(NSDictionary * _Nonnull params) {
        UINavigationController *navc = (UINavigationController *)[params objectForKey:@"controller"];
        FirstDetailViewController *firstDetailVC = [[FirstDetailViewController alloc] init];
        NSString *title = (NSString *)[params objectForKey:@"title"];
        firstDetailVC.title = title;
        [navc pushViewController:firstDetailVC animated:YES];
    }];
}

#pragma mark - View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
}

@end
