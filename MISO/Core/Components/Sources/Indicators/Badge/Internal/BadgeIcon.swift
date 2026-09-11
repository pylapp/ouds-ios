// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOThemesContract
import MISOTokensSemantic
import SwiftUI

struct BadgeIcon: View {

    // MARK: Properties

    let configuration: BadgeIconConfiguration

    @Environment(\.theme) private var theme
    @Environment(\.isEnabled) private var isEnabled

    // MARK: Body

    var body: some View {
        Group {
            switch configuration.status {
            case .warning:
                if isEnabled {
                    ZStack {
                        MISOImage(name: "Component-badge-icon-warning-internal-shape", color: theme.icon.colorContentStatusWarningInternalShape)
                        MISOImage(name: "Component-badge-icon-warning-external-shape", color: theme.icon.colorContentStatusWarningExternalShape)
                    }
                } else {
                    MISOImage(name: "Component-badge-icon-warning-external-shape", color: theme.colors.actionDisabled)
                }
            default:
                image
            }
        }
        .padding(.all, padding)
        .accessibilityElement() // Otherwise label cannot be used in OUDSBadge* body
    }

    // MARK: Helpers

    private var padding: CGFloat {
        switch configuration.status {
        case .neutral, .accent:
            switch configuration.size {
            case .extraSmall:
                theme.badge.spaceInsetXsmall
            case .small:
                theme.badge.spaceInsetSmall
            case .medium:
                theme.badge.spaceInsetMediumLarge
            case .large:
                theme.badge.spaceInsetMediumLarge
            }
        default:
            theme.spaces.insetNone
        }
    }

    private var image: MISOImage {
        switch configuration.status {
        case let .neutral(image), let .accent(image):
            image
        case .warning:
            MISOImage(asset: Image(decorative: "Component-badge-icon-warning-external-shape", bundle: theme.resourcesBundle))
        case .positive:
            MISOImage(asset: Image(decorative: "Component-badge-icon-tick-confirmation-fill", bundle: theme.resourcesBundle))
        case .negative:
            MISOImage(asset: Image(decorative: "Component-badge-icon-error-fill", bundle: theme.resourcesBundle))
        case .info:
            MISOImage(asset: Image(decorative: "Component-badge-icon-info-fill", bundle: theme.resourcesBundle))
        }
    }
}
