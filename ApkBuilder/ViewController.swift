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

    
    @IBOutlet weak var textApkFolderLocation: NSTextField!
    
    
    @IBOutlet weak var textTerminal: NSScrollView!
    
    
    @IBOutlet weak var progress: NSProgressIndicator!
   
    
    @IBOutlet weak var textApkVersionName: NSTextField!
    
    @IBOutlet weak var radioButtonAllApk: NSButton!
    
    
    @IBOutlet weak var radioButtonOneApk: NSButton!
    
    
    @IBOutlet weak var textApkVersionCodeOne: NSTextField!
    
    
    @IBOutlet weak var textApkVersionCodeTwo: NSTextField!
    
    
    @IBOutlet weak var textApkVersionCodeThree: NSTextField!
    
    
    @IBOutlet weak var textApkVersionCodeFour: NSTextField!
    
    
    @IBOutlet weak var textApkVersionCodeFive: NSTextField!
    
    
    @IBOutlet weak var textApkVersionCodeSix: NSTextField!
    
    
    var isAllApkRequired = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.progress.hidden = true
        radioButtonAllApk.state = 1
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
    
    
    @IBAction func apkFolderLocationChooserLocation(sender: AnyObject) {
        let openPanel = NSOpenPanel()
        openPanel.canChooseFiles = false
        openPanel.canChooseDirectories = true
        openPanel.resolvesAliases = true
        openPanel.allowsMultipleSelection = false
        openPanel.title = "Choose"
        openPanel.beginWithCompletionHandler({(result:Int) in
            if(result == NSFileHandlingPanelOKButton){
                let folderURL = openPanel.URL!.path
                self.textApkFolderLocation.stringValue = folderURL!
                print(folderURL!)
            }
        })
    }
    
    
    @IBAction func openApkFolder(sender: AnyObject) {
        if !textApkFolderLocation.stringValue.isEmpty{
            run("open",self.textApkFolderLocation.stringValue)
        }else{
            self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nApk folder location not provided"))
        }
    }
    
    
    @IBAction func allApkButton(sender: AnyObject) {
        isAllApkRequired = true
        radioButtonAllApk.state = 1
        radioButtonOneApk.state = 0
        textApkVersionCodeOne.hidden = false
        textApkVersionCodeTwo.hidden = false
        textApkVersionCodeThree.hidden = false
        textApkVersionCodeFour.hidden = false
        textApkVersionCodeFive.hidden = false
        textApkVersionCodeSix.hidden = false
    }
    
    
    @IBAction func oneApkButton(sender: AnyObject) {
        isAllApkRequired = false
        radioButtonAllApk.state = 0
        radioButtonOneApk.state = 1
        textApkVersionCodeOne.hidden = false
        textApkVersionCodeTwo.hidden = true
        textApkVersionCodeThree.hidden = true
        textApkVersionCodeFour.hidden = true
        textApkVersionCodeFive.hidden = true
        textApkVersionCodeSix.hidden = true
    }
    
    
    @IBAction func build(sender: AnyObject) {
        if !isInitialCheckPass(){
            return
        }
        getPermission()
        createDirForMapping()
        if isAllApkRequired{
            buildApk()
        }else{
            buildSingleApk()
        }
    }
    
    
    @IBAction func buildWithNewSeed(sender: AnyObject) {
        if !isInitialCheckPass(){
            return
        }
        getPermission()
        createDirForMapping()
        if isValidForNewSeed(){
            deleteOldResources()
            replaceSeedJSONFile()
            replaceSeedJAVAFile()
            addNewResources()
            if isAllApkRequired{
                buildApk()
            }else{
                buildSingleApk()
            }
        }
    }
    
    func isInitialCheckPass() -> Bool {
        if textParentFolderLocation.stringValue.isEmpty{
            self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nPlease provide parent directory path of project"))
            return false
        }
        if textApkFolderLocation.stringValue.isEmpty{
            self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nPlease provide apk folder location"))
            return false
        }
        if textApkVersionName.stringValue.isEmpty{
            self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nPlease provide apk version name"))
            return false
        }
        if isAllApkRequired{
            if textApkVersionCodeOne.stringValue.isEmpty{
                self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nPlease provide first apk version code"))
                return false
            }
            if textApkVersionCodeTwo.stringValue.isEmpty{
                self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nPlease provide second apk version code"))
                return false
            }
            if textApkVersionCodeThree.stringValue.isEmpty{
                self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nPlease provide third apk version code"))
                return false
            }
            if textApkVersionCodeFour.stringValue.isEmpty{
                self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nPlease provide fourth apk version code"))
                return false
            }
            if textApkVersionCodeFive.stringValue.isEmpty{
                self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nPlease provide fifth apk version code"))
                return false
            }
            if textApkVersionCodeSix.stringValue.isEmpty{
                self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nPlease provide sixth apk version code"))
                return false
            }
        }else{
            if textApkVersionCodeOne.stringValue.isEmpty{
                self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nPlease provide apk version code"))
                return false
            }
        }
        return true
    }
    
    func isValidForNewSeed() -> Bool {
        if textJsonSeedFileLocation.stringValue.isEmpty{
            self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nPlease provide path of JSON seed"))
            return false
        }else if textJavaSeedFileLocation.stringValue.isEmpty{
            self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nPlease provide path of JAVA seed"))
            return false
        }else if textResHdpiFolderLocation.stringValue.isEmpty{
            self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nPlease provide path of HDPI resources"))
            return false
        }else if textResXHdpiFolderLocation.stringValue.isEmpty{
            self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nPlease provide path of XHDPI resources"))
            return false
        }
        return true
    }
    
    func deleteOldResources(){
        self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nDeleting Old Resources"))
        let filemanager:NSFileManager = NSFileManager()

        let pathHdpi = self.textParentFolderLocation.stringValue+"/app/src/main/res/drawable-hdpi/"
        let filesHdpi = filemanager.enumeratorAtPath(pathHdpi)
        while let fileHdpi = filesHdpi?.nextObject() {
            if fileHdpi.hasPrefix("seed_"){
                do{
                    try filemanager.removeItemAtPath(pathHdpi+(fileHdpi as! String))
                    print("File deleted")
                }catch{
                    print("File delete failed")
                }
            }
        }
        
        let pathXHdpi = self.textParentFolderLocation.stringValue+"/app/src/main/res/drawable-xhdpi/"
        let filesXHdpi = filemanager.enumeratorAtPath(pathXHdpi)
        while let fileXHdpi = filesXHdpi?.nextObject() {
            if fileXHdpi.hasPrefix("seed_"){
                do{
                    try filemanager.removeItemAtPath(pathXHdpi+(fileXHdpi as! String))
                    print("File deleted")
                }catch{
                    print("File delete failed")
                }
            }
        }
        self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nOld Resources Deletion done"))
    }
    
    func addNewResources(){
        self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nAdding New Resources"))
        let filemanager:NSFileManager = NSFileManager()
        
        let pathHdpiProject = self.textParentFolderLocation.stringValue+"/app/src/main/res/drawable-hdpi/"

        let pathHdpiProvided = self.textResHdpiFolderLocation.stringValue+"/"
        
        let filesHdpiProvided = filemanager.enumeratorAtPath(pathHdpiProvided)
        
        while let fileHdpiProvided = filesHdpiProvided?.nextObject() {
            do{
                try filemanager.copyItemAtPath(pathHdpiProvided+(fileHdpiProvided as! String), toPath: pathHdpiProject+(fileHdpiProvided as! String))
                print("Copy successful")
            }catch{
                print("Copy failed")
            }
        }
        
        
        let pathXHdpiProject = self.textParentFolderLocation.stringValue+"/app/src/main/res/drawable-xhdpi/"
        
        let pathXHdpiProvided = self.textResXHdpiFolderLocation.stringValue+"/"
        
        let filesXHdpiProvided = filemanager.enumeratorAtPath(pathXHdpiProvided)
        
        while let fileXHdpiProvided = filesXHdpiProvided?.nextObject() {
            do{
                try filemanager.copyItemAtPath(pathXHdpiProvided+(fileXHdpiProvided as! String), toPath: pathXHdpiProject+(fileXHdpiProvided as! String))
                print("Copy successful")
            }catch{
                print("Copy failed")
            }
        }
        self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nNew Resources Addition done"))
    }
    
    func replaceSeedJSONFile(){
        self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nReplacing Seed JSON File"))
        let filemanager:NSFileManager = NSFileManager()
        
        let seedJSONFilePathProject = self.textParentFolderLocation.stringValue+"/app/src/main/res/raw/seed.json"
        
        let seedJSONFilePathProvided = self.textJavaSeedFileLocation.stringValue
        
        do{
            try filemanager.removeItemAtPath(seedJSONFilePathProject)
            print("File deleted")
        }catch{
            print("File delete failed")
        }
        
        do{
            try filemanager.copyItemAtPath(seedJSONFilePathProvided, toPath: seedJSONFilePathProject)
            self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nSeed JSON File Replaced"))
        }catch{
            self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nSeed JSON File Replaced Failed"))
        }
    }
    
    func replaceSeedJAVAFile(){
        self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nReplacing Seed JAVA File"))
        let filemanager:NSFileManager = NSFileManager()
        
        let seedJavaFilePathProject = self.textParentFolderLocation.stringValue+"/app/src/main/java/com/touchtalent/bobbleapp/seed/Seed.java"

        let seedJavaFilePathProvided = self.textJavaSeedFileLocation.stringValue
        
        do{
            try filemanager.removeItemAtPath(seedJavaFilePathProject)
            print("File deleted")
        }catch{
            print("File delete failed")
        }
        
        do{
            try filemanager.copyItemAtPath(seedJavaFilePathProvided, toPath: seedJavaFilePathProject)
            self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nSeed JAVA File Replaced"))
        }catch{
            self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nSeed JAVA File Replaced Failed"))
        }
        
    }
    
    func doCodeChangesForAPKBuild(){
        
    }
    
    func createDirForMapping(){
        do {
            self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nCreating Mapping Directory"))
            try NSFileManager.defaultManager().createDirectoryAtPath(self.textParentFolderLocation.stringValue+"/app/build/outputs/mapping/release", withIntermediateDirectories: true, attributes: nil)
            self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nMapping Directory Created"))
        } catch let error as NSError {
            self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nMapping Directory Creation Failed"))
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

            let command = runAsync(self.textParentFolderLocation.stringValue+"/gradlew","--build-file",self.textParentFolderLocation.stringValue+"/build.gradle","--settings-file",self.textParentFolderLocation.stringValue+"/settings.gradle","assembleArmRelease","assembleNonarmRelease")
            
            do{
                try command.finish()
                self.moveApkToRequiedFolder()
                 dispatch_async(dispatch_get_main_queue(), {
                    self.progress.stopAnimation(self)
                    self.progress.hidden = true
                    self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nBuild Ready"))
                    print("Build Ready")

                  })
                }catch {
                print("Build Failed")
                dispatch_async(dispatch_get_main_queue(), {
                    self.progress.stopAnimation(self)
                    self.progress.hidden = true
                    self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nBuild Failed"))
                })
            }
        }
        
    }
    
    func moveApkToRequiedFolder(){
        self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nMoving Apk to required folder"))
        let filemanager:NSFileManager = NSFileManager()
        
        let apkArmBuildPath = self.textParentFolderLocation.stringValue+"/app/build/outputs/apk/app-arm-release.apk"
        
        let apkNonArmBuildPath = self.textParentFolderLocation.stringValue+"/app/build/outputs/apk/app-nonarm-release.apk"
        
        let apkArmRequiredPath = self.textApkFolderLocation.stringValue+"/"+self.textApkVersionCodeFour.stringValue+".apk"
        
        let apkNonArmRequiredPath = self.textApkFolderLocation.stringValue+"/"+self.textApkVersionCodeFive.stringValue+".apk"
        
        
        do{
            try filemanager.removeItemAtPath(apkArmRequiredPath)
            print("File deleted")
        }catch{
            print("File delete failed")
        }
        
        do{
            try filemanager.removeItemAtPath(apkNonArmRequiredPath)
            print("File deleted")
        }catch{
            print("File delete failed")
        }
        
        do{
            try filemanager.moveItemAtPath(apkArmBuildPath, toPath: apkArmRequiredPath)
            self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nArm Apk moved successfully"))
        }catch{
            self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nArm Apk move failed"))
        }
        
        do{
            try filemanager.moveItemAtPath(apkNonArmBuildPath, toPath: apkNonArmRequiredPath)
            self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nNonArm Apk moved successfully"))
        }catch{
            self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nNonArm Apk move failed"))
        }
    }
    
    func buildSingleApk(){
        self.progress.hidden = false
        self.progress.startAnimation(self)
        self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nBuild Started"))
        let taskQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)
        dispatch_async(taskQueue) {
            
            let command = runAsync(self.textParentFolderLocation.stringValue+"/gradlew","--build-file",self.textParentFolderLocation.stringValue+"/build.gradle","--settings-file",self.textParentFolderLocation.stringValue+"/settings.gradle","assembleArmRelease")
            
            do{
                try command.finish()
                self.moveSingleApkToRequiedFolder()
                dispatch_async(dispatch_get_main_queue(), {
                    self.progress.stopAnimation(self)
                    self.progress.hidden = true
                    self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nBuild Ready"))
                    print("Build Ready")
                    
                })
            }catch {
                print("Build Failed")
                dispatch_async(dispatch_get_main_queue(), {
                    self.progress.stopAnimation(self)
                    self.progress.hidden = true
                    self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nBuild Failed"))
                })
            }
        }
    }
    
    func moveSingleApkToRequiedFolder(){
        self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nMoving Apk to required folder"))
        let filemanager:NSFileManager = NSFileManager()
        
        let apkArmBuildPath = self.textParentFolderLocation.stringValue+"/app/build/outputs/apk/app-arm-release.apk"
        
        let apkArmRequiredPath = self.textApkFolderLocation.stringValue+"/"+self.textApkVersionCodeOne.stringValue+".apk"
        
        do{
            try filemanager.removeItemAtPath(apkArmRequiredPath)
            print("File deleted")
        }catch{
            print("File delete failed")
        }
        
        do{
            try filemanager.moveItemAtPath(apkArmBuildPath, toPath: apkArmRequiredPath)
            self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nArm Apk moved successfully"))
        }catch{
            self.textTerminal.documentView?.textStorage??.appendAttributedString(NSAttributedString(string: "\nArm Apk move failed"))
        }
        
    }
    
}

