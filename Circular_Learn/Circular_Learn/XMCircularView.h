//
//  XMCircularView.h
//  Circular_Learn
//
//  Created by jack on 14-7-1.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMPercentLayer.h"

@interface XMCircularView : UIView
{
    XMPercentLayer   * _percentLayer;
    
    int              _finalPercent;
    BOOL             _currentAnimating;
    UILabel          * _percentLabel;
}

- (void)setPercent:(int)percent animated:(BOOL)animated;

@end
