<h1>YMCycleBannerImage</h1>
<ul>
<li>一行代码搞定手动与自动无限轮播，史上最强超级无限轮播iOS框架</li>
<li>前提条件：对应的数据模型类和对应的属性key值</li>
<li>必选参数：frame、代理控制器、本地模型数组或者网络模型数组、自动轮播时间间隔、与对应的图片key值、占位图片路径、转场url的key</li>
<li>可选参数：标题key值（nil为不设置蒙版）、是否隐藏分页指示器(YES为隐藏)</li>
<li>协议：YMCycleBannerViewDelegate 代理方法(将专场的url值直接传出来了)：ymCycleBannerView:didSelectItemUrl:</li>
<li>框架特点：性能超强、混合无瑕疵、使用超简单，一行代码搞定，轮播流畅度AppStore无敌</li>
<img src="https://raw.githubusercontent.com/iosdeveloperSVIP/YMCycleBannerImage/master/ymBanner1.gif"></img>
</ul>
<p>GitHub：<a href="https://github.com/iosdeveloperSVIP">iosdeveloperSVIP</a><p>
<h1>操作目录</h1>
<ul>
<li><a href="default">默认样式:一行代码搞定</a>
<ul>
<li><a href="default">apple官方磨砂效果蒙版</a></li>
</ul>
</li>
<li><a href="default">自定义蒙版</a>
<ul>
<li><a href="default">1.设置ym_maskView的背景颜色</a></li>
<li><a href="default">2.设置ym_maskView的透明度</a></li>
<li><a href="default">扩展：设置隐藏、frame、等等</a></li>
</ul>
</li>
<li><a href="default">自定标题栏</a>
<ul>
<li><a href="default">1.设置ym_titleLabel的字体的颜色和大小等</a></li>
<li><a href="default">扩展：ym_titleLabel的frame、隐藏等</a></li>
</ul>
</li>
<li><a href="default">自定分页指示器</a>
<ul>
<li><a href="default">1.设置ym_pageFrame来设置分页指示器的frame</a></li>
<li><a href="default">2.设置ym_currentPageImage来设置分页指示器的当前页小图标</a></li>
<li><a href="default">3.设置ym_pageImage来设置分页指示器的默认小图标</a></li>
<li><a href="default">4.设置ym_currentPageIndicatorTintColor来设置分页指示器的当前apple官方图标</a></li>
<li><a href="default">5.设置ym_pageIndicatorTintColor来设置分页指示器的默认apple官方图标</a></li>
<li>隐藏：请将将初始化方法参数设置为YES</li>
</ul>
</li>
</ul>
<h2>安装使用</h2>
<h3>使用 CocoaPods安装</h3>
<div class="highlight highlight-source-ruby"><pre>pod <span class="pl-s"><span class="pl-pds">'</span>YMCycleBannerImage<span class="pl-pds">'</span></span></pre></div>


