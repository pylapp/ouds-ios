// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOThemesContract
import MISOTokensSemantic

// swiftlint:disable missing_docs

/// List of colors available for dividers (i.e. `MISOHorizontalDivider` or `MISOVerticalDivider`)
///
/// - Since: 0.14.0
@frozen public enum MISODividerColor {
    case `default`
    case muted
    case emphasized
    case brandPrimary
    case onBrandPrimary
    case alwaysBlack
    case alwaysWhite
    case alwaysOnBlack
    case alwaysOnWhite
    // swiftlint:enable missing_docs

    /// Provides the color sementic token in theme associated to the divider color
    ///
    /// - Parameter theme: The theme that defines the token color
    public func colorToken(in theme: OUDSTheme) -> MultipleColorSemanticToken {
        switch self {
        case .default:
            theme.colors.borderDefault
        case .muted:
            theme.colors.borderMuted
        case .emphasized:
            theme.colors.borderEmphasized
        case .brandPrimary:
            theme.colors.borderBrandPrimary
        case .onBrandPrimary:
            theme.colors.borderOnBrandPrimary
        case .alwaysBlack:
            MultipleColorSemanticToken(theme.colors.alwaysBlack)
        case .alwaysWhite:
            MultipleColorSemanticToken(theme.colors.alwaysWhite)
        case .alwaysOnBlack:
            MultipleColorSemanticToken(theme.colors.alwaysOnBlack)
        case .alwaysOnWhite:
            MultipleColorSemanticToken(theme.colors.alwaysOnWhite)
        }
    }
}
