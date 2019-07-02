//
//  CollectionCell.m
//  HTWaterfallFlowDemo
//
//  Created by iOS-DEV on 2019/7/1.
//  Copyright © 2019 FOK. All rights reserved.
//

#import "CollectionCell.h"

@implementation CollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return self;
}

- (void)initViews {
    UIImageView *imgView = [[UIImageView alloc] init];
    [self.contentView addSubview:imgView];
    self.imgView = imgView;
}

@end
