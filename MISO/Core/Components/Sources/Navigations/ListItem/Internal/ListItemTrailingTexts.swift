// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOTokensSemantic
import SwiftUI

struct ListItemTrailingTexts: View {

    // MARK: Properties

    let textType: MISOListItemTrailing.TextType

    @Environment(\.theme) private var theme
    @Environment(\.isEnabled) private var isEnabled
    @Environment(\.misoListItemSize) private var itemSize
    @Environment(\.misoListItemContainersAlignment) private var alignment

    // MARK: Body

    var body: some View {
        VStack(alignment: .trailing, spacing: theme.listItem.spaceRowGap) {
            switch textType {
            case let .label(label):
                Text(label)
                    .labelDefaultLarge(theme)
                    .foregroundColor(labelColor)
            case let .labelMuted(label):
                Text(label)
                    .labelDefaultLarge(theme)
                    .foregroundColor(labelColor)
            case let .labelStrong(label):
                Text(label)
                    .labelStrongLarge(theme)
                    .foregroundColor(labelColor)
            case let .labelAndExtraLabel(label, extraLabel):
                Text(label)
                    .labelDefaultLarge(theme)
                    .foregroundColor(labelColor)

                if itemSize == .default {
                    Text(extraLabel)
                        .labelStrongMedium(theme)
                        .foregroundColor(isEnabled ? theme.colors.contentDefault : theme.colors.contentDisabled)
                }
            }
        }
        .padding(.top, topPadding)
        .multilineTextAlignment(.trailing)
    }

    // MARK: Helpers

    private var labelColor: MultipleColorSemanticToken {
        if !isEnabled {
            theme.colors.contentDisabled
        } else {
            switch textType {
            case .label, .labelStrong, .labelAndExtraLabel:
                theme.colors.contentDefault
            case .labelMuted:
                theme.colors.contentMuted
            }
        }
    }

    private var topPadding: SpaceSemanticToken {
        switch alignment {
        case .center:
            theme.spaces.fixedNone
        case .top:
            switch itemSize {
            case .default:
                theme.listItem.spacePaddingBlockTopAlignmentTopTextContainerDefault
            case .small:
                theme.listItem.spacePaddingBlockTopAlignmentTopTextContainerSmall
            }
        }
    }
}
