//
//  ViewController.m
//  XSXSTriangleView
//
//  Created by mac on 2019/12/18.
//  Copyright © 2019 mac. All rights reserved.
//

#import "ViewController.h"
#import "XSTriangleView.h"

@interface ViewController ()
@property (strong, nonatomic) XSTriangleView *triangle;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    [self addXSTriangleView];
    
}

- (void)addXSTriangleView{
    self.triangle = [[XSTriangleView alloc] initWithColor:[UIColor blueColor] style:XSTriangleViewTop];
    
    [self.view addSubview:_triangle];
    
    //mas_make
    _triangle.frame =  CGRectMake(100, 100, 50, 50);
}
@end
