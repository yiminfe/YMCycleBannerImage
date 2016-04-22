//代码地址：https://github.com/iosdeveloperSVIP/YMCycleBannerImage
//原创：iosdeveloper赵依民
//邮箱：iosdeveloper@vip.163.com
//

//  YMCycleBannerCell.h
//  YMCycleBannerImage
//
//  Created by mac on 16/4/9.
//  Copyright © 2016年 YiMin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YMCycleBannerCell : UICollectionViewCell

/** banner图片地址 */
@property (nonatomic,copy) NSString *ym_urlString;

/** banner占位图 */
@property (nonatomic,strong) UIImage *placeholder;

@end
