// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOFoundations
import MISOTokensRaw
import MISOTokensSemantic

extension MISOTheme {

    // MARK: Semantic Grid token - Helper

    /// The min column width of a grid based on the given size class.
    ///
    /// ```swift
    ///     struct YourView: View {
    ///
    ///         @Environment(\.theme) var theme
    ///         @Environment(\.misoHorizontalSizeClass) var sizeClass
    ///
    ///         func someFunc() -> GridRawToken {
    ///             theme.gridMinWidth(for: sizeClass)
    ///         }
    ///     }
    /// ```
    ///
    /// - Parameter sizeClass: The current interface size class
    /// - Returns `GridRawToken`: The minimal width according to viewports / size classes.
    public final func gridMinWidth(for sizeClass: MISOUserInterfaceSizeClass) -> GridRawToken {
        switch sizeClass {
        case .extraCompact:
            grids.extraCompactMinWidth
        case .compact:
            grids.compactMinWidth
        case .regular:
            grids.regularMinWidth
        @unknown default:
            OL.fatal("🤖 Raw token unavailable for \(sizeClass)!")
        }
    }

    /// The max column width of a grid based on the given size class.
    ///
    /// ```swift
    ///     struct YourView: View {
    ///
    ///         @Environment(\.theme) var theme
    ///         @Environment(\.misoHorizontalSizeClass) var sizeClass
    ///
    ///         func someFunc() -> GridRawToken {
    ///             theme.gridMaxWidth(for: sizeClass)
    ///         }
    ///     }
    /// ```
    ///
    /// - Parameter sizeClass: The current interface size class
    /// - Returns `GridRawToken`: The maximal width according to viewports / size classes.
    public final func gridMaxWidth(for sizeClass: MISOUserInterfaceSizeClass) -> GridRawToken {
        switch sizeClass {
        case .extraCompact:
            grids.extraCompactMaxWidth
        case .compact:
            grids.compactMaxWidth
        case .regular:
            grids.regularMaxWidth
        @unknown default:
            OL.fatal("🤖 Raw token unavailable for \(sizeClass)!")
        }
    }

    /// The margin of a grid based on the given size class.
    ///
    /// ```swift
    ///     struct YourView: View {
    ///
    ///         @Environment(\.theme) var theme
    ///         @Environment(\.misoHorizontalSizeClass) var sizeClass
    ///
    ///         func someFunc() -> GridRawToken {
    ///             theme.gridMargin(for: sizeClass)
    ///         }
    ///     }
    /// ```
    ///
    /// - Parameter sizeClass: The current interface size class
    /// - Returns `GridRawToken`: The margin according to viewports / size classes.
    public final func gridMargin(for sizeClass: MISOUserInterfaceSizeClass) -> GridRawToken {
        switch sizeClass {
        case .extraCompact:
            grids.extraCompactMargin
        case .compact:
            grids.compactMargin
        case .regular:
            grids.regularMargin
        @unknown default:
            OL.fatal("🤖 Raw token unavailable for \(sizeClass)!")
        }
    }

    /// The column gap of a grid based on the given size class.
    ///
    /// ```swift
    ///     struct YourView: View {
    ///
    ///         @Environment(\.theme) var theme
    ///         @Environment(\.misoHorizontalSizeClass) var sizeClass
    ///
    ///         func someFunc() -> GridRawToken {
    ///             theme.gridColumnGap(for: sizeClass)
    ///         }
    ///     }
    /// ```
    ///
    /// - Parameter sizeClass: The current interface size class
    /// - Returns `GridRawToken`: The column gap according to viewports / size classes.
    public final func gridColumnGap(for sizeClass: MISOUserInterfaceSizeClass) -> GridRawToken {
        switch sizeClass {
        case .extraCompact:
            grids.extraCompactColumnGap
        case .compact:
            grids.compactColumnGap
        case .regular:
            grids.regularColumnGap
        @unknown default:
            OL.fatal("🤖 Raw token unavailable for \(sizeClass)!")
        }
    }
}
