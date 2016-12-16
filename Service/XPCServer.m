//
//  XPCServer.m
//  XPCKitLearning
//
//  Created by sunny on 16/12/16.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "XPCServer.h"
#import "TestTwo.h"
#import "Person.h"

@interface XPCServer ()
@property(nonatomic,strong)NSMutableDictionary *connectionDictionry;
@property(nonatomic,strong)XPCConnection *currentConnection;

@end

@implementation XPCServer



- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self startListenWithKey];
    }
    return self;
}

- (void)startListenWithKey
{
    [XPCService runServiceWithConnectionHandler:^(XPCConnection *connection) {
        [connection setEventHandler:^(NSDictionary *message, XPCConnection *connection){
            //调用处理请求的方法
            [self handlConnection:message connection:connection];
        }];
        self.currentConnection = connection;
    }];
    
}

- (void)handlConnection:(NSDictionary *)message connection:(XPCConnection *)connection
{
    //反馈时间信息
    NSString *str = [NSString stringWithFormat:@"message from client -----%@",self.className];
    [self.currentConnection sendMessage:@{@"server":str,@"date":[NSDate date]}];
    
    //调用TestTwo的方法发送
    TestTwo *testTwo = [TestTwo new];
    [testTwo sendToClientWithConnection:self.currentConnection];
    
    
    //发送自定义类型的数据
    Person *person = [message objectForKey:@"person"];
    if (person)
    {
        [self.currentConnection sendMessage:@{@"personfromServer":person}];
    }

}


@end
