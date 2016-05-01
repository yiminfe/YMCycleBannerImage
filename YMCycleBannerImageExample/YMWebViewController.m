//
//  YMWebViewController.m
//  YMCycleBannerImage
//
//  Created by mac on 16/4/26.
//  Copyright © 2016年 YiMin. All rights reserved.
//

#import "YMWebViewController.h"

@interface YMWebViewController ()

@end

@implementation YMWebViewController{
    UIWebView *_ym_webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)setYm_httpUrl:(NSString *)ym_httpUrl{
    _ym_httpUrl = ym_httpUrl;
    NSURL *ym_url = [NSURL URLWithString:ym_httpUrl];
    NSURLRequest *ym_request = [[NSURLRequest alloc] initWithURL:ym_url];
    _ym_webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    self.view = _ym_webView;
    _ym_webView.scalesPageToFit = YES;
    [_ym_webView loadRequest:ym_request];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
