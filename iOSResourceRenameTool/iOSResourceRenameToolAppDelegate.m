//
//  iOSResourceRenameToolAppDelegate.m
//  iOSResourceRenameTool
//
//  Created by stcui on 11-8-24.
//  Copyright 2011年 stcui. All rights reserved.
//

#import "iOSResourceRenameToolAppDelegate.h"

@implementation iOSResourceRenameToolAppDelegate
@synthesize window;
@synthesize keepTopCheckBox;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    
}

- (BOOL)applicationShouldHandleReopen:(NSApplication *)theApplication hasVisibleWindows:(BOOL)flag;
{
    [self.window makeKeyAndOrderFront:nil];
    return YES;
}

- (void)windowDidResignMain:(NSNotification *)notification
{
    // It's always nicer if the user has a choice
    if ([self.keepTopCheckBox state] == YES) {
        [[self window] setLevel:NSFloatingWindowLevel];
    } else {
        [[self window] setLevel:NSNormalWindowLevel];
    }
}

- (void)windowDidBecomeMain:(NSNotification *)notification
{
    [[self window] setLevel:NSNormalWindowLevel];
}
@end
