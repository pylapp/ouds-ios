// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

@testable import MISOThemesWireframe
import Testing

// swiftlint:disable type_name

/// Check if the semantic tokens provider for size tokens under test as the good rules implementations
struct WireframeThemeSizeSemanticTokensProviderTests {

    private var provider: WireframeThemeSizeSemanticTokensProvider

    init() {
        provider = WireframeThemeSizeSemanticTokensProvider()
    }

    // MARK: - Tests

    @Test func defaultDimensionsSemanticTokensProvider() throws {
        #expect(provider.dimensions is WireframeThemeDimensionSemanticTokensProvider)
    }
}

// swiftlint:enable type_name
