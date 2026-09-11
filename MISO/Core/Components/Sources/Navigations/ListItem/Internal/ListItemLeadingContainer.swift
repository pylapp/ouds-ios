// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOTokensSemantic
import SwiftUI

/// Leading container of the ``ListItemContent``.
struct ListItemLeadingContainer: View {

    // MARK: Properties

    let leading: MISOListItemLeading
    let interactionState: MISOButtonInteractionState

    @Environment(\.theme) private var theme
    @Environment(\.misoListItemSize) private var itemSize
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize: DynamicTypeSize

    // MARK: Body

    var body: some View {
        HStack {
            switch leading {
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
        .frame(minHeight: minHeight, alignment: .center)
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
