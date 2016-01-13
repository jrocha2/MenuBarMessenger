//
//  AppDelegate.swift
//  Menu Bar Messenger
//
//  Created by John Rocha on 1/9/16.
//  Copyright © 2016 John Rocha. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let popover = NSPopover()
    var eventMonitor: EventMonitor?
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let icon = NSImage(named: "statusIconBlack")
        icon!.template = true   // Changes icon a bit if in dark mode
        statusItem.image = icon
        statusItem.action = Selector("togglePopover:")
        
        popover.contentViewController = TabViewController(nibName: "TabViewController", bundle: nil)
        
        // Close popover if left or right click detected outside of this application
        eventMonitor = EventMonitor(mask: [.LeftMouseDownMask, .RightMouseDownMask]) { [unowned self] event in
            if self.popover.shown {
                self.closePopover(event)
            }
        }
        eventMonitor?.start()
    }
    
    // Toggles the popover view coming from the menu bar button
    func togglePopover(sender: AnyObject?) {
        if popover.shown {
            closePopover(sender)
        } else {
            openPopover(sender)
        }
    }
    
    // If menu bar button pressed, open popover under that button
    func openPopover(sender: AnyObject?) {
        if let button = statusItem.button {
            popover.showRelativeToRect(button.bounds, ofView: button, preferredEdge: NSRectEdge.MinY)
        }
        eventMonitor?.start()
    }
    
    // Close the popover 
    func closePopover(sender: AnyObject?) {
        popover.performClose(sender)
        eventMonitor?.stop()
    }
}

