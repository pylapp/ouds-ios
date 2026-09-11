// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOTokensSemantic
import SwiftUI

struct TagLabel: View {

    // MARK: Stored Properties

    let appearance: MISOTag.Appearance
    let size: MISOTag.Size
    let type: MISOTag.`Type`

    @Environment(\.theme) private var theme
    @Environment(\.isEnabled) private var isEnabled

    // MARK: Body

    var body: some View {
        Group {
            switch size {
            case .default:
                Text(type.label)
                    .labelStrongMedium(theme)
            case .small:
                Text(type.label)
                    .labelModerateSmall(theme)
            }
        }
        .foregroundColor(color)
    }

    // MARK: Helpers

    private var color: MultipleColorSemanticToken {
        switch type {
        case let .status(_, status):
            if isEnabled {
                switch appearance {
                case .emphasized:
                    emphasizedColor(for: status)
                case .muted:
                    mutedColor(for: status)
                }
            } else {
                theme.colors.contentOnActionDisabled
            }
        case .loader:
            theme.colors.contentDefault
        }
    }

    private func emphasizedColor(for status: MISOTag.Status) -> MultipleColorSemanticToken {
        switch status.category {
        case .neutral:
            theme.colors.contentInverse
        case .accent:
            theme.colors.contentOnStatusAccentEmphasized
        case .positive:
            theme.colors.contentOnStatusPositiveEmphasized
        case .warning:
            theme.colors.contentOnStatusWarningEmphasized
        case .negative:
            theme.colors.contentOnStatusNegativeEmphasized
        case .info:
            theme.colors.contentOnStatusInfoEmphasized
        }
    }

    private func mutedColor(for status: MISOTag.Status) -> MultipleColorSemanticToken {
        switch status.category {
        case .neutral:
            theme.colors.contentDefault
        case .accent:
            theme.colors.contentOnStatusAccentMuted
        case .positive:
            theme.colors.contentOnStatusPositiveMuted
        case .warning:
            theme.colors.contentOnStatusWarningMuted
        case .negative:
            theme.colors.contentOnStatusNegativeMuted
        case .info:
            theme.colors.contentOnStatusInfoMuted
        }
    }
}
