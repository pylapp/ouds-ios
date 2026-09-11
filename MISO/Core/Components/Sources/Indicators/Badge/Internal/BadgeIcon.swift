//
// Software Name: OUDS iOS
// SPDX-FileCopyrightText: Copyright (c) Orange SA
// SPDX-License-Identifier: MIT
//
// This software is distributed under the MIT license,
// the text of which is available at https://opensource.org/license/MIT/
// or see the "LICENSE" file for more details.
//
// Authors: See CONTRIBUTORS.txt
// Software description: A SwiftUI components library with code examples for Orange Unified Design System
//

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
