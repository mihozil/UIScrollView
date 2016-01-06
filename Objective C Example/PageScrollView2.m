//
//  PageScrollView2.m
//  Objective C Example
//
//  Created by Apple on 1/5/16.
//  Copyright (c) 2016 AMOSC. All rights reserved.
//

#import "PageScrollView2.h"
#define photowidth 320
#define photoheight 480


@interface PageScrollView2 ()<UIScrollViewDelegate, UIGestureRecognizerDelegate>

@end

@implementation PageScrollView2{
    UIScrollView *mainscrollview;
    UIPageControl *pagecontrol;
    NSMutableArray *scrollview;
    NSMutableArray *photoarray;
    UITapGestureRecognizer *singletap;
    UITapGestureRecognizer *doubletap;
}
- (void) initproject{
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    scrollview = [[NSMutableArray alloc]initWithCapacity:6];
    photoarray = [[NSMutableArray alloc]initWithCapacity:6];

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initproject];
    [self mainscrollviewCreating];
    [self scrollviewCreating];
    [self pagecontrolCreating];
    [self taptoZoom];
    
    
}
- (void) scrollViewDidZoom:(UIScrollView *)scrollView{
    NSString *st = [NSString stringWithFormat:@"%2.2f",scrollView.zoomScale];
    UIBarButtonItem *button = [[UIBarButtonItem alloc]initWithTitle:st style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = button;
}

- (void) ondoubleTap:(UIGestureRecognizer*) tap{
    int index = (int) pagecontrol.currentPage;
    UIScrollView *currentscrollview = scrollview[index];
    UIImageView *photo = photoarray[index];
    
    float zoomingscale = currentscrollview.zoomScale/1.5;
    CGPoint tappoint = [tap locationInView:photo];
    CGSize newsize = CGSizeMake(currentscrollview.frame.size.width/zoomingscale, currentscrollview.frame.size.height/zoomingscale);
    CGRect newrect = CGRectMake(tappoint.x - newsize.width/2, tappoint.y- newsize.height/2,
                                newsize.width, newsize.height);
    
    [currentscrollview zoomToRect:newrect animated:YES];

    
}
- (void) pagecontrolCreating{
    pagecontrol = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height-64-40, self.view.bounds.size.width, 40)];
    pagecontrol.numberOfPages = 6;
    [pagecontrol addTarget:self action:@selector(onPagechange) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:pagecontrol];
}

- (void) onPagechange{
    mainscrollview.contentOffset = CGPointMake(pagecontrol.currentPage*photowidth, 0);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    pagecontrol.currentPage = mainscrollview.contentOffset.x / photowidth;
//    NSLog(@"ScrollView did Scroll");
}

- (void) taptoZoom{
    for (int index =0; index<6; index++){
        
        UIImageView *photo  = photoarray[index];
        
        photo.userInteractionEnabled = YES;
        photo.multipleTouchEnabled = YES;
        singletap = [[UITapGestureRecognizer alloc]initWithTarget:self
                     
                                                        action:@selector(onTap:)];
        singletap.numberOfTapsRequired = 1;
        singletap.delegate= self;
        [photo addGestureRecognizer:singletap];
        
        
        doubletap = [[UITapGestureRecognizer alloc]initWithTarget:self
                                            action:@selector(ondoubleTap:)];
        doubletap.numberOfTapsRequired = 2;
        doubletap.delegate= self;
        
        [photo addGestureRecognizer:doubletap];
        
        [singletap requireGestureRecognizerToFail:doubletap];

     //   NSLog(@"%d",index);
        
    }
}
- (void) onTap:(UITapGestureRecognizer*) tap  {
    NSInteger index= pagecontrol.currentPage;

    UIScrollView *currentscrollview = scrollview[index];
    UIImageView *photo = photoarray[index];
    
    float zoomingscale = currentscrollview.zoomScale*1.5;
    
    
    CGPoint tappoint = [tap locationInView:photo];
    CGSize newsize = CGSizeMake(currentscrollview.frame.size.width/zoomingscale, currentscrollview.frame.size.height/zoomingscale);
    CGRect newrect = CGRectMake(tappoint.x - newsize.width/2, tappoint.y- newsize.height/2,
                                newsize.width, newsize.height);
    
    [currentscrollview zoomToRect:newrect animated:YES];
    
}

- (void) mainscrollviewCreating{
     mainscrollview = [[UIScrollView alloc]initWithFrame:CGRectMake((self.view.bounds.size.width-photowidth)/2, 0, photowidth, photoheight)];
    mainscrollview.contentSize = CGSizeMake(photowidth*6, photoheight);
    mainscrollview.delegate = self;
    mainscrollview.pagingEnabled = YES;
}
- (void) scrollviewCreating{
    for (int i=0;i<6;i++){
        UIScrollView *newscrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(i*photowidth, 0, photowidth, photoheight)];
        
        UIImageView *newphoto = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, photowidth, photoheight)];

                                                                             
        newphoto.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i+1]];
        [photoarray addObject:newphoto];

        [newscrollview addSubview:newphoto];
        
        //zoominout
        newscrollview.delegate = self;
        newscrollview.maximumZoomScale = 4;
        newscrollview.minimumZoomScale = 1;
        newscrollview.zoomScale = 1;
        
        [mainscrollview addSubview:newscrollview];
        [scrollview addObject:newscrollview];
    }
    [self.view addSubview:mainscrollview];
    
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return scrollView.subviews[0];
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
