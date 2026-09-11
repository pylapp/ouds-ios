// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOThemesContract
import SwiftUI

/// A `ViewModifier` which applies a default border to a `View` using the default semantic tokens from the current theme.
/// Uses `theme.borders.styleDefault`, `theme.borders.widthDefault`, `theme.borders.radiusDefault`
/// and `theme.colors.borderDefault`.
struct BorderDefaultModifier: ViewModifier {

    @Environment(\.theme) private var theme

    func body(content: Content) -> some View {
        content.border(
            style: theme.borders.styleDefault,
            width: theme.borders.widthDefault,
            radius: theme.borders.radiusDefault,
            color: theme.colors.borderDefault)
    }
}
