//
//  XPCClient.h
//  XPCKitLearning
//
//  Created by sunny on 16/12/16.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <XPCKit/XPCKit.h>

@interface XPCClient : NSObject



+ (instancetype)manager;

//添加一个connection
-(XPCConnection *)addConnection:(NSString *)serviceName eventHandler:(void (^)(NSDictionary *message, XPCConnection *inConnection))eventHandler key:(NSString *)key;
//根据key找到下载
- (XPCConnection *)connectionWithKey:(NSString *)key;
//返回所有connection
- (NSArray *)allconnection;

@end
