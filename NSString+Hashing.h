//
// NSString+Hashing.h
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

/* This category adds methods to NSString that return a hex-coded string representation of the digest of the receiving object
 
 Requires NSData+Hashing.

 Category method names are of the format
	- (NSString *)stringByHashingWith<hash>
	returns an NSString containing the hex-encoded human-readable hash for the specified hashing function. The string is converted to an NSData using the UTF8 encoding scheme
	- (NSString *)stringByHashingWith<hash>UsingEncoding:(NSStringEncoding)encoding
	returns an NSString containing the hex-encoded human-readable hash for the specified hashing function, converting the NSString into an NSData using the given encoding scheme

 Supported values for <hash> are
	SHA-1 and variants:
		SHA1, SHA256, SHA224, SHA384, SHA512
	MD5 and variants:
		MD2, MD4, MD5
*/

#import <Foundation/Foundation.h>

@interface NSString (Hashing)

#define STRING_HASH_METHOD_SIG(HASH) - (NSString *)stringByHashingWith##HASH;
#define STRING_HASH_METHOD_ENCODING_SIG(HASH) - (NSString *)stringByHashingWith##HASH##UsingEncoding:(NSStringEncoding)encoding;

STRING_HASH_METHOD_SIG(SHA1);
STRING_HASH_METHOD_SIG(SHA224);
STRING_HASH_METHOD_SIG(SHA256);
STRING_HASH_METHOD_SIG(SHA384);
STRING_HASH_METHOD_SIG(SHA512);

STRING_HASH_METHOD_SIG(MD2);
STRING_HASH_METHOD_SIG(MD4);
STRING_HASH_METHOD_SIG(MD5);

STRING_HASH_METHOD_ENCODING_SIG(SHA1);
STRING_HASH_METHOD_ENCODING_SIG(SHA224);
STRING_HASH_METHOD_ENCODING_SIG(SHA256);
STRING_HASH_METHOD_ENCODING_SIG(SHA384);
STRING_HASH_METHOD_ENCODING_SIG(SHA512);

STRING_HASH_METHOD_ENCODING_SIG(MD2);
STRING_HASH_METHOD_ENCODING_SIG(MD4);
STRING_HASH_METHOD_ENCODING_SIG(MD5);

#undef STRING_HASH_METHOD_SIG
#undef STRING_HASH_METHOD_ENCODING_SIG
@end
