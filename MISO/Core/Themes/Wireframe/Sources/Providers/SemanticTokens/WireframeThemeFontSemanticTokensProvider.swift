// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOFoundations
import MISOThemesContract

/// A class which wraps all **font semantic tokens**, *multiple*, *composite* or not, and expose them.
/// This provider should be integrated as a `AllFontSemanticTokensProvider` implementation inside `MISOTheme` so as to provide
/// all tokens to the users.
///
/// - Since: 0.17.0
final class WireframeThemeFontSemanticTokensProvider: AllFontSemanticTokensProvider {

    #if DEBUG
    nonisolated(unsafe) private static var instanceCount: Int = 0
    #endif

    /// Intializes the provider
    init() {
        OL.debug("Init of WireframeThemeFontSemanticTokensProvider")
        #if DEBUG
        Self.instanceCount++
        checkInstances(count: Self.instanceCount, for: "WireframeThemeFontSemanticTokensProvider")
        #endif
    }

    deinit {
        #if DEBUG
        Self.instanceCount--
        #endif
    }

    // ଘ( ･ω･)_/ﾟ･:*:･｡☆
    // Note: So as to help the integration of generated code produced by the tokenator
    // the implementation of FontSemanticTokens, FontCompositeSemanticTokens, FontMultipleSemanticTokens are not here
    // but in Core/Themes/Wireframe/Values/SemanticTokens/WireframeTheme+FontSemanticTokens.swift,
    // in Core/Themes/Wireframe/Values/SemanticTokens/WireframeTheme+FontCompositeSemanticTokens.swift,
    // and in Core/Themes/Wireframe/Values/SemanticTokens/WireframeTheme+FontMultipleSemanticTokens.swift,
    // This declaration of MISOFontSemanticTokensProvider is here to allow to write documentation.
}
