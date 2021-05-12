//
//  ShortcutMonitor.swift
//  Thor
//
//  Created by Alvin on 5/14/16.
//  Copyright © 2016 AlvinZhu. All rights reserved.
//

import Foundation
import Cocoa
import MASShortcut

struct ShortcutMonitor {

    static func register() {
        let apps = AppsManager.manager.selectedApps
        for app in apps where app.shortcut != nil {
            MASShortcutMonitor.shared().register(app.shortcut, withAction: {
                guard defaults[.EnableShortcut] else { return }

                if let frontmostAppIdentifier = NSWorkspace.shared.frontmostApplication?.bundleIdentifier,
                    let targetAppIdentifier = Bundle(url: app.appBundleURL)?.bundleIdentifier,
                    frontmostAppIdentifier == targetAppIdentifier {
                    NSRunningApplication.runningApplications(withBundleIdentifier: frontmostAppIdentifier).first?.hide()
                } else {
                    if #available(macOS 10.15, *) {
                        let configuration = NSWorkspace.OpenConfiguration()
                        configuration.activates = true
                        NSWorkspace.shared.openApplication(at: app.appBundleURL,
                                                           configuration: configuration) { _, error in
                            if let error = error {
                                NSLog("ERROR: \(error)")
                            }
                        }
                    } else {
                        NSWorkspace.shared.launchApplication(app.appName)
                    }
                }
            })
        }
    }

    static func unregister() {
        let apps = AppsManager.manager.selectedApps
        for app in apps where app.shortcut != nil {
            MASShortcutMonitor.shared().unregisterShortcut(app.shortcut)
        }
    }

}
