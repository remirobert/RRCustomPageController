//
//  RRPageController.h
//  RRCustomPageController
//
//  Created by Remi Robert on 19/07/14.
//  Copyright (c) 2014 remirobert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RRPageController : UIViewController

@property (nonatomic, strong) UIImage *imagePage;
@property (nonatomic, strong) NSString *titlePage;

- (instancetype) initWithTitle:(NSString *)title;
- (instancetype) initWithImage:(UIImage *)image;

@end
