//
//  XMViewController.m
//  FMDB_Learn
//
//  Created by jack on 14-8-20.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMViewController.h"
#import "FMDatabase.h"
#import "FMDatabaseQueue.h"

@interface XMViewController ()
{
    FMDatabase           * _database;
}

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 40)];
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton * button2 = [[UIButton alloc] initWithFrame:CGRectMake(170, 50, 100, 40)];
    button2.backgroundColor = [UIColor orangeColor];
    [button2 addTarget:self action:@selector(button2Click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
}

- (void)buttonClick
{
    [self openDataBase];
}

- (void)button2Click
{
    [NSThread detachNewThreadSelector:@selector(threadFun) toTarget:self withObject:nil];
}

- (void)threadFun
{
    NSArray * documentsPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * paths = [documentsPaths objectAtIndex:0];
    paths = [paths stringByAppendingString:@"/db.db"];
    
    FMDatabaseQueue * queue = [FMDatabaseQueue databaseQueueWithPath:paths];
    [queue inDatabase:^(FMDatabase *db) {
        
        for ( int i = 100; i < 130; ++i) {
            NSString * idText = [NSString stringWithFormat:@"%d", i];
            BOOL result = [_database executeUpdate:@"insert into persons values (?, ?)", idText, @"xiaomi"];
            if ( !result ) {
                NSLog(@"insert table failed %d", i);
            }
        }
        
    }];
    [queue close];
    
    NSLog(@"thread end.");
}

- (void)openDataBase
{
    NSArray * documentsPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * paths = [documentsPaths objectAtIndex:0];
    paths = [paths stringByAppendingString:@"/db.db"];
    
    _database = [FMDatabase databaseWithPath:paths];
    if ( ![_database open] ) {
        NSLog(@"open db failed");
    }
    
//    BOOL result = [_database executeUpdate:@"create table if not exists persons (id integer, name text)"];
//    if ( !result ) {
//        NSLog(@"create table failed");
//    }
//    
//    for ( int i = 0; i < 3; ++i) {
//        NSString * idText = [NSString stringWithFormat:@"%d", i];
//        result = [_database executeUpdate:@"insert into persons values (?, ?)", idText, @"xiaomi"];
//        if ( !result ) {
//            NSLog(@"insert table failed %d", i);
//        }
//    }
//    
//    FMResultSet * set = [_database executeQuery:@"select * from persons where name = 'xiaomi'"];
//    while ( [set next] ) {
//        NSInteger ID = [set intForColumn:@"id"];
//        NSString * name = [set stringForColumn:@"name"];
//        NSLog(@"ID = %d, name = %@", ID, name);
//    }
}

@end
