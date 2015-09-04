//
//  AppDelegate.m
//  FCProgressViewExample
//
//  Created by Francis on 2015/9/4.
//  Copyright (c) 2015年 Francis. All rights reserved.
//

#import "AppDelegate.h"
#import "ExampleProgressController.h"

@interface AppDelegate ()

@property (nonatomic, strong) ExampleProgressController *exampleProgressController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.exampleProgressController = [[ExampleProgressController alloc] init];
    self.window.rootViewController = self.exampleProgressController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
