//
//  PAEncourageView.m
//  prayApp
//
//  Created by Jeff Wang on 11/25/13.
//  Copyright (c) 2013 Jeff Wang. All rights reserved.
//

#import "PAEncourageView.h"

#define kImageSize 44
@implementation PAEncourageView
@synthesize prayButton, shareButton, saveButton;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        float magin = (frame.size.width - 5 * kImageSize) / 6;
        prayButton = [[UIButton alloc] initWithFrame:CGRectMake( 2 * magin + 1 * kImageSize, 0, kImageSize, kImageSize)];
        prayButton.backgroundColor = [UIColor whiteColor];
        [prayButton addTarget:self action:@selector(prayButtonDidClicked) forControlEvents:UIControlEventTouchUpInside];
        
        shareButton = [[UIButton alloc] initWithFrame:CGRectMake( 3 * magin + 2 * kImageSize, 0, kImageSize, kImageSize)];
        shareButton.backgroundColor = [UIColor whiteColor];
        [shareButton addTarget:self action:@selector(shareButtonDidClicked) forControlEvents:UIControlEventTouchUpInside];

        saveButton = [[UIButton alloc] initWithFrame:CGRectMake( 4 * magin + 3 * kImageSize, 0, kImageSize, kImageSize)];
        saveButton.backgroundColor = [UIColor whiteColor];
        [saveButton addTarget:self action:@selector(saveButtonDidClicked) forControlEvents:UIControlEventTouchUpInside];

        [self addSubview:prayButton];
        [self addSubview:shareButton];
        [self addSubview:saveButton];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void)prayButtonDidClicked{
    
}

- (void)shareButtonDidClicked{
    
}

- (void)saveButtonDidClicked{
    
}
@end
