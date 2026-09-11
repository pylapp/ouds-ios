// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

/// Type alias precising `Double` value are used (because of multiplier factors) for a **border width raw token**, to keep grammar clean and clear with design system grammar.
public typealias BorderWidthRawToken = Double

/// Type alias precising `Double` value are used (because of multiplier factors) for a **border radius raw token**, to keep grammar clean and clear with design system grammar.
public typealias BorderRadiusRawToken = Double

/// Type alias for `String` so as to help users (developers) to see that raw tokens are needed and linked to `String` for **border style raw token**.
/// `String` are used here to prevent to rely on _SwiftUI_ types which are not compatible with `@objc` and are heavier than primitive types.
/// In addition, if new styles are defined in design team side (such as kind of composite styles) and need to be processed differently
/// (because not available with _SwiftUI_ because are composed of several styles),
/// such  `String` values could be processed later without any API breaks.
/// Keeps grammar clean and clear with design system grammar.
public typealias BorderStyleRawToken = String
