//
//  demoFunction.m
//  Objective C Example
//
//  Created by Apple on 12/24/15.
//  Copyright (c) 2015 AMOSC. All rights reserved.
//

#import "demoFunction.h"

@interface demoFunction ()

@end

@implementation demoFunction

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"Mihozil");
    [self write:@"Minh Tuan Nguyen"];
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
