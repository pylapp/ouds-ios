// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOTokensSemantic
import SwiftUI

/// A `ViewModifier` which will apply a specific divider under a `View` using color and size semantic tokens for a specified orientation.
struct DividerModifier: ViewModifier {

    /// Divider orientation
    enum Orientation {
        case horizontal
        case vertical
    }

    // MARK: Properties

    let dividerColor: MISODividerColor
    let forceColor: MultipleColorSemanticToken?
    let orientation: Orientation

    @Environment(\.theme) private var theme
    @Environment(\.colorScheme) private var colorScheme

    // MARK: - Init

    /// Normal (public) usage, creates with a `dividerColor`
    ///
    /// - Parameters:
    ///   - orientation: The divider orientation
    ///   - dividerColor: The color allowed for divider in a public usage
    init(orientation: Orientation, dividerColor: MISODividerColor) {
        self.dividerColor = dividerColor
        forceColor = nil
        self.orientation = orientation
    }

    /// For internal usage, creates with a `forceColor`. The `dividerColor` is ignored.
    ///
    /// - Parameters:
    ///   - orientation: The divider orientation
    ///   - forceColor: The token of the color to apply
    init(orientation: Orientation, forceColor: MultipleColorSemanticToken) {
        dividerColor = .default
        self.forceColor = forceColor
        self.orientation = orientation
    }

    // MARK: - Body

    func body(content: Content) -> some View {
        content
            .frame(width: width, height: height)
            .overlay(color.color(for: colorScheme))
    }

    // MARK: - Helpers

    private var height: CGFloat? {
        switch orientation {
        case .horizontal:
            theme.divider.borderWidth
        case .vertical:
            nil
        }
    }

    private var width: CGFloat? {
        switch orientation {
        case .horizontal:
            nil
        case .vertical:
            theme.divider.borderWidth
        }
    }

    private var color: MultipleColorSemanticToken {
        forceColor ?? dividerColor.colorToken(in: theme)
    }
}

extension Divider {

    /// Force the color of the vertical divider (for internal usage)
    ///
    /// - Parameter color: The color to force for the divider
    @MainActor
    func vertical(force color: MultipleColorSemanticToken) -> some View {
        modifier(DividerModifier(orientation: .vertical, forceColor: color))
    }

    /// Force the color of the horizontal divider (for internal usage)
    ///
    /// - Parameter color: The color to force for the divider
    @MainActor
    func horizontal(force color: MultipleColorSemanticToken) -> some View {
        modifier(DividerModifier(orientation: .horizontal, forceColor: color))
    }
}
