// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOThemesContract
import SwiftUI

/// `ViewModifier` to use to define pading to given `edges` using the MISO current horizontal size class
struct GridMarginModifier: ViewModifier {

    let edges: Edge.Set

    @Environment(\.theme) private var theme
    @Environment(\.misoHorizontalSizeClass) private var misoHorizontalSizeClass

    func body(content: Content) -> some View {
        content.padding(edges, theme.gridMargin(for: misoHorizontalSizeClass))
    }
}
