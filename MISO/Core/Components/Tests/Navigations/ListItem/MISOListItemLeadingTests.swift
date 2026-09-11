// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOComponents
import SwiftUI
import Testing

/// Tests the `MISOListItemLeading` cases.
struct MISOListItemLeadingTests {

    // MARK: - .custom builds a .slot case

    @Test func customFactoryBuildsSlotCase() {
        let leading = MISOListItemLeading.slot { Text("Gauge") }
        guard case .slot = leading else {
            Issue.record("Expected .slot case")
            return
        }
    }
}
