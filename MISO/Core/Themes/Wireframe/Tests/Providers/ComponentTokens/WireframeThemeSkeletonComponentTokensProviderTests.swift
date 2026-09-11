// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

@testable import MISOThemesWireframe
import Testing

// swiftlint:disable type_name

/// Check if the component tokens provider under test as the default semantic token providers with the expected types.
struct WireframeThemeSkeletonComponentTokensProviderTests {

    private var provider: WireframeThemeSkeletonComponentTokensProvider

    init() {
        provider = WireframeThemeSkeletonComponentTokensProvider()
    }

    // MARK: - Tests

    @Test func defaultColorSemanticTokensProvider() throws {
        #expect(provider.colors is WireframeThemeColorSemanticTokensProvider)
    }
}

// swiftlint:enable type_name
