//
//  FCProgressView.m
//  FCProgressViewExample
//
//  Created by Francis on 2015/9/4.
//  Copyright (c) 2015年 Francis. All rights reserved.
//

#import "FCProgressView.h"

@interface FCProgressView ()

@property (nonatomic, strong) UIView *progressBackgroundView;
@property (nonatomic, strong) CAShapeLayer *progressLayer;
@property (nonatomic, strong) CAShapeLayer *dotLayer;
@property (nonatomic, strong) CAShapeLayer *middleVectorLayer;
@property (nonatomic) CGFloat progressValue;

@end

@implementation FCProgressView

- (instancetype) initFcProgress {
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.progressBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.frame) - 150, CGRectGetMidY(self.frame) - 200, 300, 280)];
        self.progressBackgroundView.backgroundColor = [UIColor colorWithRed:(28.0 / 255.0) green:(137.0 / 255.0) blue:(240.0 / 255.0) alpha:1.0];
        [self addSubview:self.progressBackgroundView];
        
        CGMutablePathRef tempDotPath = CGPathCreateMutable();
        CGPathMoveToPoint(tempDotPath, nil, CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 100);
        CGPathAddLineToPoint(tempDotPath, nil, CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 20);
        
        self.dotLayer = [CAShapeLayer layer];
        self.dotLayer.path = tempDotPath;
        self.dotLayer.strokeColor = [UIColor whiteColor].CGColor;
        self.dotLayer.lineWidth = 3.0;
        self.dotLayer.fillColor = [UIColor clearColor].CGColor;
        [self.layer addSublayer:self.dotLayer];
        
        UIBezierPath *tempVectorPath = [UIBezierPath bezierPath];
        [tempVectorPath moveToPoint:CGPointMake(CGRectGetMidX(self.frame) - 30, CGRectGetMidY(self.frame) - 50)];
        [tempVectorPath addLineToPoint:CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 20)];
        [tempVectorPath addLineToPoint:CGPointMake(CGRectGetMidX(self.frame) + 30, CGRectGetMidY(self.frame) - 50)];
        
        
        self.middleVectorLayer = [CAShapeLayer layer];
        self.middleVectorLayer.path = tempVectorPath.CGPath;
        self.middleVectorLayer.strokeColor = [UIColor whiteColor].CGColor;
        self.middleVectorLayer.lineWidth = 3.0;
        self.middleVectorLayer.fillColor = [UIColor clearColor].CGColor;
        [self.layer addSublayer:self.middleVectorLayer];
        
        CGMutablePathRef tempCirclePath = CGPathCreateMutable();
        CGPathMoveToPoint(tempCirclePath, nil, CGRectGetMidX(self.frame) + 120, CGRectGetMidY(self.frame) - 60);
        CGPathAddArc(tempCirclePath, nil, CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 60, 120, 0, M_PI * 2, 0);
        self.progressLayer = [CAShapeLayer layer];
        self.progressLayer.path = tempCirclePath;
        self.progressLayer.strokeColor = [UIColor whiteColor].CGColor;
        self.progressLayer.lineWidth = 3.0;
        self.progressLayer.opacity = 0.3;
        self.progressLayer.fillColor = [UIColor clearColor].CGColor;
        [self.layer addSublayer:self.progressLayer];
        
        CGPathRelease(tempCirclePath);
        CGPathRelease(tempDotPath);
        
        UITapGestureRecognizer *testGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(halfAnimation)];
        [testGesture setNumberOfTapsRequired:1];
        [testGesture setNumberOfTouchesRequired:1];
        [self addGestureRecognizer:testGesture];
    }
    return self;
}

- (void) halfAnimation {
    
    UIBezierPath *tempVectorPath = [UIBezierPath bezierPath];
    [tempVectorPath moveToPoint:CGPointMake(CGRectGetMidX(self.frame) - 30, CGRectGetMidY(self.frame) - 50)];
    [tempVectorPath addCurveToPoint:CGPointMake(CGRectGetMidX(self.frame) + 30, CGRectGetMidY(self.frame) - 50) controlPoint1:CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 20) controlPoint2:CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 20)];
    
    self.middleVectorLayer.path = tempVectorPath.CGPath;
    
    NSMutableArray *vectorAnimationArray = [NSMutableArray array];
    
    UIBezierPath *testVectorPath = [UIBezierPath bezierPath];
    [testVectorPath moveToPoint:CGPointMake(CGRectGetMidX(self.frame) - 60, CGRectGetMidY(self.frame) - 50)];
    [testVectorPath addQuadCurveToPoint:CGPointMake(CGRectGetMidX(self.frame) + 60, CGRectGetMidY(self.frame) - 50) controlPoint:CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 30)];
    
    UIBezierPath *testToAngleVectorPath = [UIBezierPath bezierPath];
    [testToAngleVectorPath moveToPoint:CGPointMake(CGRectGetMidX(self.frame) - 60, CGRectGetMidY(self.frame) - 50)];
    [testToAngleVectorPath addQuadCurveToPoint:CGPointMake(CGRectGetMidX(self.frame) + 60, CGRectGetMidY(self.frame) - 50) controlPoint:CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 50)];
    
    UIBezierPath *testToAngleTwoVectorPath = [UIBezierPath bezierPath];
    [testToAngleTwoVectorPath moveToPoint:CGPointMake(CGRectGetMidX(self.frame) - 60, CGRectGetMidY(self.frame) - 40)];
    [testToAngleTwoVectorPath addQuadCurveToPoint:CGPointMake(CGRectGetMidX(self.frame) + 60, CGRectGetMidY(self.frame) - 40) controlPoint:CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 90)];
    
    CABasicAnimation *vectorTestAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    vectorTestAnimation.duration = 0.2;
    vectorTestAnimation.fromValue = (__bridge NSValue*)self.middleVectorLayer.path;
    vectorTestAnimation.toValue = (__bridge NSValue*)testVectorPath.CGPath;
    [vectorAnimationArray addObject:vectorTestAnimation];
    
    CABasicAnimation *vectorFixAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    vectorFixAnimation.duration = 0.3;
    [vectorFixAnimation setBeginTime:0.2];
    vectorFixAnimation.fromValue = (__bridge NSValue*)testVectorPath.CGPath;
    vectorFixAnimation.toValue = (__bridge NSValue*)testVectorPath.CGPath;
    [vectorAnimationArray addObject:vectorFixAnimation];
    
    CABasicAnimation *vectorFixAgainAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    vectorFixAgainAnimation.duration = 0.15;
    [vectorFixAgainAnimation setBeginTime:0.5];
    vectorFixAgainAnimation.fromValue = (__bridge NSValue*)testVectorPath.CGPath;
    vectorFixAgainAnimation.toValue = (__bridge NSValue*)testToAngleTwoVectorPath.CGPath;
    [vectorAnimationArray addObject:vectorFixAgainAnimation];
    
    CABasicAnimation *vectorFixTwoAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    vectorFixTwoAnimation.duration = 0.1;
    [vectorFixTwoAnimation setBeginTime:0.65];
    vectorFixTwoAnimation.fromValue = (__bridge NSValue*)testToAngleTwoVectorPath.CGPath;
    vectorFixTwoAnimation.toValue = (__bridge NSValue*)testToAngleVectorPath.CGPath;
    [vectorAnimationArray addObject:vectorFixTwoAnimation];
    
    NSMutableArray *tempFivePathArray = [NSMutableArray array];

    NSMutableArray *tempFourPathArray = [NSMutableArray array];
    for (int j = 10; j > 0; j--) {
        UIBezierPath *tempLoadingFifthPath = [UIBezierPath bezierPath];
        for (int i = 0; i < 6; i++) {
            float tempRangeFix = (i % 2 == j % 2) ? 50 + j : 50 - j;
            float tempX = 28.0 * i;
            float tempAddX = 28.0 / 3.0 + 28.0 * (i - 1);
            float nextTempAddX = 56.0 / 3.0 + 28.0 * (i - 1);
            if (i == 0) {
                [tempLoadingFifthPath moveToPoint:CGPointMake(CGRectGetMidX(self.frame) - 70, CGRectGetMidY(self.frame) - tempRangeFix)];
            } else {
                [tempLoadingFifthPath addCurveToPoint:CGPointMake(CGRectGetMidX(self.frame) - 70 + tempX, CGRectGetMidY(self.frame) - 50) controlPoint1:CGPointMake(CGRectGetMidX(self.frame) - 70 + tempAddX, CGRectGetMidY(self.frame) - tempRangeFix) controlPoint2:CGPointMake(CGRectGetMidX(self.frame) - 70 + nextTempAddX, CGRectGetMidY(self.frame) - tempRangeFix)];

            }
        }
        [tempFivePathArray addObject:tempLoadingFifthPath];
        
        UIBezierPath *tempLoadingForthPath = [UIBezierPath bezierPath];
        for (int k = 0; k < 5; k++) {
            float tempRangeFix = (k % 2 == j % 2) ? 50 + j : 50 - j;
            float tempX = 35.0 * k;
            float tempAddX = 35.0 / 3.0 + 35.0 * (k - 1);
            float nextTempAddX = 70.0 / 3.0 + 35.0 * (k - 1);
            if (k == 0) {
                [tempLoadingForthPath moveToPoint:CGPointMake(CGRectGetMidX(self.frame) - 70, CGRectGetMidY(self.frame) - tempRangeFix)];
            } else {
                [tempLoadingForthPath addCurveToPoint:CGPointMake(CGRectGetMidX(self.frame) - 70 + tempX, CGRectGetMidY(self.frame) - 50) controlPoint1:CGPointMake(CGRectGetMidX(self.frame) - 70 + tempAddX, CGRectGetMidY(self.frame) - tempRangeFix) controlPoint2:CGPointMake(CGRectGetMidX(self.frame) - 70 + nextTempAddX, CGRectGetMidY(self.frame) - tempRangeFix)];

            }
        }
        [tempFourPathArray addObject:tempLoadingForthPath];


    }
    
    CABasicAnimation *vectorDownFixAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    vectorDownFixAnimation.duration = 0.35;
    [vectorDownFixAnimation setBeginTime:0.75];
    vectorDownFixAnimation.fromValue = (__bridge NSValue*)testToAngleVectorPath.CGPath;
    vectorDownFixAnimation.toValue = (__bridge NSValue*)testToAngleVectorPath.CGPath;
    
    [vectorAnimationArray addObject:vectorDownFixAnimation];

    for (int i = 0; i < tempFourPathArray.count; i++) {
        CABasicAnimation *animationToLoading = [CABasicAnimation animationWithKeyPath:@"path"];
        [animationToLoading setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
        
        CABasicAnimation *animationToSmallLoading = [CABasicAnimation animationWithKeyPath:@"path"];
        [animationToSmallLoading setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
        if (i == 0) {
            animationToLoading.duration = 0.15;
            [animationToLoading setBeginTime:1.1];
            animationToLoading.fromValue = (__bridge NSValue*)testToAngleVectorPath.CGPath;
            animationToLoading.toValue = (__bridge NSValue*)[(UIBezierPath*)tempFivePathArray[i] CGPath];
            
            animationToSmallLoading.duration = 0.15;
            [animationToSmallLoading setBeginTime:1.25];
            animationToSmallLoading.fromValue = (__bridge NSValue*)[(UIBezierPath*)tempFivePathArray[i] CGPath];
            animationToSmallLoading.toValue = (__bridge NSValue*)[(UIBezierPath*)tempFourPathArray[i] CGPath];
        } else {
            animationToLoading.duration = 0.15;
            [animationToLoading setBeginTime:1.4 + 0.3 * (i - 1)];
            animationToLoading.fromValue = (__bridge NSValue*)[(UIBezierPath*)tempFourPathArray[i - 1] CGPath];
            animationToLoading.toValue = (__bridge NSValue*)[(UIBezierPath*)tempFivePathArray[i] CGPath];
            
            animationToSmallLoading.duration = 0.15;
            [animationToSmallLoading setBeginTime:1.55 + 0.3 * (i - 1)];
            animationToSmallLoading.fromValue = (__bridge NSValue*)[(UIBezierPath*)tempFivePathArray[i] CGPath];
            animationToSmallLoading.toValue = (__bridge NSValue*)[(UIBezierPath*)tempFourPathArray[i] CGPath];
        }
        [vectorAnimationArray addObject:animationToLoading];
        [vectorAnimationArray addObject:animationToSmallLoading];

    }
    
    CABasicAnimation *animationLoadingToOriginal = [CABasicAnimation animationWithKeyPath:@"path"];
    animationLoadingToOriginal.duration = 0.2;
    [animationLoadingToOriginal setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    [animationLoadingToOriginal setBeginTime:4.1];
    animationLoadingToOriginal.fromValue = (__bridge NSValue*)[(UIBezierPath*)[tempFivePathArray lastObject] CGPath];
    animationLoadingToOriginal.toValue = (__bridge NSValue*)testToAngleVectorPath.CGPath;
    
    CAAnimationGroup *vectorAnimationGroup = [CAAnimationGroup animation];
    [vectorAnimationGroup setAnimations:vectorAnimationArray];
    [vectorAnimationGroup setDuration:4.3];
    
    [self.middleVectorLayer addAnimation:vectorAnimationGroup forKey:@"vectorAnimation"];
    
    self.middleVectorLayer.path = testToAngleVectorPath.CGPath;
    
    
    CGMutablePathRef tempDotPath = CGPathCreateMutable();
    CGPathMoveToPoint(tempDotPath, nil, CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 60);
    CGPathAddLineToPoint(tempDotPath, nil, CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 57);
    
    CABasicAnimation *dotAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    dotAnimation.duration = 0.3;
    dotAnimation.fromValue = (NSValue*)self.dotLayer.path;
    dotAnimation.toValue = (__bridge NSValue*)tempDotPath;
    
    CGMutablePathRef tempDotTwoPath = CGPathCreateMutable();
    CGPathMoveToPoint(tempDotTwoPath, nil, CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 181.5);
    CGPathAddLineToPoint(tempDotTwoPath, nil, CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 178.5);
    
    CGMutablePathRef tempDotUpPath = CGPathCreateMutable();
    CGPathMoveToPoint(tempDotUpPath, nil, CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 190);
    CGPathAddLineToPoint(tempDotUpPath, nil, CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 187);
    
    CGMutablePathRef tempDotThreePath = CGPathCreateMutable();
    
    CGPathAddArc(tempDotThreePath, nil, CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) - 60, 120, - M_PI / 2, - M_PI * 2 - M_PI / 2, 1);
    
    CABasicAnimation *dotKeepAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    dotKeepAnimation.duration = 0.3;
    [dotKeepAnimation setBeginTime:0.3];
    dotKeepAnimation.fromValue = (__bridge NSValue*)tempDotPath;
    dotKeepAnimation.toValue = (__bridge NSValue*)tempDotPath;
    
    CABasicAnimation *dotUpAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    dotUpAnimation.duration = 0.35;
    [dotUpAnimation setBeginTime:0.6];
    [dotUpAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    dotUpAnimation.fromValue = (__bridge NSValue*)tempDotPath;
    dotUpAnimation.toValue = (__bridge NSValue*)tempDotUpPath;
    
    CABasicAnimation *dotTwoAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    dotTwoAnimation.duration = 0.1;
    [dotTwoAnimation setBeginTime:0.95];
    [dotTwoAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    dotTwoAnimation.fromValue = (__bridge NSValue*)tempDotUpPath;
    dotTwoAnimation.toValue = (__bridge NSValue*)tempDotTwoPath;
    
    CABasicAnimation *dotFixAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    dotFixAnimation.duration = 0.1;
    [dotFixAnimation setBeginTime:1.05];
    dotFixAnimation.fromValue = (__bridge NSValue*)tempDotTwoPath;
    dotFixAnimation.toValue = (__bridge NSValue*)tempDotTwoPath;
    
    CABasicAnimation *dotThreeAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    dotThreeAnimation.duration = 3.0;
    [dotThreeAnimation setBeginTime:1.15];
    dotThreeAnimation.fromValue = @0;
    dotThreeAnimation.toValue = @1;
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.delegate = self;
    [animationGroup setAnimations:@[dotAnimation, dotKeepAnimation, dotUpAnimation, dotTwoAnimation, dotFixAnimation, dotThreeAnimation]];
    [animationGroup setDuration:4.15];
    
    
    [self.dotLayer addAnimation:animationGroup forKey:@"testDotAnimation"];
    self.dotLayer.path = tempDotThreePath;
    CGPathRelease(tempDotUpPath);
    CGPathRelease(tempDotPath);
    CGPathRelease(tempDotTwoPath);
    CGPathRelease(tempDotThreePath);

}

- (void) animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        CGMutablePathRef tempVecotrSmallerPath = CGPathCreateMutable();
        CGPathMoveToPoint(tempVecotrSmallerPath, nil, CGRectGetMidX(self.frame) - 25, CGRectGetMidY(self.frame) - 45);
        CGPathAddLineToPoint(tempVecotrSmallerPath, nil, CGRectGetMidX(self.frame) - 10, CGRectGetMidY(self.frame) - 35);
        CGPathAddLineToPoint(tempVecotrSmallerPath, nil, CGRectGetMidX(self.frame) + 35, CGRectGetMidY(self.frame) - 85);
        
        CGMutablePathRef tempVecotrPath = CGPathCreateMutable();
        CGPathMoveToPoint(tempVecotrPath, nil, CGRectGetMidX(self.frame) - 30, CGRectGetMidY(self.frame) - 50);
        CGPathAddLineToPoint(tempVecotrPath, nil, CGRectGetMidX(self.frame) - 10, CGRectGetMidY(self.frame) - 30);
        CGPathAddLineToPoint(tempVecotrPath, nil, CGRectGetMidX(self.frame) + 40, CGRectGetMidY(self.frame) - 90);
        
        CGMutablePathRef tempVecotrBiggerPath = CGPathCreateMutable();
        CGPathMoveToPoint(tempVecotrBiggerPath, nil, CGRectGetMidX(self.frame) - 35, CGRectGetMidY(self.frame) - 55);
        CGPathAddLineToPoint(tempVecotrBiggerPath, nil, CGRectGetMidX(self.frame) - 10, CGRectGetMidY(self.frame) - 25);
        CGPathAddLineToPoint(tempVecotrBiggerPath, nil, CGRectGetMidX(self.frame) + 45, CGRectGetMidY(self.frame) - 95);
        
        
        CABasicAnimation *vectorSmallerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
        vectorSmallerAnimation.duration = 0.15;
        [vectorSmallerAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
        vectorSmallerAnimation.fromValue = (__bridge NSValue*)self.middleVectorLayer.path;
        vectorSmallerAnimation.toValue = (__bridge NSValue*)tempVecotrSmallerPath;
        
        CABasicAnimation *vectorBiggerFinishAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
        vectorBiggerFinishAnimation.duration = 0.15;
        [vectorBiggerFinishAnimation setBeginTime:0.15];
        [vectorBiggerFinishAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
        vectorBiggerFinishAnimation.fromValue = (__bridge NSValue*)tempVecotrSmallerPath;
        vectorBiggerFinishAnimation.toValue = (__bridge NSValue*)tempVecotrBiggerPath;
        
        CABasicAnimation *vectorFinishAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
        vectorFinishAnimation.duration = 0.15;
        [vectorFinishAnimation setBeginTime:0.15];
        [vectorFinishAnimation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
        vectorFinishAnimation.fromValue = (__bridge NSValue*)tempVecotrBiggerPath;
        vectorFinishAnimation.toValue = (__bridge NSValue*)tempVecotrPath;
        
        CAAnimationGroup *animationFinishGroup = [CAAnimationGroup animation];
        [animationFinishGroup setAnimations:@[vectorSmallerAnimation, vectorBiggerFinishAnimation, vectorFinishAnimation]];
        [animationFinishGroup setDuration:0.45];
        
        [self.middleVectorLayer removeAllAnimations];
        [self.middleVectorLayer addAnimation:animationFinishGroup forKey:@"finishAnimation"];
        self.middleVectorLayer.path = tempVecotrPath;
        
        CGPathRelease(tempVecotrSmallerPath);
        CGPathRelease(tempVecotrPath);
        CGPathRelease(tempVecotrBiggerPath);

    }
}

@end
