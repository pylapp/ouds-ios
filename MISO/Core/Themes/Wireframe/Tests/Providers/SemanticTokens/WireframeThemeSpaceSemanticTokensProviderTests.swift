// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

@testable import MISOThemesWireframe
import SwiftUI
import Testing

// swiftlint:disable type_name

/// Check if the semantic tokens provider for space tokens under test as the good rules implementations
struct WireframeThemeSpaceSemanticTokensProviderTests {

    private var provider: WireframeThemeSpaceSemanticTokensProvider

    init() {
        provider = WireframeThemeSpaceSemanticTokensProvider()
    }

    // MARK: - Tests

    @Test func defaultDimensionsSemanticTokensProvider() throws {
        #expect(provider.dimensions is WireframeThemeDimensionSemanticTokensProvider)
    }
}

// swiftlint:enable type_name
