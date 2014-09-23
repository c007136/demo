//
//  XMViewController.m
//  http_upload
//
//  Created by jack on 14-7-21.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMViewController.h"
#import "AFHTTPClient.h"
#import "AFHTTPRequestOperation.h"


@interface XMViewController ()
{
    AFHTTPClient * _httpClient;
}

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, 100, 30)];
    [button setBackgroundColor:[UIColor blueColor]];
    [button addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    NSURL * url = [NSURL URLWithString:@"http://i.zhuanpaopao.com/api"];
    _httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
}

- (void)test
{
    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"http://itunes.apple.com/us/app/id%d", 425349261]];
    //NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%d", 425349261]];
    [[UIApplication sharedApplication] openURL:url];
    
    return;
    
    DoImagePickerController * picker = [[DoImagePickerController alloc] initWithNibName:@"DoImagePickerController" bundle:nil];
    picker.delegate = self;
    picker.nMaxCount = 2;
    picker.nColumnCount = 3;
    picker.nResultType = DO_PICKER_RESULT_UIIMAGE;
    [self presentViewController:picker animated:YES completion:nil];
    
    return;
}

-(void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"info : %@", info);
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    NSLog(@"info : %@", editingInfo);
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
}

- (void)buttonClick
{
    NSURLRequest * request = [_httpClient multipartFormRequestWithMethod:@"POST" path:nil parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        UIImage * image1 = [UIImage imageNamed:@"1.png"];
        NSData * data1 = UIImagePNGRepresentation(image1);
        NSString * name1 = [NSString stringWithFormat:@"1.png"];
        NSString * filename1 = [NSString stringWithFormat:@"10_10093_%d_20140822103001.png", 1];
        [formData appendPartWithFileData:data1 name:name1 fileName:filename1 mimeType:@"image/png"];
        
        UIImage * image2 = [UIImage imageNamed:@"2.png"];
        NSData * data2 = UIImagePNGRepresentation(image2);
        NSString * name2 = [NSString stringWithFormat:@"2.png"];
        NSString * filename2 = [NSString stringWithFormat:@"10_10093_%d_20140822103001.png", 2];
        [formData appendPartWithFileData:data2 name:name2 fileName:filename2 mimeType:@"image/png"];
        
    }];
    
    AFHTTPRequestOperation * op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"上传完成");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"上传失败");
    }];
    [_httpClient.operationQueue addOperation:op];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - DoImagePickerControllerDelegate
- (void)didCancelDoImagePickerController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didSelectPhotosFromDoImagePickerController:(DoImagePickerController *)picker result:(NSArray *)aSelected
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    NSURL * url = [NSURL URLWithString:@"http://i.zhuanpaopao.com/api/imobile/wechatpics"];
    AFHTTPClient * httpClient = [[AFHTTPClient alloc] initWithBaseURL:url];
    
    NSDictionary * dict = [NSDictionary dictionaryWithObjectsAndKeys:@"20:20:20:20:20", @"mac", @"0123456789", @"idfa", @"abcdefg", @"openudid", nil];
    
    NSURLRequest * request = [httpClient multipartFormRequestWithMethod:@"POST" path:nil parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        if (picker.nResultType == DO_PICKER_RESULT_UIIMAGE)
        {
            for (int i = 0; i < aSelected.count; i++)
            {
                UIImage * image = aSelected[i];
                NSData * data = UIImagePNGRepresentation(image);
                NSString * name = [NSString stringWithFormat:@"%d", i];
                NSString * filename = [NSString stringWithFormat:@"10_10093_%d_20140822103001.png", i];
                [formData appendPartWithFileData:data name:name fileName:filename mimeType:@"image/png"];
            }
        }
        
    }];
    
    AFHTTPRequestOperation * op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [op setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"上传完成");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"上传失败");
    }];
    [httpClient.operationQueue addOperation:op];
}

@end
