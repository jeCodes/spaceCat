//
//  THSpaceCatNode.m
//  Space Cat
//
//  Created by Paul  on 2016-06-07.
//  Copyright © 2016 Treehouse. All rights reserved.
//

#import "THSpaceCatNode.h"


@interface THSpaceCatNode ()
@property (nonatomic) SKAction *tapAction;

@end
@implementation THSpaceCatNode

+ (instancetype) spaceCatAtPosition:(CGPoint)position {
    THSpaceCatNode *spaceCat = [self spriteNodeWithImageNamed:@"spacecat_1"];
    spaceCat.position = position;
    spaceCat.anchorPoint = CGPointMake(0.5, 0);
    spaceCat.name = @"SpaceCat";
    spaceCat.zPosition = 9;
    
    return spaceCat;
}

// what is a breakpoint? and how do you let the numbered rows exist in Xcode?


- (void) performTap {
    [self runAction:self.tapAction];
    
}

- (SKAction *) tapAction {
    if ( _tapAction != nil) {
        return _tapAction;
    
    }
    
    NSArray *textures = @[[SKTexture textureWithImageNamed:@"spacecat_2"], [SKTexture textureWithImageNamed:@"spacecat_1"]];
    _tapAction = [SKAction animateWithTextures:textures timePerFrame:0.25];
    return _tapAction;
}

@end
