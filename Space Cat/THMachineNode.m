//
//  THMachineNode.m
//  Space Cat
//
//  Created by Paul  on 2016-06-07.
//  Copyright © 2016 Treehouse. All rights reserved.
//

#import "THMachineNode.h"

@implementation THMachineNode

+ (instancetype) machineAtPosition:(CGPoint)position {
THMachineNode *machine = [self spriteNodeWithImageNamed:@"machine_1"];
machine.position = position;
machine.name = @"Machine";
machine.anchorPoint = CGPointMake(0.5, 0);
    machine.zPosition = 8;
    
NSArray *textures = @[[SKTexture textureWithImageNamed:@"machine_1"],
                      [SKTexture textureWithImageNamed:@"machine_2"]];
    
    SKAction *machineAnimation = [SKAction animateWithTextures:textures timePerFrame:.10];
    
    SKAction *machineRepeat = [SKAction repeatActionForever:machineAnimation];
    [machine runAction:machineRepeat]; // this line is to run the action of all the code mentioned above.
return machine;
    
}
@end
