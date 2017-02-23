//
//  CFCycleScrollLabelViewCell.m
//  CFCycleScrollLabelView
//
//  Created by Peak on 17/2/23.
//  Copyright © 2017年 陈峰. All rights reserved.
//

#import "CFCycleScrollLabelViewCell.h"
#import "CFMacro.h"

@implementation CFCycleScrollLabelViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = CFRandomColor;
    }
    return _titleLabel;
}

@end
