// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

// Conditional import and use of UIKit for documentation generation (see #628 #626)
import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

// MARK: - Environment values

extension EnvironmentValues {

    /// The `misoHorizontalSizeClass` instance exposed as en environment values across the library for the horizontal viewport.
    ///
    /// You receive a ``MISOUserInterfaceSizeClass`` value when you read this environment value.
    /// The value tells you about the amount of horizontal space available to the view that reads it.
    /// You can read this size class like any other of the ``EnvironmentValues``, by creating a property with the `Environment` property wrapper:
    ///
    /// ```swift
    ///     @Environment(\.misoHorizontalSizeClass) private var horizontalSizeClass
    /// ```
    @Entry public var misoHorizontalSizeClass: MISOUserInterfaceSizeClass = .regular

    /// The `misoVerticalSizeClass` instance exposed as en environment values across the library for the vertical viewport.
    ///
    /// You receive a ``MISOUserInterfaceSizeClass`` value when you read this environment value.
    /// The value tells you about the amount of vertical space available to the view that reads it.
    /// You can read this size class like any other of the ``EnvironmentValues``, by creating a property with the `Environment` property wrapper:
    ///
    /// ```swift
    ///     @Environment(\.misoVerticalSizeClass) private var verticalSizeClass
    /// ```
    @Entry public var misoVerticalSizeClass: MISOUserInterfaceSizeClass = .regular
}

/// Enumerates the size classes defined by the design system.
/// The __extraCompact__ size class if for screens with width < 389.
/// The __compact__ and __regular__ size classes are the standard Apple classes.
///
/// See: https://developer.apple.com/design/human-interface-guidelines/layout#iOS-iPadOS-device-size-classes
/// Remark: This enum is defined as a string to easily display its raw value.
///
/// To use it:
/// ```swift
///     @Environment(\.misoHorizontalSizeClass) var horizontalSizeClass
///     @Environment(\.misoVerticalSizeClass) var verticalSizeClass
/// ```
///
/// - Since: 0.8.0
@frozen public enum MISOUserInterfaceSizeClass: String, Sendable {
    case extraCompact = "Extra Compact"
    case compact = "Compact"
    case regular = "Regular"
}
