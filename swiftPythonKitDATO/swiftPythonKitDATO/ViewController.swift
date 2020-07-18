//
//  ViewController.swift
//  swiftPythonKitDATO
//
//  Created by unkonow on 2020/07/18.
//  Copyright © 2020 unkonow. All rights reserved.
//

import Cocoa
import Foundation
import PythonKit
import Python
import WebKit

class ViewController: NSViewController {
    
    @IBOutlet weak var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Python.versionInfo)

        let path = URL(string: "\(#file)", relativeTo: URL(fileURLWithPath: FileManager.default.currentDirectoryPath))?.path
        let __file__ = path as! NSString

        let sys = Python.import("sys")
        let os = Python.import("os")
        print(os.system("ls /Users/unkonow/Documents/pg/swift/nowProject/swiftest/swiftPythonKitDATO/swiftPythonKitDATO/"))
        print(os.getcwd())
        sys.path.append(__file__.deletingLastPathComponent + "/") // example.pyのあるディレクトリへのパス
        sys.path.append(os.getcwd())

        print(Python.version)
        print(sys.path)
        print(__file__.deletingLastPathComponent)
        print("Python \(sys.version_info.major).\(sys.version_info.minor)")
        print("Python Version: \(sys.version)")
        print("Python Encoding: \(sys.getdefaultencoding().upper())")
        let example = Python.import("unko")
        

//        example?.hello() // Pythonのファンクションをよぶ
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    
    func test(){
        if let url = NSURL(string: "https://www.youtube.com/watch_popup?v=Ga540v27NpE") {
            let request = NSURLRequest(url: url as URL)
            webView.load(request as URLRequest)
        }
    }
    


}


