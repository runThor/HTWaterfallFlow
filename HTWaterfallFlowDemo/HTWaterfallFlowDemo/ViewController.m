//
//  ViewController.m
//  HTWaterfallFlowDemo
//
//  Created by iOS-DEV on 2019/6/28.
//  Copyright © 2019 FOK. All rights reserved.
//

#import "ViewController.h"
#import "HTWaterfallFlowLayout.h"
#import "CollectionCell.h"

@interface ViewController () <UICollectionViewDataSource>

@property (nonatomic, strong) HTWaterfallFlowLayout *waterfallLayout;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, copy) NSArray *images;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HTWaterfallFlowLayout *waterfall = [[HTWaterfallFlowLayout alloc] initWithColumnCount:2];
    self.waterfallLayout = waterfall;
    [waterfall setColumnSpacing:10 rowSpacing:10 sectionInset:UIEdgeInsetsMake(10, 10, 10, 10)];
    __weak typeof(self) weakSelf = self;
    [waterfall setItemHeightBlock:^CGFloat(CGFloat itemWidth, NSIndexPath *indexPath) {
        CGSize imgSize = [UIImage imageNamed:weakSelf.images[indexPath.item]].size;
        
        return itemWidth / imgSize.width * imgSize.height;
    }];
    
    //创建collectionView
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:waterfall];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[CollectionCell class] forCellWithReuseIdentifier:@"cell"];
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    UIImage *img = [UIImage imageNamed:self.images[indexPath.item]];
    cell.imgView.image = img;
    CGFloat itemWidth = (self.collectionView.frame.size.width - self.waterfallLayout.sectionInset.left - self.waterfallLayout.sectionInset.right - (self.waterfallLayout.columnCount - 1) * self.waterfallLayout.columnSpacing) / self.waterfallLayout.columnCount;
    cell.imgView.frame = CGRectMake(0, 0, itemWidth, itemWidth / img.size.width * img.size.height);
    
    return cell;
}

- (NSArray *)images {
    if (!_images) {
        _images = @[@"1", @"2", @"3", @"4", @"5", @"6", @"1", @"2", @"3", @"4", @"5", @"6", @"1", @"2", @"3", @"4", @"5", @"6", @"1", @"2", @"3", @"4", @"5", @"6", @"1", @"2", @"3", @"4", @"5", @"6", @"1", @"2", @"3", @"4", @"5", @"6", @"1", @"2", @"3", @"4", @"5", @"6", @"1", @"2", @"3", @"4", @"5", @"6"];
    }
    
    return _images;
}


@end
