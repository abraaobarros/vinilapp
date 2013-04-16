//
//  HttpService.m
//  VinilApp
//
//  Created by Gabriel Chagas Marques on 4/16/13.
//  Copyright (c) 2013 Abraao Barros Laceda. All rights reserved.
//

#import "HttpService.h"

@implementation HttpService

- (NSDictionary *)json:(NSString *)url withPOSTString:(NSString *)postString
{
    NSError *error;
    return [NSJSONSerialization JSONObjectWithData:[self post:url withPOSTString:postString] options:kNilOptions error:&error];
}

- (NSData *)post:(NSString *)url withPOSTString:(NSString *)postString
{
    NSMutableURLRequest *request = [self createRequest: url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    return [self send:request];
}

- (NSMutableURLRequest *) createRequest:(NSString *) url
{
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString: url]
                                        cachePolicy:NSURLRequestUseProtocolCachePolicy
                                        timeoutInterval:60.0];
    return request;
}

- (NSData *)send:(NSMutableURLRequest *)request
{
    NSData *data;
    NSURLResponse *response;
    NSError *error;
    data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (error != nil) {
        [NSException raise:@"Connection error" format:@"Error: %@", error.localizedDescription];
    }
    return data;
}

@end
