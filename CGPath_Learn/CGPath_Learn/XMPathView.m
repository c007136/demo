//
//  XMPathView.m
//  CGPath_Learn
//
//  Created by jack on 14-7-1.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMPathView.h"

@implementation XMPathView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBFillColor(context, 0.6f, 0.6f, 0.6f, 1.0f);
    CGContextFillRect(context, CGRectMake(0.0f, 0.0f, 320.0f, 460.0f));
    
    CGMutablePathRef pathRef = CGPathCreateMutable();
    
    CGPathMoveToPoint(pathRef, &CGAffineTransformIdentity, 0.0f, 0.0f);
    
    CGPathAddLineToPoint(pathRef, &CGAffineTransformIdentity, 50.0f, 100.0f);
    
    CGPathCloseSubpath(pathRef);
    
    CGContextSetRGBStrokeColor(context, 0.99f, 0.01f, 0.02f, 1.0f);
    
    CGContextAddPath(context, pathRef);
    
    CGContextStrokePath(context);
    
    CGPathRelease(pathRef);
}

@end
