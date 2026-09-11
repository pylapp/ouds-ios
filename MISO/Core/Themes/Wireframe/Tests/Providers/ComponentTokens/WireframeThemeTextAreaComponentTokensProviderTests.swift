// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

@testable import MISOThemesWireframe
import Testing

// swiftlint:disable type_name

/// Check if the component tokens provider under tests has the default semantic token providers with the expected types.
struct WireframeThemeTextAreaComponentTokensProviderTests {

    private var provider: WireframeThemeTextAreaComponentTokensProvider

    init() {
        provider = WireframeThemeTextAreaComponentTokensProvider()
    }

    // MARK: - Tests

    @Test func defaultSizeSemanticTokensProvider() throws {
        #expect(provider.sizes is WireframeThemeSizeSemanticTokensProvider)
    }

    @Test func defaultSpaceSemanticTokensProvider() throws {
        #expect(provider.spaces is WireframeThemeSpaceSemanticTokensProvider)
    }
}

// swiftlint:enable type_name
