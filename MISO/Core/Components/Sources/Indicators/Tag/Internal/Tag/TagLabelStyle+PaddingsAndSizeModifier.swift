// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import SwiftUI

struct TagPaddingsAndSizeModifier: ViewModifier {

    // MARK: Stored Properties

    let size: MISOTag.Size
    let hasIcon: Bool

    @Environment(\.theme) private var theme

    // MARK: Body

    func body(content: Content) -> some View {
        content
            .padding(.top, paddingTop)
            .padding(.bottom, paddingBottom)
            .padding(.leading, paddingLeading)
            .padding(.trailing, paddingTrailing)
            .frame(minWidth: minWidth, minHeight: minHeight, alignment: .center)
    }

    // MARK: Helpers

    private var paddingTop: CGFloat {
        switch size {
        case .default:
            theme.tag.spacePaddingBlockDefault
        case .small:
            theme.tag.spacePaddingBlockSmall
        }
    }

    private var paddingBottom: CGFloat {
        switch size {
        case .default:
            theme.tag.spacePaddingBlockDefault
        case .small:
            theme.tag.spacePaddingBlockSmall
        }
    }

    private var paddingLeading: CGFloat {
        switch size {
        case .default:
            hasIcon ? theme.tag.spacePaddingInlineAssetDefault : theme.tag.spacePaddingInlineDefault
        case .small:
            hasIcon ? theme.tag.spacePaddingInlineAssetSmall : theme.tag.spacePaddingInlineSmall
        }
    }

    private var paddingTrailing: CGFloat {
        switch size {
        case .default:
            theme.tag.spacePaddingInlineDefault
        case .small:
            theme.tag.spacePaddingInlineSmall
        }
    }

    private var minWidth: CGFloat {
        switch size {
        case .default:
            theme.tag.sizeMinWidthDefault
        case .small:
            theme.tag.sizeMinWidthSmall
        }
    }

    private var minHeight: CGFloat {
        switch size {
        case .default:
            theme.tag.sizeMinHeightDefault
        case .small:
            theme.tag.sizeMinHeightSmall
        }
    }
}
