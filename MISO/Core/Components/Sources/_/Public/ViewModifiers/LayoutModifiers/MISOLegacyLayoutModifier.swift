// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOFoundations
import SwiftUI

/// `ViewModifier` to manage an edge case about Liquid Glass configuration of Apple OS and Xcode versions.
///
/// If an app is compiled with Xcode 27 for iOS 27, Liquid Glass is forced by the system and considered as enabled by MISO.
/// If an app is compiled with Xcode 26 for iOS 26, the *UIDesignRequiresCompatibility* flag is read and MISO considers wether or not Liquid Glass is enabled.
/// If an app is compiled with Xcode 26 for iOS 18 and lower, Liquid Glass is considered as unavailable, disabled.
///
/// The edge case is when the OS version is 27, the flag *UIDesignRequiresCompatibility* stils exists but the app is compiled with Xcode 26.
/// This case is extreme: the system does not force Liquid Glass, the flag is here, and MISO cannot only rely on the OS version.
/// Thus, this ``MISOLegacyLayoutModifier``  will define an environment value saying any legacy layout things (appearances, selector, divider) must be displayed.
///
/// **You must use this `ViewModifier` with care, and only if you are using Xcode 26 and  _UIDesignRequiresCompatibility_ to YES **.
/// Prefer build with Xcode 27 without the *UIDesignRequiresCompatibility*  flag.
///
/// ```swift
///   MISOTabBar(selectedTab: ..., count: ...) { ... )
///     .modifier(MISOLegacyLayoutModifier())
/// ```
///
/// **Note: You should use this view modifier in your root view because the flag it defines in deeper levels is used for all navigations components like bars**
///
/// - Since: 3.0.0
public struct MISOLegacyLayoutModifier: ViewModifier {

    /// To prevent to pollute logs
    private static var usersHaveBeenWarned: Bool = false

    /// Instanciates the `MISOLegacyLayoutModifier` and displays error messages in the standard output
    public init() {
        if !Self.usersHaveBeenWarned {
            OL.warning("You should not force the legacy layout of the navigation elements like bars; please embrace Liquid Glass!")
            OL.warning("You should not use this MISOLegacyLayoutModifier with Xcode 27 or with Xcode 26 without UIDesignRequiresCompatibility or set to NO")
            Self.usersHaveBeenWarned = true
        }
    }

    /// Defines environment variable to precise the legacy tab bar must be forced
    public func body(content: Content) -> some View {
        content
            .environment(\.forceMISOLegacyLayout, true)
    }
}

extension EnvironmentValues {

    /// A flag indicating the MISP tab bar must have the legacy layout.
    @Entry public var forceMISOLegacyLayout: Bool = false
}
