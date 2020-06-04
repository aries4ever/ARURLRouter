# ARURLRouter
## A small design patten router by using url scheme.

***

**How to use?**

### Scheme Register
*1.Open your target page such as FirstDetailViewController.m.

*2.Import "ARURLRouter.h" in your FirstDetailViewController.

*3.Register for scheme in method + (void)load as followed.

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

### Events trigger
*1.Please import "ARURLRouter.h" in your viewcontroller.m.

*2.Then add openPage:Params to the tap or click events.

```Objective-C
// ViewController.m
#import "ARURLRouter.h"

#pragma mark - Events
- (void)buttonClick:(UIButton *)button {
    [[ARURLRouter routerManager] openPage:@"detail://" params:@{@"controller" : self.navigationController, @"title" : @"DetailView"}];
}
```

### Project Running
*Press commond + R to Run your project.