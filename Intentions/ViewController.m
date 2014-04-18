#import "ViewController.h"
#import "ModelContainer.h"
#import "Person.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet ModelContainer* modelContainer;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    Person *person = [Person new];
    person.name = @"Chris";
    self.modelContainer.model = person;
}

- (void)viewWillDisappear:(BOOL)animated {
    self.leakViewController.observedObject = [self modelContainer];
    self.leakViewController.observedObjectAddress = (__bridge void *)([self modelContainer]);
    self.leakViewController.leakedObservationInfo = [self.modelContainer observationInfo];
}

@end