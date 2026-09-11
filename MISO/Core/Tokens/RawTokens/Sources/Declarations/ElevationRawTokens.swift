// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

/// Defined as the group of all **raw tokens** related to **elevations**.
/// ``ElevationRawTokens`` are tokens to use to define *elevations* , i.e. in the end box shadow effects.
/// These tokens are used to define these effects thanks to several types: the *blur*, the *X offset* and the *Y offset*, all of them being ``ElevationRawToken`` type.
/// Combinations of these three values can be defined inside ``ElevationCompositeRawToken`` i.e. *composite tokens* defining a whil box shadow to use for elevation effect.
///
/// - Since: 0.8.0
@frozen public enum ElevationRawTokens {

    // Values are defined in *ElevationRawTokens+Values.swift* file updated by the tokenator and *ElevationRawTokens+Values.swift* updated manualy by the development team.
    // Primitive types such as `CGFloat` must be used to as to allow to use `@objc` keywords in extensions for overriding.
    // Such tokens are packed in a _Swift enum_ so as to gather them in one object with the suitable namespace and avoid to have just constants in nothing else
    //  (i.e. publicly accessible from everywhere). More optimized than dimensionstruct_.

    // ଘ( ･ω･)_/ﾟ･:*:･｡☆
    // Note: So as to help the tokenator, the values have been added in the Values folder
    // This trick helps also to write documentation for these tokens as the tokenator cannot generate documentation
}
