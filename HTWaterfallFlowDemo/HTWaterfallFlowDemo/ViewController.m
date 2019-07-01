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

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, copy) NSArray *images;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    HTWaterfallFlowLayout *waterfall = [[HTWaterfallFlowLayout alloc] initWithColumnCount:2];
    [waterfall setColumnSpacing:10 rowSpacing:10 sectionInset:UIEdgeInsetsMake(10, 10, 10, 10)];
    [waterfall setItemHeightBlock:^CGFloat(CGFloat itemWidth, NSIndexPath *indexPath) {
        // 根据图片的原始尺寸，及显示宽度，等比例缩放来计算显示高度
        if (indexPath.item%3 == 0) {
            return 100;
        } else if (indexPath.item%2 == 0) {
            return 50;
        } else {
            return 70;
        }
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
    cell.imgView.image = [UIImage imageNamed:self.images[indexPath.item]];
    
    return cell;
}

- (NSArray *)images {
    if (!_images) {
        _images = @[@"1.jpg", @"2.jpg", @"3.jpg", @"4.jpeg", @"5", @"6", @"2.jpg", @"3.jpg", @"4.jpeg", @"5", @"6", @"2.jpg", @"3.jpg", @"4.jpeg", @"5", @"6", @"2.jpg", @"3.jpg", @"4.jpeg", @"5", @"6", @"2.jpg", @"3.jpg", @"4.jpeg", @"5", @"6", @"2.jpg", @"3.jpg", @"4.jpeg", @"5", @"6", @"2.jpg", @"3.jpg", @"4.jpeg", @"5", @"6"];
    }
    
    return _images;
}


@end
