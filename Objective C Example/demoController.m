//
//  demoController.m
//  Objective C Example
//
//  Created by Apple on 12/25/15.
//  Copyright (c) 2015 AMOSC. All rights reserved.
//

#import "demoController.h"

@interface demoController ()
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation demoController
{
    NSTimer *timer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    // hide slider
    [self performSelector:@selector(hideSlider) withObject:nil afterDelay:5];
    
    // withObject
    [self performSelectorOnMainThread:@selector(processdata:) withObject:@{@"apple":@"tao",@"banana":@"chuoi"} waitUntilDone:true];
    
}


- (void) processdata: (NSDictionary*)data{
    NSDictionary *key;
    for (key in data){
        NSLog(@"%@ - %@",key, [data valueForKey:key]);
        
    }
}
- (IBAction)threadAction:(id)sender {
    [self performSelectorOnMainThread:@selector(doThreadAction) withObject:nil waitUntilDone:true];
   
}

- (void) hideSlider{
    self.slider.hidden = true;
}
- (void) doThreadAction {
    [NSThread sleepForTimeInterval:2];
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
