// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOThemesContract
import MISOThemesWireframe
import Testing

/// Checks if the semantic tokens of grids, as defined in the Wireframe theme, have expected values and relationships
/// between them.
struct GridSemanticTokensValuesTests {

    private var theme: MISOTheme

    init() {
        theme = WireframeTheme()
    }

    // MARK: - Tests

    @Test("Min widths must be smaller than max widths")
    func widths() throws {
        #expect(theme.grids.extraCompactMinWidth < theme.grids.extraCompactMaxWidth)
        #expect(theme.grids.compactMinWidth < theme.grids.compactMaxWidth)
        #expect(theme.grids.regularMinWidth < theme.grids.regularMaxWidth)
    }
}
