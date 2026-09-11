// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

/// This enum helps to add new **color raw tokens** exclusive to this ``WireframeTheme``.
/// Such tokens are packed in a _Swift enum_ so as to gather them in one object with the suitable namespace and avoid to have just constants in nothing else
///  (i.e. publicly accessible from everywhere). More optimized than dimensionstruct_.
///
/// - Since: 0.17.0
@frozen public enum WireframeBrandColorRawTokens {

    // ଘ( ･ω･)_/ﾟ･:*:･｡☆
    // Note: So as to help the tokenator, the values have been added in the Values folder
    // This trick helps also to write documentation for these tokens as the tokenator cannot generate documentation
}
