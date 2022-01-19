//
//  AppDelegate.swift
//  MacCSM
//
//  Created by rtoukrichte on 17/01/2022.
//

import Cocoa
import SwiftUI

//@main
class AppDelegate: NSObject, NSApplicationDelegate {

    //var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        //let contentView = ContentView()
//
//        let hostingController = NSHostingController(rootView: ToolbarProjectApp())
//        window = NSWindow(contentViewController: hostingController)
//        // Create the window and set the content view.
////        window = NSWindow(
////            contentRect: NSRect(x: 0, y: 0, width: 500, height: 300),
////            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
////            backing: .buffered, defer: false)
//
//        window.isReleasedWhenClosed = false
//        window.center()
//        //window.toolbar = NSToolbar()
//        window.toolbarStyle = .unified
//        window.title = "CSM APP"
//        window.setFrameAutosaveName("Main Window")
//        //window.contentView = NSHostingView(rootView: contentView)
//        window.makeKeyAndOrderFront(nil)
        
        guard let app = aNotification.object as? NSApplication else {
            fatalError("No application object")
        }

        guard app.windows.count > 0 else {
            fatalError("No windows")
        }
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

}

@main
struct MainCSMApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        //.windowStyle(HiddenTitleBarWindowStyle())
    }
}

