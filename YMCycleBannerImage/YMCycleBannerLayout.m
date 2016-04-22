//代码地址：https://github.com/iosdeveloperSVIP/YMCycleBannerImage
//原创：iosdeveloper赵依民
//邮箱：iosdeveloper@vip.163.com
//

//  YMCycleBannerLayout.m
//  YMCycleBannerImage
//
//  Created by mac on 16/4/9.
//  Copyright © 2016年 YiMin. All rights reserved.
//

#import "YMCycleBannerLayout.h"

@implementation YMCycleBannerLayout

- (void)prepareLayout {
    [super prepareLayout];
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.itemSize = self.collectionView.bounds.size;
    self.minimumInteritemSpacing = 0;
    self.minimumLineSpacing = 0;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView.bounces = NO;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.showsVerticalScrollIndicator = NO;
}
@end
