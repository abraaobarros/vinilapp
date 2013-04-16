//
//  HttpService.h
//  VinilApp
//
//  Created by Gabriel Chagas Marques on 4/16/13.
//  Copyright (c) 2013 Abraao Barros Laceda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpService : NSObject

- (NSData *)post:(NSString *)url withPOSTString:(NSString *)postString;
- (NSDictionary *)json:(NSString *)url withPOSTString:(NSString *)postString;

@end
