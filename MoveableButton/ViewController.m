//
//  ViewController.m
//  MoveableButton
//
//  Created by 楊利嘉 on 2016/9/22.
//  Copyright © 2016年 楊利嘉. All rights reserved.
//

#import "ViewController.h"

#import "CHMoveButton.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CHMoveButton *button = [[CHMoveButton alloc]initWithFrame:CGRectMake(30, 100, 100, 100)];
    
    button.backgroundColor = [UIColor grayColor];
    [self.view addSubview:button];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
