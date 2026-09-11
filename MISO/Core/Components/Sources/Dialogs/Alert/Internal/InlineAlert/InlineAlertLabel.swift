// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOTokensSemantic
import SwiftUI

struct InlineAlertLabel: View {

    // MARK: - Properties

    let text: String
    let status: MISOAlertStatus

    @Environment(\.theme) private var theme
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass

    var body: some View {
        Text(text)
            .labelModerateLarge(theme)
            .foregroundColor(contentColor)
            .frame(maxWidth: theme.sizes.maxWidthLabelLarge.dimension(for: horizontalSizeClass ?? .regular), alignment: .leading)
            .accessibilityLabel(accessibilityLabel)
            .onAppear {
                VoiceOverUtils.announce(accessibilityLabel)
            }
    }

    // MARK: - Private helper

    private var contentColor: MultipleColorSemanticToken {
        switch status {
        case .neutral, .accent:
            theme.colors.contentDefault
        case .positive:
            theme.colors.contentStatusPositive
        case .info:
            theme.colors.contentStatusInfo
        case .warning:
            theme.colors.contentStatusWarning
        case .negative:
            theme.colors.contentStatusNegative
        }
    }

    private var accessibilityLabel: String {
        let labelPrefix = switch status {
        case .warning:
            "core_shared_warning_a11y".localized() + ","
        case .negative:
            "core_ashared_negative_a11y".localized() + ","
        case .info:
            "core_alertMessage_info_a11y".localized() + ","
        default:
            ""
        }
        return "\(labelPrefix) \(text)"
    }
}
