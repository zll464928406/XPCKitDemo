//
//  TestTwo.h
//  XPCKitLearning
//
//  Created by sunny on 16/12/16.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XPCKit.h"

@interface TestTwo : NSObject


- (void)sendToClientWithConnection:(XPCConnection *)connection;

@end
