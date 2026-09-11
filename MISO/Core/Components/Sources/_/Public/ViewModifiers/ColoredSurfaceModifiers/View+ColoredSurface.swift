// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOTokensSemantic // NOTE: "unused" false positive by periphery (https://github.com/peripheryapp/periphery/issues/943)
import SwiftUI

extension View {

    /// Helper to set the current view on colored surface based on ``MISOColoredSurface``.
    /// Will use a surface color, i.e. a kind of configuration to apply considering monochrome mode and color scheme.
    ///
    /// - Parameter surfaceColor: The surface color applied as background on the current view
    public func coloredSurface(_ surfaceColor: MISOColoredSurface.SurfaceColor) -> some View {
        modifier(MISOColoredSurfaceModifier(backgroundSurfaceColor: surfaceColor))
    }
}
