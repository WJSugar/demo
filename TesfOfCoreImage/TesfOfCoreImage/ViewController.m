//
//  ViewController.m
//  TesfOfCoreImage
//
//  Created by jinghua on 16/10/27.
//  Copyright © 2016年 Sugar. All rights reserved.
//

#import "ViewController.h"
#define kFix_Image(image) fixImageWidth(image, 320.f)
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CIImage *ciImage = [[CIImage alloc] initWithImage:[UIImage imageNamed:@"image.jpg"]];
    CIFilter *filter = [CIFilter filterWithName:@"CIColorCubeWithColorSpace" keysAndValues:kCIInputImageKey, ciImage, nil];
    [filter setDefaults];
    
    CIContext *context = [CIContext context];
    CIImage *outputImage = [filter outputImage];
    CGImageRef cgImage = [context createCGImage:outputImage fromRect:[outputImage extent]];
    UIImage *showImage = [UIImage imageWithCGImage:cgImage];
    CGImageRelease(cgImage);
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:kFix_Image(showImage)];
    [self.view addSubview:imageView];
    
}

UIImage *fixImageWidth(UIImage *image, CGFloat width) {
    float newHeight = image.size.height * (width / image.size.width);
    CGSize size = CGSizeMake(width, newHeight);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeCopy);
    CGContextDrawImage(context, CGRectMake(0.0, 0.0, size.width, size.height), image.CGImage);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
