// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import SwiftUI

// MARK: - Fixed Icon

/// Defines an image based on ``MISOImage`` with with a fixed size
///
/// ## Code samples
///
/// ```swift
///   MISOFixedIcon(image: someOudsImage, size: someTokenOfSize)
/// ```
///
/// - Since: 2.3.0
public struct MISOFixedIcon: View {

    let image: MISOImage
    let size: CGFloat

    public init(image: MISOImage, size: CGFloat) {
        self.image = image
        self.size = size
    }

    public var body: some View {
        image
            .frame(width: size, height: size, alignment: .center)
    }
}

// MARK: - Scaled icon

/// Defines an image based on ``MISOImage`` with with a dynamic size depending to `ScaledMetric`
///
/// ## Code samples
///
/// ```swift
///   MISOScaledIcon(image: someOudsImage, size: someTokenOfSize)
/// ```
///
/// - Since: 2.3.0
public struct MISOScaledIcon: View {

    let image: MISOImage
    @ScaledMetric var size: CGFloat

    public init(image: MISOImage, size: CGFloat) {
        self.image = image
        _size = ScaledMetric(wrappedValue: size)
    }

    public var body: some View {
        image
            .frame(width: size, height: size, alignment: .center)
    }
}
