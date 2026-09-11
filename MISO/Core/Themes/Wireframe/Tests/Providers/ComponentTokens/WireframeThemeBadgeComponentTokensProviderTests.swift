// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

@testable import MISOThemesWireframe
import Testing

// swiftlint:disable type_name

/// Check if the component tokens provider under tests has the default semantic token providers with the expected types.
struct WireframeThemeBadgeComponentTokensProviderTests {

    private var provider: WireframeThemeBadgeComponentTokensProvider

    init() {
        provider = WireframeThemeBadgeComponentTokensProvider()
    }

    // MARK: - Tests

    @Test func defaultSpaceSemanticTokensProvider() throws {
        #expect(provider.spaces is WireframeThemeSpaceSemanticTokensProvider)
    }

    @Test func defaultDimensionsSemanticTokensProvider() throws {
        #expect(provider.dimensions is WireframeThemeDimensionSemanticTokensProvider)
    }
}

// swiftlint:enable type_name
