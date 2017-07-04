//
//  YJCache.h
//  Cache
//
//  Created by cptech on 2017/3/21.
//  Copyright © 2017年 cptech. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface YJCache : NSCache    
- (UIImage *)cachedImageForRequest:(NSURLRequest *)request;
- (void)cacheImage:(UIImage *)image forRequest:(NSURLRequest *)request;
@end

