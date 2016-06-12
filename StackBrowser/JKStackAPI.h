//
//  JKStackAPI.h
//  StackBrowser
//
//  Created by Jirat Ki on 6/12/2559 BE.
//  Copyright © 2559 Jirat Kijlerdpornpailoj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKStackAPI : NSObject

+ (JKStackAPI *)sharedInstance;

- (void)fetchHotQuestionsWithCompletionBlock:(void (^)(NSArray *questions, NSError *error))completionBlock;

//- (void)someMethodThatTakesABlock:(returnType (^nullability)(parameterTypes))blockName;

@end
