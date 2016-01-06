//
//  contentSize.m
//  Objective C Example
//
//  Created by Apple on 1/3/16.
//  Copyright (c) 2016 AMOSC. All rights reserved.
//

#import "contentSize.h"

@interface contentSize ()
@property (nonatomic, strong)UIScrollView* scrollview;

@end

@implementation contentSize{
    UIImageView *photo;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    photo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"people.jpg"]];
    
    self.scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(8, 8, self.view.bounds.size.width-16,
                                                                     photo.frame.size.height)];
    self.scrollview.contentSize = CGSizeMake(photo.frame.size.width, photo.frame.size.height);
    self.scrollview.backgroundColor = [UIColor grayColor];
    
    self.scrollview.bounces = true;
    
    self.scrollview.showsHorizontalScrollIndicator = true;
    self.scrollview.showsVerticalScrollIndicator = true;
    
    [self.scrollview addSubview:photo];
    [self.view  addSubview:self.scrollview];
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
