//
//  ViewController.h
//  WebServices
//
//  Created by Luis de Jesus Martin Castillo on 15/07/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebServices.h"
#import "Declarations.h"

@interface Start : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *labelCity;
@property (strong, nonatomic) IBOutlet UILabel *labelCityValue;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

- (IBAction)loadWeather:(id)sender;

@end

