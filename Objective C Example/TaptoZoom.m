//
//  TaptoZoom.m
//  Objective C Example
//
//  Created by Apple on 1/4/16.
//  Copyright (c) 2016 AMOSC. All rights reserved.
//

#import "TaptoZoom.h"

@interface TaptoZoom ()<UIScrollViewDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIScrollView *scrollview;

@end

@implementation TaptoZoom{
    UIImageView *photo;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.view.backgroundColor = [UIColor blackColor];
    
    photo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"model.jpg"]];
    
    self.scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,
                                                                     self.view.bounds.size.height)];
    self.scrollview.backgroundColor = [UIColor grayColor];
    self.scrollview.minimumZoomScale = 0.1;
    self.scrollview.maximumZoomScale = 10;
    self.scrollview.delegate = self;
    self.scrollview.zoomScale = 0.2;
  //    NSLog(@"%f %f",self.scrollview.bounds.size.width, self.scrollview.bounds.size.height);
    
    photo.userInteractionEnabled = YES;
    photo.multipleTouchEnabled = YES;
    
    UITapGestureRecognizer *singletap=  [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                               action:@selector(onTap:)];;
    singletap.numberOfTapsRequired = 1;
    singletap.delegate = self;
    [photo addGestureRecognizer:singletap];
    
    UITapGestureRecognizer *doubletap = [[UITapGestureRecognizer alloc]initWithTarget:self
                                                                            action:@selector(ondoubletap:)];
    doubletap.numberOfTapsRequired = 2;
    doubletap.delegate = self;
    [photo addGestureRecognizer:doubletap];
    
   
    
    
    [self.scrollview addSubview:photo];
    [self.view addSubview:self.scrollview];
     [singletap requireGestureRecognizerToFail:doubletap];
    
}
- (void) onTap:(UITapGestureRecognizer*) tap{
    CGPoint tappoint = [tap locationInView:photo];
    float zoomingscale = self.scrollview.zoomScale*1.5;
    
    CGSize newframe = CGSizeMake(self.view.bounds.size.width/zoomingscale,
                                 self.view.bounds.size.height/zoomingscale);
    CGRect newrect = CGRectMake(tappoint.x - newframe.width/2, tappoint.y - newframe.height/2,
                                newframe.width, newframe.height);
    //NSLog(@"%f %f %f %f",newrect.origin.x,newrect.origin.y, newrect.size.width, newrect.size.height);
  
    [self.scrollview zoomToRect:newrect animated:YES];
    
}

- (void) ondoubletap:(UITapGestureRecognizer*) tap{
    CGPoint tappoint = [tap locationInView:photo];
    float zoomingscale = self.scrollview.zoomScale/1.5;
    
    CGSize newframe = CGSizeMake(self.view.bounds.size.width/zoomingscale,
                                 self.view.bounds.size.height/zoomingscale);
    CGRect newrect = CGRectMake(tappoint.x - newframe.width/2,
                                tappoint.y - newframe.height/2,
                                newframe.width, newframe.height);
    [self.scrollview zoomToRect:newrect animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
  
                       
}

- (UIView*) viewForZoomingInScrollView:(UIScrollView *)scrollView{
      return photo;
}
- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    [self zoomFigure:self.scrollview.zoomScale];
}

- (void) zoomFigure:(CGFloat)zoomscale{
    NSString *st = [NSString stringWithFormat:@"%2.2f",zoomscale];
    UIBarButtonItem *button = [[UIBarButtonItem alloc]initWithTitle:st style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = button;
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
