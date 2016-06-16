//
//  THGameOverNode.h
//  Space Cat
//
//  Created by paulBookAir on 2016-06-16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface THGameOverNode : SKNode

+ (instancetype) gameOverAtPosition: (CGPoint)position;

- (void) performAnimation;

@end
