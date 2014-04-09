//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Jan Grassegger on 06.04.14.
//
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //All BNRHypnosisViews start with a clear background color
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
        
        UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Red", @"Green", @"Blue"]];
        _segmentedControl = segmentedControl;
        [_segmentedControl setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:self.segmentedControl];
        [self setNeedsUpdateConstraints ];
    }
    return self;
}

- (void)setCircleColor:(UIColor *)circleColor
{
    _circleColor = circleColor;
    [self setNeedsDisplay];
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    
    //Figure out the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    // Thelarges circle will circumscribe the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0
                      endAngle:M_PI*2.0
                     clockwise:YES];
    }
    
    //Configure line width to 10 pixels
    path.lineWidth = 10;
    
    //Configure the drawing color to light gray
    [self.circleColor setStroke];
    
    //Draw the line
    [path stroke];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@ was touched", self);
    
    //Get 3 random numbers between 0 and 1
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue = (arc4random() %  100) / 100.0;
    
    UIColor * randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    self.circleColor = randomColor;
}

- (void)updateConstraints
{
    NSLog(@"Updating constraints");
    // Center horizontally
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.segmentedControl
                                                     attribute:NSLayoutAttributeCenterX
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeCenterX
                                                    multiplier:1.0
                                                      constant:0.0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.segmentedControl
                                                    attribute:NSLayoutAttributeTop
                                                    relatedBy:NSLayoutRelationEqual
                                                       toItem:self
                                                    attribute:NSLayoutAttributeTop
                                                   multiplier:10
                                                      constant:20]];
    
    // Center vertically
    /*[self addConstraint:[NSLayoutConstraint constraintWithItem:centerView
     attribute:NSLayoutAttributeCenterY
     relatedBy:NSLayoutRelationEqual
     toItem:self
     attribute:NSLayoutAttributeCenterY
     multiplier:1.0
     constant:0.0]];*/
    [super updateConstraints];

}


@end
