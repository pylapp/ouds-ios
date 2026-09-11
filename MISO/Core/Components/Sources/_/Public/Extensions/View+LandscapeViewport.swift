// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

#if canImport(UIKit)
import UIKit
#endif
import SwiftUI

extension View {

    /// Returns if the device is in landscape mode if the current OS is iOS / iPadOS.
    /// Otherwise returns always false.
    ///
    /// - Returns Bool: True if landscape, false in portrait
    public static func isInLandscapeViewport() -> Bool {
        #if os(iOS)
        let deviceOrientation = UIDevice.current.orientation
        if deviceOrientation.isValidInterfaceOrientation {
            return deviceOrientation.isLandscape
        }

        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first
        {
            return window.bounds.width > window.bounds.height
        }

        return UIScreen.main.bounds.width > UIScreen.main.bounds.height
        #else
        return false
        #endif
    }
}
