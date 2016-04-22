//代码地址：https://github.com/iosdeveloperSVIP/YMCycleBannerImage
//原创：iosdeveloper赵依民
//邮箱：iosdeveloper@vip.163.com
//

//  UIImageView+YMDownloadBannerImage.m
//  YMCycleBannerImage
//
//  Created by mac on 16/4/11.
//  Copyright © 2016年 YiMin. All rights reserved.
//

#import "UIImageView+YMDownloadBannerImage.h"
#import <objc/runtime.h>

NSArray *ym_bannersArray;
NSOperationQueue *ym_queue;
NSCache *ym_imageCache;
NSCache *ym_operationCache;

@implementation UIImageView (YMDownloadBannerImage)

+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ym_bannersArray = [NSArray array];
        ym_queue = [[NSOperationQueue alloc] init];
        ym_imageCache = [[NSCache alloc] init];
        ym_operationCache = [[NSCache alloc] init];
        Method systemMethod = class_getInstanceMethod([self class], @selector(setImage:));
        Method myMethod = class_getInstanceMethod([self class], @selector(ym_setImage:));
        class_addMethod([self class], @selector(setImage:), method_getImplementation(myMethod), method_getTypeEncoding(myMethod));
        
//        class_replaceMethod([self class], @selector(ym_setImage:), method_getImplementation(systemMethod), method_getTypeEncoding(systemMethod));
        
        method_exchangeImplementations(systemMethod,myMethod);
    });
}

-(void)ym_setImageWithUrl:(NSString *)urlString placeholder:(UIImage *)placeholder{
    if ([ym_imageCache objectForKey:urlString]) {
        [self setImage:[ym_imageCache objectForKey:urlString]];
        return;
    }
    if ([ym_operationCache objectForKey:urlString]) {
        return;
    }
    NSData *ym_data=[NSData dataWithContentsOfFile:[self ym_appendCachePath:urlString]];
    UIImage *ym_image=[UIImage imageWithData:ym_data];
    if (ym_image!=nil) {
        [self ym_setImage:ym_image];
        [ym_imageCache setObject:ym_image forKey:urlString];
        return;
    }
    [self ym_setImage:placeholder];
    NSBlockOperation *op=[NSBlockOperation blockOperationWithBlock:^{
        NSURL *ym_url=[NSURL URLWithString:urlString];
        NSData *ym_data=[NSData dataWithContentsOfURL:ym_url];
        UIImage *ym_image=[UIImage imageWithData:ym_data];
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            if (ym_image!=nil) {
                [ym_imageCache setObject:ym_image forKey:urlString];
                if ([self.superview.superview.superview respondsToSelector:@selector(reloadData)]) {
                    [(UICollectionView *)self.superview.superview.superview reloadData];
                }
                [ym_data writeToFile:[self ym_appendCachePath:urlString] atomically:YES];
            }
            [ym_operationCache removeObjectForKey:urlString];
        }];
    }];
    [ym_queue addOperation:op];
    [ym_operationCache setObject:op forKey:urlString];
}

-(NSString *)ym_appendCachePath:(NSString *)ym_path{
    NSString *ym_path_cache=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *ym_name_cache=[ym_path lastPathComponent];
    NSString *ym_file_cache=[ym_path_cache stringByAppendingPathComponent:ym_name_cache];
    return  ym_file_cache;
}

- (void)ym_setImage:(UIImage *)image {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
    [image drawInRect:self.bounds];
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self ym_setImage:result];
}


@end
