//
// Software Name: OUDS iOS
// SPDX-FileCopyrightText: Copyright (c) Orange SA
// SPDX-License-Identifier: MIT
//
// This software is distributed under the MIT license,
// the text of which is available at https://opensource.org/license/MIT/
// or see the "LICENSE" file for more details.
//
// Authors: See CONTRIBUTORS.txt
// Software description: A SwiftUI components library with code examples for Orange Unified Design System
//

import MISOFoundations
import MISOTokensSemantic
import SwiftUI

/// Bullet list is a UI element that helps to view in related individual text items grouped together; items usually starting with a number or a bullet.
/// Bullet list is also known as _Unordered list_ or _Ordered list_ and is not an interactive element by default.
///
/// ## Types
///
/// Three types are proposed:
///
/// - **Unordered (by default)**: Collects related items that don’t need to be in a specific order or sequence.
/// - **Ordered**: Collects related items with numeric order or sequence.
/// - **Bare**: An unordered list without any bullets or alphanumeric sequence.
///
/// Types can be mixed in list, but must be identical for the same `MISOBulletList.NestedLevel`.
///
/// ## Levels
///
/// Lists can include nested items to indicate hierarchy or subcategories, with indentation distinguishing each level.
/// Arrange ordered list items logically, such as ranking by importance, highest to lowest values, or in alphabetical / numeric order.
/// Three levels are maximum.
///
/// ## Text Style
///
/// List can be used with different font sizes:
/// - **Body Large**: If the text accompanying the list component is the Body Large text. This variant is designed for more visual, engaging experiences.
/// - **Body Medium**: If the text accompanying the list component is the Body Medium text. This variant is best suited for functional, task-oriented experiences.
///
/// ## Cases forbidden by design
///
/// **it is not allowed to have a depth of items greater than 3**
///
/// ## Internationalisation considerations
///
/// For latin-based speaking countries, like France, Spain, United Kingdom or Belgium, the european "arabic" numbers are used for the first level of depth
/// of the ordered bullet list. For the second and third levels, the european alphabets are used with upper and lower case values.
///
/// However for countries speaking arabic, these rules can't be applied. Indeed, there is no notion of upper and lower case characters in arabic alphabet.
/// In addition, the numbers in use (i.e. the european "arabic" numbers like "1, 2, 3") are accepted in arabic countries, even if the "true arabic" numbers (like " ٢ ٣ ١") are used
/// in middle-east arabic countries and for official documents.
/// Thus the OUDS ordered bullet list will use "european" numbers for first level, and arabic alphabets for second and third levels.
///
/// ## Code samples
///
/// ```swift
///        // 1. Unordered list with bullets
///        MISOBulletList {
///            MISOBulletList.Item("Label 1")
///            MISOBulletList.Item("Label 2")
///            MISOBulletList.Item("Label 3")
///        }
///
///        // 1.1. Item of Unordered list with bullet as tick, a text style
///        // body medium and text bold
///        MISOBulletList(type: .unordered(asset: .tick),
///                       textStyle: .bodyMedium,
///                       isBold: true)  {
///            MISOBulletList.Item("Label 1")
///            MISOBulletList.Item("Label 2")
///            MISOBulletList.Item("Label 3")
///        }
///
///        // 2. Bare list with 3 items
///        MISOBulletList(type: .bare) {
///            MISOBulletList.Item("Label 1")
///            MISOBulletList.Item("Label 2")
///            MISOBulletList.Item("Label 3")
///        }
///
///        // 3. Ordered list with 3 items
///        MISOBulletList(type: .ordered) {
///            MISOBulletList.Item("Label 1")
///            MISOBulletList.Item("Label 2")
///            MISOBulletList.Item("Label 3")
///        }
///
///        // 3.1. Ordered list with 3 items in first level,
///        // and one item as sub item (second level),
///        // and 2 items as sub item in (third level)
///        MISOBulletList(type: .ordered) {
///            MISOBulletList.Item("Label 1") {
///                MISOBulletList.Item("Label 1.1") {
///                    MISOBulletList.Item("Label 1.1.1")
///                    MISOBulletList.Item("Label 1.1.2")
///                }
///            }
///            MISOBulletList.Item("Label 2")
///            MISOBulletList.Item("Label 3")
///        }
///
///        // Same Bullet list but items in third level with free icon as bullet
///        let icon = Image(decorative: "ic_heart")
///        MISOBulletList(type: .ordered) {
///            MISOBulletList.Item("Label 1") {
///                MISOBulletList.Item("Label 1.1", subListType: .unordered(asset: .icon(icon))) {
///                    MISOBulletList.Item("Label 1.1.1")
///                    MISOBulletList.Item("Label 1.1.2")
///                }
///            }
///            MISOBulletList.Item("Label 2")
///            MISOBulletList.Item("Label 3")
///        }
/// ```
///
/// ## Rich text recommendations
///
/// Rich text can be applied for bullet list whatever the `isBold` flag is.
///
/// Strong text can be used sparingly within alert messages to highlight key information.
/// Underlined text must not be used for emphasis, as it is commonly associated with links.
/// Underlined links must be bold.
/// If a hyperlink is needed within the content, the underlined style should be used.
/// Italic should be used with care, some brands do not allow it like Orange brand.
/// No other text styles should be used.
///
/// ## Accessibility considerations
///
/// Always check the results of rich text mode with high contrast, light and dark modes, and Voice Over vocalization.
///
/// - Version: 1.1.0 (Figma component design version)
/// - Since: 1.2.0
@available(iOS 15, macOS 13, visionOS 1, watchOS 11, tvOS 16, *)
public struct MISOBulletList: View {

    // MARK: Properties

    let type: Self.`Type`
    let textStyle: Self.TextStyle
    let isBold: Bool
    let items: [Item]

    @Environment(\.theme) private var theme

    // MARK: - Item

    // swiftlint:disable discouraged_optional_boolean
    /// The item of bullet list with text and optional sub items.
    public struct Item {

        // MARK: Properties

        let text: TextualContent
        let subListType: MISOBulletList.`Type`?
        let subListTextStyle: MISOBulletList.TextStyle?
        let subListHasBoldText: Bool?
        let subItems: [Item]

        // MARK: Initializer

        /// Create the item with text and sub items.
        /// Use the `subListType` , `subListTextStyle` and `subListHasBoldText`
        /// to change properties for those sub items, if needed.
        ///
        /// ```swift
        ///     MISOBulletList.Item("First point")
        ///     MISOBulletList.Item("Parent") {
        ///         MISOBulletList.Item("Child")
        ///     }
        /// ```
        ///
        /// - Parameters:
        ///    - text: The text of the item
        ///    - subListType: The specific `MISOBulletList.Type` for the nested sub-list, if any. If `nil`,
        ///     the type is inherited from the parent list.
        ///    - subListTextStyle: The specific `MISOBulletList.TextStyle` for the nested sub-list, if any. If
        ///     `nil`, the text style is inherited from the parent list.
        ///    - subListHasBoldText: Whether the text of the nested sub-list should be bold. If `nil`, the bold
        ///     setting is inherited from the parent list.
        ///    - subItems: The sub items builder to add to the current item. **Remark** only three levels are allowed.
        public init(_ text: String,
                    subListType: MISOBulletList.`Type`? = nil,
                    subListTextStyle: MISOBulletList.TextStyle? = nil,
                    subListHasBoldText: Bool? = nil,
                    @MISOBulletListItemBuilder subItems: () -> [MISOBulletList.Item] = { [] })
        {
            self.text = .raw(text)
            self.subListType = subListType
            self.subListTextStyle = subListTextStyle
            self.subListHasBoldText = subListHasBoldText
            self.subItems = subItems()
        }

        /// Create the item with text and sub items, the text is a rich text.
        /// Use the `subListType` , `subListTextStyle` and `subListHasBoldText`
        /// to change properties for those sub items, if needed.
        ///
        /// ```swift
        ///     MISOBulletList.Item(AttributedString(markdown: "First **important** point")) // Manage in your side errors for init
        /// ```
        ///
        /// - Parameters:
        ///    - richText: The rich text of the item
        ///    - subListType: The specific `MISOBulletList.Type` for the nested sub-list, if any. If `nil`,
        ///     the type is inherited from the parent list.
        ///    - subListTextStyle: The specific `MISOBulletList.TextStyle` for the nested sub-list, if any. If
        ///     `nil`, the text style is inherited from the parent list.
        ///    - subListHasBoldText: Whether the text of the nested sub-list should be bold. If `nil`, the bold
        ///     setting is inherited from the parent list.
        ///    - subItems: The sub items builder to add to the current item. **Remark** only three levels are allowed.
        public init(_ richText: AttributedString,
                    subListType: MISOBulletList.`Type`? = nil,
                    subListTextStyle: MISOBulletList.TextStyle? = nil,
                    subListHasBoldText: Bool? = nil,
                    @MISOBulletListItemBuilder subItems: () -> [MISOBulletList.Item] = { [] })
        {
            text = .attributed(richText)
            self.subListType = subListType
            self.subListTextStyle = subListTextStyle
            self.subListHasBoldText = subListHasBoldText
            self.subItems = subItems()
        }

        /// Creates a bullet list item with a localized text, looking up the key in the given bundle.
        ///
        /// ```swift
        ///     MISOBulletList.Item(LocalizedStringKey("item_label"), bundle: Bundle.module)
        /// ```
        ///
        /// - Parameters:
        ///    - key: A `LocalizedStringKey` used to look up the text in the given bundle
        ///    - tableName: The name of the `.strings` file, or `nil` for the default
        ///    - bundle: The bundle in which to look up the localized string. Defaults to `Bundle.main`.
        ///    - subListType: The specific `MISOBulletList.Type` for the nested sub-list, if any. If `nil`,
        ///     the type is inherited from the parent list.
        ///    - subListTextStyle: The specific `MISOBulletList.TextStyle` for the nested sub-list, if any. If
        ///     `nil`, the text style is inherited from the parent list.
        ///    - subListHasBoldText: Whether the text of the nested sub-list should be bold. If `nil`, the bold
        ///     setting is inherited from the parent list.
        ///    - subItems: The sub items builder to add to the current item. **Remark** only three levels are allowed.
        public init(_ key: LocalizedStringKey,
                    tableName: String? = nil,
                    bundle: Bundle = .main,
                    subListType: MISOBulletList.`Type`? = nil,
                    subListTextStyle: MISOBulletList.TextStyle? = nil,
                    subListHasBoldText: Bool? = nil,
                    @MISOBulletListItemBuilder subItems: () -> [MISOBulletList.Item] = { [] })
        {
            text = .raw(key.resolved(tableName: tableName, bundle: bundle))
            self.subListType = subListType
            self.subListTextStyle = subListTextStyle
            self.subListHasBoldText = subListHasBoldText
            self.subItems = subItems()
        }
    }

    // swiftlint:enable discouraged_optional_boolean

    // MARK: - Unordered Icon

    /// The type of asset in the unordered list
    /// - Since: 1.2.0
    @frozen public enum UnorderedAsset {
        /// A bullet for unordered bullet list
        case bullet

        /// A tick as bullet
        case tick

        /// A free icon as bullet
        ///
        ///  - Parameters:
        ///     - image: The asset image as bullet
        ///     - accessibilityLabel: An optional label for accessibility description if asset is not decorative.
        case icon(_ image: Image, accessibilityLabel: String? = nil)
    }

    // MARK: - Type

    /// The visual type of the list
    /// - Since: 1.2.0
    @frozen public enum `Type` {
        /// Collects related items that don’t need to be in a specific order or sequence.
        /// List items are typically marked with bullets, but it is also possible to use a tick or any Solaris icon.
        ///
        ///  - Parameters:
        ///     - asset: The type of icon the unordered item should be used, Bullet as default and branded
        ///     - isBranded: Flag used to display icon tinted with brand color. false by default
        case unordered(asset: UnorderedAsset = .bullet, isBranded: Bool = true)

        /// Collects related items with numeric order or sequence. Numbering starts at 1 with the first list item and increases
        /// by increments of 1 for each successive ordered list item.
        case ordered

        /// An unordered list without any bullets or alphanumeric sequence. It still has left-padding,
        /// so list items will appear indented. This is the default and is also known as undecorated “Unstyled” list.
        case bare
    }

    // MARK: - Text Style

    /// The typography style for the list item
    /// - Since: 1.2.0
    @frozen public enum TextStyle {
        /// If the text accompanying the list component is the body large text.
        /// This variant is designed for more visual, engaging experiences.
        case bodyLarge

        /// If the text accompanying the list component is the body medium text.
        /// This variant is best suited for functional, task-oriented experiences.
        case bodyMedium
    }

    // MARK: - Nested Level

    /// The level of the list item
    enum NestedLevel: Int {
        /// Level 0 list items define the main structure.
        case zero

        /// Level 1 (nested) list items provide hierarchy or subcategories.
        case one

        /// Level 2 (nested) list items provide hierarchy or subcategories.
        case two
    }

    // MARK: - Initializer

    /// Creates a bullet list with a bullet type, text style and bold.
    ///
    /// ```swift
    ///     MISOBulletList {
    ///         MISOBulletList.Item("First point")
    ///         MISOBulletList.Item("Second point")
    ///     }
    /// ```
    ///
    /// - Parameters:
    ///    - type: The visual type of the list (e.g., `ordered`, `unordered` or `bare`).
    ///     See `MISOBulletList.Type`, default `.unordered(asset: .bullet, isBranded: false)`
    ///    - textStyle: The typography style for the list items. See `MISOBulletList.TextStyle`, defaults `.bodyLarge`
    ///    - isBold: Whether the list item text should be bold. This can be overridden for sub-lists. Defaults to `true`
    ///    - items: Defines the list items
    public init(type: Self.`Type` = .unordered(asset: .bullet, isBranded: false),
                textStyle: Self.TextStyle = .bodyLarge,
                isBold: Bool = true,
                @MISOBulletListItemBuilder items: () -> [MISOBulletList.Item])
    {
        self.type = type
        self.textStyle = textStyle
        self.isBold = isBold
        self.items = items()
    }

    // MARK: - Properties

    public var body: some View {
        VStack(alignment: .leading, spacing: theme.spaces.fixedNone) {
            ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                BulletListItem(item: item,
                               type: type,
                               textStyle: textStyle,
                               isBold: isBold,
                               level: .zero,
                               index: UInt8(index))
            }
        }
    }
}
