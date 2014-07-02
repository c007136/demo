//
//  XMCircularView.m
//  Circular_Learn
//
//  Created by jack on 14-7-1.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMCircularView.h"

@implementation XMCircularView

#pragma mark - public
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)layoutSubviews
{
    CGRect frame = self.frame;
    int percent = _percentLayer.percent*100;
    [_percentLabel setText:[NSString stringWithFormat:@"%d%%", percent]];
    
    CGRect labelFrame = _percentLabel.frame;
    labelFrame.origin.x = frame.size.width/2 - _percentLabel.frame.size.width/2;
    labelFrame.origin.y = frame.size.height/2 - _percentLabel.frame.size.height/2;
    _percentLabel.frame = labelFrame;
    
    [super layoutSubviews];
}

- (void)setPercent:(int)percent animated:(BOOL)animated
{
    if (animated) {
        
        _finalPercent = MIN(100, MAX(0, percent));
        int oldPercent = _percentLayer.percent*100;
        [self performSelector:@selector(delayedDraw:) withObject:[NSNumber numberWithInt:oldPercent] afterDelay:0.01];
        
    } else {
        CGFloat floatPercent = percent / 100.0;
        floatPercent = MIN(1, MAX(0, floatPercent));
        _percentLayer.percent = floatPercent;
        [self setNeedsLayout];
        [_percentLayer setNeedsDisplay];
    }
}

#pragma mark - private
- (void)setup
{
    self.backgroundColor = [UIColor grayColor];
    self.clipsToBounds = NO;
    
    _percentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 125.0, 125.0)];
    [_percentLabel setFont:[UIFont systemFontOfSize:50.0]];
    [_percentLabel setTextColor:[UIColor redColor]];
    [_percentLabel setTextAlignment:NSTextAlignmentCenter];
    [_percentLabel setBackgroundColor:[UIColor clearColor]];
    _percentLabel.adjustsFontSizeToFitWidth = YES;
    [self addSubview:_percentLabel];
    
    _percentLayer = [[XMPercentLayer layer] init];
    _percentLayer.frame = self.bounds;
    _percentLayer.masksToBounds = NO;
    [_percentLayer setNeedsDisplay];
    [self.layer addSublayer:_percentLayer];
}

- (void)delayedDraw:(NSNumber *)newPercent
{
    int perc = [newPercent intValue];
    if ( perc < _finalPercent ) {
        perc++;
    } else {
        perc--;
    }
    _percentLayer.percent = perc / 100.0;
    [self setNeedsLayout];
    [_percentLayer setNeedsDisplay];
    
    if ( perc != _finalPercent ) {
        [self performSelector:@selector(delayedDraw:) withObject:[NSNumber numberWithInt:perc] afterDelay:0.01];
    }
}

@end
