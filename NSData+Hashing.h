//
//  NSData+Hashing.h
//
//  Created by Daryl Hawkins on 2012-08-15.
//  Copyright (c) 2012 Daryl Hawkins. All rights reserved.
//

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