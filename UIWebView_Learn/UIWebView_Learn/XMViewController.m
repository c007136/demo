//
//  XMViewController.m
//  UIWebView_Learn
//
//  Created by jack on 14-8-18.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMViewController.h"

@interface XMViewController () <UIWebViewDelegate>
{
    UIWebView          * _webView;
}

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    NSURLRequest * requst = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://wap.huanqiu.com/viewTouTiao.html?newId=5177881&f=jrtt"]];
    [_webView loadRequest:requst];
    _webView.delegate = self;
    
//    NSString * path = [[NSBundle mainBundle] pathForResource:@"html" ofType:@"txt"];
//    NSString * html = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
//    [_webView loadHTMLString:html baseURL:[[NSBundle mainBundle] bundleURL]];
    
    [self.view addSubview:_webView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSString * output = [webView stringByEvaluatingJavaScriptFromString:@"document.body.scrollHeight"];
    NSLog(@"output height : %@", output);
    
    CGFloat height = 0;
    if ( webView.subviews.count > 0 ) {
        UIView * scrollView = [webView.subviews objectAtIndex:0];
        if ( scrollView.subviews.count > 0 ) {
            UIView * webDocView = scrollView.subviews.lastObject;
            if ( [webDocView isKindOfClass:[NSClassFromString(@"UIWebDocumentView") class]] ) {
                height = webDocView.frame.size.height;
            }
        }
    }
    
    NSLog(@"height : %lf", height);
}

@end
