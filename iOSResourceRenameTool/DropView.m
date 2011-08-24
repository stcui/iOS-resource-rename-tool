//
//  DropView.m
//  iOSResourceRenameTool
//
//  Created by stcui on 11-8-24.
//  Copyright 2011年 stcui. All rights reserved.
//

#import "DropView.h"

@implementation DropView
@synthesize properName;
@synthesize delegate;

- (id)initWithFrame:(NSRect)frameRect
{
    self = [super initWithFrame:frameRect];
    if (self) {
        [self registerForDraggedTypes:
         [NSArray arrayWithObjects:NSTIFFPboardType,NSFilenamesPboardType,nil]];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self registerForDraggedTypes:
     [NSArray arrayWithObjects: NSFilenamesPboardType, nil]];
}

- (BOOL)acceptsFirstResponder {
    return YES;
}

- (BOOL)becomeFirstResponder {
    [self setNeedsDisplay:YES];
    return YES;
}

- (BOOL)resignFirstResponder
{
    NSLog(@"Resigning");
    [self setKeyboardFocusRingNeedsDisplayInRect:[self bounds]];
    return YES;
}  

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    if (([[self window] firstResponder] == self) &&
        [NSGraphicsContext currentContextDrawingToScreen]) {
        [NSGraphicsContext saveGraphicsState];
        NSSetFocusRingStyle(NSFocusRingOnly);
        NSRect bounds = NSInsetRect([self borderRect], 3, 3);
        bounds.size.height -= 5;
        [NSBezierPath fillRect:bounds];
        [NSGraphicsContext restoreGraphicsState];
    }
}

- (NSDragOperation)draggingEntered:(id )sender
{
    if ((NSDragOperationGeneric & [sender draggingSourceOperationMask])
        == NSDragOperationGeneric) {
        NSPasteboard *pboard = [sender draggingPasteboard];
        if ([[pboard types] containsObject:NSFilenamesPboardType]) {
            if ([[pboard propertyListForType:NSFilenamesPboardType] count] > 1) {
                return NSDragOperationNone;
            }
        }
        [self.window makeFirstResponder:self];
        return NSDragOperationGeneric;
        
    } // end if
    
    // not a drag we can use
    return NSDragOperationNone;
    
} // end draggingEntered

- (BOOL)performDragOperation:(id <NSDraggingInfo>)sender
{
    NSPasteboard *pboard = [sender draggingPasteboard];
    
    if ( [[pboard types] containsObject:NSFilenamesPboardType] ) {
        NSArray *files = [pboard propertyListForType:NSFilenamesPboardType];
    
        // Perform operation using the list of files
        [self.delegate dropView:self fileDropped:[files lastObject]];

        NSLog(@"dragged file %@", [files lastObject]);
        
    }
    
    return YES;
}

- (BOOL)prepareForDragOperation:(id )sender {
    return YES;
} 

- (void)concludeDragOperation:(id )sender {
    if (self.window.firstResponder == self) {
        [self.window makeFirstResponder:nil];
    }
} // end concludeDragOperation
@end
