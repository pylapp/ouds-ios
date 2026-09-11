// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOTokensSemantic
import SwiftUI

// MARK: - Colored Surface

/// Used to define if a content is used on a colored surface.
///
/// It applies the `color` to the background and set the `misoColoredSurface` environment variable to *true*.
/// This variable is useful, for example, to change the style of a component according to its environment (e.g monochrome mode on `MISOButton`).
///
/// ```swift
///   MISOColoredSurface(color: theme.colorModes.onBrandPrimary) {
///      MISOButton(image: MISOImage(asset: Image("ic_heart")), appearance: .strong) {}
///   }
/// ```
///
/// ## Theme rendering
///
/// ### Wireframe
///
/// ![A colored surface with text, button and link in light and dark modes with Wireframe theme](component_coloredSurface_Wireframe)
///
/// - Since: 0.13.0
@available(iOS 15, macOS 13, visionOS 1, watchOS 11, tvOS 16, *)
public struct MISOColoredSurface<Content>: View where Content: View {

    /// A type alias to use for clarity reasons ; a surface color is in the end a token
    public typealias SurfaceColor = MultipleColorModeSemanticToken

    // MARK: Stored Properties

    let backgroundSurfaceColor: SurfaceColor
    let content: () -> Content

    // MARK: Initializer

    /// Create a view with background color applied on the `content` view.
    ///
    /// ```swift
    ///     MISOColoredSurface(color: theme.colorModes.onBgPrimary) {
    ///         Text("Hello")
    ///     }
    /// ```
    ///
    /// - Parameters:
    ///    - color: The color applied as background on the content view
    ///    - content: The content view builder
    public init(color: SurfaceColor, @ViewBuilder content: @escaping () -> Content) {
        backgroundSurfaceColor = color
        self.content = content
    }

    // MARK: Body

    public var body: some View {
        content().modifier(MISOColoredSurfaceModifier(backgroundSurfaceColor: backgroundSurfaceColor))
    }
}
