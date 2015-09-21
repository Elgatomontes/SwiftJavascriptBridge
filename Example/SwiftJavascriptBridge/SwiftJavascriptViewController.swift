//
//  SwiftJavascriptIntegration.swift
//  SwiftJavascriptBridge
//
//  Created by Gaston Montes on 18/9/15.
//  Copyright © 2015 CocoaPods. All rights reserved.
//

import SwiftJavascriptBridge
import Foundation
import UIKit

class SwiftJavascriptViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Constants.
    private let kNibName: String = "SwiftJavascriptViewController"
    private let kCellIdentifier = "ExampleCell"
    private let kJSWebURL = "https://dl.dropboxusercontent.com/u/64786881/JSSwiftBridge.html"
    
    // MARK: - Vars.
    private var messagesFromJS = NSMutableDictionary()
    private var bridge: SwiftJavascriptBridge = SwiftJavascriptBridge.bridgeForURLString()
    
    // MARK: - Initialization.
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName:kNibName, bundle:NSBundle.mainBundle())
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - View life cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.bridge.bridgeAddHandler(self, handlerName: "firstFunction")
        self.bridge.bridgeLoadScriptFromURL(kJSWebURL)
    }
    
    // MARK: - UITableViewDatasource implementation.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagesFromJS.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier, forIndexPath: indexPath) as UITableViewCell
        return cell
    }
    
    // MARK: - Functions to be called by JS.
    func firstFunction() {
    }
}
