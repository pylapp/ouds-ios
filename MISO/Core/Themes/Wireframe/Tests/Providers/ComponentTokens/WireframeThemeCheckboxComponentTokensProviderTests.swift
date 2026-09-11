// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

@testable import MISOThemesWireframe
import Testing

// swiftlint:disable type_name

/// Check if the component tokens provider under test as the default semantic token providers with the expected types.
struct WireframeThemeCheckboxComponentTokensProviderTests {

    private var provider: WireframeThemeCheckboxComponentTokensProvider

    init() {
        provider = WireframeThemeCheckboxComponentTokensProvider()
    }

    // MARK: - Tests

    @Test func defaultSizeSemanticTokensProvider() throws {
        #expect(provider.sizes is WireframeThemeSizeSemanticTokensProvider)
    }

    @Test func defaultBorderSemanticTokensProvider() throws {
        #expect(provider.borders is WireframeThemeBorderSemanticTokensProvider)
    }
}

// swiftlint:enable type_name
