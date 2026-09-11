// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOFoundations
import MISOThemesContract

// swiftlint:disable type_name

/// A class which wraps all **component  tokens of categorical tag** for *tag* objects like `MISOCategoricalTag`.
/// Contains also references to semantic tokens providers so as to be able to use them to define the component tokens.
/// This provider should be integrated as a `AllCategoricalTagComponentTokensProvider` implementation inside `MISOTheme` so as to provide
/// all tokens to the users. It helps users to override some of the tokens and assign them to an `MISOTheme` implementation to use.
/// It implements also the protocol `CategoricalTagComponentTokens` so as to expose the component tokens for *categorical tags* through any `MISOTheme`.
/// *Categorical tags* components tokens are defined with semantic tokens of colors (`AllColorSemanticTokensProvider`)
///
/// - Since: 3.0.0
final class WireframeThemeCategoricalTagComponentTokensProvider: AllCategoricalTagComponentTokensProvider {

    /// Provider of color semantic tokens to use
    let colors: AllColorSemanticTokensProvider

    #if DEBUG
    nonisolated(unsafe) private static var instanceCount: Int = 0
    #endif

    /// Defines a provider of component tokens dedicated to `MISOCategoricalTag`
    /// - Parameter colors: Provider for color semantic tokens. If nil, a default one will be used (``WireframeThemeColorSemanticTokensProvider``)
    init(colors: AllColorSemanticTokensProvider? = nil) {
        OL.debug("Init of WireframeThemeCategoricalTagComponentTokensProvider")
        self.colors = (colors ?? WireframeThemeColorSemanticTokensProvider())
        #if DEBUG
        Self.instanceCount++
        checkInstances(count: Self.instanceCount, for: "WireframeThemeCategoricalTagComponentTokensProvider")
        #endif
    }

    deinit {
        #if DEBUG
        Self.instanceCount--
        #endif
    }

    // ଘ( ･ω･)_/ﾟ･:*:･｡☆
    // Note: So as to help the integration of generated code produced by the tokenator
    // the implementation of CategoricalTagComponentTokens is not here but in Core/Themes/Wireframe/Values/ComponentTokens/WireframeTheme+CategoricalTagComponentTokens.swift
    // This declaration of WireframeThemeCategoricalTagComponentTokensProvider is here also to allow to write documentation.
}

// swiftlint:enable type_name
