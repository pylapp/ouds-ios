// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

#if !os(watchOS) && !os(tvOS)
import Foundation

/// Enumerates the types of layouts a ``MISOCheckboxPicker`` can have
///
/// - Since: 0.14.0
@frozen public enum MISOCheckboxPickerPlacement {

    /// A `RootLabel` is in the end a String
    public typealias RootLabel = String

    // MARK: - Values

    /// All checkboxes are in one row, with a flag saying if a scroll indicator can be displayed or not
    case horizontal(Bool)

    /// All checkboxes are in one column
    case vertical

    /// All checkboxes are in one column, with a root checkbox in the top, all children below, and a String as label
    case verticalRooted(RootLabel, DisplayType)

    // MARK: - Display Type

    /// The type of display for the root label in case of *vertical rooted* picker placement.
    /// - Since: 0.14.0
    @frozen public enum DisplayType {

        /// Display only the given root label
        case textOnly

        /// Display the given root label, and the number of selected items,
        case textAndCount

        /// Display the given root label, and the number of selected items if greater than zero
        case textAndPositiveCount
    }
}
#endif
