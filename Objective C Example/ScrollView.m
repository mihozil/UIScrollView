//
//  ScrollView.m
//  Objective C Example
//
//  Created by Apple on 1/3/16.
//  Copyright (c) 2016 AMOSC. All rights reserved.
//

#import "ScrollView.h"

@interface ScrollView () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollview;

@end

@implementation ScrollView{
    UIImageView *photo;
    UIToolbar *toolbar;
    UISlider *slider;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    toolbar = [UIToolbar new];
    [toolbar sizeToFit];
    
    slider = [[UISlider alloc]initWithFrame:CGRectMake(8,0,
                                                       self.view.bounds.size.width-16, 40)];
    
    
    slider.minimumValue = 0.2;
    slider.maximumValue = 4;
    slider.value = 0.2;
    
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithCustomView:slider];
    toolbar.items = @[button];
    toolbar.frame = CGRectMake(0, self.view.bounds.size.height - toolbar.frame.size.height
                               , toolbar.frame.size.width, toolbar.frame.size.height);
    
    [self.view addSubview:toolbar];
    [slider addTarget:self action:@selector(onsliderchange:) forControlEvents:UIControlEventValueChanged];
    
    photo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"milkway.jpg"]];
    
    CGRect scrollRect = CGRectMake(0, 0, self.view.bounds.size.width,
                                    self.view.bounds.size.height- toolbar.frame.size.height);
    
    self.scrollview = [[UIScrollView alloc]initWithFrame:scrollRect];
    self.scrollview.delegate = self;
    self.scrollview.minimumZoomScale = slider.minimumValue;
    self.scrollview.maximumZoomScale = slider.maximumValue;
    self.scrollview.zoomScale = slider.value;
    [self.scrollview addSubview:photo];
    [self.view addSubview:self.scrollview];
    
}

- (UIView*) viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return photo;
}
- (void) onsliderchange:(UISlider*) sender{
    [self.scrollview setZoomScale:sender.value animated:true];
}


- (void) scrollViewDidZoom:(UIScrollView *)scrollView{
    slider.value = self.scrollview.zoomScale;
    
    NSString *st = [NSString stringWithFormat:@"%2.2f",scrollView.zoomScale];
    [self zoomingfigure:st];
    
}
- (void) zoomingfigure: (NSString*) st{
    UIBarButtonItem *button = [[UIBarButtonItem alloc]initWithTitle:st style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = button;
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
