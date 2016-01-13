//
//  TabViewController.swift
//  Menu Bar Messenger
//
//  Created by John Rocha on 1/11/16.
//  Copyright © 2016 John Rocha. All rights reserved.
//

import Cocoa
import WebKit

class TabViewController: NSViewController {

    @IBOutlet weak var webView: WebView!
    var notifications = 0

    override func viewDidLoad() {
        webView.mainFrameURL = "https://app.groupme.com"
        super.viewDidLoad()
    }
    
}
