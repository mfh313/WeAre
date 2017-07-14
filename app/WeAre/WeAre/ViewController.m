//
//  ViewController.m
//  WeAre
//
//  Created by mafanghua on 2017/6/28.
//  Copyright © 2017年 mafanghua. All rights reserved.
//

#import "ViewController.h"


#define PATH_OF_DOCUMENT    [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

@interface ViewController ()
{
    FMDatabase *_db;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *dbPath = [PATH_OF_DOCUMENT stringByAppendingPathComponent:@"student.sqlite"];
    
    _db = [FMDatabase databaseWithPath:dbPath];
    
    [_db open];
}

- (IBAction)onClickCreateTable:(id)sender {
    if ([_db open]) {
        NSString *createSql = @"CREATE TABLE IF NOT EXISTS t_student (id integer PRIMARY KEY AUTOINCREMENT,name text NOT NULL ,age integer NOT NULL)";
        if ([_db executeUpdate:createSql]) {
            NSLog(@"创建表成功");
        }
    }
}

- (IBAction)onClickInsert:(id)sender {
    int age = 42;
    NSString *name = @"mafanghua";
    NSString *insertSql = @"INSERT INTO t_student (name,age) VALUES (?,?);";
    
    if ([_db open])
    {
        if ([_db executeUpdate:insertSql,name,@(age)]) {
            NSLog(@"插入成功");
        }
    }
}

- (IBAction)onClickUpdateDB:(id)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
