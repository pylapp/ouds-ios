// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOFoundations
import MISOThemesContract

// swiftlint:disable type_name

/// A class which wraps all **component  tokens of bullet list** for *bullet list* objects like `MISOBulletList`.
/// Contains also references to semantic tokens providers so as to be able to use them to define the component tokens.
/// This provider should be integrated as a `AllBulletListComponentTokensProvider` implementation inside `MISOTheme` so as to provide
/// all tokens to the users. It helps users to override some of the tokens and assign them to an `MISOTheme` implementation to use.
/// It implements also the protocol `BulletListComponentTokens` so as to expose the component tokens for *bullet list* through any `MISOTheme`.
/// *Bullet list* components tokens are defined with raw and semantic tokens of spaces (from `AllSpaceSemanticTokensProvider`).
///
/// - Since: 0.17.0
final class WireframeThemeBulletListComponentTokensProvider: AllBulletListComponentTokensProvider {

    /// Provider of spaces semantic tokens to use for link spaces
    let spaces: AllSpaceSemanticTokensProvider

    #if DEBUG
    nonisolated(unsafe) private static var instanceCount: Int = 0
    #endif

    /// Defines a provider of component tokens dedicated to `MISOLink`
    /// - Parameter spaces: Provider for space semantic tokens. If nil, a default one will be used (``WireframeThemeSpaceSemanticTokensProvider``)
    init(spaces: AllSpaceSemanticTokensProvider? = nil) {
        OL.debug("Init of WireframeThemeBulletListComponentTokensProvider")
        self.spaces = (spaces ?? WireframeThemeSpaceSemanticTokensProvider())
        #if DEBUG
        Self.instanceCount++
        checkInstances(count: Self.instanceCount, for: "WireframeThemeBulletListComponentTokensProvider")
        #endif
    }

    deinit {
        #if DEBUG
        Self.instanceCount--
        #endif
    }

    // ଘ( ･ω･)_/ﾟ･:*:･｡☆
    // Note: So as to help the integration of generated code produced by the tokenator
    // the implementation of BulletListComponentTokens is not here but in Core/Themes/Wireframe/Values/ComponentTokens/WireframeTheme+BulletListComponentTokens.swift
    // This declaration of WireframeThemeBulletListComponentTokensProvider is here also to allow to write documentation.
}

// swiftlint:enable type_name
