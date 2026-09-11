// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

/// Defined as the group of all **raw tokens** related to **grid**.
/// ``GridRawTokens`` are tokens to use to define *grids*  using ``GridRawToken`` type.
///
/// - Since: 0.8.0
@frozen public enum GridRawTokens {

    // Values are defined in *GridRawTokens+Values.swift* file updated by the tokenator.
    // Primitive types such as `Int` must be used to as to allow to use `@objc` keywords in extensions for overriding.
    // Such tokens are packed in a _Swift enum_ so as to gather them in one object with the suitable namespace and avoid to have just constants in nothing else
    // (i.e. publicly accessible from everywhere). More optimized than struct.

    // ଘ( ･ω･)_/ﾟ･:*:･｡☆
    // Note: So as to help the tokenator, the values have been added in the Values folder
    // This trick helps also to write documentation for these tokens as the tokenator cannot generate documentation
}
