// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

#if !os(watchOS) && !os(tvOS)
import MISOComponents
import SwiftUI
import Testing

/// Tests the default and explicit parameter values of `MISOToolBarItem` enum cases.
struct MISOToolBarItemTests {

    // MARK: - ActionType.label default values

    @Test func labelActionTypeDefaultEmphasizedIsFalse() {
        guard case let .label(_, emphasized, _, _) = MISOToolBarItem.ActionType.label("Action") else {
            Issue.record("Expected .label case")
            return
        }
        #expect(emphasized == false)
    }

    @Test func labelActionTypeDefaultAccessibilityHintIsNil() {
        guard case let .label(_, _, accessibilityHint, _) = MISOToolBarItem.ActionType.label("Action") else {
            Issue.record("Expected .label case")
            return
        }
        #expect(accessibilityHint == nil)
    }

    // MARK: - ActionType.icon default values

    @Test func iconActionTypeDefaultAccessibilityHintIsNil() {
        guard case let .icon(_, _, accessibilityHint, _, _) = MISOToolBarItem.ActionType.icon(asset: Image(systemName: "star"), accessibilityLabel: "Star") else {
            Issue.record("Expected .icon case")
            return
        }
        #expect(accessibilityHint == nil)
    }

    @Test func iconActionTypeDefaultBadgeTypeIsNil() {
        guard case let .icon(_, _, _, badgeType, _) = MISOToolBarItem.ActionType.icon(asset: Image(systemName: "star"), accessibilityLabel: "Star") else {
            Issue.record("Expected .icon case")
            return
        }
        #expect(badgeType == nil)
    }

    // MARK: - NavigationType.back default values

    @Test func backNavigationTypeDefaultLabelIsNil() {
        guard case let .back(label, _, _) = MISOToolBarItem.NavigationType.back() else {
            Issue.record("Expected .back case")
            return
        }
        #expect(label == nil)
    }

    @Test func backNavigationTypeDefaultAccessibilityLabelIsNotEmpty() {
        guard case let .back(_, accessibilityLabel, _) = MISOToolBarItem.NavigationType.back() else {
            Issue.record("Expected .back case")
            return
        }
        #expect(!accessibilityLabel.isEmpty)
    }
}
#endif
