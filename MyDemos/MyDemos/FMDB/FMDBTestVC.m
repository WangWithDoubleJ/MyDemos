//
//  FMDBTestVC.m
//  MyDemos
//
//  Created by 平安科技 on 17/5/2.
//  Copyright © 2017年 wangjianjune. All rights reserved.
//

#import "FMDBTestVC.h"
#import <FMDatabase.h>
@interface FMDBTestVC ()
@property (nonatomic, strong) NSMutableArray *datas;///<数据字典
@property (nonatomic, strong) FMDatabase *db;///<数据库对象
@end

@implementation FMDBTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initDatas];
    
//    [self createDatabaseAndAddDatas];
    [self dapiliang_createDatabaseAndAddDatas];
    
    [self getDatasFromDataBaseWithTableName:@"stu"];

}


/**
 初始化数据
 */
- (void)initDatas{
    
    
    //初始化数据100条
    NSMutableArray *datas = [NSMutableArray array];
    self.datas = datas;
    
    for (NSInteger i = 0; i<500; i++) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict setObject:[NSString stringWithFormat:@"wang%03ld",i] forKey:@"name"];
        NSNumber *num = [NSNumber numberWithInteger:i];
        [dict setObject:num forKey:@"age"];
        if (i%2==0) {
            [dict setObject:@"男" forKey:@"gender"];
        }else{
            [dict setObject:@"女" forKey:@"gender"];
        }
        [self.datas addObject:dict];
    }
}

// ******************************************************** 华丽的分割线  ********************************************************//
- (void)createDatabaseAndAddDatas{
    
    
    
    //1.指定沙河路径
    NSString *path =  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *dbPath = [path stringByAppendingPathComponent:@"test1.db"];
    
    //2.获取数据库
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    self.db = db;
    //3.打开数据库
    if ([self.db open]) {
        
        //如果数据库存在表stu，则删除该表
        [self.db executeQuery:@"DROP TABLE if exists stu"];
        
      //4.建表
      BOOL isSucsses = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS stu(ID integer PRIMARY KEY AUTOINCREMENT,name text NOT NULL,age integer NOT NULL,gender char(2) default '男' check(gender in ('男','女')))"];
        if (isSucsses) {
            NSLog(@"建表成功");
            NSDate *startTime = [NSDate date];
            
            //插入数据
            [self insertData];
            
            NSDate *endTime = [NSDate date];
            NSTimeInterval a = [endTime timeIntervalSince1970] - [startTime timeIntervalSince1970];
            NSLog(@"没有使用事务插入500条数据用时%.3f毫秒",a);
            
            
        }else{
            NSLog(@"建表失败");
        }
    }
}

/**
 插入数据
 */
- (void)insertData{
    
    for (NSDictionary *dic in self.datas) {
        
        BOOL isCG = [self.db executeUpdate:@"INSERT INTO stu(name,age,gender) VALUES (?,?,?)",[dic objectForKey:@"name"],[dic objectForKey:@"age"],[dic objectForKey:@"gender"]];
        NSLog(@"%d ,@{name:%@,age:%@,gender:%@}",isCG,[dic objectForKey:@"name"],[dic objectForKey:@"age"],[dic objectForKey:@"gender"]);
    }
    [self.db close];
}

// ******************************************************** 华丽的分割线  ********************************************************//

- (void)dapiliang_createDatabaseAndAddDatas{
    
    //1.指定沙河路径
    NSString *path =  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *dbPath = [path stringByAppendingPathComponent:@"test2.db"];
    
    //2.获取数据库
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    
    
    BOOL isRollBack = NO;
    
    self.db = db;

    //3.打开数据库
    if ([self.db open]) {
        
        //如果数据库存在表stu，则删除该表
        [self.db executeQuery:@"DROP TABLE if exists stu"];
        
        BOOL isSucsses = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS stu(ID integer PRIMARY KEY AUTOINCREMENT,name text NOT NULL,age integer NOT NULL,gender char(2) default '男' check(gender in ('男','女')))"];
        
        if (isSucsses) {
            NSLog(@"建表成功");
            NSDate *startTime = [NSDate date];
            
            [db beginTransaction];

            @try {
                
                [self dapiliang_insertDatas];
                NSDate *endTime = [NSDate date];
                NSTimeInterval a = [endTime timeIntervalSince1970] - [startTime timeIntervalSince1970];
                NSLog(@"使用事务插入500条数据用时%.3f毫秒",a);
                
            } @catch (NSException *exception) {
                
                isRollBack = YES;
                [self.db rollback];
                
            } @finally {
                
                if (!isRollBack) {
                    [self.db commit];
                }
            }
            
        }else{
            NSLog(@"建表失败");
        }
    }
}



/**
 大批量插入数据
 */
- (void)dapiliang_insertDatas{
    
    [self insertData];
    
}
// ******************************************************** 华丽的分割线  ********************************************************//


/**
 获取数据
 */
- (void)getDatasFromDataBaseWithTableName:(NSString *)tableName{
    
    if ([self.db open]) {
        
        NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@",tableName];
        FMResultSet *result= [self.db executeQuery:sql];
        while ([result next]) {
            int ID = [result intForColumn:@"ID"];
            NSString *name = [result stringForColumn:@"name"];
            int age = [result intForColumn:@"age"];
            NSString *gender = [result stringForColumn:@"gender"];
            NSLog(@">>>>>>>>>>>>>>>>>>>>>>>> ID = %d,name = %@,age = %d,gender = %@",ID,name,age,gender);
        }
        [self.db close];
    }
}

- (void)dealloc{
    
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
