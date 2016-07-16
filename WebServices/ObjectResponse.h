//
//  ObjectResponse.h
//  WebServices
//
//  Created by Luis de Jesus Martin Castillo on 15/07/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coord.h"

@interface ObjectResponse : NSObject

@property (nonatomic,strong) Coord *coord;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *laonda;
@end
