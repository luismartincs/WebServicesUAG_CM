//
//  ViewController.m
//  WebServices
//
//  Created by Luis de Jesus Martin Castillo on 15/07/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import "Start.h"


#define nLat @"20.694073"
#define nLng @"-103.421259"

@interface Start ()

@end

@implementation Start

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loadWeather:(id)sender {
    [_indicator startAnimating];
    [self queueLoadData];
}

-(void)queueLoadData{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    
    NSOperationQueue *queue = [NSOperationQueue new];
    
    NSInvocationOperation *opGet = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(loadData) object:nil];
    [queue addOperation:opGet];
    
     NSInvocationOperation *opDidGet = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(didLoadData) object:nil];
    [opDidGet addDependency:opGet];
    
    [queue addOperation:opDidGet];
    
}

-(void)loadData{
    mjsonGeo = [WebServices getWeatherWithLatitude:nLat AndLongitude:nLng];
    print(NSLog(@"mjsonGeo  = %@",mjsonGeo))

}

-(void)didLoadData{
    
    dispatch_async(dispatch_get_main_queue(), ^{
    
        ObjectResponse *object  = [Parser parseGeoObject];
        Coord *coordObject      = object.coord;
        float lat               = coordObject.lat;
        float lng               = coordObject.lon;
        NSString *stName        = object.name;
        
        _labelCityValue.text= object.name;
        [_indicator stopAnimating];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        print(NSLog(@"We are at %@ with latitude %f and longitude %f",stName, lat, lng));
        
    });
}

@end
