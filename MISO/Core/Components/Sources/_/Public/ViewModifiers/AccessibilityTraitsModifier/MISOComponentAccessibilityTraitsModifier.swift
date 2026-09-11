// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import SwiftUI

// MARK: - Environment values

extension EnvironmentValues {

    /// Some accessibility traits to add in specific parts of some compatible MISO components.
    @Entry var additionalTraits: AccessibilityTraits = []
}

// MARK: - MISO Component Accessibility Traits Modifier

/// `ViewModifier` that propagates accessibility traits down the environment so that
/// specific parts of some compatible MISO components can get additional accessibility traits.
///
/// Prefer the convenience methods on `View`:
/// - ``View/misoAccessibilityAddTraits(_:)-single``
/// - ``View/misoAccessibilityAddTraits(_:)-array``
struct MISOComponentAccessibilityTraitsModifier: ViewModifier {

    let traits: AccessibilityTraits

    func body(content: Content) -> some View {
        content.transformEnvironment(\.additionalTraits) { $0.formUnion(traits) }
    }
}

// MARK: - View extension

extension View {

    /// Adds one accessibility trait to add to any compatible MISO components in the view subtree.
    ///
    /// ```swift
    /// MISOTextArea(label: "Title", text: $text)
    ///     .misoAccessibilityAddTraits(.isHeader) // Will add "header" trait to text editor
    /// ```
    ///
    /// - Parameter trait: The `AccessibilityTraits` value to add.
    /// - Returns: A view that sets the given trait on the inner text editor.
    public func misoAccessibilityAddTraits(_ trait: AccessibilityTraits) -> some View {
        modifier(MISOComponentAccessibilityTraitsModifier(traits: trait))
    }

    /// Adds multiple accessibility traits to add to any compatible MISO components in the view subtree.
    ///
    /// ```swift
    /// MISOTextArea(label: "Title", text: $text)
    ///     .misoAccessibilityAddTraits([.isHeader, .updatesFrequently]) // Will add traits to text editor
    /// ```
    ///
    /// - Parameter traits: An array of `AccessibilityTraits` values to add.
    /// - Returns: A view that sets the union of the given traits on the inner text editor.
    public func misoAccessibilityAddTraits(_ traits: [AccessibilityTraits]) -> some View {
        modifier(MISOComponentAccessibilityTraitsModifier(traits: traits.reduce(into: AccessibilityTraits()) { $0.formUnion($1) }))
    }
}
