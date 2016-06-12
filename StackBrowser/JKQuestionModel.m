//
//  JKQuestionModel.m
//  StackBrowser
//
//  Created by Jirat Ki on 6/12/2559 BE.
//  Copyright © 2559 Jirat Kijlerdpornpailoj. All rights reserved.
//

#import "JKQuestionModel.h"

@implementation JKQuestionModel


- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        self.title = dict[@"title"];
        self.score = [dict[@"score"] integerValue];
        self.profileImageUrl = dict[@"owner"][@"profile_image"];
    }
    return self;
}

@end
