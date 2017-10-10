//
//  WJBaseWebViewController.m
//  MyDemos
//
//  Created by 平安科技 on 2017/10/9.
//  Copyright © 2017年 wangjianjune. All rights reserved.
//

#import "WJBaseWebViewController.h"
#import "WebViewJavascriptBridge.h"


@interface WJBaseWebViewController ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *webview;///<webview
@property (nonatomic, strong) WebViewJavascriptBridge *bridge;///<js桥
@end

@implementation WJBaseWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建UIWebview并加载本地网页内容
    _webview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    [self.view addSubview:_webview];
    
    
    _webview.delegate = self;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"WJWebTestFile" ofType:@"html"];
    NSString *appHTML = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    [_webview loadHTMLString:appHTML baseURL:url];
    
    //********  WebViewJavascriptBridge  ********//
    //1.开启日志
    [WebViewJavascriptBridge enableLogging];
    //2.创建oc/js桥梁
    _bridge = [WebViewJavascriptBridge bridgeForWebView:_webview];
    [_bridge setWebViewDelegate:self];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    if (webView != _webview) {return YES;}
    NSURL *url = [request URL];
//    __strong WVJB_WEBVIEW_DELEGATE_TYPE *strongDelegate = _webViewDelegate;

    
    
    
    
    
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
