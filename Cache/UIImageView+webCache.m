//
//  UIImageView+webCache.m
//  Cache
//
//  Created by cptech on 2017/3/21.
//  Copyright © 2017年 cptech. All rights reserved.
//

#import "UIImageView+webCache.h"
#import "YJCache.h"
@implementation UIImageView (webCache)


- (void)setImageWithURL:(NSURL *)url
{
    YJCache *cache = (YJCache *)[[self class] shareCacheImage];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    UIImage *existImage = [cache cachedImageForRequest:request];
    if(existImage){
        self.image = existImage;
        return;
    }
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        UIImage *imageData = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:url]];
        if(imageData)
        {
            [cache cacheImage:imageData forRequest:request];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = [cache cachedImageForRequest:request];
        });
    });
}

+ (id)shareCacheImage{
    static YJCache *cache = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        cache = [[YJCache alloc] init];
        //内存警告 清除内存
        [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidReceiveMemoryWarningNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
            [cache removeAllObjects];
        }];
    });
    return cache;
}
@end
