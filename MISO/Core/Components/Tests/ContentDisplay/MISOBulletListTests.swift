// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOComponents
import SwiftUI
import Testing

/// Tests the default and explicit parameter values of `MISOBulletList` enum cases.
struct MISOBulletListTests {

    // MARK: - MISOBulletList.UnorderedAsset.icon default values

    @Test func unorderedAssetIconDefaultAccessibilityLabelIsNil() {
        guard case let .icon(_, accessibilityLabel) = MISOBulletList.UnorderedAsset.icon(Image(systemName: "star")) else {
            Issue.record("Expected .icon case")
            return
        }
        #expect(accessibilityLabel == nil)
    }

    // MARK: - MISOBulletList.Type.unordered default values

    @Test func bulletListTypeDefaultAssetIsBullet() {
        let type: MISOBulletList.`Type` = .unordered()
        guard case let .unordered(asset, _) = type else {
            Issue.record("Expected .unordered case")
            return
        }
        guard case .bullet = asset else {
            Issue.record("Expected .bullet asset")
            return
        }
    }

    @Test func bulletListTypeDefaultIsBrandedIsTrue() {
        let type: MISOBulletList.`Type` = .unordered()
        guard case let .unordered(_, isBranded) = type else {
            Issue.record("Expected .unordered case")
            return
        }
        #expect(isBranded == true)
    }

    // MARK: - MISOBulletList.Type.unordered explicit values are preserved

    @Test func bulletListTypeExplicitIsBrandedFalseIsPreserved() {
        let type: MISOBulletList.`Type` = .unordered(isBranded: false)
        guard case let .unordered(_, isBranded) = type else {
            Issue.record("Expected .unordered case")
            return
        }
        #expect(isBranded == false)
    }
}
