// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import SwiftUI

/// The indicator of the radio.
/// Its content depends mainly to the ``MISOButtonInteractionState`` and from flags also.
struct RadioIndicator: View {

    // MARK: - Properties

    let interactionState: MISOButtonInteractionState
    let isOn: Bool
    let isError: Bool

    @Environment(\.theme) private var theme

    // MARK: - Body

    var body: some View {
        indicator()
            .modifier(RadioIndicatorModifier(interactionState: interactionState,
                                             isOn: isOn,
                                             isError: isError))
    }

    // MARK: - Indicator

    @ViewBuilder
    private func indicator() -> some View {
        if isOn {
            tickImage(name: "Component-radio-button-radio-button-selected")
        } else {
            Color.clear
        }
    }

    private func tickImage(name: String) -> some View {
        Image(decorative: name, bundle: theme.resourcesBundle)
            .renderingMode(.template)
            .resizable()
            .scaledToFit()
            .accessibilityHidden(true)
    }
}
