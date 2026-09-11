// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOFoundations
import MISOThemesContract

// swiftlint:disable type_name

/// A class which wraps all **component  tokens of select input** for objects like `MISOSelectInput`.
/// Contains also references to semantic tokens providers so as to be able to use them to define the component tokens.
/// This provider should be integrated as a `AllSelectInputComponentTokensProvider` implementation inside `MISOTheme` so as to provide
/// all tokens to the users. It helps users to override some of the tokens and assign them to an `MISOTheme` implementation to use.
/// It implements also the protocol `SelectInputComponentTokens` so as to expose the component tokens for *select* through any `MISOTheme`.
/// *Select input* components tokens are defined with semantic tokens of dimensions (from `AllDimensionSemanticTokensProvider`).
///
/// - Since: 0.17.0
final class WireframeThemeSelectInputComponentTokensProvider: AllSelectInputComponentTokensProvider {

    /// Provider of dimensions semantic tokens to use for pin code input dimensions
    let dimensions: AllDimensionSemanticTokensProvider

    #if DEBUG
    nonisolated(unsafe) private static var instanceCount: Int = 0
    #endif

    /// Defines a provider of component tokens dedicated to `MISOSelect`
    /// - Parameter dimensions: Provider for _ semantic tokens. If nil, a default one will be used (``WireframeThemeDimensionSemanticTokensProvider``)
    init(dimensions: AllDimensionSemanticTokensProvider? = nil) {
        OL.debug("Init of WireframeThemeSelectInputComponentTokensProvider")
        self.dimensions = (dimensions ?? WireframeThemeDimensionSemanticTokensProvider())
        #if DEBUG
        Self.instanceCount++
        checkInstances(count: Self.instanceCount, for: "WireframeThemeSelectInputComponentTokensProvider")
        #endif
    }

    deinit {
        #if DEBUG
        Self.instanceCount--
        #endif
    }

    // ଘ( ･ω･)_/ﾟ･:*:･｡☆
    // Note: So as to help the integration of generated code produced by the tokenator
    // the implementation of SelectComponentTokens is not here but in Core/Themes/Wireframe/Values/ComponentTokens/WireframeTheme+SelectInputComponentTokens.swift
    // This declaration of WireframeThemeSelectInputComponentTokensProvider is here also to allow to write documentation.
}

// swiftlint:enable type_name
