// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOFoundations
import MISOThemesContract

// swiftlint:disable type_name

/// A class which wraps all **component  tokens of badge** for *badge* objects like `MISOBadgeStandard`, `MISOBadgeIcon` and `MISOBadgeCount`.
/// Contains also references to semantic tokens providers so as to be able to use them to define the component tokens.
/// This provider should be integrated as a `AllBadgeComponentTokensProvider` implementation inside `MISOTheme` so as to provide
/// all tokens to the users. It helps users to override some of the tokens and assign them to an `MISOTheme` implementation to use.
/// It implements also the protocol `BadgeComponentTokens` so as to expose the component tokens for *badge* through any `MISOTheme`.
/// *Badge* components tokens are defined with semantic tokens of dimensions (`AllDimensionSemanticTokensProvider`)
/// and spaces (from `AllSpaceSemanticTokensProvider`).
///
/// - Since: 0.17.0
final class WireframeThemeBadgeComponentTokensProvider: AllBadgeComponentTokensProvider {

    /// Provider of spaces semantic tokens to use for badge spaces
    let spaces: AllSpaceSemanticTokensProvider

    /// Provider of _dimensions_  semantic tokens to use for spaces as the Swift package exposes "closed" tokens of Figma
    let dimensions: AllDimensionSemanticTokensProvider

    #if DEBUG
    nonisolated(unsafe) private static var instanceCount: Int = 0
    #endif

    /// Defines a provider of component tokens dedicated to `MISOBadgeStandard`, `MISOBadgeIcon` and `MISOBadgeCount`
    /// - Parameters:
    ///    - spaces: Provider for space semantic tokens, if nil, a default one will be used (``WireframeThemeSpaceSemanticTokensProvider``)
    ///    - dimensions: Provider for dimension semantic tokens, if nil, default one will be used ( ``WireframeThemeDimensionSemanticTokensProvider``)
    init(spaces: AllSpaceSemanticTokensProvider? = nil,
         dimensions: AllDimensionSemanticTokensProvider? = nil)
    {
        OL.debug("Init of WireframeThemeBadgeComponentTokensProvider")
        self.spaces = (spaces ?? WireframeThemeSpaceSemanticTokensProvider())
        self.dimensions = (dimensions ?? WireframeThemeDimensionSemanticTokensProvider())
        #if DEBUG
        Self.instanceCount++
        checkInstances(count: Self.instanceCount, for: "WireframeThemeBadgeComponentTokensProvider")
        #endif
    }

    deinit {
        #if DEBUG
        Self.instanceCount--
        #endif
    }

    // ଘ( ･ω･)_/ﾟ･:*:･｡☆
    // Note: So as to help the integration of generated code produced by the tokenator
    // the implementation of BadgeComponentTokens is not here but in Core/Themes/Wireframe/Values/ComponentTokens/WireframeTheme+BadgeComponentTokens.swift
    // This declaration of WireframeThemeBadgeComponentTokensProvider is here also to allow to write documentation.
}

// swiftlint:enable type_name
