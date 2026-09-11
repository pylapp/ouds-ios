// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOTokensSemantic
import SwiftUI

/// Creates a `VStack` with spacing scaled according to `verticalSizeClass` base on MISO `MultipleSpaceSemanticToken`.
///
/// ```swift
///    // For sclaed space use the initializer with token aprameter
///    MISOVStack(alignment: .leading, spacing: theme.space.scaledMedium) {
///        Text("Hello")
///        Text("World")
///    }
///
///    // For not scaled space use the initializer with the Double parameter
///    MISOVStack(alignment: .top, spacing: theme.spaces.rowGapMedium) {
///        Text("Hello")
///        Text("World")
///    }
///
/// ```
///
/// - Since: 1.3.0
@available(iOS 15, macOS 13, visionOS 1, watchOS 11, tvOS 16, *)
public struct MISOVStack<Content: View>: View {

    // MARK: - Properties

    private let alignment: HorizontalAlignment
    private let spacingToken: MultipleSpaceSemanticToken?
    private let spacing: Double?
    @ViewBuilder private let content: () -> Content

    @Environment(\.verticalSizeClass) private var verticalSizeClass

    // MARK: - Initializers

    /// Creates a vertical stack with the given spacing token and horizontal alignment.
    ///
    /// ```swift
    ///     MISOVStack(spacing: theme.spaces.scaledMedium) {
    ///         Text("Hello")
    ///         Text("World")
    ///     }
    /// ```
    ///
    /// - Parameters:
    ///   - alignment: The guide for aligning the subviews in this stack. This guide has the same vertical screen coordinate for every subview. Default set to `.center`.
    ///   - spacing: The distance between adjacent subviews, or `nil` if you want the stack to choose a default distance for each pair of subviews. Default set to `nil`.
    ///   - content: A view builder that creates the content of this stack.
    public init(alignment: HorizontalAlignment = .center,
                spacing: MultipleSpaceSemanticToken? = nil,
                @ViewBuilder content: @escaping () -> Content)
    {
        self.alignment = alignment
        spacingToken = spacing
        self.spacing = nil
        self.content = content
    }

    /// Creates a vertical stack with the given spacing value and horizontal alignment.
    ///
    /// ```swift
    ///     MISOVStack(spacing: theme.spaces.scaledSmall) {
    ///         Text("Hello")
    ///         Text("World")
    ///     }
    /// ```
    ///
    /// - Parameters:
    ///   - alignment: The guide for aligning the subviews in this stack. This guide has the same vertical screen coordinate for every subview. Default set to `.center`.
    ///   - spacing: The distance between adjacent subviews, or `nil` if you want the stack to choose a default distance for each pair of subviews. Default set to `nil`.
    ///   - content: A view builder that creates the content of this stack.
    public init(alignment: HorizontalAlignment = .center,
                spacing: SpaceSemanticToken? = nil,
                @ViewBuilder content: @escaping () -> Content)
    {
        self.alignment = alignment
        spacingToken = nil
        self.spacing = spacing
        self.content = content
    }

    // MARK: - Body

    public var body: some View {
        VStack(alignment: alignment,
               spacing: scaledSpacing,
               content: content)
    }

    // MARK: - Helpers

    private var scaledSpacing: CGFloat? {
        if let spacingToken, let verticalSizeClass {
            return CGFloat(spacingToken.dimension(for: verticalSizeClass))
        }

        if let spacing {
            return spacing
        }

        return nil
    }
}
