// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOThemesContract
import MISOThemesWireframe
import Testing

/// The aim of this tests class is to look for regressions in **Wireframe brand border semantic tokens**.
/// Indeed, each future generation of Swift code may break these tests because there are new values.
/// In the semantics of **border semantic tokens**, there will be some unchanged things like relationships between tokens.
/// Thus this tests class just checks if such relationships are still here whatever the values at the end.
struct WireframeThemeBorderSemanticTokensTests {

    private var theme: MISOTheme

    init() {
        theme = WireframeTheme()
    }

    @Test func widthSemanticTokensAreBiggerAndBigger() throws {
        #expect(theme.borders.widthNone < theme.borders.widthThin)
        #expect(theme.borders.widthThin < theme.borders.widthDefault)
        #expect(theme.borders.widthDefault <= theme.borders.widthMedium)
        #expect(theme.borders.widthMedium < theme.borders.widthThick)
        #expect(theme.borders.widthThick < theme.borders.widthThicker)

        #expect(theme.borders.widthFocusInset < theme.borders.widthFocus)

        #expect(theme.borders.radiusNone <= theme.borders.radiusDefault)
    }

    @Test func radiusSemanticTokensAreBiggerAndBigger() throws {
        #expect(theme.borders.radiusNone <= theme.borders.radiusDefault)
        #expect(theme.borders.radiusSmall < theme.borders.radiusMedium)
        #expect(theme.borders.radiusMedium < theme.borders.radiusLarge)
        #expect(theme.borders.radiusLarge < theme.borders.radiusPill)
    }
}
