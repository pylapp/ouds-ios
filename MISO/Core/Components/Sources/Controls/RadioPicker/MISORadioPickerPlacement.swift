// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

#if !os(watchOS) && !os(tvOS)
/// Enumerates the types of layouts a ``MISORadioPicker`` can have
///
/// - Since: 0.14.0
@frozen public enum MISORadioPickerPlacement {

    /// All radio buttons are in one row, with a flag saying if a scroll indicator can be displayed or not
    case horizontal(Bool)

    /// All radio buttons are in one column
    case vertical
}
#endif
