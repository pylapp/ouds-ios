// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

@testable import MISOThemesWireframe
import Testing

// swiftlint:disable type_name

/// Check if the component tokens provider under test as the default semantic token providers with the expected types.
struct WireframeThemeAlertMessageComponentTokensProviderTests {

    private var provider: WireframeThemeAlertMessageComponentTokensProvider

    init() {
        provider = WireframeThemeAlertMessageComponentTokensProvider()
    }

    // MARK: - Tests

    @Test func defaultBordersSemanticTokensProvider() throws {
        #expect(provider.borders is WireframeThemeBorderSemanticTokensProvider)
    }

    @Test func defaultSpacesSemanticTokensProvider() throws {
        #expect(provider.spaces is WireframeThemeSpaceSemanticTokensProvider)
    }
}

// swiftlint:enable type_name
