// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

//
// Software Name: OUDS iOS
// SPDX-FileCopyrightText: Copyright (c) Orange SA
// SPDX-License-Identifier: MIT
//
// This software is distributed under the MIT license,
// the text of which is available at https://opensource.org/license/MIT/
// or see the "LICENSE" file for more details.
//
// Authors: See CONTRIBUTORS.txt
// Software description: A SwiftUI components library with code examples for Orange Unified Design System
//

import MISOTokensSemantic
import SwiftUI

// MARK: - Environment values for misoUseMonochrome

private struct ColoredSurfaceUseMonochromeKey: EnvironmentKey {

    static let defaultValue = false
}

extension EnvironmentValues {

    /// Updated by the ``MISOColoredSurface``, the value tells that component (or `View`) needs to switch to monochrome.
    public var misoUseMonochrome: Bool {
        get {
            self[ColoredSurfaceUseMonochromeKey.self]
        }
        set {
            self[ColoredSurfaceUseMonochromeKey.self] = newValue
        }
    }
}

// MARK: - Environment values for misoSurfaceColor

private struct SurfaceColor: EnvironmentKey {

    static let defaultValue = MultipleColorSemanticToken("")
}

extension EnvironmentValues {

    /// Updated by the ``MISOColoredSurface``, the value tells the color token of the surface
    public var misoSurfaceColor: MultipleColorSemanticToken {
        get {
            self[SurfaceColor.self]
        }
        set {
            self[SurfaceColor.self] = newValue
        }
    }
}

// MARK: - Environment values for misoOnColoredSurface

private struct OnColoredSurfaceKey: EnvironmentKey {

    static let defaultValue = false
}

extension EnvironmentValues {

    /// Updated by the ``MISOColoredSurface``, the value tells the component (or `View`)  is on a colored surface or not.
    public var misoOnColoredSurface: Bool {
        get {
            self[OnColoredSurfaceKey.self]
        }
        set {
            self[OnColoredSurfaceKey.self] = newValue
        }
    }
}
