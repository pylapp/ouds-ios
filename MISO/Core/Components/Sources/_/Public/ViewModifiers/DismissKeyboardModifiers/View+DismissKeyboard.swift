// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import SwiftUI

extension View {

    /// Dismisses the software keyboard when the user taps anywhere
    /// outside a text input field.
    ///
    /// Apply this modifier on the parent view containing an `MISOTextInput`
    /// or `MISOTextArea` for example.
    ///
    /// ```swift
    /// VStack {
    ///     MISOTextInput(label: "Email", text: $email)
    ///     MISOTextInput(label: "Name", text: $name)
    /// }
    /// .misoHideKeyboardOnTap()
    /// ```
    public func misoHideKeyboardOnTap() -> some View {
        #if os(iOS) || os(iPadOS) || os(visionOS)
        modifier(DismissKeyboardOnTapModifier())
        #else
        self
        #endif
    }
}
