// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOTokensSemantic
import SwiftUI

struct AlertMessageBulletListItem: View {

    // MARK: - Properties

    let text: TextualContent
    let status: MISOAlertStatus

    @Environment(\.theme) private var theme
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize: DynamicTypeSize

    // MARK: - Body

    var body: some View {
        HStack(alignment: .top, spacing: theme.bulletList.spaceColumnGapBodyMedium) {
            HStack(alignment: .center) {
                MISOImage(name: "Component-bullet-list-bullet-level-0", color: foregroundColor)
                    .frame(width: iconSize, height: iconSize)
            }
            .frame(width: width, alignment: .trailing)
            .frame(maxHeight: maxHeight, alignment: .center)

            textView(for: text)
                .labelDefaultMedium(theme)
                .foregroundColor(foregroundColor)
                .frame(maxWidth: theme.sizes.maxWidthLabelMedium.dimension(for: horizontalSizeClass ?? .regular), alignment: .leading)
        }
    }

    // MARK: - Helpers

    private var iconSize: CGFloat {
        let rawSize = theme.sizes.iconWithLabelMediumSizeSmall
        return rawSize * dynamicTypeSize.percentageRate / 100
    }

    private var width: CGFloat {
        let rawSize = theme.sizes.iconWithLabelMediumSizeMedium
        return rawSize * dynamicTypeSize.percentageRate / 100
    }

    private var maxHeight: CGFloat {
        let rawSize = theme.fonts.lineHeightBodyMedium.lineHeight(for: verticalSizeClass ?? .regular)
        return rawSize * dynamicTypeSize.percentageRate / 100
    }

    private var foregroundColor: MultipleColorSemanticToken {
        switch status {
        case .neutral:
            theme.colors.contentDefault
        case .accent:
            theme.colors.contentOnStatusAccentMuted
        case .positive:
            theme.colors.contentOnStatusPositiveMuted
        case .negative:
            theme.colors.contentOnStatusNegativeMuted
        case .warning:
            theme.colors.contentOnStatusWarningMuted
        case .info:
            theme.colors.contentOnStatusInfoMuted
        }
    }
}
