//
//  NotificationName+Preferences.swift
//  GIFSearcher
//
//  Created by Константин Клинов on 9/9/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import Foundation

// MARK: - Extending NSNotificationCenter for Preferences
extension Notification.Name
{
    
    /// Dispatched when the preferences changed.
    static let PreferencesChanged = Notification.Name("com.mosheberman.giphy.preferences-changed")
}
