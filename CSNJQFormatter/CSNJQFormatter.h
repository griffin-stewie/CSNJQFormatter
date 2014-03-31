//
//  CSNJQFormatter.h
//  
//
//  Created by griffin-stewie on 2014/03/31.
//  Copyright (c) 2014年 net.cyan-stivy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CSNJQFormatter : NSFormatter

///-------------------------
/// @name Converting Objects
///-------------------------

/**
 Returns a `jq` command string equivalent of the specified JSON object.
 
 @param JSON The Foundation objects JSON to format.
 */
+ (NSString *)jqCommandFromJSON:(id)JSON;

/**
 Returns a `jq` command string equivalent of the specified JSON object.
 
 @param JSONString The JSON string representation to format.
 */
+ (NSString *)jqCommandFromJSONString:(NSString *)JSONString;

/**
 Returns a `jq` command string equivalent of the specified JSON object.
 
 @param JSONData The NSData of JSON to format.
 */
+ (NSString *)jqCommandFromJSONData:(NSData *)JSONData;
@end
