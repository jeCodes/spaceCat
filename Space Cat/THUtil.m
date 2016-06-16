//
//  THUtil.m
//  Space Cat
//
//  Created by Paul  on 2016-06-11.
//  Copyright © 2016 Treehouse. All rights reserved.
//

#import "THUtil.h"

@implementation THUtil

+ (NSInteger) randomWithMin:(NSInteger)min max: (NSInteger)max {
    return arc4random()%(max - min) + min;
}


@end
