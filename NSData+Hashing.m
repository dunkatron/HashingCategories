//
//  NSData+Hashing.m
//
//  Created by Daryl Hawkins on 2012-08-15.
//  Copyright (c) 2012 Daryl Hawkins. All rights reserved.
//

#import "NSData+Hashing.h"
#import <CommonCrypto/CommonCrypto.h>

#define DATA_HASH_METHOD(HASH) \
- (NSData *)dataByHashingWith##HASH \
{ \
	unsigned char hashed[CC_##HASH##_DIGEST_LENGTH]; \
	CC_##HASH(self.bytes, (CC_LONG) self.length, hashed); \
	return [NSData dataWithBytes:hashed length:CC_##HASH##_DIGEST_LENGTH]; \
}

#define STRING_HASH_METHOD(HASH) \
- (NSString *)stringByHashingWith##HASH \
{ \
	NSData *hashed = [self dataByHashingWith##HASH]; \
	const unsigned char *bytes = hashed.bytes; \
	NSUInteger len = hashed.length; \
	NSMutableString *hashString = [NSMutableString stringWithCapacity:CC_##HASH##_DIGEST_LENGTH * 2]; \
	for (NSUInteger i = 0; i < len; i++) { \
		[hashString appendFormat:@"%02x", bytes[i]]; \
	} \
	return [hashString copy]; \
} \

@implementation NSData (Hashing)

#pragma mark - Pure NSData returning hashing functions

DATA_HASH_METHOD(SHA1);
DATA_HASH_METHOD(SHA256);
DATA_HASH_METHOD(SHA224);
DATA_HASH_METHOD(SHA384);
DATA_HASH_METHOD(SHA512);

DATA_HASH_METHOD(MD2);
DATA_HASH_METHOD(MD4);
DATA_HASH_METHOD(MD5);

#pragma mark - Hashing functions that return hex-coded hashes

STRING_HASH_METHOD(SHA1);
STRING_HASH_METHOD(SHA256);
STRING_HASH_METHOD(SHA224);
STRING_HASH_METHOD(SHA384);
STRING_HASH_METHOD(SHA512);

STRING_HASH_METHOD(MD2);
STRING_HASH_METHOD(MD4);
STRING_HASH_METHOD(MD5);

@end
