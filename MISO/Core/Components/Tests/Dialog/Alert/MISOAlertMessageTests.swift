// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

@testable import MISOComponents
import SwiftUI
import Testing

/// Tests some values for `MISOAlertMessage` component.
struct MISOAlertMessageTests {

    @Test
    func `alert message component link position by default must be bottom`() {
        let alertMessageLink = MISOAlertMessage.Link(text: "") {}
        #expect(alertMessageLink.position == .bottom)
    }

    @Test
    func `alert message component neutral status does not have icon by default`() {
        let neutralStatus = MISOAlertStatus.neutral()
        if case let .neutral(icon) = neutralStatus {
            #expect(icon == nil, "Icon must be nil for neutral status")
        } else {
            Issue.record("Status should be neutral")
        }
    }

    @Test
    func `alert message component accent status does not have icon by default`() {
        let accentStatus = MISOAlertStatus.accent()
        if case let .accent(icon) = accentStatus {
            #expect(icon == nil, "Icon must be nil for accent status")
        } else {
            Issue.record("Status should be accent")
        }
    }

    @Test
    func `alert message components priority must be text then link then close button`() {
        #expect(MISOAlertMessage.textsAccessibilityPriority > MISOAlertMessage.actionLinkAccessibilityPriority)
        #expect(MISOAlertMessage.actionLinkAccessibilityPriority > MISOAlertMessage.closeButtonAccessibilityPriority)
    }
}
