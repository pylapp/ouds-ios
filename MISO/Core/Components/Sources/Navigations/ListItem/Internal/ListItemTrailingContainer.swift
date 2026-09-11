// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOTokensSemantic
import SwiftUI

/// Trailing container of the ``ListItemContent``.
struct ListItemTrailingContainer: View {

    // MARK: Properties

    let trailing: MISOListItemTrailing
    let interactionState: MISOButtonInteractionState

    @Environment(\.theme) private var theme
    @Environment(\.misoListItemSize) private var itemSize
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize: DynamicTypeSize

    // MARK: Body

    var body: some View {
        HStack {
            switch trailing {
            case let .text(type):
                ListItemTrailingTexts(textType: type)
            case let .badge(badgeType):
                switch badgeType {
                case let .standard(badge):
                    badge
                case let .count(badge):
                    badge
                }
            case let .tag(tag):
                tag
            case let .icon(icon):
                icon
            case let .image(image):
                image
            case let .flag(flag):
                flag
            case let .avatar(avatar):
                avatar
            case let .slot(view):
                view
            }
        }
        .disabled(interactionState == .disabled)
        .frame(minHeight: minHeight, alignment: .trailing)
    }

    // MARK: Size helper

    private var minHeight: CGFloat {
        let rawSize = switch itemSize {
        case .default:
            theme.listItem.sizeAssetMedium
        case .small:
            theme.listItem.sizeAssetSmall
        }

        return rawSize * dynamicTypeSize.percentageRate / 100
    }
}
