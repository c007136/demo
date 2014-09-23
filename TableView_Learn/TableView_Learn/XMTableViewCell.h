//
//  XMTableViewCell.h
//  TableView_Learn
//
//  Created by jack on 14-9-9.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XMTableViewCell : UITableViewCell

- (id)initWithIdentifier:(NSString *)reuseIdentifier;

- (void)setCellText:(NSString *)text;

@end
