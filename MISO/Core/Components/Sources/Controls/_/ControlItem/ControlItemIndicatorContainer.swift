// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import SwiftUI

/// This is the indicator container of the ControlItem.
///
/// This is a container because the height of the frame can increase dynamically
/// to a `maxHeight` fixed by a specific token.
/// The indicator with a fixed size is centered in this frame.
struct ControlItemIndicatorContainer: View {

    // MARK: - Stored properties

    let interactionState: MISOButtonInteractionState
    let indicatorType: ControlItem.IndicatorType
    let layoutData: ControlItemLabel.LayoutData

    @Environment(\.theme) private var theme

    // MARK: Body

    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            switch indicatorType {
            case let .switch(binding):
                SwitchIndicator(interactionState: interactionState, isOn: binding)
            case let .radioButton(binding):
                RadioIndicator(interactionState: interactionState, isOn: binding.wrappedValue, isError: layoutData.isError)
            case let .checkBox(binding):
                CheckboxIndicator(interactionState: interactionState, indicatorState: binding.wrappedValue, isError: layoutData.isError)
            }
        }
        .frame(minHeight: theme.listItem.sizeAssetSmall, maxHeight: theme.listItem.sizeMaxHeightAssetsContainer, alignment: .center)
    }
}
