// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOThemesContract
import MISOTokensSemantic
import SwiftUI

/// The content for the ``MISOStaticListItem`` and the ``MISONavigationListItem`` component described by the ``MISOListItemData``.
/// The layout (divider, background, size) are updated according to the interaction state ``MISOButtonInteractionState``.
struct ListItemContent: View {

    // MARK: Properties

    let data: MISOListItemData
    let indicatorType: MISONavigationListItemIndicatorType?
    let leading: MISOListItemLeading?
    let trailing: MISOListItemTrailing?
    let interactionState: MISOButtonInteractionState

    @Environment(\.theme) private var theme
    @Environment(\.misoListItemSize) private var itemSize
    @Environment(\.misoListItemContainersAlignment) private var containersAlignment

    // MARK: Body

    var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
                HStack(alignment: verticalAlignment, spacing: theme.listItem.spaceColumnGap) {
                    if indicatorType == .previous {
                        ListItemIndicatorContainer(type: indicatorType, interactionState: interactionState)
                    }

                    if let leading, shouldDisplay(leading: leading) {
                        leadingContainer(leading)
                    }

                    textContainer()

                    if let trailing, shouldDisplay(trailing: trailing) {
                        trailingContainer(trailing)
                    }

                    if indicatorType == .next || indicatorType == .external {
                        ListItemIndicatorContainer(type: indicatorType, interactionState: interactionState)
                    }
                }
                .accessibilityElement(children: .combine)

                if let bottomSlot = data.bottomSlot, itemSize != .small {
                    bottomSlot.view
                }
            }
            .accessibilityElement(children: .combine)
            .padding(.top, topPadding)
            .padding(.bottom, bottomPadding)
            .padding(.horizontal, theme.listItem.spacePaddingInline)
            .frame(minHeight: minHeight, alignment: textFrameAlignment)
            .modifier(ListItemBackgroundModifier(interactionState: interactionState))
            .modifier(ListItemBordersModifier(interactionState: interactionState))

            if let helperText = data.helperText {
                ListItemHelperTextContainer(text: .raw(helperText), interactionState: interactionState)
            }
        }
        .accessibilityElement(children: .combine)
        .frame(minWidth: theme.listItem.sizeMinWidth)
        .contentShape(Rectangle()) // Needed otherwise because of button style any empty space without views won't trigger tap
    }

    // MARK: Containers

    @ViewBuilder
    private func leadingContainer(_ leading: MISOListItemLeading) -> some View {
        // Remove leading element if previous indicator is presented
        if indicatorType != .previous {
            ListItemLeadingContainer(leading: leading, interactionState: interactionState)
        }
    }

    private func textContainer() -> some View {
        ListItemTextContainer(data: data, interactionState: interactionState)
    }

    private func trailingContainer(_ trailing: MISOListItemTrailing) -> some View {
        ListItemTrailingContainer(trailing: trailing, interactionState: interactionState)
    }

    // MARK: Display helpers

    private func shouldDisplay(leading: MISOListItemLeading) -> Bool {
        if case .slot = leading, itemSize == .small {
            return false
        }
        return true
    }

    private func shouldDisplay(trailing: MISOListItemTrailing) -> Bool {
        if case .slot = trailing, itemSize == .small {
            return false
        }
        return true
    }

    // MARK: Computed properties

    private var textFrameAlignment: Alignment {
        switch containersAlignment {
        case .top:
            .topLeading
        case .center:
            .center
        }
    }

    private var verticalAlignment: VerticalAlignment {
        switch containersAlignment {
        case .top:
            .top
        case .center:
            .center
        }
    }

    private var topPadding: SpaceSemanticToken {
        switch itemSize {
        case .small:
            switch containersAlignment {
            case .top:
                theme.listItem.spacePaddingBlockTopAlignmentTopCounterweightSmall
            case .center:
                theme.listItem.spacePaddingBlockSmall
            }

        case .default:
            switch containersAlignment {
            case .top:
                theme.listItem.spacePaddingBlockTopAlignmentTopCounterweightDefault
            case .center:
                theme.listItem.spacePaddingBlockDefault
            }
        }
    }

    private var bottomPadding: Double {
        switch itemSize {
        case .small:
            theme.listItem.spacePaddingBlockSmall
        case .default:
            theme.listItem.spacePaddingBlockDefault
        }
    }

    private var minHeight: SizeSemanticToken {
        switch itemSize {
        case .small:
            theme.listItem.sizeMinHeightSmall
        case .default:
            theme.listItem.sizeMinHeightDefault
        }
    }
}
