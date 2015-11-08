//
//  ExampleProgressController.m
//  FCProgressViewExample
//
//  Created by Francis on 2015/9/4.
//  Copyright (c) 2015年 Francis. All rights reserved.
//

#import "ExampleProgressController.h"
#import "ExampleProgressView.h"

@interface ExampleProgressController ()

@property (nonatomic, strong) ExampleProgressView *exampleProgressView;

@end

@implementation ExampleProgressController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.exampleProgressView = [[ExampleProgressView alloc] initWithFrame:self.view.frame];
    self.view = self.exampleProgressView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
