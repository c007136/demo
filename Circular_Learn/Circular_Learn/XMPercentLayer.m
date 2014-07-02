//
//  XMPercentLayer.m
//  Circular_Learn
//
//  Created by jack on 14-7-1.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMPercentLayer.h"

#define toRadians(x) ((x)*M_PI / 180.0)
#define toDegrees(x) ((x)*180.0 / M_PI)

#define innerRadius    50.5
#define outerRadius    80.5

@implementation XMPercentLayer

- (id)init
{
    self = [super init];
    if (self) {
        _percent = 0;
    }
    return self;
}

- (void)drawInContext:(CGContextRef)ctx
{
    [self drawRight:ctx];
    [self drawLeft:ctx];
}

- (void)drawRight:(CGContextRef)ctx
{
    CGPoint center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    
    CGFloat delta = -toRadians(360*_percent);
    
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextSetLineWidth(ctx, 1);
    CGContextSetAllowsAntialiasing(ctx, YES);
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathAddRelativeArc(path, NULL, center.x, center.y, innerRadius, -(M_PI/2), delta);
    CGPathAddRelativeArc(path, NULL, center.x, center.y, outerRadius, delta-(M_PI/2), -delta);
    CGPathAddLineToPoint(path, NULL, center.x, center.y-innerRadius);
    
    CGContextAddPath(ctx, path);
    CGContextFillPath(ctx);
    
    CFRelease(path);
}

- (void)drawLeft:(CGContextRef)ctx
{
    CGPoint center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    
    CGFloat delta = toRadians(360 * (1-_percent));
    
    
    CGContextSetFillColorWithColor(ctx, [UIColor whiteColor].CGColor);
    
    CGContextSetLineWidth(ctx, 1);
    
    CGContextSetAllowsAntialiasing(ctx, YES);
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathAddRelativeArc(path, NULL, center.x, center.y, innerRadius, -(M_PI/2), delta);
    CGPathAddRelativeArc(path, NULL, center.x, center.y, outerRadius, delta - (M_PI/2), -delta);
    CGPathAddLineToPoint(path, NULL, center.x, center.y-innerRadius);
    
    CGContextAddPath(ctx, path);
    CGContextFillPath(ctx);
    
    CFRelease(path);
}

@end
