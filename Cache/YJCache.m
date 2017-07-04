//
//  YJCache.m
//  Cache
//
//  Created by cptech on 2017/3/21.
//  Copyright © 2017年 cptech. All rights reserved.
//

#import "YJCache.h"

@implementation YJCache

static inline NSString *YJImageCacheKeyFromURLRequest(NSURLRequest *request){

    return [[request URL] absoluteString];

}
- (UIImage *)cachedImageForRequest:(NSURLRequest *)request{
    switch ([request cachePolicy]) {
        case NSURLRequestReloadIgnoringCacheData:
        case NSURLRequestReloadIgnoringLocalAndRemoteCacheData:
            return nil;
        default:
            break;
    }
    return [self objectForKey:YJImageCacheKeyFromURLRequest(request)];
}


- (void)cacheImage:(UIImage *)image forRequest:(NSURLRequest *)request
{
    if(image&&request)
    {
        [self setObject:image forKey: YJImageCacheKeyFromURLRequest(request)];
    }
}

@end
