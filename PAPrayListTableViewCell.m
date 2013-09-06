//
//  PAPrayListTableViewCell.m
//  prayApp
//
//  Created by Jeff Wang on 8/14/13.
//  Copyright (c) 2013 Jeff Wang. All rights reserved.
//

#import "PAPrayListTableViewCell.h"

#define kCheckerViewInitX -320
#define kCheckerViewCheckXoffset -260;
@interface PAPrayListTableViewCell (){
    UIPanGestureRecognizer* panGR;
    UILabel* markLabel;
}

@end

@implementation PAPrayListTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        // TODO: Will Need an image
        UILabel* accessoryView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 33, 33)];
        accessoryView.text = @">";
        self.accessoryView = accessoryView;
        
        // Set up the gesture recognizer
        panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRightToCheck:)];
        [self addGestureRecognizer:panGR];
        
        // This is view thats dragable.
        checkConfirmView = [[UIView alloc] initWithFrame:CGRectMake(kCheckerViewInitX, 0, 320, self.frame.size.height)];
        checkConfirmView.backgroundColor = [UIColor lightGrayColor];
        markLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 310, 60)];
        markLabel.text = @"Pray";
        markLabel.textAlignment = NSTextAlignmentRight;
        [checkConfirmView addSubview:markLabel];
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self insertSubview:checkConfirmView atIndex:0];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// This function will update the text.
- (void) updateWithPrayer:(PAPrayer *)prayerItem{
    self.textLabel.text = prayerItem.prayerTitle;
    self.detailTextLabel.text = prayerItem.prayerContext;
}

- (void)swipeRightToCheck:(UIPanGestureRecognizer*) gr{
    // At the beginning.
    if ([gr state] == UIGestureRecognizerStateBegan){
        CGRect frame = checkConfirmView.frame;
        frame.size.height = self.frame.size.height;
        checkConfirmView.frame = frame;
    }
    else if ([gr state] == UIGestureRecognizerStateEnded){
        // The user release to mark as prayed
        if (checkConfirmView.backgroundColor == [UIColor greenColor]){
            [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                CGRect frame = self.contentView.frame;
                frame.origin.x = 60;
                self.contentView.frame = frame;
                
                checkConfirmView.alpha = 1;
                frame = checkConfirmView.frame;
                frame.origin.x = kCheckerViewCheckXoffset;
                checkConfirmView.frame = frame;
                
                markLabel.text = @">";
            } completion:^(BOOL finished) {
                [self removeGestureRecognizer:panGR];
            }];
        }
        else{
            [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                CGRect frame = self.contentView.frame;
                frame.origin.x = 0;
                self.contentView.frame = frame;
                
                checkConfirmView.alpha = 0;
                frame = checkConfirmView.frame;
                frame.origin.x = kCheckerViewInitX;
                checkConfirmView.frame = frame;
                
            } completion:^(BOOL finished) {
            }];
        }
    }
    else{
        CGFloat xValue = [gr translationInView:self.contentView].x;
        
        CGFloat ratio = 0;
        if (xValue > 60)
            ratio = 1;
        else
            ratio = xValue/60;
        
        if (ratio == 1)
            checkConfirmView.backgroundColor = [UIColor greenColor];
        else if (xValue > 120)
            checkConfirmView.backgroundColor = [UIColor brownColor];
        else
            checkConfirmView.backgroundColor = [UIColor lightGrayColor];
        
        [UIView animateWithDuration:0.1 animations:^{
            checkConfirmView.alpha = ratio;
            
            // -260
            if (YES){
//            if (ratio == 1){
                CGRect frame = checkConfirmView.frame;
                frame.origin.x = xValue -320;
                checkConfirmView.frame = frame;
            }
            
            CGRect frame = self.contentView.frame;
            frame.origin.x = xValue;
            self.contentView.frame = frame;
            
            frame = self.accessoryView.frame;
            
        }];
    }
}
@end
