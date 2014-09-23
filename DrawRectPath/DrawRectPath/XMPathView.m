//
//  XMPathView.m
//  DrawRectPath
//
//  Created by jack on 14-8-11.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMPathView.h"

@implementation XMPathView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBStrokeColor(context, 0.99f, 0.01f, 0.02f, 1.0f);
    
    CGContextAddRect(context, rect);
    
    CGFloat lenghts[] = {5, 5};
    CGContextSetLineDash(context, 0, lenghts, 2);
    CGContextStrokePath(context);
}

@end
