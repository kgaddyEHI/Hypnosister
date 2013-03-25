//
//  HypnosisterAppDelegate.m
//  Hypnosister
//
//  Created by kgaddy on 3/22/13.
//  Copyright (c) 2013 com.kgaddy. All rights reserved.
//

#import "HypnosisterAppDelegate.h"
#import "HypnosisView.h"

@implementation HypnosisterAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    CGRect screenRect = [[self window]bounds];
    
    //create a UI scroll view to have the size of the window matchin its size.
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:screenRect];
    [scrollView setPagingEnabled:YES];
    
    [[self window]addSubview:scrollView];
    
    //create the hpynosisView with a frame that is twice the size of the screen.
    CGRect bigRect  = screenRect;
    bigRect.size.width *=2.0;
   // bigRect.size.height *=2.0;
    //HypnosisView *view =[[HypnosisView alloc]initWithFrame:bigRect];
    HypnosisView *view =[[HypnosisView alloc]initWithFrame:screenRect];
    
    //move the rectangle fro the other view to the right, just off the screen.
    screenRect.origin.x = screenRect.size.width;
    HypnosisView *anotherView = [[HypnosisView alloc]initWithFrame:screenRect];
    [scrollView addSubview:anotherView ];
    
    //add the view as a subview of the scrollview instead of the window.
    [scrollView addSubview:view];
    
    //tell the scrollview how big its virtual world is.
    [scrollView setContentSize:bigRect.size];
    
    
    
    //CGRect viewFrame = CGRectMake(160, 240, 100, 150);
//    HypnosisView *view = [[HypnosisView alloc] initWithFrame:viewFrame];
  //  HypnosisView *view = [[HypnosisView alloc] initWithFrame:[[self window]bounds]];
    //[view setBackgroundColor:[UIColor redColor]];
   // [[self window] addSubview:view];
    
    BOOL success  = [view becomeFirstResponder];
    if(success)
    {
        NSLog(@"HypnosisView became the first responder");
        
    }else{
        NSLog(@"Could not became the first responder");
    }
    
    
    //CGRect anotherViewFrame = CGRectMake(29, 30, 50, 50);
    //HypnosisView *anotherView = [[HypnosisView alloc] initWithFrame:anotherViewFrame];
    //[anotherView setBackgroundColor:[UIColor blueColor]];
    //[view addSubview:anotherView];
    //[[self window] addSubview:anotherView];
    
    
    
    

    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
