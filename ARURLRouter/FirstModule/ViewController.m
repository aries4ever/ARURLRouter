//
//  ViewController.m
//  ARURLRouter
//
//  Created by liukaibo on 2020/6/4.
//  Copyright © 2020 liukaibo. All rights reserved.
//

#import "ViewController.h"
#import "ARURLRouter.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - View lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"FirstView";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addButton];
}

#pragma mark - Private Methods
- (void)addButton {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setFrame:CGRectMake(0, 0, 100, 100)];
    
    CGPoint center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    button.center = center;

    [button addTarget:self
               action:@selector(buttonClick:)
     forControlEvents:UIControlEventTouchUpInside];
    
    [button setBackgroundColor:[UIColor blueColor]];
    
    [self.view addSubview:button];
}

#pragma mark - Events
- (void)buttonClick:(UIButton *)button {
    [[ARURLRouter routerManager] openPage:@"detail://" params:@{@"controller" : self.navigationController, @"title" : @"DetailView"}];
}
@end
