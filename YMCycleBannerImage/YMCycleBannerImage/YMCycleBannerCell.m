//
//  YMCycleBannerCell.m
//  YMCycleBannerImage
//
//  Created by mac on 16/4/9.
//  Copyright © 2016年 YiMin. All rights reserved.
//

#import "YMCycleBannerCell.h"
#import "UIImageView+YMDownloadBannerImage.h"

@implementation YMCycleBannerCell{
    UIImageView *ym_imageView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        ym_imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self.contentView addSubview:ym_imageView];
        ym_imageView.userInteractionEnabled = YES;
        ym_imageView.contentMode = UIViewContentModeScaleAspectFill;
        ym_imageView.clipsToBounds = YES;
        
        self.layer.shouldRasterize = YES;
        self.layer.rasterizationScale = [UIScreen mainScreen].scale;
        self.layer.drawsAsynchronously = YES;
    }
    return self;
}

-(void)setYm_urlString:(NSString *)ym_urlString{
    _ym_urlString = ym_urlString;
    if ([ym_urlString containsString:@"http://"] || [ym_urlString containsString:@"https://"] ) {
        [ym_imageView ym_setImageWithUrl:ym_urlString placeholder:self.placeholder];
    }else{
        ym_imageView.image = [UIImage imageNamed:ym_urlString];
    }
}

@end
