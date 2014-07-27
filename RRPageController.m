//
//  RRPageController.m
//  RRCustomPageController
//
//  Created by Remi Robert on 19/07/14.
//  Copyright (c) 2014 remirobert. All rights reserved.
//

#import "RRPageController.h"

@interface RRPageController ()

@end

@implementation RRPageController

- (instancetype) initWithTitle:(NSString *)title {
    if (self = [super init]) {
        _titlePage = title;
    }
    return (self);
}

- (instancetype) initWithImage:(UIImage *)image {
    if (self = [super init]) {
        _imagePage = image;
    }
    return (self);
}

@end
