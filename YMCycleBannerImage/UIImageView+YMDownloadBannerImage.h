//
//  UIImageView+YMDownloadBannerImage.h
//  YMCycleBannerImage
//
//  Created by mac on 16/4/11.
//  Copyright © 2016年 YiMin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (YMDownloadBannerImage)

-(void)ym_setImageWithUrl:(NSString *)urlString placeholder:(UIImage *)placeholder;

@end
