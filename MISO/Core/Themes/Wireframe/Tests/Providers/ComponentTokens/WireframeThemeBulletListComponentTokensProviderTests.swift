// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

@testable import MISOThemesWireframe
import Testing

// swiftlint:disable type_name

/// Check if the component tokens provider under test as the default semantic token providers with the expected types.
struct WireframeThemeBulletListComponentTokensProviderTests {

    private var provider: WireframeThemeBulletListComponentTokensProvider

    init() {
        provider = WireframeThemeBulletListComponentTokensProvider()
    }

    // MARK: - Tests

    @Test func defaultSpaceSemanticTokensProvider() throws {
        #expect(provider.spaces is WireframeThemeSpaceSemanticTokensProvider)
    }
}

// swiftlint:enable type_name
