//
//  AppInfo.m
//  03-加载网路图片
//
//  Created by apple on 15/6/1.
//  Copyright (c) 2015年 heima. All rights reserved.
//

#import "AppInfo.h"

@implementation AppInfo

+ (instancetype)appInfoWithDict:(NSDictionary *)dict {
    id obj = [[self alloc] init];
    
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

+ (NSArray *)appList {
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"apps.plist" withExtension:nil];
    NSArray *array = [NSArray arrayWithContentsOfURL:url];
    
    // 字典转模型
    // arrayWithCapacity 容量，指定数组容量，在实例化数组的同时，准备好容量指定的内容空间
    // 假如是10，一次性在内存中，准备10个空间，再添加元素的时候，就不会再次申请内存
    // 如果增加第11个元素，会直接再次开辟10个元素的空间
    // [NSMutableArray array]，每添加一个元素，临时申请空间！
    // 因为最近有面试问到！
    NSMutableArray *list = [NSMutableArray arrayWithCapacity:array.count];
    
    // 遍历数组
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [list addObject:[AppInfo appInfoWithDict:obj]];
    }];
    
    // 将可变数组转换成不可变的，保证线程安全，外部不能修改
    return list.copy;
}

@end
