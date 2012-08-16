//
// NSData+Hashing.m
//
// Copyright (c) 2012 Daryl Hawkins.
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

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
