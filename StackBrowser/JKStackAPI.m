//
//  JKStackAPI.m
//  StackBrowser
//
//  Created by Jirat Ki on 6/12/2559 BE.
//  Copyright © 2559 Jirat Kijlerdpornpailoj. All rights reserved.
//

#import "JKStackAPI.h"

#import <AFNetworking/AFNetworking.h>
#import "JKQuestionModel.h"

@implementation JKStackAPI

+ (JKStackAPI *)sharedInstance
{
    
    static JKStackAPI *sharedAPI = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedAPI = [[self alloc] init];
    });
    
    return sharedAPI;

}

- (void)fetchHotQuestionsWithCompletionBlock:(void (^)(NSArray *, NSError *))completionBlock {
    
    // Session
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    // Request
    NSURL *URL = [NSURL URLWithString:@"https://api.stackexchange.com/2.2/questions?order=desc&sort=hot&site=stackoverflow"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    
    // sending Request
    NSURLSessionDataTask *dataTask =
    [manager dataTaskWithRequest:request
               completionHandler:
     ^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
            completionBlock(nil, error);
        } else {
            NSArray *questions = [self getQuestionsFromResponse:responseObject];
            completionBlock(questions, nil);
        }
    }];
    [dataTask resume];
    
}

- (NSArray *)getQuestionsFromResponse:(NSDictionary *)responseObject {
    NSArray *questionsArray = responseObject[@"items"];
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    for (NSDictionary *questionDict in questionsArray) {
        JKQuestionModel *question = [[JKQuestionModel alloc] initWithDictionary:questionDict];
        [result addObject:question];
    }
    return result;
}


@end
