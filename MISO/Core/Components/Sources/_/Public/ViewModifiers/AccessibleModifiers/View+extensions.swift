// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import SwiftUI

// MARK: - Accessibility Delay

/// Contains some delays to apply to view modifiers' deadlines for vocalizations or accessibility notifications
private enum AccessibilityDelay: Double {
    /// Must be lower than accesibleFocusRequestDelay to start before
    case accessibleTitleNotificationDelay = 0.0
    /// Must be greater than accessibleTitleNotificationDelay to start after
    case accessibleFocusRequestDelay = 1.0
}

// MARK: - View extension

extension View {

    /// Adds a modifier to the current `View` so as to define a navigation title and subtitle (under this title) using the current
    /// `title` and optional `subtitle`. It also sends a notification to accessibility layers for a screen change when it appears.
    ///
    /// ```swift
    ///      SomeView().misoNavigationTitle("your title key")
    /// ```
    ///
    /// - Parameters:
    ///    - title: The navigation title
    ///    - subtitle: An optional subtitle displayed under the title. For iOS >= 26 the native API is used.
    ///       For previous versions of iOS, a `ToolbarItem` with placement `.principal` is used to display `title` and `subtitle`.
    ///       If `hasLargeTitle` is `true`, the subtitle is ignored.
    ///    - hasLargeTitle: Flag to activate the large title. Default is `false`.
    ///
    /// - Returns View: The view with a new modifier
    public func misoNavigationTitle(_ title: String, subtitle: String? = nil, hasLargeTitle: Bool = false) -> some View {
        #if canImport(UIKit)
        modifier(AccessibleNavigationTitleModifier(title: title,
                                                   subtitle: subtitle,
                                                   hasLargeTitle: hasLargeTitle,
                                                   deadline: .now() + AccessibilityDelay.accessibleTitleNotificationDelay.rawValue))
        #else
        modifier(AccessibleNavigationTitleModifier(title: title, subtitle: subtitle, hasLargeTitle: hasLargeTitle))
        #endif
    }

    /// Adds a modifier to the current `View` so as to defer a focus request after the view is displayed
    ///
    /// ```swift
    ///     YourView: View {
    ///         @AccessibilityFocusState var requestFocus: Bool
    ///
    ///         var body: some View {
    ///             SomeView()
    ///                 .requestAccessibleFocus(_requestFocus)
    ///         }
    ///     }
    /// ```
    ///
    /// - Parameter requestFocus: The boolean binding (e.g. the `AccessibilityFocusState`)
    /// - Returns View: The view with a new modifier
    public func requestAccessibleFocus(_ requestFocus: AccessibilityFocusState<Bool>) -> some View {
        modifier(RequestAccessibleFocusModifier(requestFocus: requestFocus,
                                                deadline: .now() + AccessibilityDelay.accessibleFocusRequestDelay.rawValue))
    }

    /// Adds a modifier to the current `View` so as to defer a focus request after the view is displayed for the given element
    ///
    /// ```swift
    ///     YourView: View {
    ///         @AccessibilityFocusState var requestFocus: Bool
    ///
    ///         var body: some View {
    ///             SomeView()
    ///                 .requestAccessibleFocus(_requestFocus, for: .some(id: element.id))
    ///         }
    ///     }
    /// ```
    ///
    /// - Parameters:
    ///    - requestFocus: The boolean binding (e.g. the `AccessibilityFocusState`)
    ///    - target: The item which will get the focus
    /// - Returns View: The view with a new modifier
    public func requestAccessibleFocus(_ requestFocus: AccessibilityFocusState<AccessibilityFocusable?>, for target: AccessibilityFocusable) -> some View {
        modifier(RestrictedRequestAccessibleFocusModifier(requestFocus: requestFocus,
                                                          target: target,
                                                          deadline: .now() + AccessibilityDelay.accessibleFocusRequestDelay.rawValue))
    }
}
