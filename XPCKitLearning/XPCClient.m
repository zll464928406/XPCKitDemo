//
//  XPCClient.m
//  XPCKitLearning
//
//  Created by sunny on 16/12/16.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "XPCClient.h"

@interface XPCClient ()

@property(nonatomic,strong)NSMutableDictionary *connectionDictionry;

@end

@implementation XPCClient

+(instancetype)manager
{
    static XPCClient *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[XPCClient alloc] init];
        instance.connectionDictionry = [[NSMutableDictionary alloc] init];
    });
    return instance;
}

//向字典中添加连接
-(XPCConnection *)addConnection:(NSString *)serviceName eventHandler:(void (^)(NSDictionary *message, XPCConnection *inConnection))eventHandler key:(NSString *)key
{
    XPCConnection *connection = [self.connectionDictionry objectForKey:key];
    if (!connection)
    {
        connection = [[XPCConnection alloc] initWithServiceName:serviceName];
        connection.eventHandler = eventHandler;
        [self.connectionDictionry setObject:connection forKey:key];
    }
    connection.eventHandler = eventHandler;
    return connection;
}

//根据key找到Connection
- (XPCConnection *)connectionWithKey:(NSString *)key
{
    return [self.connectionDictionry objectForKey:key];
}
//返回所有connection
- (NSArray *)allconnection
{
    return [self.connectionDictionry allValues];
}


@end
