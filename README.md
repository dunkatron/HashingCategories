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

## License ##

Copyright (C) 2012 Daryl Hawkins

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.