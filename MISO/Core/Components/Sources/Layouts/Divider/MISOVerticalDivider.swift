// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import SwiftUI

/// Divider is a UI element that allows to structure the content by visually separating the content zones.
/// Divider improves readability and content organization without introducing a stronger visual hierarchy like a heading or a container would.
/// A vertical Divider is used to separate content laid out side by side (`HStack`).
/// The divider can be colored using dedicated ``MISODividerColor`` colors.
/// The thickness (width) is fixed by dedicated token from `MISOTheme`.
///
/// ## Code samples
///
/// ```swift
/// HStack {
///     Text("Hello wolrd!")
///     MISOVerticalDivider(color: .brandPrimary)
///     Text("Happy to see you")
/// }
/// ```
///
/// - Version: 1.0.0 (Figma component design version)
/// - Since: 0.14.0
@available(iOS 15, macOS 13, visionOS 1, watchOS 11, tvOS 16, *)
public struct MISOVerticalDivider: View {

    // MARK: - Stored properties

    private let color: MISODividerColor

    // MARK: - Initializer

    /// Create a vertical colored divider.
    ///
    /// ```swift
    ///     MISOVerticalDivider(color: .brandPrimary)
    /// ```
    ///
    /// - Parameter color: The color of the divider, `MISODividerColor.default` by default
    ///
    /// **Remark: Vertical means vertical line (content separator in a HStack)**
    public init(color: MISODividerColor = .default) {
        self.color = color
    }

    // MARK: - Body

    public var body: some View {
        Divider().vertical(color: color)
    }
}

extension Divider {

    /// Set the color to the vertical divider and adjust the thickness (width)
    /// automatically according to token value.
    ///
    /// ```swift
    /// HStack {
    ///     Text("Bazinga!")
    ///
    ///     Divider().vertical(color: .brandPrimary)
    ///
    ///     Text("Yowza!")
    /// }
    /// ```
    ///
    /// - Parameter color: the color of the divider, `MISODividerColor.default` by default
    ///
    /// **Remark: Vertical means vertical line (content separator in a HStack)**
    @MainActor
    public func vertical(color: MISODividerColor) -> some View {
        modifier(DividerModifier(orientation: .vertical, dividerColor: color))
    }
}
