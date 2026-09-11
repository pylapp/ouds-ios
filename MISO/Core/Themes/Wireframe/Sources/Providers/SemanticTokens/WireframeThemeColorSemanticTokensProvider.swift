// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOFoundations
import MISOThemesContract

// swiftlint:disable type_name

/// A class which wraps all **color semantic tokens**, *multiple* or not, and expose them.
/// This provider should be integrated as a `AllColorSemanticTokensProvider` implementation inside `MISOTheme` so as to provide
/// all tokens to the users.
///
/// - Since: 0.17.0
final class WireframeThemeColorSemanticTokensProvider: AllColorSemanticTokensProvider {

    #if DEBUG
    nonisolated(unsafe) private static var instanceCount: Int = 0
    #endif

    /// Intializes the provider
    init() {
        OL.debug("Init of WireframeThemeColorSemanticTokensProvider")
        #if DEBUG
        Self.instanceCount++
        checkInstances(count: Self.instanceCount, for: "WireframeThemeColorSemanticTokensProvider")
        #endif
    }

    deinit {
        #if DEBUG
        Self.instanceCount--
        #endif
    }

    // ଘ( ･ω･)_/ﾟ･:*:･｡☆
    // Note: So as to help the integration of generated code produced by the tokenator
    // the implementation of ColorSemanticTokens and ColorMultipleSemanticTokens are not here
    // but in Core/Themes/Wireframe/Values/SemanticTokens/WireframeTheme+ColorMultipleSemanticTokens.swift
    // and in Core/Themes/Wireframe/Values/SemanticTokens/WireframeTheme+ColorSemanticTokens.swift
    // This declaration of WireframeThemeColorSemanticTokensProvider is here to allow to write documentation.
}

// swiftlint:enable type_name
