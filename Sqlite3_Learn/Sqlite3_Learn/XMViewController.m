//
//  XMViewController.m
//  Sqlite3_Learn
//
//  Created by jack on 14-8-19.
//  Copyright (c) 2014年 com.yuzhuangbao.xiaomi. All rights reserved.
//

#import "XMViewController.h"
#import <sqlite3.h>

@interface XMViewController ()
{
    sqlite3         * _database;
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
    
    _database = nil;
    
    //NSLog(@"sqlite_version : %s", sqlite3_libversion());
}

- (void)buttonClick
{
    [self openDataBase];
    [self createDataTable];
    [self insertDataTable];
    [self selectDataTable];
}

- (void)openDataBase
{
    NSArray * documentsPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * paths = [documentsPaths objectAtIndex:0];
    paths = [paths stringByAppendingString:@"/db.db"];
    
    if ( SQLITE_OK == sqlite3_open([paths UTF8String], &_database) ) {
        NSLog(@"open sqlite db ok");
    } else {
        NSLog(@"open sqlite db failed");
    }
}

- (void)createDataTable
{
    char * errorMsg = nil;
    const char * createSql = "create table if not exists persons (id integer primary key, name text)";
    if ( SQLITE_OK == sqlite3_exec(_database, createSql, NULL, NULL, &errorMsg) ) {
        NSLog(@"create table ok");
    } else {
        NSLog(@"create table failed");
    }
}

- (void)insertDataTable
{
    for ( int i = 0 ; i < 3; ++i) {
        char * update = "insert or replace into persons values (?,?)";
        
        sqlite3_stmt * statement;
        if ( SQLITE_OK == sqlite3_prepare_v2(_database, update, -1, &statement, NULL) ) {
            
            sqlite3_bind_int(statement, 1, 10+i);
            sqlite3_bind_text(statement, 2, "xiao mi", -1, NULL);
            
        }
        
        if ( sqlite3_step(statement) != SQLITE_DONE ) {
            NSLog(@"update db is not ok");
        }
        
        sqlite3_finalize(statement);
    }
    
    NSLog(@"update table ok");
}

- (void)selectDataTable
{
    sqlite3_stmt * statement;
    
    char * select = "select * from persons order by id";
    if ( SQLITE_OK == sqlite3_prepare_v2(_database, select, -1, &statement, NULL) ) {
        
        while ( SQLITE_ROW == sqlite3_step(statement) ) {
            int ID = sqlite3_column_int(statement, 1);
            const unsigned char * name = sqlite3_column_text(statement, 2);
            NSLog(@"ID %d, name %s", ID, name);
        }
        
    } else {
        NSLog(@"select table failed.");
    }
    sqlite3_finalize(statement);
}


@end
