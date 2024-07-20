//
//  DefaultsKeys+Extension.swift
//  Thor
//
//  Created by AlvinZhu on 4/18/16.
//  Copyright © 2016 AlvinZhu. All rights reserved.
//

import Foundation

extension DefaultsKeys {

    static let ModifyKey      = DefaultsKey<Int>("ModifyKey")
    static let EnableShortcut = DefaultsKey<Bool>("EnableShortcut")
    static let DelayInterval  = DefaultsKey<Double>("DelayInterval")
    static let Shortcuts      = DefaultsKey<[Data]?>("Shortcuts")
    static let DeactivateKey  = DefaultsKey<Int>("DeactivateKey")
    static let EnableDeactivateKey = DefaultsKey<Bool>("EnableDeactivateKey")
    static let LaunchAtLoginKey = DefaultsKey<Bool>("LaunchAtLoginKey")
    static let enableMenuBarIcon = DefaultsKey<Bool>("enableMenuBarIcon")
    static let enableMenuBarIconShowHideKey = DefaultsKey<Bool>("enableMenuBarIconShowHideKey")

}
