// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOFoundations
import MISOTokensSemantic
import SwiftUI

// MARK: - Bullet

struct Bullet: View {

    // MARK: Properties

    let type: MISOBulletList.`Type`
    let level: MISOBulletList.NestedLevel
    let textStyle: MISOBulletList.TextStyle
    let isBold: Bool
    let index: UInt8

    @Environment(\.theme) private var theme
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize: DynamicTypeSize

    // MARK: Body

    var body: some View {
        HStack(alignment: .center) {
            switch type {
            case let .unordered(asset, isBranded):
                UnorderedBullet(asset: asset, isBranded: isBranded, level: level, textStyle: textStyle)
            case .ordered:
                OrderedBullet(level: level, textStyle: textStyle, isBold: isBold, index: index)
            case .bare:
                Rectangle().fill(.clear).frame(width: minWidth)
            }
        }
        .frame(minWidth: minWidth, alignment: .trailing)
        .frame(maxHeight: maxHeight, alignment: .center)
    }

    // MARK: Private helpers

    private var minWidth: CGFloat {
        let token = switch textStyle {
        case .bodyLarge:
            theme.sizes.iconWithBodyLargeSizeMedium
        case .bodyMedium:
            theme.sizes.iconWithBodyMediumSizeMedium
        }

        // To follow the dynamic font, the width of the container must be adjusted.
        let rawSize = token.dimension(for: horizontalSizeClass ?? .regular)
        return rawSize * dynamicTypeSize.percentageRate / 100
    }

    private var maxHeight: CGFloat {
        let token = switch textStyle {
        case .bodyLarge:
            theme.fonts.lineHeightBodyLarge
        case .bodyMedium:
            theme.fonts.lineHeightBodyMedium
        }

        // To follow the dynamic font, the height of the container must be adjusted.
        let rawSize = token.lineHeight(for: verticalSizeClass ?? .regular)
        return rawSize * dynamicTypeSize.percentageRate / 100
    }
}

// MARK: - Unordered Bullet

struct UnorderedBullet: View {

    // MARK: Properties

    let asset: MISOBulletList.UnorderedAsset
    let isBranded: Bool
    let level: MISOBulletList.NestedLevel
    let textStyle: MISOBulletList.TextStyle

    @Environment(\.theme) private var theme
    @Environment(\.verticalSizeClass) private var verticalSizeClass

    // MARK: Body

    var body: some View {
        MISOScaledIcon(image: MISOImage(asset: image, renderingMode: .template), size: assetSize)
            .foregroundColor(color)
    }

    // MARK: Private helpers

    private var image: Image {
        switch asset {
        case .bullet:
            Image(decorative: bulletAssetName, bundle: theme.resourcesBundle)
        case .tick:
            Image(decorative: "Component-bullet-list-bullet-tick", bundle: theme.resourcesBundle)
        case let .icon(image, _):
            image
        }
    }

    private var bulletAssetName: String {
        switch level {
        case .zero:
            "Component-bullet-list-bullet-level-0"
        case .one:
            "Component-bullet-list-bullet-level-1"
        case .two:
            "Component-bullet-list-bullet-level-2"
        }
    }

    private var color: MultipleColorSemanticToken {
        isBranded ? theme.colors.contentBrandPrimary : theme.colors.contentDefault
    }

    private var assetSize: CGFloat {
        switch textStyle {
        case .bodyLarge:
            theme.sizes.iconWithBodyLargeSizeSmall.dimension(for: verticalSizeClass ?? .regular)
        case .bodyMedium:
            theme.sizes.iconWithBodyMediumSizeSmall.dimension(for: verticalSizeClass ?? .regular)
        }
    }
}

// MARK: - Ordered Bullet

struct OrderedBullet: View {

    // MARK: Properties

    let level: MISOBulletList.NestedLevel
    let textStyle: MISOBulletList.TextStyle
    let isBold: Bool
    let index: UInt8

    // MARK: Body

    var body: some View {
        Group {
            switch level {
            case .zero:
                Text(Self.levelZeroBullet(for: index))
            case .one:
                Text(Self.levelOneBullet(for: index))
            case .two:
                Text(Self.levelTwoBullet(for: index))
            }
        }
        .modifier(BulletTextModifier(textStyle: textStyle, isBold: isBold))
    }

    // MARK: Helpers

    static func levelZeroBullet(for index: UInt8) -> String {
        if MYOUtils.isArabicLanguageInUse() {
            ".\(index + 1)"
        } else {
            "\(index + 1)."
        }
    }

    static func levelOneBullet(for index: UInt8) -> String {
        if MYOUtils.isArabicLanguageInUse() {
            MYOUtils.cyclicArabicLetter(at: index) + "." // NOTE: . won't be leading but trailing, arabic alphabet in use
        } else {
            MYOUtils.cyclicLatinLetter(at: index, isUppercase: true) + "."
        }
    }

    static func levelTwoBullet(for index: UInt8) -> String {
        if MYOUtils.isArabicLanguageInUse() {
            "(" + MYOUtils.cyclicArabicLetter(at: index) + ")" + "." // NOTE: . won't be leading but trailing, arabic alphabet in use
        } else {
            MYOUtils.cyclicLatinLetter(at: index, isUppercase: false) + "."
        }
    }
}
