//
//  JKQuestionModel.h
//  StackBrowser
//
//  Created by Jirat Ki on 6/12/2559 BE.
//  Copyright © 2559 Jirat Kijlerdpornpailoj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKQuestionModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger score;
@property (nonatomic, copy) NSString *profileImageUrl;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
