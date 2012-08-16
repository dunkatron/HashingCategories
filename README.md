# HashingCategories #

## Introduction ##
This project adds message digest methods to the NSData and NSString classes, allowing you to easily compute the message digest of data or strings using a variety of digest schemes.

## Requirements ##

Requires ARC.

## How to use
Macros are used to generate category methods for the supported hashing functions. The method names follow this format:

For NSData:

	- (NSData *)dataByHashingWith<hash>
	- (NSString *)stringByHashingWith<hash>

For NSString:

	- (NSString *)stringByHashingWith<hash> // (for UTF8 encoding)
	- (NSString *)stringByHashingWith<hash>UsingEncoding:(NSStringEncoding)encoding // for other encoding types

Supported values for `<hash>` are found in *Supported Schemes*.

## Supported Schemes ##

- SHA variants
	- SHA1
	- SHA224
	- SHA256
	- SHA384
	- SHA512

- MD5 variants
	- MD2
	- MD4
	- MD5