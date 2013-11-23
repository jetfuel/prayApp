//
//  PACommentTableViewCell.h
//  prayApp
//
//  Created by Jeff Wang on 11/21/13.
//  Copyright (c) 2013 Jeff Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PAComment.h"
@interface PACommentTableViewCell : UITableViewCell{
    UIView* chatBubbleView;
    UILabel* userNameLabel;
    UILabel* commemtLabel;
    
    UIImageView* timeStampImageView;
    UILabel* timeStampLabel;
}

- (void)updateWithComment:(PAComment*) commentItem;

+ (float)estimateCellheightWithComment:(PAComment*) commentItem;
@end
