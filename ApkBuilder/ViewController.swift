//
//  ViewController.swift
//  ApkBuilder
//
//  Created by Amit Shekhar on 08/05/16.
//  Copyright © 2016 Amit Shekhar. All rights reserved.
//

import Cocoa

import Foundation

import SwiftShell

class ViewController: NSViewController {

    
    @IBOutlet weak var textParentFolderLocation: NSTextField!
    
    
    @IBOutlet weak var textJsonSeedFileLocation: NSTextField!
    
    
    @IBOutlet weak var textJavaSeedFileLocation: NSTextField!
    
    
    @IBOutlet weak var textResHdpiFolderLocation: NSTextField!
    
    
    @IBOutlet weak var textResXHdpiFolderLocation: NSTextField!
    
    
    @IBOutlet weak var textSeededPackIds: NSTextField!
    
    
    @IBOutlet weak var textApkVersions: NSTextField!
    
    
    @IBOutlet weak var textTerminal: NSScrollView!
    
    
    @IBOutlet weak var progress: NSProgressIndicator!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.progress.hidden = true
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    
    
    @IBAction func parentFolderLocationChooser(sender: AnyObject) {
        let openPanel = NSOpenPanel()
        openPanel.canChooseFiles = false
        openPanel.canChooseDirectories = true
        openPanel.resolvesAliases = true
        openPanel.allowsMultipleSelection = false
        openPanel.title = "Choose"
        openPanel.beginWithCompletionHandler({(result:Int) in
            if(result == NSFileHandlingPanelOKButton){
                let folderURL = openPanel.URL!.path
                self.textParentFolderLocation.stringValue = folderURL!
                print(folderURL!)
            }
        })
    }
    
    
    @IBAction func jsonSeedFileLocationChooser(sender: AnyObject) {
        let openPanel = NSOpenPanel()
        openPanel.allowedFileTypes = ["json"]
        openPanel.canChooseFiles = true
        openPanel.canChooseDirectories = false
        openPanel.resolvesAliases = true
        openPanel.allowsMultipleSelection = false
        openPanel.title = "Choose"
        openPanel.beginWithCompletionHandler({(result:Int) in
            if(result == NSFileHandlingPanelOKButton){
                let folderURL = openPanel.URL!.path
                self.textJsonSeedFileLocation.stringValue = folderURL!
                print(folderURL!)
            }
        })
    }
    
    
    @IBAction func javaSeedFileLocationChooser(sender: AnyObject) {
        let openPanel = NSOpenPanel()
        openPanel.allowedFileTypes = ["java"]
        openPanel.canChooseFiles = true
        openPanel.canChooseDirectories = false
        openPanel.resolvesAliases = true
        openPanel.allowsMultipleSelection = false
        openPanel.title = "Choose"
        openPanel.beginWithCompletionHandler({(result:Int) in
            if(result == NSFileHandlingPanelOKButton){
                let folderURL = openPanel.URL!.path
                self.textJavaSeedFileLocation.stringValue = folderURL!
                print(folderURL!)
            }
        })
    }
    

    @IBAction func resHdpiFolderLocationChooser(sender: AnyObject) {
        let openPanel = NSOpenPanel()
        openPanel.canChooseFiles = false
        openPanel.canChooseDirectories = true
        openPanel.resolvesAliases = true
        openPanel.allowsMultipleSelection = false
        openPanel.title = "Choose"
        openPanel.beginWithCompletionHandler({(result:Int) in
            if(result == NSFileHandlingPanelOKButton){
                let folderURL = openPanel.URL!.path
                self.textResHdpiFolderLocation.stringValue = folderURL!
                print(folderURL!)
            }
        })
    }

    @IBAction func resXHdpiFolderLocationChooser(sender: AnyObject) {
        let openPanel = NSOpenPanel()
        openPanel.canChooseFiles = false
        openPanel.canChooseDirectories = true
        openPanel.resolvesAliases = true
        openPanel.allowsMultipleSelection = false
        openPanel.title = "Choose"
        openPanel.beginWithCompletionHandler({(result:Int) in
            if(result == NSFileHandlingPanelOKButton){
                let folderURL = openPanel.URL!.path
                self.textResXHdpiFolderLocation.stringValue = folderURL!
                print(folderURL!)
            }
        })
    }
    
    @IBAction func build(sender: AnyObject) {
        createDirForMapping()
        getPermission()
        buildApk()
    }
    
    func createDirForMapping(){
        do {
            try NSFileManager.defaultManager().createDirectoryAtPath(self.textParentFolderLocation.stringValue+"/app/build/outputs/mapping/release", withIntermediateDirectories: true, attributes: nil)
        } catch let error as NSError {
            print(error.localizedDescription);
        }
    }
    
    func getPermission(){
        
        run("chmod","+x",self.textParentFolderLocation.stringValue+"/gradlew")
        
        self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nPermission Granted"))
    }
    
    
    func buildApk() {
        self.progress.hidden = false
        self.progress.startAnimation(self)
        self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nBuild Started"))
        let taskQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)
        dispatch_async(taskQueue) {

            let command = runAsync(self.textParentFolderLocation.stringValue+"/gradlew","--build-file",self.textParentFolderLocation.stringValue+"/build.gradle","--settings-file",self.textParentFolderLocation.stringValue+"/settings.gradle","assembleRelease")
            
            do{
                try command.finish()
                print("Build Ready")
                self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nBuild Ready"))
            }catch {
                print("Build Failed")
                self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nBuild Failed"))
            }
            
            dispatch_async(dispatch_get_main_queue(), {
                self.progress.stopAnimation(self)
                self.progress.hidden = true
            })
            
        }
        
    }
    
}

