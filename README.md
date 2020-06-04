# ARURLRouter
## A small design patten router by using url scheme.

***

**How to use?**

Please import "ARURLRouter.h" in your viewcontroller.m,then add openPage:Params to the tap or click events.

### Events trigger

```Objective-C
// ViewController.m
#import "ARURLRouter.h"

#pragma mark - Events
- (void)buttonClick:(UIButton *)button {
    [[ARURLRouter routerManager] openPage:@"detail://" params:@{@"controller" : self.navigationController, @"title" : @"DetailView"}];
}

// 
```

### Scheme Register

```Objective-C
// FirstDetailViewController.m
#import "ARURLRouter.h"

+ (void)load {
    [[ARURLRouter routerManager] registerScheme:@"detail://" processBlock:^(NSDictionary * _Nonnull params) {
        UINavigationController *navc = (UINavigationController *)[params objectForKey:@"controller"];
        FirstDetailViewController *firstDetailVC = [[FirstDetailViewController alloc] init];
        NSString *title = (NSString *)[params objectForKey:@"title"];
        firstDetailVC.title = title;
        [navc pushViewController:firstDetailVC animated:YES];
    }];
}
```