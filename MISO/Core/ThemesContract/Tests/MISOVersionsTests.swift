// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import Foundation
import MISOThemesContract
import Testing
import TestsUtils

/// Some tests on versions of MISO parts to be sure they are well defined
struct MISOVersionsTests {

    // swiftlint:disable force_try
    private static let misoVersionsFormat = try! NSRegularExpression(pattern: "^\\d+\\.\\d+\\.\\d+$")
    // swiftlint:enable force_try

    // MARK: - Tests - Themes versions - Core

    @Test func themeCoreVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.themeCoreVersion, regexp: Self.misoVersionsFormat)
    }

    // MARK: - Tests - Themes versions - Wireframe

    @Test func themeWireframeCoreVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.themeWireframeCoreVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func themeWireframeBrandVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.themeWireframeBrandVersion, regexp: Self.misoVersionsFormat)
    }

    // MARK: - Tests - Component versions - Actions

    @Test func componentButtonVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentButtonVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func componentInteractiveIconVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentInteractiveIcon, regexp: Self.misoVersionsFormat)
    }

    // MARK: - Tests - Component versions - AI assistant

    @Test func componentAssistantButtonVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentAssistantButtonVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func componentAssistantIconVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentAssistantIconVersion, regexp: Self.misoVersionsFormat)
    }

    // MARK: - Tests - Component versions - Navigation

    @Test func componentLinkVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentLinkVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func componentExpandLinkVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentExpandLinkVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func componentTabBarVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentTabBarVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func componentToolBarTopVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentToolBarTopVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func componentToolBarBottomVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentToolBarBottomVersion, regexp: Self.misoVersionsFormat)
    }

    // MARK: - Tests - Component versions - Controls

    @Test func componentCheckboxVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentCheckboxVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func componentSugggestionChipVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentSuggestionChipVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func componentFilterChipVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentFilterChipVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func componentFilterChipExpandVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentFilterChipExpandVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func componentRadioButtonVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentRadioButtonVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func componentStaticListItemVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentStaticListItemVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func componentStaticCardItemVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentStaticCardItemVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func componentNavigationListItemVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentNavigationListItemVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func componentNavigationCardItemVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentNavigationCardItemVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func componentSwitchVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentSwitchVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func componentTextInputVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentTextInputVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func componentPhoneNumberInputVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentPhoneNumberInputVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func componentPasswordInputVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentPasswordInputVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func componentPinCodeInputVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentPinCodeInputVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func componentQuantityInputVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentQuantityInputVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func componentSelectInputVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentSelectInputVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func componentTextAreaVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentTextAreaVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func componentBadgeVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentBadgeVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func componentBadgeCountVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentBadgeCountVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func componentBadgeIconVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentBadgeIconVersion, regexp: Self.misoVersionsFormat)
    }

    // MARK: - Tests - Component versions - Tag

    @Test func componentSkeletonVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentSkeletonVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func componentTagVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentTagVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func componentInputTagVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentInputTagVersion, regexp: Self.misoVersionsFormat)
    }

    // MARK: - Tests - Component versions - Layout

    @Test func componentDividerVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentDividerVersion, regexp: Self.misoVersionsFormat)
    }

    // MARK: - Tests - Component versions - Content display

    @Test func componentBulletListVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentBulletListVersion, regexp: Self.misoVersionsFormat)
    }

    // MARK: - Tests - Component versions - Dialog

    @Test func componentAlertMessageVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentAlertMessageVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func componentInlineAlertVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentInlineAlertVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func componentInlineToastMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentToastVersion, regexp: Self.misoVersionsFormat)
    }

    // MARK: - Tests - Component versions - Foundations

    @Test func componentTypographyVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentTypographyVersion, regexp: Self.misoVersionsFormat)
    }

    // MARK: - Tests - Component versions - Indicator

    @Test func componentCircularProgressIndicatorVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentCircularProgressIndicatorVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func componentLinearProgressIndicatorVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentLinearProgressIndicatorVersion, regexp: Self.misoVersionsFormat)
    }

    @Test func componentStatusIconVersionMustBeConform() throws {
        TestsUtils.assertMatches(MISOVersions.componentStatusIconVersion, regexp: Self.misoVersionsFormat)
    }
}
