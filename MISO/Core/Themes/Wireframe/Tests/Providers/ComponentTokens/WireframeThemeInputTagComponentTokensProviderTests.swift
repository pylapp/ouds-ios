// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

@testable import MISOThemesWireframe
import Testing

// swiftlint:disable type_name

/// Check if the component tokens provider under test has the default semantic token providers with the expected types.
struct WireframeThemeInputTagComponentTokensProviderTests {

    private var provider: WireframeThemeInputTagComponentTokensProvider

    init() {
        provider = WireframeThemeInputTagComponentTokensProvider()
    }

    // MARK: - Tests

    @Test func defaultBorderSemanticTokensProvider() throws {
        #expect(provider.borders is WireframeThemeBorderSemanticTokensProvider)
    }

    @Test func defaultColorSemanticTokensProvider() throws {
        #expect(provider.colors is WireframeThemeColorSemanticTokensProvider)
    }
}

// swiftlint:enable type_name
