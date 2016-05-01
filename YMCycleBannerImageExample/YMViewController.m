//
//  YMViewController.m
//  YMCycleBannerImage
//
//  Created by mac on 16/4/9.
//  Copyright © 2016年 YiMin. All rights reserved.
//

#import "YMViewController.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "nuomiModel.h"
#import "YMCycleBannerView.h"
#import "ymbannerModel.h"
#import "YMWebViewController.h"

@interface YMViewController ()<YMCycleBannerViewDelegate>

@end

@implementation YMViewController{
    NSArray *_ym_nuomiArray;
    NSArray *_ym_nuomiArray2;
    NSArray *_ym_bannerModel;
    YMCycleBannerView *_ym_bannerView;
    YMCycleBannerView *_ym_bannerView1;
    YMCycleBannerView *_ym_bannerView2;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"无限轮播";
    //设置背景颜色
    self.view.backgroundColor = [UIColor redColor];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width)];
    //加载本地plist
    //请求api
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    [manager GET:@"http://app.nuomi.com/naserver/home/homepage?appid=ios&bduss=h5aWVISTJNYXZtY05pd3RwQlNsN0ZTTUpjc2xsQU8xdDdNVVRGdkpSRUhiZFZXQVFBQUFBJCQAAAAAAAAAAAEAAABrtluHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAfgrVYH4K1WNE&channel=com_dot_apple&cityid=100010000&compId=index&compV=3.2.7&cuid=655748ab525342b09bf7fb81454adc9f4e6fd5eb&device=iPhone&ha=5&lbsidfa=739D40F5-4ACE-4595-9B58-88F855ACDD2D&location=40.105190%2C116.291040&logpage=Home&net=wifi&os=9.3&page_type=component&power=0.95&sheight=2208&sign=c4a73bbbad0e441006655396fa736056&swidth=1242&terminal_type=ios&timestamp=1460201861906&tn=ios&uuid=655748ab525342b09bf7fb81454adc9f4e6fd5eb&v=6.4.0&wifi=%5B%7B%22mac%22%3A%22fc%3Ad7%3A33%3Ae2%3A22%3Ae6%22%2C%22sig%22%3A99%2C%22ssid%22%3A%22305wifi%22%7D%5D&wifi_conn=%7B%22mac%22%3A%22fc%3Ad7%3A33%3Ae2%3A22%3Ae6%22%2C%22sig%22%3A99%2C%22ssid%22%3A%22305wifi%22%7D" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        _ym_nuomiArray = [nuomiModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"banners"]];
        _ym_bannerView = [[YMCycleBannerView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width / 2) Delegate:self banners:_ym_nuomiArray duration:2.5 ImageUrlKeyPath:@"picture_url" placeholder:nil titleKeyPath:@"banner_id"  hiddenPage:NO];
//        bannerView.ym_maskView.backgroundColor = [UIColor blackColor];
//        bannerView.ym_maskView.alpha = 0.5;
        _ym_bannerView.ym_titleLabel.font = [UIFont systemFontOfSize:20.0];
        _ym_bannerView.ym_titleLabel.textColor = [UIColor whiteColor];
        _ym_bannerView.ym_pageFrame = CGRectMake([UIScreen mainScreen].bounds.size.width * 0.5, [UIScreen mainScreen].bounds.size.width * 0.5 * 0.83, [UIScreen mainScreen].bounds.size.width * 0.5, [UIScreen mainScreen].bounds.size.width * 0.5 * 0.2);
//        //自定义分页指示器图标
//        bannerView.ym_currentPageImage = [UIImage imageNamed:@""];
//        bannerView.ym_pageImage = [UIImage imageNamed:@""];
//        //使用apple官方分页指示器颜色图标
        [view addSubview:_ym_bannerView];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
    }];
    
        [manager GET:@"http://app.nuomi.com/naserver/home/homepage?appid=ios&bduss=h5aWVISTJNYXZtY05pd3RwQlNsN0ZTTUpjc2xsQU8xdDdNVVRGdkpSRUhiZFZXQVFBQUFBJCQAAAAAAAAAAAEAAABrtluHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAfgrVYH4K1WNE&channel=com_dot_apple&cityid=100010000&compId=index&compV=3.2.7&cuid=655748ab525342b09bf7fb81454adc9f4e6fd5eb&device=iPhone&ha=5&lbsidfa=739D40F5-4ACE-4595-9B58-88F855ACDD2D&location=40.105190%2C116.291040&logpage=Home&net=wifi&os=9.3&page_type=component&power=0.95&sheight=2208&sign=c4a73bbbad0e441006655396fa736056&swidth=1242&terminal_type=ios&timestamp=1460201861906&tn=ios&uuid=655748ab525342b09bf7fb81454adc9f4e6fd5eb&v=6.4.0&wifi=%5B%7B%22mac%22%3A%22fc%3Ad7%3A33%3Ae2%3A22%3Ae6%22%2C%22sig%22%3A99%2C%22ssid%22%3A%22305wifi%22%7D%5D&wifi_conn=%7B%22mac%22%3A%22fc%3Ad7%3A33%3Ae2%3A22%3Ae6%22%2C%22sig%22%3A99%2C%22ssid%22%3A%22305wifi%22%7D" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        _ym_nuomiArray2 = [nuomiModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"banners"]];
        _ym_bannerView1 = [[YMCycleBannerView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.width * 0.5,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width / 2) Delegate:self banners:_ym_nuomiArray2 duration:3.0 ImageUrlKeyPath:@"picture_url" placeholder:nil titleKeyPath:@"banner_id"  hiddenPage:NO];
        _ym_bannerView1.ym_currentPageIndicatorTintColor = [UIColor redColor];
        _ym_bannerView1.ym_pageIndicatorTintColor = [UIColor whiteColor];
            _ym_bannerView1.ym_maskView.backgroundColor = [UIColor blackColor];
            _ym_bannerView1.ym_maskView.alpha = 0.5;
        [view addSubview:_ym_bannerView1];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
    }];
    self.tableView.tableHeaderView = view;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)ymCycleBannerView:(YMCycleBannerView *)ymCycleBannerView     didSelectItemAtIndex:(NSInteger)index{
    NSString *httpUrl;
    if (ymCycleBannerView.frame.origin.y == _ym_bannerView.frame.origin.y) {
        nuomiModel *model = _ym_nuomiArray[index];
        httpUrl = model.picture_url;
    }
    if (ymCycleBannerView.frame.origin.y == _ym_bannerView1.frame.origin.y) {
        nuomiModel *model = _ym_nuomiArray2[index];
        httpUrl = model.picture_url;
    }
    YMWebViewController *ymWeb = [[YMWebViewController alloc] init];
    [self.navigationController pushViewController:ymWeb animated:YES];
    ymWeb.ym_httpUrl = httpUrl;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"ym_cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}

@end
