// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOTokensSemantic
import SwiftUI

// MARK: - Alert Leading Icon

struct AlertLeadingIcon: View {

    // MARK: Properties

    private let status: MISOAlertStatus

    @Environment(\.theme) private var theme
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize: DynamicTypeSize

    // MARK: Initilizer

    init?(status: MISOAlertStatus) {
        if status.hasIcon {
            self.status = status
        } else {
            return nil
        }
    }

    // MARK: Body

    var body: some View {
        HStack {
            switch status {
            case let .accent(icon):
                icon?.update(with: theme.colors.contentStatusAccent)
            case let .neutral(icon):
                icon?.update(with: theme.colors.contentDefault)
            case .negative:
                MISOImage(name: "Component-alert-important-fill", color: theme.colors.contentStatusNegative)
            case .positive:
                MISOImage(name: "Component-alert-tick-confirmation-fill", color: theme.colors.contentStatusPositive)
            case .info:
                MISOImage(name: "Component-alert-info-fill", color: theme.colors.contentStatusInfo)
            case .warning:
                ZStack {
                    MISOImage(name: "Component-alert-warning-external-shape", color: theme.icon.colorContentStatusWarningExternalShape)
                    MISOImage(name: "Component-alert-warning-internal-shape", color: theme.icon.colorContentStatusWarningInternalShape)
                }
            }
        }
        .frame(width: size, height: size)
    }

    private var size: CGFloat {
        theme.alert.sizeAsset * dynamicTypeSize.percentageRate / 100
    }
}

// MARK: - Extension of MISO Alert Status

extension MISOAlertStatus {
    var hasIcon: Bool {
        switch self {
        case let .neutral(icon), let .accent(icon):
            icon != nil
        default:
            true
        }
    }
}
