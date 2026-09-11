// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

#if os(iOS)
// Conditional import and use of UIKit for documentation generation (see #628 #626)
import Foundation
import UIKit

/// For vibrations using the standard feedback generator
struct VibrationsManager {

    private init() {}

    @MainActor
    static func success() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }

    @MainActor
    static func warning() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.warning)
    }

    @MainActor
    static func error() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
    }
}
#endif
