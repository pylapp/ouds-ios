// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOThemesContract
import MISOTokensSemantic
import SwiftUI

/// An country flag element that can be used at the leading or trailing position of a list item
/// such as ``MISOStaticListItem`` or ``MISONavigationListItem``.
///
/// ``MISOListItemFlag`` displays a country flag (i.e. image)
///
/// ## Code samples
///
/// ```swift
///     // Country flag with medium size (default)
///     MISOListItemFlag(asset: Image(decorative: "il_flag_fr"), description: "France")
///
///     // Usage as leading element in a list item
///     MISOStaticListItem(
///         data: MISOListItemData(label: "Information"),
///         leading: .flag(.init(asset: Image(decorative: "il_flag_fr"), description: "France"))
///     )
///
///     // Usage as trailing element in a list item
///     MISOStaticListItem(
///         data: MISOListItemData(label: "Warning"),
///         trailing: .flag(.init(asset: Image(decorative: "il_flag_fr"), description: "France"))
///     )
/// ```
///
/// - Since: 3.0.0
@available(iOS 15, macOS 13, visionOS 1, watchOS 11, tvOS 16, *)
public struct MISOListItemFlag: View {

    // MARK: Properties

    private let asset: Image
    private let description: String

    @Environment(\.theme) private var theme
    @Environment(\.isEnabled) private var isEnabled
    @Environment(\.misoListItemSize) private var itemSize
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    // MARK: Initializer

    /// Creates an icon element for use in a list item at the leading or trailing position.
    ///
    /// ```swift
    ///     // Decorative image
    ///     MISOListItemFlag(asset: Image(decorative: "il_flag_fr"))
    /// ```
    ///
    /// - Parameters:
    ///   - asset: The asset contains the image
    ///   - description: The description of the country flag
    public init(asset: Image, description: String) {
        self.asset = asset
        self.description = description
    }

    // MARK: Body

    public var body: some View {
        HStack {
            MISOImage(asset: asset, accessibilityLabel: description, renderingMode: .original)
                .aspectRatio(contentMode: .fit)
                .frame(height: flagHeight)
                .opacity(opacity)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(description)
        .frame(minWidth: minWidth, alignment: .center)
    }

    // MARK: Helpers

    private var opacity: Double {
        isEnabled ? theme.opacities.opaque : theme.opacities.disabled
    }

    private var flagHeight: SizeSemanticToken {
        theme.listItem.sizeFlagHeight * dynamicTypeSize.percentageRate / 100
    }

    private var minWidth: SizeSemanticToken {
        let rawSize = if itemSize == .small {
            theme.listItem.sizeAssetSmall
        } else {
            theme.listItem.sizeAssetMedium
        }

        return rawSize * dynamicTypeSize.percentageRate / 100
    }
}
