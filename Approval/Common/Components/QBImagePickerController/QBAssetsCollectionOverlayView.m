//
//  QBAssetsCollectionOverlayView.m
//  QBImagePickerController
//
//  Created by Tanaka Katsuma on 2014/01/01.
//  Copyright (c) 2014年 Katsuma Tanaka. All rights reserved.
//

#import "QBAssetsCollectionOverlayView.h"
#import <QuartzCore/QuartzCore.h>

// Views
#import "QBAssetsCollectionCheckmarkView.h"

@interface QBAssetsCollectionOverlayView ()

@property (nonatomic, strong) QBAssetsCollectionCheckmarkView *checkmarkView;

@end

@implementation QBAssetsCollectionOverlayView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        // View settings
//        self.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.6];
        
        self.backgroundColor=[UIColor colorWithRed:95/255.0 green:90/255.0 blue:185/255.0 alpha:0.6];
        
        // Create a checkmark view
//        QBAssetsCollectionCheckmarkView *checkmarkView = [[QBAssetsCollectionCheckmarkView alloc] initWithFrame:CGRectMake(self.bounds.size.width - (4.0 + 24.0), self.bounds.size.height - (4.0 + 24.0), 24.0, 24.0)];
//        checkmarkView.autoresizingMask = UIViewAutoresizingNone;
//        
//        checkmarkView.layer.shadowColor = [[UIColor grayColor] CGColor];
//        checkmarkView.layer.shadowOffset = CGSizeMake(0, 0);
//        checkmarkView.layer.shadowOpacity = 0.6;
//        checkmarkView.layer.shadowRadius = 2.0;
        
        UIImageView *checkmarkView                       = [[UIImageView alloc] init];
        checkmarkView.frame                              = CGRectMake(20, 20, 42.0f, 34.0f);
        [checkmarkView setImage:[UIImage imageNamed:@"gallery_select_icon.png"]];
        checkmarkView.layer.masksToBounds                = YES;
        
        
        [self addSubview:checkmarkView];
//        self.checkmarkView = checkmarkView;
    }
    
    return self;
}

@end
