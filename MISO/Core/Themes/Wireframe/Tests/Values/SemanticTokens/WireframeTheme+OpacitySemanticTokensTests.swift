// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOThemesContract
import MISOThemesWireframe
import Testing

/// Checks if the semantic tokens of opacities, as defined in the Wireframe theme, have expected values and relationships
/// between them.
struct OpacitySemanticTokensValuesTests {

    private var theme: MISOTheme

    init() {
        theme = WireframeTheme()
    }

    // MARK: - Tests

    @Test("Opacities must be bigger and bigger")
    func opacities() throws {
        #expect(theme.opacities.invisible < theme.opacities.weakest)
        #expect(theme.opacities.weakest < theme.opacities.weaker)
        #expect(theme.opacities.weaker < theme.opacities.weak)
        #expect(theme.opacities.weak < theme.opacities.medium)
        #expect(theme.opacities.medium < theme.opacities.strong)
        #expect(theme.opacities.strong < theme.opacities.opaque)
        // NOTE: "disabled" is particular, not tested here
    }
}
