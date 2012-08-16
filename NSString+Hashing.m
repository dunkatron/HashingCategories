//
// NSString+Hashing.m
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
