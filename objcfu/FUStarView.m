//
// Created by Johnny Sparks on 3/28/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import "FUStarView.h"
#import "FUStar.h"


@interface FUStarView ()
@property(nonatomic, strong) CAEmitterLayer *glowLayer;
@end

@implementation FUStarView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.glowLayer = [FUStarView glowEmitterLayer];
        [self setEffectsVisible:YES];
    }

    return self;
}

- (void)setStar:(FUStar *)star {
    _star = star;
    self.backgroundColor = UIColor.greenColor;
}

- (void)setEffectsVisible:(BOOL)visible {
    if(visible){
        BOOL added = (BOOL) self.glowLayer.superlayer;
        if(!added){
            [self.layer addSublayer:self.glowLayer];
        }
    } else {
        [self.glowLayer removeFromSuperlayer];
    }
}


- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.layer.cornerRadius = MIN(frame.size.height, frame.size.width) / 2.f;
}

+ (instancetype)reusableStarViewWithStar:(FUStar *)star {
    return nil;
}


+ (CAEmitterLayer *)glowEmitterLayer
{
    CAEmitterLayer *emitterLayer = [CAEmitterLayer layer];
    emitterLayer.emitterPosition = CGPointMake(10, 10);

    CAEmitterCell *emitterCell = [CAEmitterCell emitterCell];
    emitterCell.contents = (__bridge id)[[UIImage imageNamed:@"spark"] CGImage];

    emitterCell.birthRate = 5.0f;
    emitterCell.velocity = 1;
    emitterCell.velocityRange = 3;
    emitterCell.yAcceleration = 0;
    emitterCell.emissionLongitude = M_PI;
    emitterCell.emissionRange = M_PI;
    emitterCell.scale = 0.1f;
    emitterCell.scaleSpeed = 0.5f;
    emitterCell.scaleRange = 0.5f;
    emitterCell.color = [UIColor colorWithRed:0
                                       green:1
                                        blue:0
                                       alpha:0.2].CGColor;
    [emitterCell setLifetime:3.0f];
    [emitterCell setLifetimeRange:2.0f];
    emitterLayer.emitterCells = @[emitterCell];
    return emitterLayer;
}

@end