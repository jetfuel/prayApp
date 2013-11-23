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
        // Name
        userNameLabel = [[UILabel alloc] init];
        userNameLabel.font = [UIFont fontWithName:@"OpenSans-Semibold" size:14];

        // Comment
        commemtLabel = [[UILabel alloc] init];
        commemtLabel.font = [UIFont fontWithName:@"OpenSans" size:14];
        [commemtLabel setLineBreakMode:NSLineBreakByWordWrapping];
        [commemtLabel setNumberOfLines:0];
        
        // TimeStamp
        timeStampImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"prayer_detail_clock"]];
        timeStampLabel = [[UILabel alloc] init];
        [timeStampLabel setNumberOfLines:1];
        timeStampLabel.textColor = [UIColor lightGrayColor];
        timeStampLabel.font = [UIFont fontWithName:@"OpenSans" size:12];
        
        // Chatbubble
        chatBubbleView = [[UIView alloc] initWithFrame:CGRectMake(80, kTopMargin, kMaxChatBubbleWidth, 44)];
        chatBubbleView.backgroundColor = [UIColor whiteColor];
        [chatBubbleView addSubview:userNameLabel];
        [chatBubbleView addSubview:commemtLabel];
        [chatBubbleView addSubview:timeStampImageView];
        [chatBubbleView addSubview:timeStampLabel];
        
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
    
    // is this comment is a prayer action.
    if (commentItem.isPrayedAction){
        NSString* prayedString = [NSString stringWithFormat:@"%@ prayed", commentItem.userNameString];
        NSMutableAttributedString* attributeString = [[NSMutableAttributedString alloc] initWithString:prayedString];
        [attributeString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"OpenSans" size:14] range:[prayedString rangeOfString:@" prayed"]];
        userNameLabel.attributedText = attributeString;
        commemtLabel.hidden = YES;
    }
    else{
        userNameLabel.attributedText = nil;

        userNameLabel.text = commentItem.userNameString;
        commemtLabel.hidden = NO;
        commemtLabel.text = commentItem.comment;
    }
    
    timeStampLabel.text = @"15m";
}

- (void)layoutSubviews{
    [userNameLabel sizeToFit];
    [timeStampLabel sizeToFit];
    
    if (commemtLabel.hidden == YES){
        CGRect frame = chatBubbleView.frame;
        frame.size.height = userNameLabel.frame.origin.y + userNameLabel.frame.size.height + 2 * kChatMargin;
        frame.origin.x = kTopMargin;
        frame.size.width = 320 - 2 * kTopMargin;
        chatBubbleView.frame = frame;

    }
    else{
        commemtLabel.frame = CGRectMake(kChatMargin, kChatMargin + userNameLabel.frame.origin.y + userNameLabel.frame.size.height, chatBubbleView.frame.size.width - 2 * kChatMargin, 10);
        [commemtLabel sizeToFit];
        
        CGRect frame = chatBubbleView.frame;
        frame.size.height = commemtLabel.frame.origin.y + commemtLabel.frame.size.height + 2 * kChatMargin;
        chatBubbleView.frame = frame;
    }
    
    CGRect frame = timeStampLabel.frame;
    frame.origin.x = chatBubbleView.frame.size.width - kChatMargin - timeStampLabel.frame.size.width;
    frame.origin.y = (userNameLabel.frame.size.height - timeStampLabel.frame.size.height) / 2  + kChatMargin;
    timeStampLabel.frame = frame;
    
    frame = timeStampImageView.frame;
    frame.origin.x = timeStampLabel.frame.origin.x - timeStampImageView.frame.size.width;
    timeStampImageView.frame = frame;
}

+ (float)estimateCellheightWithComment:(PAComment*) commentItem{
    CGSize userLabelSize = [commentItem.userNameString sizeWithFont:[UIFont fontWithName:@"OpenSans-Bold" size:14] constrainedToSize:CGSizeMake(kMaxChatBubbleWidth, 999) lineBreakMode:NSLineBreakByWordWrapping];
    
    CGSize commentLabelSize = [commentItem.comment sizeWithFont:[UIFont fontWithName:@"OpenSans" size:14] constrainedToSize:CGSizeMake(kMaxChatBubbleWidth, 999) lineBreakMode:NSLineBreakByWordWrapping];
    
    // If there is no comment, this is an item for the 
    if (commentItem.isPrayedAction)
        return userLabelSize.height + 2 * kTopMargin;
    else
        return userLabelSize.height + commentLabelSize.height + 3 * kChatMargin + 2 * kTopMargin;
}
@end
