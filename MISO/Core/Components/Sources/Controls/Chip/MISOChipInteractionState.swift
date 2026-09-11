// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOFoundations

/// The state used by modifiers to handle all states of the chip components.
/// Combined with an interaction button, defines the available states for a component of a chip family.
///
/// ## Code samples
///
/// ```swift
/// struct MyCustomChip: View {
///
///     let action: () -> Void
///
///     public var body: some View {
///         // Defines for your chip an interaction button with a given action to trigger
///         // It has MyChipLayout as layout, and casts the button interaction state
///         // to the chip interaction state
///         MISOInteractionButton(action: action) {
///             // Deal with the states in the chip layout to change the layout
///             MyChipLayout(interactionState: MISOChipInteractionState(with: $0))
///         }
///     }
/// }
/// ```
///
/// - Since: 2.3.0
@frozen public enum MISOChipInteractionState {

    /// User can interact with the component
    case enabled

    /// The component is hovered, e.g. with an a11y hardware or a mouse
    case hover

    /// The component is being pressed
    case pressed

    /// The user cannot interact with the component
    case disabled

    /// Initializes the ``MISOChipInteractionState`` from the ``MISOButtonInteractionState``
    /// provided by the ``MISOInteractionButton`` which is used to build a chip.
    ///
    /// This is preferred because chip does not support read only state.
    ///
    /// - Parameter interactionState: State provided by `MISOInteractionButton`. Crashes if `.readOnly`.
    public init(with interactionState: MISOButtonInteractionState) {
        switch interactionState {
        case .enabled:
            self = .enabled
        case .hover:
            self = .hover
        case .pressed:
            self = .pressed
        case .disabled:
            self = .disabled
        case .readOnly:
            ML.fatal("A MISO chip is a component which cannot be in read only mode")
        }
    }
}
