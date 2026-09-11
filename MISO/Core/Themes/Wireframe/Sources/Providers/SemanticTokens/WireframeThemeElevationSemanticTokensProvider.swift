// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOFoundations
import MISOThemesContract

// swiftlint:disable type_name

/// A class which wraps all **elevation semantic tokens**, *multiple*, *composite* or not, and expose them.
/// This provider should be integrated as a `AllElevationSemanticTokensProvider` implementation inside `MISOTheme` so as to provide
/// all tokens to the users.
///
/// - Since: 0.22.0
final class WireframeThemeElevationSemanticTokensProvider: AllElevationSemanticTokensProvider {

    #if DEBUG
    nonisolated(unsafe) private static var instanceCount: Int = 0
    #endif

    /// Intializes the provider
    init() {
        OL.debug("Init of WireframeThemeElevationSemanticTokensProvider")
        #if DEBUG
        Self.instanceCount++
        checkInstances(count: Self.instanceCount, for: "WireframeThemeElevationSemanticTokensProvider")
        #endif
    }

    deinit {
        #if DEBUG
        Self.instanceCount--
        #endif
    }

    // ଘ( ･ω･)_/ﾟ･:*:･｡☆
    // Note: So as to help the integration of generated code produced by the tokenator
    // the implementation of ElevationSemanticTokens and ElevationCompositeSemanticTokens are not here
    // but in Core/Themes/Wireframe/Values/SemanticTokens/WireframeTheme+ElevationSemanticTokens.swift,
    // and in Core/Themes/Wireframe/Values/SemanticTokens/WireframeTheme+ElevationCompositeSemanticTokens.swift.
    // This declaration of WireframeThemeElevationSemanticTokensProvider is here to allow to write documentation.
}

// swiftlint:enable type_name
