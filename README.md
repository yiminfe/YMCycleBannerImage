<h1>YMCycleBannerImage</h1>
<ul>
<li>一行代码搞定手动与自动无限轮播，史上最强超级无限轮播iOS框架</li>
<li>前提条件：对应的数据模型类和对应的属性key值</li>
<li>必选参数：frame、代理控制器、本地模型数组或者网络模型数组、自动轮播时间间隔、与对应的图片key值、占位图片路径</li>
<li>可选参数：标题key值（nil为不设置蒙版）、是否隐藏分页指示器(YES为隐藏)</li>
<li>协议：YMCycleBannerViewDelegate 代理方法(将选中的数组下标直接传出来了)：ymCycleBannerView:didSelectItemAtIndex:</li>
<li>框架特点：性能超强、混合无瑕疵、使用超简单，一行代码搞定，轮播流畅度AppStore无敌</li>
<img src="https://raw.githubusercontent.com/iosdeveloperSVIP/YMCycleBannerImage/master/ymbanner.gif"></img>
</ul>
<p>GitHub：<a href="https://github.com/iosdeveloperSVIP"  target="_blank">iosdeveloperSVIP</a>
 &nbsp;&nbsp;&nbsp;&nbsp;邮箱：<a href="mailto:iosdeveloper@vip.163.com">iosdeveloper@vip.163.com</a><p>
<h4>亲爱的各位同行，如果在使用中出现bug，请联系邮箱:
<a href="mailto:iosdeveloper@vip.163.com">iosdeveloper@vip.163.com</a>，如果使用不错的话请帮我点下右上角星星UnStar，非常感谢</h4>
<h1>操作目录</h1>
<ul>
<li><a href="#defaultstyles">默认样式:一行代码搞定</a>
<ul>
<li><a href="#defaultstyles">apple官方磨砂效果蒙版</a></li>
</ul>
</li>
<li><a href="#maskstyles">自定义蒙版</a>
<ul>
<li><a href="#maskstyles">1.设置ym_maskView的背景颜色</a></li>
<li><a href="#maskstyles">2.设置ym_maskView的透明度</a></li>
<li><a href="#maskstyles">扩展：设置隐藏、frame、等等</a></li>
</ul>
</li>
<li><a href="#titlestyles">自定标题栏</a>
<ul>
<li><a href="#titlestyles">1.设置ym_titleLabel的字体的颜色和大小等</a></li>
<li><a href="#titlestyles">扩展：ym_titleLabel的frame、隐藏等</a></li>
</ul>
</li>
<li><a href="#pagestyles">自定分页指示器</a>
<ul>
<li><a href="#pagestyles">1.设置ym_pageFrame来设置分页指示器的frame</a></li>
<li><a href="#pagestyles">2.设置ym_currentPageImage来设置分页指示器的当前页小图标</a></li>
<li><a href="#pagestyles">3.设置ym_pageImage来设置分页指示器的默认小图标</a></li>
<li><a href="#pagestyles">4.设置ym_currentPageIndicatorTintColor来设置分页指示器的当前apple官方图标</a></li>
<li><a href="#pagestyles">5.设置ym_pageIndicatorTintColor来设置分页指示器的默认apple官方图标</a></li>
<li><a href="#pagestyles">隐藏：请将将初始化方法参数设置为YES</a></li>
</ul>
</li>
</ul>
<hr/>
<h2>安装使用</h2>
<h3>使用 CocoaPods安装</h3>
<div class="highlight highlight-source-ruby"><pre>pod <span class="pl-s"><span class="pl-pds">'</span>YMCycleBannerImage<span class="pl-pds">'</span></span></pre></div>
<h3>手动导入文件</h3>
<ul>
<li>将YMCycleBannerImage文件夹中的所有源代码拽入项目中</li>
<li>【导入主头文件：<code>#import "YMCycleBannerView.h"</code>】</li>
</ul>
<h2 id="defaultstyles">默认样式:apple官方磨砂蒙版效果</h2>
<img src="https://raw.githubusercontent.com/iosdeveloperSVIP/YMCycleBannerImage/master/defaultstyles.gif"></img>
<div class="highlight highlight-source-objc"><pre>
<span class="pl-k">YMCycleBannerView *bannerView = [[YMCycleBannerView alloc]
<br>initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.width * 0.5, 
<br>[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width * 0.5) 
<br>Delegate:self banners:bannerModel2 duration:2.0 
<br>ImageUrlKeyPath:@"ymbanner" placeholder:nil
<br>titleKeyPath:@"title" hiddenPage:NO];
<br><span class="pl-c">//参数解析:initWithFrame(轮播视图的大小和位置) Delegate(传入代理控制器) banners(数据模型数组)
<br>//duration(轮播时间间隔) ImageUrlKeyPath(图片url的模型key值) placeholder(本地占位图片路径) 
<br>//urlKeyPath(转场url的模型key值) titleKeyPath(标题栏的模型key值) hiddenPage(是否隐藏分页指示器)</span>
<br>[self.view addSubview:bannerView];
<br>YMCycleBannerViewDelegate <span class="pl-c">//请遵守协议</span>
<br>-(void)ymCycleBannerView:(YMCycleBannerView *)ymCycleBannerView     didSelectItemAtIndex:(NSInteger)index
<br><span class="pl-c">//请实现代理方法、index为选中的数组下标，做控制器跳转操作</span></span></pre></div>
<h2 id="maskstyles">自定义蒙版</h2>
<img src="https://raw.githubusercontent.com/iosdeveloperSVIP/YMCycleBannerImage/master/maskstyles.gif"></img>
<div class="highlight highlight-source-objc"><pre>
<span class="pl-k">bannerView.ym_maskView.backgroundColor = [UIColor blackColor];//设置背景颜色
<br>bannerView.ym_maskView.alpha = 0.5;//设置透明度
<br><span class="pl-c">//其它扩展属性:frame、hidden</span></span></pre></div>
<h2 id="titlestyles">自定标题栏</h2>
<img src="https://raw.githubusercontent.com/iosdeveloperSVIP/YMCycleBannerImage/master/titlestyles.gif"></img>
<div class="highlight highlight-source-objc"><pre>
<span class="pl-k">bannerView.ym_titleLabel.font = [UIFont systemFontOfSize:20.0];<span class="pl-c">//设置标题的字体大小</span>
<br>bannerView.ym_titleLabel.textColor = [UIColor redColor];<span class="pl-c">//设置标题的字体颜色</span>
<br><span class="pl-c">//其它扩展属性:frame、hidden</span></span></pre></div>
<h2 id="pagestyles">自定分页指示器</h2>
<img src="https://raw.githubusercontent.com/iosdeveloperSVIP/YMCycleBannerImage/master/pagetyles.gif"></img>
<div class="highlight highlight-source-objc"><pre>
<span class="pl-k"><span class="pl-c">//自定义分页指示器图标</span>
<br>bannerView.ym_currentPageImage = [UIImage imageNamed:@"图片路径"];
<br>bannerView.ym_pageImage = [UIImage imageNamed:@"图片路径"];
<br><span class="pl-c">//使用apple官方分页指示器颜色图标</span>
<br>bannerView.ym_currentPageIndicatorTintColor = [UIColor redColor];
<br>bannerView.ym_pageIndicatorTintColor = [UIColor whiteColor];
<br><span class="pl-c">//其它扩展属性:frame,如需设置隐藏请设置初始化参数hiddenPage为YES</span></span></pre></div>
<h4>亲爱的各位同行，如果你已经浏览到这，请帮我点下右上角星星UnStar，非常感谢</h4>
