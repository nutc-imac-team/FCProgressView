//
//  ExampleProgressView.m
//  FCProgressViewExample
//
//  Created by Francis on 2015/9/4.
//  Copyright (c) 2015年 Francis. All rights reserved.
//

#import "ExampleProgressView.h"

@implementation ExampleProgressView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.fcProgressView = [[FCProgressView alloc] initFcProgress];
        [self addSubview:self.fcProgressView];
    }
    return self;
}

@end
