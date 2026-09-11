// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOFoundations
import MISOThemesContract

/// A class which wraps all **grid semantic tokens** and expose them.
/// This provider should be integrated as a `AllGridSemanticTokensProvider` implementation inside `MISOTheme` so as to provide
/// all tokens to the users.
///
/// - Since: 0.17.0
final class WireframeThemeGridSemanticTokensProvider: AllGridSemanticTokensProvider {

    #if DEBUG
    nonisolated(unsafe) private static var instanceCount: Int = 0
    #endif

    /// Intializes the provider
    init() {
        OL.debug("Init of WireframeThemeGridSemanticTokensProvider")
        #if DEBUG
        Self.instanceCount++
        checkInstances(count: Self.instanceCount, for: "WireframeThemeGridSemanticTokensProvider")
        #endif
    }

    deinit {
        #if DEBUG
        Self.instanceCount--
        #endif
    }

    // ଘ( ･ω･)_/ﾟ･:*:･｡☆
    // Note: So as to help the integration of generated code produced by the tokenator
    // the implementation of GridSemanticTokens is not here but in Core/Themes/Wireframe/Values/SemanticTokens/WireframeTheme+GridSemanticTokens.swift
    // This declaration of WireframeThemeGridSemanticTokensProvider is here to allow to write documentation.
}
