# HTWaterfallFlow
一种瀑布流布局方式，用作collectionView的layout。

## Show
![example](https://github.com/runThor/HTWaterfallFlow/raw/master/Other/example.png)

## Usage
```Objective-C

// ViewController.m

#import "HTWaterfallFlowLayout.h"

HTWaterfallFlowLayout *waterfall = [[HTWaterfallFlowLayout alloc] initWithColumnCount:2];
[waterfall setColumnSpacing:10 rowSpacing:10 sectionInset:UIEdgeInsetsMake(10, 10, 10, 10)];
[waterfall setItemHeightBlock:^CGFloat(CGFloat itemWidth, NSIndexPath *indexPath) {
    // 返回计算后的高度
    return itemHeight;
}];

// 作为collectionView的layout
self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:waterfall];
         
```
