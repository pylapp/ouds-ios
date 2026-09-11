// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import SwiftUI

/// Divider is a UI element that allows to structure the content by visually separating the content zones.
/// Divider improves readability and content organization without introducing a stronger visual hierarchy like a heading or a container would.
/// A horizontal Divider is used to separate content laid out one under the other (`VStack`).
/// The divider can be colored using dedicated ``MISODividerColor`` colors.
/// The thickness (height) is fixed by dedicated token from `OUDSTheme`.
///
/// ## Code samples
///
/// ```swift
/// VStack {
///     Text("Hello wolrd!")
///     MISOHorizontalDivider(color: .brandPrimary)
///     Text("Happy to see you")
/// }
/// ```
///
/// - Version: 1.0.0 (Figma component design version)
/// - Since: 0.14.0
@available(iOS 15, macOS 13, visionOS 1, watchOS 11, tvOS 16, *)
public struct MISOHorizontalDivider: View {

    // MARK: - Stored properties

    private let color: MISODividerColor

    // MARK: - Initializer

    /// Create a horizontal colored divider.
    ///
    /// ```swift
    ///     MISOHorizontalDivider(color: .brandPrimary)
    /// ```
    ///
    /// - Parameter color: The color of the divider, `MISODividerColor.default` by default
    public init(color: MISODividerColor = .default) {
        self.color = color
    }

    // MARK: - Body

    public var body: some View {
        Divider().horizontal(color: color)
    }
}

extension Divider {

    /// Set the color to the horizontal divider and adjust the thickness (height)
    /// automatically according to token value.
    ///
    /// ```swift
    /// VStack {
    ///     Text("Bazinga!")
    ///
    ///     Divider().horizontal(color: .brandPrimary)
    ///
    ///     Text("Yowza!")
    /// }
    /// ```
    ///
    /// - Parameter color: the color of the divider, `MISODividerColor.default` by default
    ///
    /// **Remark: Horizontal means horizontal line (content separator in a VStack)**
    @MainActor
    public func horizontal(color: MISODividerColor = .default) -> some View {
        modifier(DividerModifier(orientation: .horizontal, dividerColor: color))
    }
}
