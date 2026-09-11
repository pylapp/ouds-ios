// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOTokensSemantic
import SwiftUI

/// A container to display the indicator according to its type and apply the right color based on the ``MISOButtonInteractionState`.
/// For RTL, the next and previous indicators change their assets according to the `LayoutDirection`.
struct ListItemIndicatorContainer: View {

    // MARK: Properties

    let type: MISONavigationListItemIndicatorType?
    let interactionState: MISOButtonInteractionState

    @Environment(\.theme) private var theme
    @Environment(\.misoListItemSize) private var itemSize
    @Environment(\.layoutDirection) private var layoutDirection

    // MARK: Body

    var body: some View {
        if let asset {
            HStack {
                MISOScaledIcon(image: MISOImage(asset: asset), size: theme.listItem.sizeAssetSmall)
                    .foregroundColor(color)
            }
            .frame(minHeight: minHeight, alignment: .center)
        }
    }

    // MARK: Helpers

    private var asset: Image? {
        if let assetName {
            Image(decorative: assetName, bundle: theme.resourcesBundle)
                .renderingMode(.template)
        } else {
            nil
        }
    }

    private var assetName: String? {
        switch type {
        case .next:
            layoutDirection == .rightToLeft ? "Component-list-item-previous" : "Component-list-item-next"
        case .previous:
            layoutDirection == .rightToLeft ? "Component-list-item-next" : "Component-list-item-previous"
        case .external:
            "functional-actions-external-link"
        case .none:
            nil
        }
    }

    private var color: MultipleColorSemanticToken {
        switch interactionState {
        case .enabled:
            theme.link.colorChevronEnabled
        case .hover:
            theme.colors.actionHover
        case .pressed:
            theme.colors.actionPressed
        case .disabled:
            theme.colors.actionDisabled
        case .readOnly:
            // should not appear
            theme.colors.actionDisabled
        }
    }

    private var minHeight: CGFloat {
        switch itemSize {
        case .default:
            theme.listItem.sizeAssetMedium
        case .small:
            theme.listItem.sizeAssetSmall
        }
    }
}
