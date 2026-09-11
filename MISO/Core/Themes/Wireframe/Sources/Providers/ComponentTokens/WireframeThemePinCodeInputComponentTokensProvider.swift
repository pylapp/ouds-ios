// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOFoundations
import MISOThemesContract

// swiftlint:disable type_name

/// A class which wraps all **component  tokens of pin code input** like `MISOPinCodeInput`.
/// Contains also references to semantic tokens providers so as to be able to use them to define the component tokens.
/// This provider should be integrated as a `AllPinCodeInputComponentTokensProvider` implementation inside `MISOTheme` so as to provide
/// all tokens to the users. It helps users to override some of the tokens and assign them to an `MISOTheme` implementation to use.
/// It implements also the protocol `PinCodeInputComponentTokens` so as to expose the component tokens for *pin code input* through any `MISOTheme`.
/// *Pint code input* components tokens are defined with semantic tokens of dimensions (from `AllDimensionSemanticTokensProvider`),
/// ans spaces (from `AllSpaceSemanticTokensProvider`).
///
/// - Since: 0.17.0
final class WireframeThemePinCodeInputComponentTokensProvider: AllPinCodeInputComponentTokensProvider {

    /// Provider of spaces semantic tokens to use for pin code input  spaces
    let spaces: AllSpaceSemanticTokensProvider

    /// Provider of dimensions semantic tokens to use for pin code input dimensions
    let dimensions: AllDimensionSemanticTokensProvider

    #if DEBUG
    nonisolated(unsafe) private static var instanceCount: Int = 0
    #endif

    /// Defines a provider of component tokens dedicated to `MISOPinCodeInput`
    /// - Parameters:
    ///    - spaces: Provider for space semantic tokens. If nil, a default one will be used (``WireframeThemeSpaceSemanticTokensProvider``)
    ///    - dimensions: Provider for dimension semantic tokens. If nil, a default one will be used (``WireframeThemeDimensionSemanticTokensProvider``)
    init(spaces: AllSpaceSemanticTokensProvider? = nil,
         dimensions: AllDimensionSemanticTokensProvider? = nil)
    {
        OL.debug("Init of WireframeThemePinCodeInputComponentTokensProvider")
        self.spaces = (spaces ?? WireframeThemeSpaceSemanticTokensProvider())
        self.dimensions = (dimensions ?? WireframeThemeDimensionSemanticTokensProvider())
        #if DEBUG
        Self.instanceCount++
        checkInstances(count: Self.instanceCount, for: "WireframeThemePinCodeInputComponentTokensProvider")
        #endif
    }

    deinit {
        #if DEBUG
        Self.instanceCount--
        #endif
    }

    // ଘ( ･ω･)_/ﾟ･:*:･｡☆
    // Note: So as to help the integration of generated code produced by the tokenator
    // the implementation of PinCodeInputComponentTokens is not here but in Core/Themes/Wireframe/Values/ComponentTokens/WireframeTheme+PinCodeInputComponentTokens.swift
    // This declaration of WireframeThemePinCodeInputComponentTokensProvider is here also to allow to write documentation.
}

// swiftlint:enable type_name
