// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOFoundations
import SwiftUI

// MARK: - MISO Input Tag

/// Input tag is a UI element that allows to enter multiple values, each represented as a tag.
/// As users type and submit values (usually by pressing enter, comma, or tab), each value is transformed into a tag.
/// Input tag is often used for adding labels, categories, or participants.
///
/// ## Code samples
///
/// ```swift
///     // Create an input tag
///     MISOInputTag("Label") {
///         // Do something, usually remove itself from a list
///     }
///
///     // Show in a list and remove when clicked
///     var names: [String] = [ "Foo", "Bar", "Wizz" ]
///
///     ForEach(names, id: \.self) { name in
///         MISOInputTag(label: name) {
///             if let index = names.firstIndex(of: name) {
///                 names.remove(at: index)
///             }
///         }
///     }
/// ```
///
/// - Version: 1.2.0 (Figma component design version)
/// - Since: 0.21.0
@available(iOS 15, macOS 13, visionOS 1, watchOS 11, tvOS 16, *)
public struct MISOInputTag: View {

    let label: String
    let action: () -> Void

    @Environment(\.theme) private var theme

    /// Creates an `MISOInputTag`
    ///
    /// **Remark: To disable the tag, use the `View/disabled(disabled:)` view modifier
    ///
    /// ```swift
    ///     MISOInputTag(label: "Swift") { /* Remove action */ }
    /// ```
    ///
    /// - Parameters:
    ///    - label: The label displayed in the input tag
    ///    - action: Called when the input tag is clicked, supposed for remove / delete action
    public init(label: String, action: @escaping () -> Void) {
        if label.isEmpty {
            OL.warning("The MISOInputTag must not be empty!")
        }
        self.label = label
        self.action = action
    }

    public var body: some View {
        MISOInteractionButton(action: action) {
            InputTagContent(label: label, interactionState: $0)
        }
        .frame(height: theme.tag.sizeMinHeightInteractiveArea, alignment: .center)
        .accessibilityHint(accessibilityHint)
    }

    private var accessibilityHint: String {
        "core_inputTag_delete_hint_a11y".localized()
    }
}
