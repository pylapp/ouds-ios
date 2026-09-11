// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOFoundations
import MISOThemesContract

// swiftlint:disable type_name

/// A class which wraps all **component  tokens of icons** for *icons* used in some components like `MISOTag`.
/// Contains also references to semantic tokens providers so as to be able to use them to define the component tokens.
/// This provider should be integrated as a `AllIconComponentTokensProvider` implementation inside `MISOTheme` so as to provide
/// all tokens to the users.
/// It implements also the protocol `IconomponentTokens` so as to expose the component tokens for *icons* through any `MISOTheme`.
/// *Icons* components tokens are defined with raw and semantic tokens of colors (from `AllColorSemanticTokensProvider`).
///
/// - Since: 0.20.0
final class WireframeThemeIconComponentTokensProvider: AllIconComponentTokensProvider {

    /// Provider of color semantic tokens to use for link colors
    let colors: AllColorSemanticTokensProvider

    #if DEBUG
    nonisolated(unsafe) private static var instanceCount: Int = 0
    #endif

    /// Defines a provider of component tokens dedicated to icons
    /// - Parameters:
    ///    - colors: Provider for color semantic tokens. If nil, a default one will be used (``WireframeThemeColorSemanticTokensProvider``)
    init(colors: AllColorSemanticTokensProvider? = nil) {
        OL.debug("Init of WireframeThemeIconComponentTokensProvider")
        self.colors = (colors ?? WireframeThemeColorSemanticTokensProvider())
        #if DEBUG
        Self.instanceCount++
        checkInstances(count: Self.instanceCount, for: "WireframeThemeIconComponentTokensProvider")
        #endif
    }

    deinit {
        #if DEBUG
        Self.instanceCount--
        #endif
    }

    // ଘ( ･ω･)_/ﾟ･:*:･｡☆
    // Note: So as to help the integration of generated code produced by the tokenator
    // the implementation of IconComponentTokens is not here but in Core/Themes/Wireframe/Values/ComponentTokens/WireframeTheme+IconComponentTokens.swift
    // This declaration of WireframeThemeIconComponentTokensProvider is here also to allow to write documentation.
}

// swiftlint:enable type_name
