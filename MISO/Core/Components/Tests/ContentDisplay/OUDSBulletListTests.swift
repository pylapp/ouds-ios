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

import MISOComponents
import SwiftUI
import Testing

/// Tests the default and explicit parameter values of `MISOBulletList` enum cases.
struct OUDSBulletListTests {

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
