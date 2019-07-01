//
//  HTWaterfallFlowLayout.h
//  HTWaterfallFlowDemo
//
//  Created by iOS-DEV on 2019/7/1.
//  Copyright © 2019 FOK. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HTWaterfallFlowLayout : UICollectionViewLayout

//总列数
@property (nonatomic, assign) NSInteger columnCount;

//列间距
@property (nonatomic, assign) NSInteger columnSpacing;

//行间距
@property (nonatomic, assign) NSInteger rowSpacing;

//section与collectionView的间距，默认是（0，0，0，0）
@property (nonatomic, assign) UIEdgeInsets sectionInset;

//同时设置列间距，行间距，sectionInset
- (void)setColumnSpacing:(NSInteger)columnSpacing rowSpacing:(NSInteger)rowSepacing sectionInset:(UIEdgeInsets)sectionInset;

//计算item高度的block，将item的高度与indexPath传递给外界
@property (nonatomic, copy) CGFloat(^itemHeightBlock)(CGFloat itemHeight, NSIndexPath *indexPath);


- (instancetype)initWithColumnCount:(NSInteger)columnCount;

@end

NS_ASSUME_NONNULL_END
