# RRCustomPageController

[![CI Status](http://img.shields.io/travis/remirobert/RRCustomPageController.svg?style=flat)](https://travis-ci.org/remirobert/RRCustomPageController)
[![Version](https://img.shields.io/cocoapods/v/RRCustomPageController.svg?style=flat)](http://cocoadocs.org/docsets/RRCustomPageController)
[![License](https://img.shields.io/cocoapods/l/RRCustomPageController.svg?style=flat)](http://cocoadocs.org/docsets/RRCustomPageController)
[![Platform](https://img.shields.io/cocoapods/p/RRCustomPageController.svg?style=flat)](http://cocoadocs.org/docsets/RRCustomPageController)

## Usage

``` Objective-c
#import "RRViewController.h"
#import "RRCustomPageController.h"
#import "RRPageController.h"
#import "RRViewController1.h"

@interface RRViewController ()

@end

@implementation RRViewController

- (void) viewDidAppear:(BOOL)animated {
    RRViewController1 *c1 = [[RRViewController1 alloc] initWithTitle:@"title1"];
    RRViewController1 *c2 = [[RRViewController1 alloc] initWithTitle:@"title2"];
    RRViewController1 *c3 = [[RRViewController1 alloc] initWithTitle:@"title3"];
    RRViewController1 *c4 = [[RRViewController1 alloc] initWithTitle:@"title4"];
    
    
    RRCustomPageController *controller = [[RRCustomPageController alloc] initWithControllers:@[c1, c2, c3, c4]];
  
    controller.menuBar.backgroundColor = [UIColor colorWithRed:0.842 green:0.000 blue:0.000 alpha:1.000];
    [self presentViewController:controller animated:NO completion:nil];
}
```

## Installation

RRCustomPageController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "RRCustomPageController"

## Author

remirobert, remi.robert@epitech.eu

## License

RRCustomPageController is available under the MIT license. See the LICENSE file for more info.

