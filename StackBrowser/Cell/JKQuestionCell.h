//
//  JKQuestionCell.h
//  StackBrowser
//
//  Created by Jirat Ki on 6/12/2559 BE.
//  Copyright © 2559 Jirat Kijlerdpornpailoj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JKQuestionCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *voteLabel;

@end
