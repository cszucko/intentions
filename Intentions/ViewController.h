//
//  ViewController.h
//  Intentions
//
//  Created by Chris Eidhof on 16/03/14.
//  Copyright (c) 2014 Chris Eidhof. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeakViewController.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) LeakViewController *leakViewController;

@end
