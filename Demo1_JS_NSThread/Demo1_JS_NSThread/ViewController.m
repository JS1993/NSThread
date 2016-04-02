//
//  ViewController.m
//  Demo1_JS_NSThread
//
//  Created by  江苏 on 16/3/17.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    //不要把耗时操作，比如网络请求，线程睡眠代码，加载文件，大量运算放到主线程
    //不要把修改页面的代码放在子线程，不会得到及时更新
    [super viewDidLoad];
    
}
- (IBAction)myButton:(UIButton *)sender {
    //开辟一个子线程用来处理某些事
    [NSThread detachNewThreadSelector:@selector(addView) toTarget:self withObject:nil];
}
-(void)addView{
    for (int i=0; i<5; i++) {
    UIView* view=[[UIView alloc]initWithFrame:CGRectMake(100, 40*i, 100, 30)];
    view.backgroundColor=[UIColor redColor];
    //让主线程睡眠
    [NSThread sleepForTimeInterval:2];
    //回到主线程更新界面
    [self performSelectorOnMainThread:@selector(showView:) withObject:view waitUntilDone:NO];
    }
}
-(void)showView:(UIView*)view{
    [self.view addSubview:view];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
