CSNJQFormatter
==============

[![CocoaPods](http://img.shields.io/cocoapods/v/CSNJQFormatter.svg)](https://github.com/CocoaPods/Specs/tree/master/CSNJQFormatter)
![](http://img.shields.io/badge/license-MIT-green.svg)

## Overview

format JSON string to easy to read for jq.

Print out `jq` command equivalents for `JSON`, `NSString` and `NSData` *(e.g. `cat <<'END' | jq '.' \n{"foo":"bar"}\nEND`)* for debugging in the console.

## Requirements

* iOS 6 or Later
* ARC

## Usage
 
```objective-c
[CSNJQFormatter jqCommandFromJSON:@{@"foo": @"bar"}];
```
 
    cat <<'END' | jq '.' 
    {"foo":"bar"}
    END
 
## Install

Use CocoaPods,

```
pod 'CSNJQFormatter', '~> 0.0'
```

## License

CSNJQFormatter is available under the MIT license. See the LICENSE file for more info.