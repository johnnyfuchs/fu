//
// Created by Johnny Sparks on 3/28/15.
// Copyright (c) 2015 Johnny Sparks. All rights reserved.
//

#import "FUStarView.h"
#import "FUStar.h"


@interface FUStarView ()
@property(nonatomic, strong) CAEmitterCell *particle;
@end

@implementation FUStarView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.particle = [CAEmitterCell emitterCell];
        self.particle.scaleSpeed = 10;
        self.particle.lifetime = 2.481715;
        self.particle.velocity = 332.3636968085106;
        self.particle.contents = [UIImage imageNamed:@"spark.png"];
        self.particle.name = @"New Emitter";
        self.particle.color = [[UIColor colorWithRed:0.50 green:0.00 blue:1.00 alpha:1.00] CGColor];
        self.particle.scaleRange = 4.178236607142859;
        self.particle.lifetimeRange = 1.6;
        self.particle.greenRange = -2.775558e-17;
        self.particle.birthRate = 40;
        self.particle.emissionRange = -6.283185306666667;
        self.particle.scale = 0;
    }

    return self;
}

- (void)setStar:(FUStar *)star {
    _star = star;
    self.backgroundColor = UIColor.greenColor;
}


- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.layer.cornerRadius = MIN(frame.size.height, frame.size.width) / 2.f;
}

+ (instancetype)reusableStarViewWithStar:(FUStar *)star {
    return nil;
}

@end