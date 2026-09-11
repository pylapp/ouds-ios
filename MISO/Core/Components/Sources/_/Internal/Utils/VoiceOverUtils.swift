// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import SwiftUI

/// To wrap some utility methods for accessibility uses and Voice Over
enum VoiceOverUtils {

    /// Makes a Voice Over vocalization / announcement of the given message
    ///
    /// - Parameter message: The message to vocalize as is
    @MainActor static func announce(_ message: String) {
        #if os(watchOS)
        return
        #else
        #if canImport(UIKit)
        guard UIAccessibility.isVoiceOverRunning else { return }
        #endif
        if #available(iOS 17, visionOS 1, macOS 14, tvOS 17, *) {
            var announcement = AttributedString(message)
            announcement.accessibilitySpeechAnnouncementPriority = .high
            AccessibilityNotification.Announcement(announcement).post()
        } else {
            #if canImport(UIKit)
            UIAccessibility.post(
                notification: .announcement,
                argument: message)
            #endif
        }
        #endif
    }
}
