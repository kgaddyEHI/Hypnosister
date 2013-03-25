//
//  HypnosisView.m
//  Hypnosister
//
//  Created by kgaddy on 3/24/13.
//  Copyright (c) 2013 com.kgaddy. All rights reserved.

#import "HypnosisView.h"

@implementation HypnosisView
@synthesize circleColor;

-(BOOL)canBecomeFirstResponder
{
    return YES;
}

-(void)setCircleColor:(UIColor *)clr
{
    circleColor  = clr;
    [self setNeedsDisplay];
}

-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if(motion==UIEventSubtypeMotionShake){
        NSLog(@"Device started shaking");
        [self setCircleColor:[UIColor redColor]];
    }

 
}

-(void)drawRect:(CGRect)dirtyRect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
    //get the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width /2.0;
    center.y = bounds.origin.y + bounds.size.height /2.0;
    
    //the radious of the circle should be as big as the view
    //float maxRadius = hypot(bounds.size.width,bounds.size.height)/4.0;
    float maxRadius = hypot(bounds.size.width,bounds.size.height)/2.0;
    
    //stroke should be 10 points
    CGContextSetLineWidth(ctx, 10);
    [[self circleColor]setStroke];
    
    //make the color of the line gray
    //CGContextSetRGBStrokeColor(ctx, 0.6, 0.6, 0.6, 1.0);
    //[[UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:1]setStroke];
    
    //add a shape to the contect. This does not draw the shape
//    CGContextAddArc(ctx, center.x, center.y, maxRadius, 0.0, M_PI * 2.0, YES);
   // CGContextAddArc(ctx, center.x, center.y, maxRadius, 0.0, M_PI * 2.0, YES);
    
    //perform the drawing instruction.
    //CGContextStrokePath(ctx);
    
    
    // draw concentric circles from the outside in
    for(float currentRadius = maxRadius; currentRadius >0;currentRadius -=20)
    {
        //add path to context
        CGContextAddArc(ctx, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
        //perform drawing instruction
        CGContextStrokePath(ctx);
    }
    
    //create a string
    NSString *text = @"You are getting sleepy.";
    
    //get the font to draw in
    UIFont *font = [UIFont boldSystemFontOfSize:28];
    
    CGRect textRect;
    
    //how big is the string when drawn in the font?
    textRect.size = [text sizeWithFont:font];
    
    //put in the center
    textRect.origin.x = center.x - textRect.size.width /2.0;
    textRect.origin.y= center.y - textRect.size.height /2.0;
    
    
    //set the fill color of the current context to black
    [[UIColor blackColor]setFill];
    
    //The shadow will move 4 points to the right and 3 points down from the text.
    CGSize offset = CGSizeMake(4, 3);
    
    //the shadow will be dark gray in color.
    CGColorRef color = [[UIColor darkGrayColor]CGColor];
    
    //set the shadow of the contect with these parms.
    //all subsequent will be shadowed
    CGContextSetShadowWithColor(ctx, offset,2.0, color);
    
    
    //draw the string
    [text drawInRect:textRect withFont:font];
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        //all hyposisViews start witha  claear background
        [self setBackgroundColor:[UIColor clearColor]];
        [self setCircleColor:[UIColor lightGrayColor]];
        
        
    }
    return self;
}

@end
