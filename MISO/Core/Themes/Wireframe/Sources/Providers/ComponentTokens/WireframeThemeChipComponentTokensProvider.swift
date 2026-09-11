// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOFoundations
import MISOThemesContract

// swiftlint:disable type_name

/// A class which wraps all **component  tokens of chip** for *chip* objects like `MISOFilterChip` and `MISOSuggestionChip`.
/// Contains also references to semantic tokens providers so as to be able to use them to define the component tokens.
/// This provider should be integrated as a `AllChipComponentTokensProvider` implementation inside `MISOTheme` so as to provide
/// all tokens to the users. It helps users to override some of the tokens and assign them to an `MISOTheme` implementation to use.
/// It implements also the protocol `ChipComponentTokens` so as to expose the component tokens for *chip* through any `MISOTheme`.
/// *Chip* components tokens are defined with semantic tokens of colors (from `AllColorSemanticTokensProvider`) ,
/// spaces (from `AllSpaceSemanticTokensProvider`), dimensions (`AllDimensionSemanticTokensProvider`),
/// border  (from `AllBorderSemanticTokensProvider`) and sizes  (from `AllSizeSemanticTokensProvider`).
///
/// - Since: 0.17.0
final class WireframeThemeChipComponentTokensProvider: AllChipComponentTokensProvider {

    /// Provider of size semantic tokens to use for chip sizes
    let sizes: AllSizeSemanticTokensProvider

    /// Provider of border semantic tokens to use for chip borders
    let borders: AllBorderSemanticTokensProvider

    /// Provider of color semantic tokens to use for chip colors
    let colors: AllColorSemanticTokensProvider

    /// Provider of spaces semantic tokens to use for chip spaces
    let spaces: AllSpaceSemanticTokensProvider

    /// Provider of _dimensions_  semantic tokens to use for spaces as the Swift package exposes "closed" tokens of Figma
    let dimensions: AllDimensionSemanticTokensProvider

    #if DEBUG
    nonisolated(unsafe) private static var instanceCount: Int = 0
    #endif

    /// Defines a provider of component tokens dedicated to `MISOFilterChip` and `MISOSuggestionChip`
    /// - Parameters:
    ///    - sizes: Provider for size semantic tokens. If nil, a default one will be used (``WireframeThemeSizeSemanticTokensProvider``)
    ///    - borders: Provider for border semantic tokens. If nil, a default one will be used (``WireframeThemeBorderSemanticTokensProvider``)
    ///    - colors: Provider for color semantic tokens. If nil, a default one will be used (``WireframeThemeColorSemanticTokensProvider``)
    ///    - spaces: Provider for space semantic tokens. If nil, a default one will be used (``WireframeThemeSpaceSemanticTokensProvider``)
    ///    - dimensions: Provider for dimension semantic tokens. If nil, a default one will be used (``WireframeThemeDimensionSemanticTokensProvider``)
    init(sizes: AllSizeSemanticTokensProvider? = nil,
         borders: AllBorderSemanticTokensProvider? = nil,
         colors: AllColorSemanticTokensProvider? = nil,
         spaces: AllSpaceSemanticTokensProvider? = nil,
         dimensions: AllDimensionSemanticTokensProvider? = nil)
    {
        OL.debug("Init of WireframeThemeChipComponentTokensProvider")
        self.sizes = (sizes ?? WireframeThemeSizeSemanticTokensProvider())
        self.borders = (borders ?? WireframeThemeBorderSemanticTokensProvider())
        self.colors = (colors ?? WireframeThemeColorSemanticTokensProvider())
        self.spaces = (spaces ?? WireframeThemeSpaceSemanticTokensProvider())
        self.dimensions = (dimensions ?? WireframeThemeDimensionSemanticTokensProvider())
        #if DEBUG
        Self.instanceCount++
        checkInstances(count: Self.instanceCount, for: "WireframeThemeChipComponentTokensProvider")
        #endif
    }

    deinit {
        #if DEBUG
        Self.instanceCount--
        #endif
    }
    // ଘ( ･ω･)_/ﾟ･:*:･｡☆
    // Note: So as to help the integration of generated code produced by the tokenator
    // the implementation of ChipComponentTokens is not here but in Core/Themes/Wireframe/Values/ComponentTokens/WireframeTheme+ChipComponentTokens.swift
    // This declaration of WireframeThemeChipComponentTokensProvider is here also to allow to write documentation.
}

// swiftlint:enable type_name
