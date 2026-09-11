// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

@testable import MISOThemesWireframe
import Testing

// swiftlint:disable type_name

/// Check if the component tokens provider under tests has the default semantic token providers with the expected types.
struct WireframeThemeToastComponentTokensProviderTests {

    private var provider: WireframeThemeToastComponentTokensProvider

    init() {
        provider = WireframeThemeToastComponentTokensProvider()
    }

    // MARK: - Tests

    @Test func defaultBordersSemanticTokensProvider() throws {
        #expect(provider.borders is WireframeThemeBorderSemanticTokensProvider)
    }

    @Test func defaultDimensionsSemanticTokensProvider() throws {
        #expect(provider.dimensions is WireframeThemeDimensionSemanticTokensProvider)
    }

    @Test func defaultSizesSemanticTokensProvider() throws {
        #expect(provider.sizes is WireframeThemeSizeSemanticTokensProvider)
    }
}

// swiftlint:enable type_name
