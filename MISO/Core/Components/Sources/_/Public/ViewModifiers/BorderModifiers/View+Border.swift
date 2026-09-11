// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOTokensSemantic
import SwiftUI

extension View {

    /// Modifies the current `View` to apply a border.
    ///
    /// ```swift
    ///     @Environment(\.theme) private var theme
    ///
    ///    var body: some View {
    ///        SomeView()
    ///        .border(
    ///             style: theme.borders.styleDefault,
    ///             width: theme.borders.widthThin,
    ///             radius: theme.borders.radiusNone,
    ///             color: theme.colors.borderDefault)
    ///     }
    /// ```
    ///
    /// - Parameters
    ///     - style: The style to apply on the component
    ///     - width: The width of the border
    ///     - radius: The radius of the border to apply
    ///     - color: The colors of the border (depending to the `colorScheme`)
    /// - Returns some View: The current `View` but with a border.
    public func border(
        style: BorderStyleSemanticToken,
        width: BorderWidthSemanticToken,
        radius: BorderRadiusSemanticToken,
        color: MultipleColorSemanticToken) -> some View
    {
        modifier(BorderModifier(style, width, radius, color))
    }

    /// Modifies the current `View` to apply a default border using the tokens from the current theme.
    ///
    /// This is a convenience method that uses `theme.borders.styleDefault`, `theme.borders.widthDefault`,
    /// `theme.borders.radiusDefault` and `theme.colors.borderDefault` automatically.
    ///
    /// ```swift
    ///    var body: some View {
    ///        SomeView()
    ///            .borderDefault()
    ///     }
    /// ```
    ///
    /// - Returns some View: The current `View` but with a default border.
    public func borderDefault() -> some View {
        modifier(BorderDefaultModifier())
    }
}
