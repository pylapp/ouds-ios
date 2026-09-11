// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import SwiftUI

/// A custom parameter attribute that constructs `MISOBulletList.Item` from closures.
///
/// You typically use `MISOBulletListItemBuilder` as a parameter attribute for
/// sub items producing closure parameters, allowing those closures to provide
/// multiple sub items.
///
/// Clients of this function can use multiple-statement closures to provide
/// several sub items, as shown in the following example:
///
/// ```swift
///     func listItem() -> [MISOBulletList.Item] {
///         MISOBulletList.Item("First item")
///         MISOBulletList.Item("Second item") {
///             MISOBulletList.Item("First sub item")
///             MISOBulletList.Item("Second sub item")
///         }
///     }
/// ```
///
/// - Since: 1.2.0
@resultBuilder
@frozen public enum MISOBulletListItemBuilder {

    /// Combines multiple `MISOBulletList.Item` instances into a single array
    public static func buildBlock(_ components: MISOBulletList.Item...) -> [MISOBulletList.Item] {
        components
    }

    /// Combines multiple arrays of OUDSBulletListItem into a single array
    /// Accepts variadic array of arrays and flattens them into one array
    public static func buildBlock(_ components: [MISOBulletList.Item]...) -> [MISOBulletList.Item] {
        components.flatMap(\.self)
    }

    /// Handles the first branch of an if-else statement (true branch)
    public static func buildEither(first: [MISOBulletList.Item]) -> [MISOBulletList.Item] {
        first
    }

    /// Handles the second branch of an if-else statement (false branch)
    public static func buildEither(second: [MISOBulletList.Item]) -> [MISOBulletList.Item] {
        second
    }

    /// Finalizes the result, returning the complete list of items
    public static func buildFinalResult(_ component: [MISOBulletList.Item]) -> [MISOBulletList.Item] {
        component
    }
}
