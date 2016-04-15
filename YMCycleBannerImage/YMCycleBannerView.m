//
//  YMCycleBannerView.m
//  YMCycleBannerImage
//
//  Created by mac on 16/4/9.
//  Copyright © 2016年 YiMin. All rights reserved.
//

#import "YMCycleBannerView.h"
#import "YMCycleBannerCell.h"
#import "YMCycleBannerLayout.h"
#import "UIImage+YMImageEffects.h"

//static NSString *identifier = @"YMCell";

@interface YMCycleBannerView()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation YMCycleBannerView{
    NSArray *_ym_banners;
    NSTimer *_ym_timer;
    UICollectionView *_ym_collectionView;
    UIPageControl *_ym_pageView;
    NSString *_ym_ImageUrlKeyPath;
    NSString *_ym_urlKeyPath;
    NSString *_ym_titleKeyPath;
    NSTimeInterval _ym_duration;
    UIImage *_ym_placeholder;
    NSDictionary<NSString *, id> *_ym_attrs;
}

-(instancetype)initWithFrame:(CGRect)frame Delegate:(id)target banners:(NSArray *)ym_banners duration:(NSTimeInterval)ym_duration ImageUrlKeyPath:(NSString *)ym_ImageUrlKeyPath placeholder:(NSString *)ym_placeholder urlKeyPath:(NSString *)ym_urlKeyPath titleKeyPath:(NSString *)ym_titleKeyPath hiddenPage:(BOOL)hiddenPage{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        NSAssert(target, @"请传入代理");
        NSAssert(ym_banners, @"请传入模型数组");
        NSAssert(ym_duration, @"请传入轮播时间间隔");
        NSAssert(ym_ImageUrlKeyPath, @"请传入的图片url的key");
        NSAssert(ym_urlKeyPath, @"请传入转场url的key");
        self.ym_cycleBannerDelegate = target;
        _ym_banners = ym_banners;
        _ym_duration = ym_duration;
        _ym_ImageUrlKeyPath = ym_ImageUrlKeyPath;
        if (ym_placeholder) {
            _ym_placeholder = [UIImage imageNamed:ym_placeholder];
        }else{
            _ym_placeholder = [UIImage imageNamed:@"YMCycleBannerImage.bundle/ym_iosdeveloper.jpg"];
        }
        _ym_urlKeyPath = ym_urlKeyPath;
        if (ym_titleKeyPath) {
            _ym_titleKeyPath = ym_titleKeyPath;
        }
        _ym_collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:[YMCycleBannerLayout new]];
        _ym_collectionView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_ym_collectionView];
        _ym_collectionView.dataSource = self;
        _ym_collectionView.delegate = self;
        [_ym_collectionView registerClass:[YMCycleBannerCell class] forCellWithReuseIdentifier:_ym_urlKeyPath];
        dispatch_async(dispatch_get_main_queue(), ^{
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:_ym_banners.count inSection:0];
            [_ym_collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        });
        [self ym_addTimer];
        if (_ym_titleKeyPath) {
            [self ym_setMaskView];
            [self ym_setTitle];
        }
        if (!hiddenPage) {
            [self ym_preparePageView];
        }
    }
    return self;
}
-(void)ym_setMaskView{
    self.ym_maskView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.bounds.size.height * 0.87, self.bounds.size.width, self.bounds.size.height * 0.13)];
    [self addSubview:self.ym_maskView];
}

-(void)ym_setTitle{
    self.ym_titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.bounds.size.height * 0.87, self.bounds.size.width * 0.7, self.bounds.size.height * 0.13)];
    self.ym_titleLabel.textAlignment = NSTextAlignmentLeft;
    self.ym_titleLabel.font = [UIFont systemFontOfSize:15];
    self.ym_titleLabel.textColor = [UIColor whiteColor];
    [self addSubview:self.ym_titleLabel];
}

-(void)setYm_pageFrame:(CGRect)ym_pageFrame{
    _ym_pageFrame = ym_pageFrame;
    _ym_pageView.frame = ym_pageFrame;
    [self setNeedsLayout];
}

-(void)setYm_currentPageImage:(UIImage *)ym_currentPageImage{
    _ym_currentPageImage = ym_currentPageImage;
    [_ym_pageView setValue:ym_currentPageImage forKeyPath:@"_currentPageImage"];
}

-(void)setYm_pageImage:(UIImage *)ym_pageImage{
    _ym_pageImage = ym_pageImage;
    [_ym_pageView setValue:ym_pageImage forKeyPath:@"_pageImage"];
}

-(void)setYm_currentPageIndicatorTintColor:(UIColor *)ym_currentPageIndicatorTintColor{
    _ym_currentPageIndicatorTintColor = ym_currentPageIndicatorTintColor;
    [_ym_pageView setValue:nil forKeyPath:@"_currentPageImage"];
    _ym_pageView.currentPageIndicatorTintColor = ym_currentPageIndicatorTintColor;
}

-(void)setYm_pageIndicatorTintColor:(UIColor *)ym_pageIndicatorTintColor{
    _ym_pageIndicatorTintColor = ym_pageIndicatorTintColor;
    [_ym_pageView setValue:nil forKeyPath:@"_pageImage"];
    _ym_pageView.pageIndicatorTintColor = ym_pageIndicatorTintColor;
}

-(void)ym_preparePageView {
    _ym_pageView = [[UIPageControl alloc] initWithFrame:CGRectMake(self.bounds.size.width * 0.7, self.bounds.size.height * 0.87, self.bounds.size.width * 0.3, self.bounds.size.height * 0.13)];
    _ym_pageView.numberOfPages = _ym_banners.count;
    [_ym_pageView setValue:[UIImage imageNamed:@"YMCycleBannerImage.bundle/ym_currentPageImage.png"] forKeyPath:@"_currentPageImage"];
    [_ym_pageView setValue:[UIImage imageNamed:@"YMCycleBannerImage.bundle/ym_pageImage.png"] forKeyPath:@"_pageImage"];
    _ym_pageView.currentPage = 0;
    [self addSubview:_ym_pageView];
}

- (void)ym_addTimer{
    _ym_timer = [NSTimer scheduledTimerWithTimeInterval:_ym_duration target:self selector:@selector(ym_nextImage) userInfo:nil repeats:YES];
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:_ym_timer forMode:NSRunLoopCommonModes];
}

-(void)ym_nextImage {
    NSInteger offset = _ym_collectionView.contentOffset.x / _ym_collectionView.bounds.size.width;
    [_ym_collectionView setContentOffset:CGPointMake((offset + 1)* _ym_collectionView.bounds.size.width, 0) animated:YES];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _ym_banners.count * 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YMCycleBannerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:_ym_urlKeyPath forIndexPath:indexPath];
    NSString *ym_url = [_ym_banners valueForKeyPath:_ym_ImageUrlKeyPath][indexPath.item % _ym_banners.count];
    cell.placeholder = _ym_placeholder;
    cell.ym_urlString = ym_url;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.ym_cycleBannerDelegate respondsToSelector:@selector(ymCycleBannerView:didSelectItemUrl:)]) {
        NSString *urlString = [_ym_banners valueForKeyPath:_ym_urlKeyPath][indexPath.item % _ym_banners.count];
        NSURL *url = [NSURL URLWithString:urlString];
        [self.ym_cycleBannerDelegate ymCycleBannerView:self didSelectItemUrl:url];
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self setContenOffsetAndCurrentPage:scrollView isDidScroll:YES];
}


-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [_ym_timer invalidate];
    _ym_timer = nil;
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self ym_addTimer];
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [self scrollViewDidEndDecelerating:scrollView];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self setContenOffsetAndCurrentPage:scrollView isDidScroll:NO];
}

-(void)setContenOffsetAndCurrentPage:(UIScrollView *)scrollView isDidScroll:(BOOL)isDidScroll{
    NSInteger offset = scrollView.contentOffset.x / scrollView.bounds.size.width + 0.5;
    if (offset == 0 || offset == ([_ym_collectionView numberOfItemsInSection:0] - 1)) {
        if (offset == 0) {
            offset = _ym_banners.count;
        } else {
            offset = _ym_banners.count - 1;
        }
        scrollView.contentOffset = CGPointMake(offset * scrollView.bounds.size.width, 0);
    }
    NSInteger index = offset % _ym_banners.count;
    if (_ym_pageView) {
        _ym_pageView.currentPage = index;
    }
    if (self.ym_titleLabel) {
        if (!self.ym_maskView.hidden && !self.ym_maskView.backgroundColor) {
            if (!isDidScroll) {
                self.ym_maskView.image = [[self ym_drawingMaskImage:self.ym_maskView.bounds.size] applyLightEffect];
            }
        }
        NSString *ym_title = [_ym_banners valueForKeyPath:_ym_titleKeyPath][index];
        self.ym_titleLabel.text = [NSString stringWithFormat:@"  %@",ym_title];
    }
}

-(UIImage *)ym_drawingMaskImage:(CGSize)size{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
        CGContextRef context = UIGraphicsGetCurrentContext();
        [self.layer renderInContext:context];
        UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    return image;
}

@end
