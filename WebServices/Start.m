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

    mjsonGeo = [WebServices getWeatherWithLatitude:nLat AndLongitude:nLng];
    print(NSLog(@"mjsonGeo  = %@",mjsonGeo))
    ObjectResponse *object  = [Parser parseGeoObject];
    Coord *coordObject      = object.coord;
    float lat               = coordObject.lat;
    float lng               = coordObject.lon;
    
    NSString *stName        = object.name;
    
    print(NSLog(@"We are at %@ with latitude %f and longitude %f",stName, lat, lng))
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
