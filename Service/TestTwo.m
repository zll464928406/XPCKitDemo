//
//  TestTwo.m
//  XPCKitLearning
//
//  Created by sunny on 16/12/16.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "TestTwo.h"


@implementation TestTwo


- (void)sendToClientWithConnection:(XPCConnection *)connection
{
    NSString *str = [NSString stringWithFormat:@"message from client -----%@",self.className];
    [connection sendMessage:@{@"server":str,@"date":[NSDate date]}];
}


@end
