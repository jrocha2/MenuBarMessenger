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
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let icon = NSImage(named: "statusIcon")
        icon!.template = true   // Changes icon a bit if in dark mode
        statusItem.image = icon
        statusItem.action = Selector("togglePopover:")
        
        popover.contentViewController = TabViewController(nibName: "TabViewController", bundle: nil)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func togglePopover(sender: AnyObject?) {
        if popover.shown {
            popover.performClose(sender)
        } else {
            if let button = statusItem.button {
                popover.showRelativeToRect(button.bounds, ofView: button, preferredEdge: NSRectEdge.MinY)
            }
        }
    }
    
    
}

