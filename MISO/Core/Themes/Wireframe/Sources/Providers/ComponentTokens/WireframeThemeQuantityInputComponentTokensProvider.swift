// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOFoundations
import MISOThemesContract

// swiftlint:disable type_name

/// A class which wraps all **component  tokens of quantity input** objects like `MISOQuantityInput`.
/// Contains also references to semantic tokens providers so as to be able to use them to define the component tokens.
/// This provider should be integrated as a `AllQuantityInputComponentTokensProvider` implementation inside `MISOTheme` so as to provide
/// all tokens to the users. It helps users to override some of the tokens and assign them to an `MISOTheme` implementation to use.
///
/// - Since: 0.17.0
final class WireframeThemeQuantityInputComponentTokensProvider: AllQuantityInputComponentTokensProvider {

    /// Provider of size semantic tokens to use for quantity input component
    let sizes: AllSizeSemanticTokensProvider

    /// Provider of space semantic tokens to use for quantity input component
    let spaces: AllSpaceSemanticTokensProvider

    #if DEBUG
    nonisolated(unsafe) private static var instanceCount: Int = 0
    #endif

    /// Defines a provider of component tokens dedicated to `MISOQuantityInput`
    /// - Parameters:
    ///    - sizes: Provider for borders semantic tokens. If nil, a default one will be used (``WireframeThemeSizeSemanticTokensProvider``)
    ///    - spaces: Provider for _ semantic tokens. If nil, a default one will be used (``WireframeThemeSpaceSemanticTokensProvider``)
    init(sizes: AllSizeSemanticTokensProvider? = nil,
         spaces: AllSpaceSemanticTokensProvider? = nil)
    {
        OL.debug("Init of WireframeThemeQuantityInputComponentTokensProvider")
        self.sizes = (sizes ?? WireframeThemeSizeSemanticTokensProvider())
        self.spaces = (spaces ?? WireframeThemeSpaceSemanticTokensProvider())
        #if DEBUG
        Self.instanceCount++
        checkInstances(count: Self.instanceCount, for: "WireframeThemeQuantityInputComponentTokensProvider")
        #endif
    }

    deinit {
        #if DEBUG
        Self.instanceCount--
        #endif
    }

    // ଘ( ･ω･)_/ﾟ･:*:･｡☆
    // Note: So as to help the integration of generated code produced by the tokenator
    // the implementation of QuantityInputComponentTokens is not here but in Core/Themes/Wireframe/Values/ComponentTokens/WireframeTheme+QuantityInputComponentTokens.swift
    // This declaration of WireframeThemeQuantityInputComponentTokensProvider is here also to allow to write documentation.
}

// swiftlint:enable type_name
