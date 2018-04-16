//
//  GollyViewController.m
//  golly_Runtime
//
//  Created by 孙国立 on 2018/4/16.
//  Copyright © 2018年 孙国立. All rights reserved.
//

#import "GollyViewController.h"
#import "GollyMessageForwarding.h"
@interface GollyViewController ()

@end

@implementation GollyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    GollyMessageForwarding *gollyMessage = [[GollyMessageForwarding alloc]init];
    /*
     1.oc语言是一门动态语言
     2.实际的调用方法是：objc_msgSend(receiver, selector)
     3.调用方法会根据SEL的映射表 查找其类和父类。如果没有找到该方法则会提示方法没有找到，如果想解决这个报错问题可以使用Runtime将方法进行动态实现  动态实现的方法放在GollyMessageForwording里面
     4.在没有实现对应方法的时候 会提示这个错误
     ===>-[GollyMessageForwarding gollyRun]: unrecognized selector sent to instance 0x60400000818
     */
    [gollyMessage gollyRun];
    // Do any additional setup after loading the view.
}



@end
