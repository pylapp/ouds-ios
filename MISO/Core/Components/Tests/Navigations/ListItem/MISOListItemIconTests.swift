// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOComponents
import SwiftUI
import Testing

/// Tests the default and explicit parameter values of `MISOListItemIcon.IconType` cases.
struct MISOListItemIconTests {

    // MARK: - .neutral default values

    @Test func neutralIconTypeDefaultBadgeIsFalse() {
        guard case let .neutral(_, badge) = MISOListItemIcon.IconStatus.neutral(asset: Image(systemName: "star")) else {
            Issue.record("Expected .neutral case")
            return
        }
        #expect(badge == false)
    }

    // MARK: - .neutral explicit values are preserved

    @Test func neutralIconTypeExplicitBadgeTrueIsPreserved() {
        guard case let .neutral(_, badge) = MISOListItemIcon.IconStatus.neutral(asset: Image(systemName: "star"), badge: true) else {
            Issue.record("Expected .neutral case")
            return
        }
        #expect(badge == true)
    }
}
