//
//  ViewController.m
//  ObjectiveC-UIKit
//
//  Created by Glenn Ludszuweit on 15/05/2023.
//

#import "ViewController.h"
#import "PersonViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"Not Working");
}

- (IBAction)goToPersonPage:(id)sender {
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PersonViewController* personVC = [storyboard instantiateViewControllerWithIdentifier:@"PersonViewController"];
    [self.navigationController pushViewController:personVC animated:true];
}

@end
