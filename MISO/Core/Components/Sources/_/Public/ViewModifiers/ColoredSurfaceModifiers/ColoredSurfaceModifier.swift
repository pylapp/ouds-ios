// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOTokensSemantic
import SwiftUI

/// `ViewModifier` which helps to apply a predefined color mode on a view.
/// This mode is based on `MISOColoredSurface.SurfaceColor` and defines which tyê of color scheme
/// and monochrome must be considered.
public struct MISOColoredSurfaceModifier: ViewModifier {

    // MARK: - Stored properties

    let backgroundSurfaceColor: MISOColoredSurface.SurfaceColor
    @Environment(\.theme) private var theme
    @Environment(\.colorScheme) private var colorScheme

    // MARK: - Body

    public func body(content: Content) -> some View {
        content
            .background(useColorToken.color(for: colorScheme))
            .environment(\.misoUseMonochrome, useMonochrome)
            .environment(\.misoOnColoredSurface, true)
            .environment(\.misoSurfaceColor, useColorToken)
            .environment(\.colorScheme, useColorScheme)
    }

    // MARK: - Computed properties

    private var useColorToken: MultipleColorSemanticToken {
        theme.colorModes.toColor(from: backgroundSurfaceColor)
    }

    private var useColorScheme: ColorScheme {
        theme.colorModes.useColorScheme(for: backgroundSurfaceColor, colorScheme)
    }

    private var useMonochrome: Bool {
        theme.colorModes.isMonochrome(mode: backgroundSurfaceColor)
    }
}
