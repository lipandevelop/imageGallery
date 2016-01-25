//
//  ViewController.m
//  ScrollViewImageGallery
//
//  Created by Li Pan on 2016-01-25.
//  Copyright © 2016 Li Pan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView1;
@property (nonatomic, strong) UIImageView *imageView2;
@property (nonatomic, strong) UIImageView *imageView3;
@property (nonatomic, strong) UIView *allImages;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 150, CGRectGetWidth(self.view.frame), 400)];
    
    self.allImages = [[UIView alloc]init];
    [self.allImages setFrame:CGRectMake(0,0,CGRectGetWidth(self.imageView1.frame), CGRectGetHeight(self.imageView1.frame) + CGRectGetHeight(self.imageView2.frame) + CGRectGetHeight(self.imageView3.frame))];
    
    self.imageView1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Lighthouse-in-Field.jpg"]];
    self.imageView2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Lighthouse-night.jpg"]];
    self.imageView3 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Lighthouse.jpg"]];

    [self.imageView2 setFrame:CGRectMake(CGRectGetWidth(self.imageView1.frame), 0, CGRectGetWidth(self.imageView2.frame), CGRectGetHeight(self.imageView2.frame))];
    
    [self.imageView3 setFrame:CGRectMake(CGRectGetWidth(self.imageView1.frame) + CGRectGetWidth(self.imageView2.frame), 0, CGRectGetWidth(self.imageView3.frame), CGRectGetHeight(self.imageView3.frame))];
    self.scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.imageView1.frame) + CGRectGetWidth(self.imageView2.frame) + CGRectGetWidth(self.imageView3.frame), CGRectGetHeight(self.imageView3.frame) );
    
    self.scrollView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.imageView1];
    [self.scrollView addSubview:self.imageView2];
    [self.scrollView addSubview:self.imageView3];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    self.scrollView.clipsToBounds = YES;
    self.scrollView.bounces = NO;
    self.scrollView.pagingEnabled = YES;

    
    self.scrollView.delegate = self;
    
    self.scrollView.maximumZoomScale = 2;
    self.scrollView.minimumZoomScale = 1;
    
    [self.scrollView.widthAnchor constraintEqualToAnchor:self.view.widthAnchor multiplier:1];
    [self.scrollView.heightAnchor constraintEqualToAnchor:self.view.heightAnchor multiplier:1];
    

//    NSArray *arrayOfPictures = @[self.imageView1 ,self.imageView2, self.imageView3];    
//    CGFloat xPosition;
//    for (UIImageView *pictures in arrayOfPictures) {
//        UIImageView *window = [[UIImageView alloc] initWithFrame:CGRectMake(xPosition, 0, CGRectGetWidth(self.scrollView.frame), CGRectGetHeight(self.scrollView.frame))];
//        pictures.image = self.allImages.image;
//        [self.view addSubview:window];
//        
//        
//    }
}

    

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)viewForZoomingInScrollView: (UIScrollView *)scrollView {
    return self.imageView1;
}

@end
