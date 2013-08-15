//
//  PAPrayListTableViewCell.m
//  prayApp
//
//  Created by Jeff Wang on 8/14/13.
//  Copyright (c) 2013 Jeff Wang. All rights reserved.
//

#import "PAPrayListTableViewCell.h"

@implementation PAPrayListTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
//        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        UILabel* accessoryView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 33, 33)];
        accessoryView.text = @">";
        self.accessoryView = accessoryView;
        
        UIPanGestureRecognizer* panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRightToCheck:)];
        [self addGestureRecognizer:panGR];
        
        checkConfirmView = [[UIView alloc] initWithFrame:CGRectMake(-260, 0, 320, self.frame.size.height)];
        checkConfirmView.backgroundColor = [UIColor lightGrayColor];
        UILabel* markLabel = [[UILabel alloc] initWithFrame:CGRectMake(260, 0, 60, 60)];
        markLabel.text = @">";
        markLabel.textAlignment = NSTextAlignmentCenter;
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

- (void) updateWithPrayer:(PAPrayer *)prayerItem{
    
    NSLog(@"OK: %@", prayerItem.prayerContext);
    self.textLabel.text = prayerItem.prayerTitle;
    self.detailTextLabel.text = prayerItem.prayerContext;
    NSLog(@"self.%@", self.detailTextLabel.text);
}

- (void)swipeRightToCheck:(UIPanGestureRecognizer*) gr{
    if ([gr state] == UIGestureRecognizerStateBegan){
        CGRect frame = checkConfirmView.frame;
        frame.size.height = self.frame.size.height;
        checkConfirmView.frame = frame;
    }
    else if ([gr state] == UIGestureRecognizerStateEnded){
        [UIView animateWithDuration:0.4 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
            CGRect frame = self.contentView.frame;
            frame.origin.x = 0;
            self.contentView.frame = frame;
            
            checkConfirmView.alpha = 0;
            frame = checkConfirmView.frame;
            frame.origin.x = -260;
            checkConfirmView.frame = frame;
            
        } completion:^(BOOL finished) {
        }];
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
        else
            checkConfirmView.backgroundColor = [UIColor lightGrayColor];
        
        [UIView animateWithDuration:0.1 animations:^{
            checkConfirmView.alpha = ratio;
            
            // -260
            if (ratio == 1){
                CGRect frame = checkConfirmView.frame;
                frame.origin.x = xValue -320;
                checkConfirmView.frame = frame;
            }
            
            NSLog(@"The frame: %@", NSStringFromCGRect(checkConfirmView.frame));
            CGRect frame = self.contentView.frame;
            frame.origin.x = xValue;
            self.contentView.frame = frame;

            frame = self.accessoryView.frame;
            
        }];
    }
}
@end
