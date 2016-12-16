//
//  Person.m
//  XPCKitLearning
//
//  Created by sunny on 16/12/16.
//  Copyright © 2016年 sunny. All rights reserved.
//

#import "Person.h"

@implementation Person

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self)
    {
        _name = [aDecoder decodeObjectOfClass:[NSString class] forKey:@"name"];
    }
    return self;
}

+ (BOOL)supportsSecureCoding
{
    return YES;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_name forKey:@"name"];
    
}


@end
