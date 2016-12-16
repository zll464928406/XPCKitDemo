/*
 * 1.第一次连接必须是app向service发起connection,连接以后两端可以互相发送信息
 * 2.client和server的连接是一对一的
 * 3.app的connection也只能存在一条,如果发起了另外一个connection,那么原来的就不会起作用了
 */

#import <Foundation/Foundation.h>
#import "XPCKit.h"
#import "XPCServer.h"


int main(int argc, const char *argv[])
{
    
    /*
     这里只执行一次
     在app连接service的时候执行
     如果service重启的时候也会执行一次
     */
    XPCServer *listenServer = [XPCServer new];
    
    return 0;
}
