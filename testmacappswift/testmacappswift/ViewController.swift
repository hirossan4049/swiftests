//
//  ViewController.swift
//  testmacappswift
//
//  Created by unkonow on 2020/07/14.
//  Copyright © 2020 unkonow. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    var addedObserver = false

    override func viewDidLoad() {
        super.viewDidLoad()
        print("View Did Load")
        if let window = self.view.window {
            // custom window here
            window.level = .floating
        } else {
            addedObserver = true
            self.addObserver(self, forKeyPath: "view.window", options: [.new, .initial], context: nil)
        }
        self.view.window?.level = .floating
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let window = self.view.window {
            window.level = .floating
        }
    }

    deinit {
        if addedObserver {
            self.removeObserver(self, forKeyPath: "view.window")
        }
    }


}

