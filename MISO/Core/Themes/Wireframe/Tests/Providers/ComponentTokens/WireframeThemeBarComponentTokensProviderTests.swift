// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

@testable import MISOThemesWireframe
import Testing

// swiftlint:disable type_name

/// Check if the component tokens provider under tests has the default semantic token providers with the expected types.
struct WireframeThemeBarComponentTokensProviderTests {

    private var provider: WireframeThemeBarComponentTokensProvider

    init() {
        provider = WireframeThemeBarComponentTokensProvider()
    }

    // MARK: - Tests

    @Test func defaultSizesSemanticTokensProvider() throws {
        #expect(provider.sizes is WireframeThemeSizeSemanticTokensProvider)
    }

    @Test func defaultBordersSemanticTokensProvider() throws {
        #expect(provider.borders is WireframeThemeBorderSemanticTokensProvider)
    }

    @Test func defaultColorsSemanticTokensProvider() throws {
        #expect(provider.colors is WireframeThemeColorSemanticTokensProvider)
    }

    @Test func defaultOpacitiesSemanticTokensProvider() throws {
        #expect(provider.opacities is WireframeThemeOpacitySemanticTokensProvider)
    }

    @Test func defaultEffectsSemanticTokensProvider() throws {
        #expect(provider.effects is WireframeThemeEffectSemanticTokensProvider)
    }
}

// swiftlint:enable type_name
