//
//  THSpaceCatNode.h
//  Space Cat
//
//  Created by Paul  on 2016-06-07.
//  Copyright © 2016 Treehouse. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface THSpaceCatNode : SKSpriteNode


+ (instancetype) spaceCatAtPosition:(CGPoint)position;

- (void) performTap;

@end
