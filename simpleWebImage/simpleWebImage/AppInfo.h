//
//  AppInfo.h
//  03-加载网路图片
//
//  Created by apple on 15/6/1.
//  Copyright (c) 2015年 heima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AppInfo : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *download;
///  下载得到的图像 － 问题：如果行数非常多，假设20000行！
///  一旦出现内存警告，图像和模型绑定的很紧，不好释放
// @property (nonatomic, strong) UIImage *image;

+ (instancetype)appInfoWithDict:(NSDictionary *)dict;

///  模型是准备好一些方法，供外部调用，方法通常是`被动`，外部调用方不用关心内部的实现细节
///  从 bundle 中加载应用程序数组
+ (NSArray *)appList;

@end
