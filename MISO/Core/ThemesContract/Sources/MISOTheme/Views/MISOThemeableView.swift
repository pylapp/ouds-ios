// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import Foundation
import MISOFoundations
import SwiftUI
#if canImport(UIKit) // Conditional import and use of UIKit for documentation generation (see #628 #626)
import UIKit
#endif

// MARK: - Environment Values

extension EnvironmentValues {

    /// The `MISOTheme` instance exposed as en environment values across the library.
    /// Because at the level of the package we don't have any existing theme, this instance is optional
    @Entry public var _theme: MISOTheme?

    // swiftlint:disable force_unwrapping
    /// The `MISOTheme` applied to the application, must be defined otherwise **crash will occur**.
    public var theme: MISOTheme {
        _theme!
    }

    // swiftlint:enable force_unwrapping

    /// A flag indicating whether Liquid Glass is disabled.
    /// The environment entry default is *false*.
    /// When using `MISOThemeableView` (the recommended integration path), this value may be overridden to *true*
    /// on iOS versions earlier than 26 or when the app enables *UIDesignRequiresCompatibility* in the
    /// *main Bundle* `Info.plist` if Xcode 26.
    /// For Xcode 27, will be always `false` as Apple forces Liquid Glass.
    @Entry public var isLiquidGlassDisabled: Bool = false
}

// MARK: - Themeable View

/// This is a kind of root `SwiftUI.View` to add at the top level of your views tree so as to define
/// as an environment variable the theme which will be applied.
/// Any theme to apply must be a child of `MISOTheme`, direct or not.
///
/// To use this special `View` and apply the *theme*, you must wrap your app root view inside, like:
///
/// ```swift
///     // Add themeable view to your root view to use the WireframeTheme
///     MISOThemeableView(theme: WireframeTheme()) {
///         YourRootView()
///     }
///
///     // Or use your custom theme if you want
///     MISOThemeableView(theme: YourCustomTheme()) {
///         YourRootView()
///     }
/// ```
///
/// - Since: 0.8.0
public struct MISOThemeableView<Content: View>: View {

    private let theme: MISOTheme
    private let content: () -> Content

    private static var isLiquidGlassDisabled: Bool {
        if #available(iOS 27.0, *) { // Liquid Glass mandatory for iOS 27 (so Xcode 27)
            false
        } else if #available(iOS 26.0, *) { // Liquid Glass optional for iOS 26 (with Xcode 26)
            (Bundle.main.object(forInfoDictionaryKey: "UIDesignRequiresCompatibility") as? Bool) ?? false
        } else { // Liquid Glass unavailable for iOS 18 and lower
            true
        }
    }

    public init(theme: MISOTheme, @ViewBuilder content: @escaping () -> Content) {
        self.theme = theme
        self.content = content
    }

    public var body: some View {
        #if canImport(UIKit)
        content()
            .environment(\.isLiquidGlassDisabled, Self.isLiquidGlassDisabled)
            .environment(\._theme, theme)
            .environmentObject(MISOLowPowerModeObserver())
            .modifier(UserInterfaceSizeClassModifier())
        #else
        content()
            .environment(\._theme, theme)
            .environmentObject(MISOLowPowerModeObserver())
        #endif
    }
}

#if canImport(UIKit)
/// Private modifier used to set in environment the computed orizontal and vertical size classes.
private struct UserInterfaceSizeClassModifier: ViewModifier {

    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.verticalSizeClass) private var verticalSizeClass

    /// According to Apple guidelines, this value of 390 is the limit defining extract compact size classes if lower and compact if higher or equal
    private static let extraCompactMaxWidth = 390.0

    private var horizontalUserInterfaceSizeClass: MISOUserInterfaceSizeClass {
        #if os(iOS)
        if UIScreen.main.bounds.width < Self.extraCompactMaxWidth {
            .extraCompact
        } else {
            horizontalSizeClass == .compact ? .compact : .regular
        }
        #else
        horizontalSizeClass == .compact ? .compact : .regular
        #endif
    }

    private var verticalUserInterfaceSizeClass: MISOUserInterfaceSizeClass {
        #if os(iOS)
        if UIScreen.main.bounds.width < Self.extraCompactMaxWidth {
            .extraCompact
        } else {
            verticalSizeClass == .compact ? .compact : .regular
        }
        #else
        verticalSizeClass == .compact ? .compact : .regular
        #endif
    }

    func body(content: Content) -> some View {
        content
            .environment(\.misoHorizontalSizeClass, horizontalUserInterfaceSizeClass)
            .environment(\.misoVerticalSizeClass, verticalUserInterfaceSizeClass)
    }
}
#endif
