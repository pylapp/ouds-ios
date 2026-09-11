// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOTokensSemantic
import SwiftUI

struct TagBackgroundModifier: ViewModifier {

    // MARK: Properties

    let appearance: MISOTag.Appearance
    let type: MISOTag.`Type`

    @Environment(\.isEnabled) private var isEnabled
    @Environment(\.theme) private var theme

    // MARK: Body

    func body(content: Content) -> some View {
        content.background(background)
    }

    // MARK: Helpers

    private var background: MultipleColorSemanticToken {
        switch type {
        case let .status(_, status):
            if isEnabled {
                switch appearance {
                case .emphasized:
                    emphasizedBackground(for: status)
                case .muted:
                    mutedBackground(for: status)
                }
            } else {
                theme.colors.actionDisabled
            }
        case .loader:
            theme.colors.surfaceSecondary
        }
    }

    private func emphasizedBackground(for status: MISOTag.Status) -> MultipleColorSemanticToken {
        switch status.category {
        case .neutral:
            theme.colors.surfaceInverseHigh
        case .accent:
            theme.colors.surfaceStatusAccentEmphasized
        case .positive:
            theme.colors.surfaceStatusPositiveEmphasized
        case .warning:
            theme.colors.surfaceStatusWarningEmphasized
        case .negative:
            theme.colors.surfaceStatusNegativeEmphasized
        case .info:
            theme.colors.surfaceStatusInfoEmphasized
        }
    }

    private func mutedBackground(for status: MISOTag.Status) -> MultipleColorSemanticToken {
        switch status.category {
        case .neutral:
            theme.colors.surfaceSecondary
        case .accent:
            theme.colors.surfaceStatusAccentMuted
        case .positive:
            theme.colors.surfaceStatusPositiveMuted
        case .warning:
            theme.colors.surfaceStatusWarningMuted
        case .negative:
            theme.colors.surfaceStatusNegativeMuted
        case .info:
            theme.colors.surfaceStatusInfoMuted
        }
    }
}
