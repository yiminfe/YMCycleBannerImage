//
//  YMCycleBannerView.h
//  YMCycleBannerImage
//
//  Created by mac on 16/4/9.
//  Copyright © 2016年 YiMin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YMCycleBannerView;

@protocol YMCycleBannerViewDelegate <NSObject>

- (void)ymCycleBannerView:(YMCycleBannerView *)ymCycleBannerView didSelectItemUrl:(NSURL *)url;

@end

@interface YMCycleBannerView : UIView

/** 请设置必要参数：轮播视图的位置、数组模型对象、自动轮播时间间隔、图片url、转场url，可选参数：banner标题、是否隐藏pageView  nil代表隐藏pageView设置YES隐藏*/
-(instancetype)initWithFrame:(CGRect)frame Delegate:(id)target banners:(NSArray *)ym_banners duration:(NSTimeInterval)ym_duration ImageUrlKeyPath:(NSString *)ym_ImageUrlKeyPath placeholder:(NSString *)ym_placeholder urlKeyPath:(NSString *)ym_urlKeyPath titleKeyPath:(NSString *)ym_titleKeyPath hiddenPage:(BOOL)hiddenPage;

/** 设置pageView的frame 初始化参数hiddenPage需要设置为NO*/
@property (nonatomic,assign) CGRect ym_pageFrame;

/** 设置titleLabel 初始化参数titleKeyPath不能为空*/
@property (nonatomic,strong) UILabel *ym_titleLabel;

/** 设置蒙版 */
@property (nonatomic,strong) UIImageView *ym_maskView;

/** 设置当前cell的page小图标 */
@property (nonatomic,strong) UIImage *ym_currentPageImage;

/** 设置默认的cel的page小图标 */
@property (nonatomic,strong) UIImage *ym_pageImage;

/** 设置当前cell的page小图标 */
@property (nonatomic,strong) UIColor *ym_currentPageIndicatorTintColor;

/** 设置默认的cel的page小图标 */
@property (nonatomic,strong) UIColor *ym_pageIndicatorTintColor;

@property (nonatomic,weak) id<YMCycleBannerViewDelegate> ym_cycleBannerDelegate;

@end
