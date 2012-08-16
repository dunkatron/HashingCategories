//
//  NSString+Hashing.m
//
//  Created by Daryl Hawkins on 2012-08-15.
//  Copyright (c) 2012 Daryl Hawkins. All rights reserved.
//

#import "NSString+Hashing.h"
#import "NSData+Hashing.h"

#define STRING_HASH_METHOD_ENCODING(HASH) \
- (NSString *)stringByHashingWith##HASH##UsingEncoding:(NSStringEncoding)encoding \
{ \
	NSData *stringData = [self dataUsingEncoding:encoding]; \
	return [stringData stringByHashingWith##HASH]; \
}

#define STRING_HASH_METHOD(HASH) \
- (NSString *)stringByHashingWith##HASH \
{ \
	return [self stringByHashingWith##HASH##UsingEncoding:NSUTF8StringEncoding]; \
} \

@implementation NSString (Hashing)
STRING_HASH_METHOD(SHA1);
STRING_HASH_METHOD(SHA224);
STRING_HASH_METHOD(SHA256);
STRING_HASH_METHOD(SHA384);
STRING_HASH_METHOD(SHA512);

STRING_HASH_METHOD(MD2);
STRING_HASH_METHOD(MD4);
STRING_HASH_METHOD(MD5);

STRING_HASH_METHOD_ENCODING(SHA1);
STRING_HASH_METHOD_ENCODING(SHA224);
STRING_HASH_METHOD_ENCODING(SHA256);
STRING_HASH_METHOD_ENCODING(SHA384);
STRING_HASH_METHOD_ENCODING(SHA512);

STRING_HASH_METHOD_ENCODING(MD2);
STRING_HASH_METHOD_ENCODING(MD4);
STRING_HASH_METHOD_ENCODING(MD5);
@end
