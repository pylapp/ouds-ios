// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOComponents
import SwiftUI
import Testing

/// Tests the `MISOListItemTrailing` cases.
struct MISOListItemTrailingTests {

    // MARK: - .custom builds a .slot case

    @Test func customFactoryBuildsSlotCase() {
        let trailing = MISOListItemTrailing.slot { Text("Gauge") }
        guard case .slot = trailing else {
            Issue.record("Expected .slot case")
            return
        }
    }
}
