//
//  contentSize2.m
//  Objective C Example
//
//  Created by Apple on 1/4/16.
//  Copyright (c) 2016 AMOSC. All rights reserved.
//

#import "contentSize2.h"

@interface contentSize2 () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollview;

@end

@implementation contentSize2{
    UIImageView *photo;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    // Do any additional setup after loading the view.
    photo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"cat.png"]];
    //photo.frame = CGRectMake(0, 0, 200, 200);
    
    self.scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,
                                                                    photo.frame.size.width,
                                                                    photo.frame.size.height)];
       self.scrollview.backgroundColor = [UIColor grayColor];
    self.scrollview.contentSize = CGSizeMake(self.scrollview.frame.size.width, self.scrollview.frame.size.height);
    
   //  self.scrollview.contentOffset = CGPointMake(-100, -100);
    self.scrollview.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);
    
    self.scrollview.maximumZoomScale = 5;
    self.scrollview.minimumZoomScale = 0.2;
    self.scrollview.delegate = self;
    self.scrollview.zoomScale = 1;
    
    self.scrollview.clipsToBounds = true;
    
    self.scrollview.showsVerticalScrollIndicator = true;
    self.scrollview.showsHorizontalScrollIndicator = true;
    
    
    
    [self.scrollview addSubview:photo];
    [self.view addSubview:self.scrollview];
}
- (UIView*) viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return photo;
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
