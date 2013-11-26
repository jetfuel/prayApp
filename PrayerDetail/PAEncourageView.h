//
//  PAEncourageView.h
//  prayApp
//
//  Created by Jeff Wang on 11/25/13.
//  Copyright (c) 2013 Jeff Wang. All rights reserved.
//

#import <UIKit/UIKit.h>


// Delegate functions
@protocol PAEncourageViewDelegate <NSObject>
- (void)encourageViewDidPray:(id)encourageView;
- (void)encourageViewDidShare:(id)encourageView;
- (void)encourageViewDidSave:(id)encourageView;
- (void)encourageViewdidEndSync:(id)encourageView;
@end

@interface PAEncourageView : UIView{
    
}
@property (nonatomic, strong) UIButton* prayButton;
@property (nonatomic, strong) UIButton* shareButton;
@property (nonatomic, strong) UIButton* saveButton;
@property (nonatomic, assign) id<PAEncourageViewDelegate> delegate;
@end
