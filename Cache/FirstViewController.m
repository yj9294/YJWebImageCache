//
//  FirstViewController.m
//  Cache
//
//  Created by cptech on 2017/3/21.
//  Copyright © 2017年 cptech. All rights reserved.
//

#import "FirstViewController.h"
#import "UIImageView+webCache.h"
@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self loadImage];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)loadImage
{
    //测试url
    [self.imageView setImageWithURL:[NSURL URLWithString:@"http://img.zcool.cn/community/0117e2571b8b246ac72538120dd8a4.jpg@1280w_1l_2o_100sh.jpg"]];
    [self.imageView2 setImageWithURL:[NSURL URLWithString:@"http://pic2.52pk.com/files/160216/5329500_160443_1.png"]];
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
