//
//  NSString+Hashing.h
//
//  Created by Daryl Hawkins on 2012-08-15.
//  Copyright (c) 2012 Daryl Hawkins. All rights reserved.
//

/* This category adds methods to NSString that return a hex-coded string representation of the digest of the receiving object
 
 Requires NSData+Hashing.

 Category method names are of the format
	- (NSString *)stringByHashingWith<hash>
	returns an NSString containing the hex-encoded human-readable hash for the specified hashing function

 Supported values for <hash> are
	SHA-1 and variants:
		SHA256, SHA224, SHA384, SHA512
	MD5 and variants:
		MD2, MD4, MD5
*/

#import <Foundation/Foundation.h>

@interface NSString (Hashing)

#define STRING_HASH_METHOD_SIG(HASH) - (NSString *)stringByHashingWith##HASH;

STRING_HASH_METHOD_SIG(SHA224);
STRING_HASH_METHOD_SIG(SHA256);
STRING_HASH_METHOD_SIG(SHA384);
STRING_HASH_METHOD_SIG(SHA512);

STRING_HASH_METHOD_SIG(MD2);
STRING_HASH_METHOD_SIG(MD4);
STRING_HASH_METHOD_SIG(MD5);

#undef STRING_HASH_METHOD_SIG
@end
