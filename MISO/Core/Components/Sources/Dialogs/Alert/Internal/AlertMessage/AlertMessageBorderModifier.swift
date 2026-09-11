// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOTokensSemantic
import SwiftUI

struct AlertMessageBorderModifier: ViewModifier {

    // MARK: - Properties

    let status: MISOAlertStatus

    @Environment(\.theme) private var theme

    // MARK: - Body

    func body(content: Content) -> some View {
        content
            .border(style: theme.borders.styleDefault,
                    width: theme.alertMessage.borderWidth,
                    radius: radius,
                    color: color)
            .clipShape(RoundedRectangle(cornerRadius: radius))
            .contentShape(RoundedRectangle(cornerRadius: radius))
    }

    // MARK: - Helpers

    private var radius: BorderRadiusSemanticToken {
        theme.tuning.hasRoundedAlertMessages ? theme.alert.borderRadiusRounded : theme.alert.borderRadiusDefault
    }

    private var color: MultipleColorSemanticToken {
        switch status {
        case .neutral:
            theme.colors.borderDefault
        case .accent:
            theme.colors.borderStatusAccent
        case .positive:
            theme.colors.borderStatusPositive
        case .info:
            theme.colors.borderStatusInfo
        case .warning:
            theme.colors.borderStatusWarning
        case .negative:
            theme.colors.borderStatusNegative
        }
    }
}
