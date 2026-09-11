// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOFoundations
import MISOThemesContract

// swiftlint:disable type_name

/// A class which wraps all **space semantic tokens**, *multiple* or not, and expose them.
/// This provider should be integrated as a `AllSpaceSemanticTokens` implementation inside `MISOTheme` so as to provide
/// all tokens to the users.
/// Closed tokens of dimensions (`AllDimensionSemanticTokensProvider`) are used so as to keep consistancy beweetn Figma specifications and library for developers.
///
/// - Since: 0.17.0
final class WireframeThemeSpaceSemanticTokensProvider: AllSpaceSemanticTokensProvider {

    /// Provider of _dimensions_  semantic tokens to use for spaces as the Swift package exposes "closed" tokens of Figma
    let dimensions: AllDimensionSemanticTokensProvider

    #if DEBUG
    nonisolated(unsafe) private static var instanceCount: Int = 0
    #endif

    /// Intializes the provider
    /// - Parameter dimensions: Provider for _ semantic tokens. If nil, a default one will be used (``WireframeThemeDimensionSemanticTokensProvider``)
    init(dimensions: AllDimensionSemanticTokensProvider? = nil) {
        OL.debug("Init of WireframeThemeSpaceSemanticTokensProvider")
        self.dimensions = (dimensions ?? WireframeThemeDimensionSemanticTokensProvider())
        #if DEBUG
        Self.instanceCount++
        checkInstances(count: Self.instanceCount, for: "WireframeThemeSizeSemanticTokensProvider")
        #endif
    }

    deinit {
        #if DEBUG
        Self.instanceCount--
        #endif
    }

    // ଘ( ･ω･)_/ﾟ･:*:･｡☆
    // Note: So as to help the integration of generated code produced by the tokenator
    // the implementation of SpaceSemanticTokens and SpaceMultipleSemanticTokens are not here
    // but in Core/Themes/Wireframe/Values/SemanticTokens/WireframeTheme+SpaceSemanticTokens.swift
    // and in Core/Themes/Wireframe/Values/SemanticTokens/WireframeTheme+SpaceMultipleSemanticTokens.swift
    // This declaration of WireframeThemeSpaceSemanticTokensProvider is here to allow to write documentation.
}

// swiftlint:enable type_name
