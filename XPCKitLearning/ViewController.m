//
//  ViewController.m
//  XPCKitLearning
//
//  Created by sunny on 16/12/14.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "XPCClient.h"

@interface ViewController ()

@property(nonatomic,strong)Person *person;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.person = [Person new];
    self.person.name = @"kobe";
}

#pragma mark - 给服务器的请求并接收服务器的反馈信息
- (IBAction)btnClick:(NSButton *)sender
{
    
    XPCConnection *connection = [[XPCClient manager] addConnection:@"com.moxtra.Service" eventHandler:^(NSDictionary *message, XPCConnection *inConnection) {
        
        Person *person = [message objectForKey:@"personfromServer"];
        NSDate *date = [message objectForKey:@"date"];
        if(person)
        {
            NSLog(@"名字: %@", person.name);
        }else if (date)
        {
            NSLog(@"时间:%@", date);
        }
    } key:@"one"];
     
     //第一种方式:带有参数,同时包含有自定义的类型数据
     NSDictionary *dict = @{@"operation":@"sendPerson",@"person":self.person};
     [connection sendMessage:dict];
     
     //第二种方式:不带有参数的方式
     [connection sendMessage:[NSDictionary dictionaryWithObject:@"whatTimeIsIt" forKey:@"operation"]];

}

#pragma mark - 不给服务器发送数据,只接收服务器发送的数据
- (IBAction)acceptServerInfo:(NSButton *)sender
{

    XPCConnection *connection = [[XPCClient manager] addConnection:@"com.moxtra.Service" eventHandler:^(NSDictionary *message, XPCConnection *inConnection) {
        NSString *msg = [message objectForKey:@"server"];
        NSDate *date = [message objectForKey:@"date"];
        if (msg)
        {
            NSLog(@"%@--------%@",msg,date);
        }
    } key:@"two"];

    [connection sendMessage:@{@"value":@"111"}];
}









- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    
}


@end
