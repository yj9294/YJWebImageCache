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
    UIImage *existImage = [cache cachedImageForRequest:[NSURLRequest requestWithURL:url]];
    if(existImage)
    {
        self.image = existImage;
        return;
    }
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        UIImage *imageData = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:url]];
        if(imageData)
        {
            [cache cachedImageForRequest:[NSURLRequest requestWithURL:url]];
        }
        self.image = imageData;
    });
}

+ (id)shareCacheImage{
    static YJCache *cache = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
       
        cache = [[YJCache alloc] init];
        [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidReceiveMemoryWarningNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
            [cache removeAllObjects];
        }];
    });
    return cache;
}
@end
