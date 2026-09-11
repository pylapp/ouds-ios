// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import SwiftUI

struct TagLabelStyle: LabelStyle {

    // MARK: Stored properties

    let appearance: MISOTag.Appearance
    let shape: MISOTag.Shape
    let size: MISOTag.Size
    let type: MISOTag.`Type`

    @Environment(\.theme) private var theme
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize: DynamicTypeSize

    // MARK: Body

    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .center, spacing: spacing) {
            configuration.icon
                .frame(width: assetSize, height: assetSize, alignment: .center)

            configuration.title
        }
        .modifier(TagPaddingsAndSizeModifier(size: size, hasIcon: hasIcon))
        .modifier(TagBackgroundModifier(appearance: appearance, type: type))
        .modifier(TagShapeModifier(shape: shape))
    }

    // MARK: Helpers

    private var hasIcon: Bool {
        switch type {
        case let .status(_, status):
            switch status.leading {
            case .icon, .bullet:
                true
            default:
                false
            }
        default:
            true
        }
    }

    private var spacing: CGFloat {
        switch size {
        case .default:
            theme.tag.spaceColumnGapDefault
        case .small:
            theme.tag.spaceColumnGapSmall
        }
    }

    private var assetSize: CGFloat {
        let rawSize = switch size {
        case .default:
            theme.tag.sizeAssetDefault
        case .small:
            theme.tag.sizeAssetSmall
        }
        return rawSize * (dynamicTypeSize.isLargeTextUsed ? dynamicTypeSize.percentageRate / 100 : 1)
    }
}
