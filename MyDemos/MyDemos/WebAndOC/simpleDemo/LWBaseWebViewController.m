//
//  LWBaseWebViewController.m
//  MyDemos
//
//  Created by 平安科技 on 2017/7/21.
//  Copyright © 2017年 wangjianjune. All rights reserved.
//


#import "LWBaseWebViewController.h"

@interface LWBaseWebViewController ()<UIWebViewDelegate>
@property (nonatomic, strong) UIWebView *webview;///<网页控件
@end

@implementation LWBaseWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initSubview];
    
}

//initWeb
-(void)initSubview{
    
    self.title = @"WEBVIEW";
    _webview = [[UIWebView alloc] init];
    _webview.backgroundColor = [UIColor yellowColor];
    _webview.delegate = self;
    _webview.scalesPageToFit = YES;
    [self.view addSubview:_webview];
    [_webview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"webviewTest" ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:htmlPath];
    NSURLRequest *reqyest = [NSURLRequest requestWithURL:url];
    [_webview loadRequest:reqyest];
 
}

#pragma mark - 网页加载
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
//    NSString *requestString = [[[request URL] absoluteString] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
   NSString *requestString = [[[request URL] absoluteString] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    
    if ([requestString hasPrefix:@"myapp"]) {
        NSLog(@"requestString = %@",requestString);
        NSMutableDictionary *param = [self queryStringToDictionary:requestString];
        NSLog(@"param = %@",param.description);
        NSString *func = [param objectForKey:@"func"];
        if ([func isEqualToString:@"testFunc"]) {
            [self testFunc:[param objectForKey:@"param1"] withParam2:[param objectForKey:@"param2"] andParam3:[param objectForKey:@"param3"]];
        }        
        return NO;
    }
    return YES;
}

- (void)webViewDidFinishLoad: (UIWebView *) webView
{
    //重定义web的alert方法,捕获webview弹出的原生alert  可以修改标题和内容等等
}

//分隔字符串
- (NSMutableDictionary*)queryStringToDictionary:(NSString*)string {
    NSMutableArray *elements = (NSMutableArray*)[string componentsSeparatedByString:@"&"];
    NSMutableDictionary *retval = [NSMutableDictionary dictionaryWithCapacity:[elements count]];
    for(NSString *e in elements) {
        NSArray *pair = [e componentsSeparatedByString:@"="];
        if (pair.count<=1) {
            NSMutableArray *arr = pair.mutableCopy;
           [arr insertObject:@"" atIndex:0];
            pair = arr.copy;
        }
        NSString *pairKey = [pair objectAtIndex:0];
        [retval setObject:[pair objectAtIndex:1]?:@"" forKey:pairKey.length?pairKey:@"nokey"];
    }
    return retval;
}

/**
 JS调用OC
 */
- (void)testFunc:(NSString *)param withParam2:(NSString *)param2 andParam3:(NSString *)param3{
    NSLog(@"param = %@,param2 = %@,param3 = %@",param,param2,param3);
    
    //OC调用JS（回传赋值）
    NSString *callBack = [NSString stringWithFormat:@"var script = document.createElement('script');\
                          script.type = 'text/JavaScript';\
                          script.text = function jsFouc(){\
                          var a = document.getElementsByTagName('body')[0];\
                          alert('%@,%@,%@');\
                          };\
                          document.getElementsByTagName('head')[0].appendChild(script);\
                          ",param,param2,param3];
    [_webview stringByEvaluatingJavaScriptFromString:callBack];
    [_webview stringByEvaluatingJavaScriptFromString:@"jsFouc()"];
  
    
}

#pragma mark - OC调用JS
- (void)submitFromWithParams1:(NSString *)str1 params2:(NSString *)str2 params3:(NSString *)str3 {
    
    
    
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
