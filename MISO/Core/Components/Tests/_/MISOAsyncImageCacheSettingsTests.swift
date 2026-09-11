// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import Foundation
@testable import MISOComponents
import Testing

/// Tests on the settings defined in ``MISOAsyncImageCache``.
struct MISOAsyncImageCacheSettingsTests {

    @Test
    func `max memory cost must be 100 MB`() {
        #expect(MISOAsyncImageCache.Settings.maxMemoryCost == 100 * 1_024 * 1_024)
    }

    @Test
    func `max memory count must be 100`() {
        #expect(MISOAsyncImageCache.Settings.maxMemoryCount == 100)
    }

    @Test
    func `max disk size must be 500 MB`() {
        #expect(MISOAsyncImageCache.Settings.maxDiskSize == 500 * 1_024 * 1_024)
    }

    @Test
    func `disk cache folder name must be MISO-Cache-AsyncImage`() {
        #expect(MISOAsyncImageCache.Settings.diskCacheFolderName == "MISO-Cache-AsyncImage")
    }
}
