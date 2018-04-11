//
//  ViewController.m
//  ProcessFormDemo
//
//  Created by weihao on 2018/2/25.
//  Copyright © 2018年 weihao. All rights reserved.
//

#import "ViewController.h"
#import "ProcessModel.h"

#import "FromTableView.h"

#import "CWHFormMainView.h"

@interface ViewController ()

@property (nonatomic ,strong)FromTableView *formTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//       [self analysisLocalJson];
    
//    [self createFormList];
    [self createCWHFormList];
}

- (void)createFormList {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"processJson" ofType:@"json"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    NSString *jsonStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    ProcessModel *model = [ProcessModel yy_modelWithJSON:jsonStr];
    
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"json" ofType:@"json"];
    NSData *date1 = [[NSData alloc] initWithContentsOfFile:path1];
    NSString *jsonStr1 = [[NSString alloc] initWithData:date1 encoding:NSUTF8StringEncoding];

    _formTableView = [[FromTableView alloc] initWithFrame:self.view.bounds Json:jsonStr1 dic:dic];
    
    [self.view addSubview:_formTableView];
    
}

- (void)createCWHFormList {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"processJson" ofType:@"json"];
    NSData *data = [[NSData alloc] initWithContentsOfFile:path];
    NSString *jsonStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    ProcessModel *model = [ProcessModel yy_modelWithJSON:jsonStr];
    
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"demo" ofType:@"json"];
    NSData *date1 = [[NSData alloc] initWithContentsOfFile:path1];
    NSString *jsonStr1 = [[NSString alloc] initWithData:date1 encoding:NSUTF8StringEncoding];
    
//    _formTableView = [[FromTableView alloc] initWithFrame:self.view.bounds Json:jsonStr1 dic:dic];
//
//    [self.view addSubview:_formTableView];
    CWHFormMainView *mainVeiw = [[CWHFormMainView alloc] initWithFrame:self.view.bounds Json:jsonStr1 resourceModel:dic];
    [self.view addSubview:mainVeiw];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
