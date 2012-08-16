//
// NSData+Hashing.h
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

/* This category adds methods to NSData that return either NSData or NSString representations of the digest of the receiving object
 
 Category method names are of the format
 - (NSData *)dataByHashingWith<hash>
	returns an NSData containing the hash of this NSData, using the specified hashing function
 
 - (NSString *)stringByHashingWith<hash>
	returns an NSString containing the hex-encoded human-readable hash for the specified hashing function
 
 Supported values for <hash> are
	SHA-1 and variants:
		SHA256, SHA224, SHA384, SHA512
	MD5 and variants:
		MD2, MD4, MD5
 */

#import <Foundation/Foundation.h>

@interface NSData (Hashing)

#define DATA_HASH_METHOD_SIG(HASH) - (NSData *)dataByHashingWith##HASH;
#define STRING_HASH_METHOD_SIG(HASH) - (NSString *)stringByHashingWith##HASH;

#pragma mark - Pure NSData returning hashing functions

DATA_HASH_METHOD_SIG(SHA1);
DATA_HASH_METHOD_SIG(SHA256);
DATA_HASH_METHOD_SIG(SHA224);
DATA_HASH_METHOD_SIG(SHA384);
DATA_HASH_METHOD_SIG(SHA512);

DATA_HASH_METHOD_SIG(MD2);
DATA_HASH_METHOD_SIG(MD4);
DATA_HASH_METHOD_SIG(MD5);

#pragma mark - Hashing functions that return hex-coded hashes

STRING_HASH_METHOD_SIG(SHA1);
STRING_HASH_METHOD_SIG(SHA256);
STRING_HASH_METHOD_SIG(SHA224);
STRING_HASH_METHOD_SIG(SHA384);
STRING_HASH_METHOD_SIG(SHA512);

STRING_HASH_METHOD_SIG(MD2);
STRING_HASH_METHOD_SIG(MD4);
STRING_HASH_METHOD_SIG(MD5);

#undef DATA_HASH_METHOD_SIG
#undef STRING_HASH_METHOD_SIG

@end