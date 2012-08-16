//
//  NSString+Hashing.m
//
//  Created by Daryl Hawkins on 2012-08-15.
//  Copyright (c) 2012 Daryl Hawkins. All rights reserved.
//

#import "NSString+Hashing.h"
#import "NSData+Hashing.h"

#define STRING_HASH_METHOD(HASH) \
- (NSString *)stringByHashingWith##HASH \
{ \
	NSData *stringData = [self dataUsingEncoding:NSUTF8StringEncoding]; \
	return [stringData stringByHashingWith##HASH]; \
}

@implementation NSString (Hashing)
STRING_HASH_METHOD(SHA224);
STRING_HASH_METHOD(SHA256);
STRING_HASH_METHOD(SHA384);
STRING_HASH_METHOD(SHA512);

STRING_HASH_METHOD(MD2);
STRING_HASH_METHOD(MD4);
STRING_HASH_METHOD(MD5);
@end
