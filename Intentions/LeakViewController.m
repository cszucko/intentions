//
//  LeakViewController.m
//  Intentions
//
//  Created by Christopher Szucko on 4/18/14.
//  Copyright (c) 2014 Chris Eidhof. All rights reserved.
//

#import "LeakViewController.h"
#import "ViewController.h"

@interface LeakViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation LeakViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (!self.textView.text) {
        self.textView.text = @"";
    }
    
    [self updateTextView];
    [self performSelector:@selector(updateTextView) withObject:nil afterDelay:2.0];
}

- (void)updateTextView {
    self.textView.text = [self.textView.text stringByAppendingFormat:@"===== %@ =====\n", [[NSDate alloc] init]];
    if (self.leakedObservationInfo) {
        if (self.observedObject) {
            self.textView.text = [self.textView.text stringByAppendingFormat:@"Observed Object: %p\n%@\n\n", self.observedObject, [((NSObject *)self.observedObject) description]];
        } else {
            self.textView.text = [self.textView.text stringByAppendingFormat:@"Observed Object: %p\n%@\n\n", self.observedObjectAddress, @"Object was deallocated"];
        }
        self.textView.text = [self.textView.text stringByAppendingFormat:@"Observation Info: %p\n%@\n\n", self.leakedObservationInfo, [((NSObject *)self.leakedObservationInfo) description]];
    } else {
        self.textView.text = [self.textView.text stringByAppendingString:@"No leaked observation information.\n\n"];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ((ViewController *)segue.destinationViewController).leakViewController = self;
}

@end
