// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import SwiftUI

// MARK: - Button Internal State

/// The internal state used by modifiers to handle all states of the button.
enum ButtonInternalState {
    case enabled, hover, pressed, loading, disabled
}

// MARK: - Button View Modifier

/// This modifier has in charge to:
/// - compute the internal state based on `isEnabled`, `isPressed` and `isHover` flags
/// - apply foreground, background colors and add a border (width, radius and color) associated to the appearance and according to the internal state
struct ButtonViewModifier: ViewModifier {

    // MARK: Properties

    let appearance: MISOButton.Appearance
    let state: ButtonInternalState

    // MARK: Body

    func body(content: Content) -> some View {
        content
            .modifier(ButtonForegroundModifier(appearance: appearance, state: state))
            .modifier(ButtonBackgroundModifier(appearance: appearance, state: state))
            .modifier(ButtonBorderModifier(appearance: appearance, state: state))
    }
}
