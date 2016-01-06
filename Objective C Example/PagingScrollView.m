//
//  PagingScrollView.m
//  Objective C Example
//
//  Created by Apple on 1/4/16.
//  Copyright (c) 2016 AMOSC. All rights reserved.
//

#import "PagingScrollView.h"
#define photowidth 320
#define photoheight 480

@interface PagingScrollView ()<UIScrollViewDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIScrollView *scrollview;
@property (nonatomic, strong) UIPageControl *pagecontrol;

@end

@implementation PagingScrollView{
    int index;
    NSMutableArray *photo;
}

- (void) initproject{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor lightGrayColor];
    index = 0;
    photo = [[NSMutableArray alloc]initWithCapacity:6];
    
    //currentphoto = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.bounds.size.width-photowidth)/2, 0, photowidth, photoheight)];
}

- (void)viewDidLoad {
    [super viewDidLoad];
   // Do any additional setup after loading the view.
    [self initproject];
    [self scrollviewCreating];
    [self toolbarCreating];
    
    
}
- (void) scrollViewDidScroll:(UIScrollView *)scrollView{
    self.pagecontrol.currentPage = self.scrollview.contentOffset.x / photowidth;
    index = (int)self.pagecontrol.currentPage;
}


- (void) scrollviewCreating{
    self.scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake((self.view.bounds.size.width - photowidth)/2, 0, photowidth, photoheight)];
    self.scrollview.backgroundColor = [UIColor grayColor];
    self.scrollview.contentSize = CGSizeMake(photowidth*6, photoheight);
    self.scrollview.delegate = self;
    self.scrollview.pagingEnabled = YES;
    
    for (int i =1; i<=6; i++){
        
        UIImageView *newphoto = [[UIImageView alloc]initWithFrame:CGRectMake((i-1)*photowidth, 0, photowidth, photoheight)];
        newphoto.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i]];
        [self.scrollview addSubview:newphoto];
        [photo addObject:newphoto];
        
    }
    
    
    [self.view addSubview:self.scrollview];
                       
    
}
- (void) toolbarCreating{
    self.pagecontrol = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height-64-40,
                                                                      self.view.bounds.size.width, 40)];
    self.pagecontrol.numberOfPages = 6;
    [self.pagecontrol addTarget:self action:@selector(onPagechange:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:self.pagecontrol];

    
}
- (void) onPagechange:(id) sender{
    // change the image after change the page bar
    self.scrollview.contentOffset = CGPointMake(self.pagecontrol.currentPage * photowidth, 0);
    
    index = (int) self.pagecontrol.currentPage ;

    
}

- (void) viewDidDisappear:(BOOL)animated{
    self.scrollview.delegate = nil;
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
