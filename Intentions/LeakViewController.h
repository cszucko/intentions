//
//  LeakViewController.h
//  Intentions
//
//  Created by Christopher Szucko on 4/18/14.
//  Copyright (c) 2014 Chris Eidhof. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeakViewController : UIViewController

@property (weak, nonatomic) NSObject *observedObject;
@property (assign, nonatomic) void *observedObjectAddress;
@property (assign, nonatomic) void *leakedObservationInfo;

@end
