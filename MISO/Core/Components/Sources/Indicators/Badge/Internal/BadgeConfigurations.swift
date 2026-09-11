// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import SwiftUI

// MARK: - Badge Standard Configuration

protocol BadgeConfiguration {}

/// The status of an ``MISOBadgeStandard`` determines the leading element, the background
/// and the content colors of the badge according to the category.
struct BadgeStandardConfiguration: BadgeConfiguration {
    let size: MISOBadgeStandard.Size
    let status: MISOBadgeStandard.Status
}

// MARK: - Badge Count Configuration

/// The status of an ``MISOBadgeCount`` determines the leading element, the background
/// and the content colors of the badge according to the category.
struct BadgeCountConfiguration: BadgeConfiguration {
    let value: UInt8
    let size: MISOBadgeCount.Size
    let status: MISOBadgeStandard.Status
}

// MARK: - Badge Icon Configuration

/// The status of an ``MISOBadgeIcon`` determines the leading element, the background
/// and the content colors of the badge according to the category.
struct BadgeIconConfiguration: BadgeConfiguration {
    let size: MISOBadgeStandard.Size
    let status: MISOBadgeIcon.Status
}
