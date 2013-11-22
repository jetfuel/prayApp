//
//  PACommentTableViewCell.m
//  prayApp
//
//  Created by Jeff Wang on 11/21/13.
//  Copyright (c) 2013 Jeff Wang. All rights reserved.
//

#import "PACommentTableViewCell.h"

#define kTopMargin 10
#define kChatMargin 5
#define kMaxChatBubbleWidth 230
#define kMinChatBubbleWidth 100

@implementation PACommentTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        userNameLabel = [[UILabel alloc] init];
        userNameLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14];

        commemtLabel = [[UILabel alloc] init];
        commemtLabel.font = [UIFont fontWithName:@"OpenSans" size:14];
        [commemtLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [commemtLabel setNumberOfLines:0];
        
        chatBubbleView = [[UIView alloc] initWithFrame:CGRectMake(80, kTopMargin, kMaxChatBubbleWidth, 44)];
        [chatBubbleView addSubview:userNameLabel];
        [chatBubbleView addSubview:commemtLabel];
        chatBubbleView.backgroundColor = [UIColor whiteColor];
        
        userNameLabel.frame = CGRectMake(kChatMargin, kChatMargin, chatBubbleView.frame.size.width - 2 * kChatMargin, 10);
        commemtLabel.frame = CGRectMake(kChatMargin, kChatMargin + userNameLabel.frame.origin.y + userNameLabel.frame.size.height, chatBubbleView.frame.size.width - 2 * kChatMargin, 10);
        
        [self.contentView addSubview:chatBubbleView];
        [self setBackgroundColor:[UIColor colorWithRed:(242.0f/255.0f) green:(242.0f/255.0f) blue:(242.0f/255.0f) alpha:1]];

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateWithComment:(PAComment*) commentItem{
    // Initialize the cell
    userNameLabel.text = commentItem.userNameString;
    commemtLabel.text = commentItem.comment;
}

- (void)layoutSubviews{
    [userNameLabel sizeToFit];
    commemtLabel.frame = CGRectMake(kChatMargin, kChatMargin + userNameLabel.frame.origin.y + userNameLabel.frame.size.height, chatBubbleView.frame.size.width - 2 * kChatMargin, 10);
    [commemtLabel sizeToFit];
    
    CGRect frame = chatBubbleView.frame;
    frame.size.height = commemtLabel.frame.origin.y + commemtLabel.frame.size.height + 2 * kChatMargin;
    chatBubbleView.frame = frame;
}

+ (float)estimateCellheightWithComment:(PAComment*) commentItem{
    CGSize userLabelSize = [commentItem.userNameString sizeWithFont:[UIFont fontWithName:@"OpenSans-Bold" size:14] constrainedToSize:CGSizeMake(kMaxChatBubbleWidth, 999) lineBreakMode:NSLineBreakByWordWrapping];
    
    CGSize commentLabelSize = [commentItem.comment sizeWithFont:[UIFont fontWithName:@"OpenSans" size:14] constrainedToSize:CGSizeMake(kMaxChatBubbleWidth, 999) lineBreakMode:NSLineBreakByWordWrapping];
    
    return userLabelSize.height + commentLabelSize.height + 3 * kChatMargin + 2 * kTopMargin;
}
@end
