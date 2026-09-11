// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

@testable import MISOComponents
import SwiftUI
import Testing

/// Tests the `MISOListItemImage.ImageType` cases, in particular the `.animated` case
/// used to display GIF/WebP animated images (see ``AnimatedImage``).
@MainActor
struct MISOListItemImageTests {

    // MARK: - init(asset:) builds a .asset case

    @Test func assetInitializerBuildsAssetCase() {
        let image = MISOListItemImage(asset: Image(systemName: "star"))
        guard case .asset = image.imageType else {
            Issue.record("Expected .asset case")
            return
        }
    }

    // MARK: - init(animatedImage:) builds a .animated case

    @Test func animatedImageInitializerBuildsAnimatedCase() {
        let image = MISOListItemImage(animatedImage: MISOAnimatedImage(url: nil))
        guard case .animated = image.imageType else {
            Issue.record("Expected .animated case")
            return
        }
    }
}
