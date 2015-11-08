//
//  FCProgressView.h
//  FCProgressViewExample
//
//  Created by Francis on 2015/9/4.
//  Copyright (c) 2015年 Francis. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, FCProgressType) {
    FCProgressDefaultType = 0,
    FCProgressCircleType,
};

@interface FCProgressView : UIView

@property (nonatomic) CGFloat maxValue;

- (instancetype) initFcProgress;
- (void) refresh;
- (void) setProgressValue:(float)value maxValue:(float)maxValue;
- (void) setProgressDuration:(float)duration;
- (void) halfAnimation;
- (void) testAnimation;

@end
