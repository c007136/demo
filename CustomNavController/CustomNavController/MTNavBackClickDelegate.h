//
//  MTNavBackClickDelegate.h
//  miltoday
//
//  导航栏返回按钮重写代理
//
//  Created by jack on 14-8-13.
//  Copyright (c) 2014年 com.yuzhuangbao.miltoday. All rights reserved.
//

#ifndef miltoday_MTNavBackClickDelegate_h
#define miltoday_MTNavBackClickDelegate_h

@protocol MTNavBackClickDelegate <NSObject>

@required
- (void)backButtonClick;
- (void)panGetstureRecognizerEnded;

@end

#endif
