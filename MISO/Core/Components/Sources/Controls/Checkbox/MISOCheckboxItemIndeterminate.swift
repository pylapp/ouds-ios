// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

import MISOFoundations
import SwiftUI

// MARK: - MISO Checkbox Item Indeterminate

/// Checkbox is a UI element that allows to select multiple options from a set of mutually non exclusive choices.
/// Checkbox item covers a wider range of contexts by allowing to toggle the visibility of additional text labels and icon assets.
///
/// ## Layouts
///
/// The component can be rendered as two different layouts:
///
/// - **default**: the component has a leading indicator, a label and optional helper texts, and an optional trailing decorative icon
/// - **inverse**: like the *default* layout but with a trailing checkbox indicator and a leading optional image
///
/// ## Indicator states
///
/// The checkbox indicator has three available states:
/// - **selected**: the checkbox is filled with a tick, the user has made the action to select the checkbox
/// - **unselected**: the checkbox is empty, does not contain a tick, the user has made the action to unselect or did not select yet the checkbox
/// - **indeterminate**: mike a prefilled or preticked checkbox, the user did not do anything on it yet
///
/// If you need a checkbox with only two states to manage use instead ``MISOCheckboxItem``.
///
/// ## Particular cases
///
/// An ``MISOCheckboxItemIndeterminate`` can be related to an error situation, for example troubles for a form.
/// A dedicated look and feel is implemented for that if the `isError` flag is risen.
/// In that case if the component displayed an icon, this icon will be replaced automatically by an error icon.
///
/// In addition, the ``MISOCheckboxItemIndeterminate`` can be in read only mode, i.e. the user cannot interact with the component yet
/// but this component must not be considered as disabled.
///
/// The component does not follow the right-to-left (RTL) / left-to-right (LTR) mode returned by the system as it could have some meaning
/// to have for example the indicator in trailing position for LTR mode and vice versa.
/// However, if the component has an icon in leading position (RTL mode) or in trailing position (LTR), the content of the icon is never changed.
/// It could lead to a loss of meaning or semantics in the icon. Thus the ``MISOImage`` `flipped` property can be used to flip the icon content
/// whatever the layout direction is, preventing the user from implementing their own rules to flip or not the image.
///
/// ## Accessibility considerations
///
/// *Voice Over* will use several elements to describe the component: if component disabled / read only, if error context, the label and helper texts and a custom checkbox trait.
///
/// ## Forbidden by design
///
/// **The design system does not allow to have both an error situation and a read only component.**
/// **The design system does not allow to have both an error situation and a disabled component.**
/// **The design system does not allow to have both a read only and a disabled component.**
///
/// ## Code samples
///
/// ```swift
///     // Supposing we have an indeterminate state checkbox
///     @Published var selection: MISOCheckboxIndicatorState = .indeterminate
///
///     // A leading checkbox with a label.
///     MISOCheckboxItemIndeterminate("Hello world", selection: $selection)
///
///     // Localizable from bundle can also be used
///     MISOCheckboxItemIndeterminate(LocalizedStringKey("select_all"), bundle: Bundle.module, selection: $selection)
///
///     // A leading checkbox with a label, but in read only mode.
///     MISOCheckboxItemIndeterminate("Hello world", selection: $selection, isReadOnly: true)
///
///     // A leading checkbox with a label and a description as helper text.
///     MISOCheckboxItemIndeterminate("Bazinga!", selection: $selection, description: "Doll-Dagga Buzz-Buzz Ziggety-Zag")
///
///     // A trailing checkbox with a label, an helper text and an icon (tinted, default rendering).
///     MISOCheckboxItemIndeterminate("We live in a fabled world",
///                                   selection: $selection,
///                                   description: "Of dreaming boys and wide-eyed girls",
///                                   image: MISOImage(asset: Image(decorative: "ic_heart")),
///                                   isReversed: true)
///
///     // A trailing checkbox with a raw (non-tinted) image.
///     MISOCheckboxItemIndeterminate("We live in a fabled world",
///                                   selection: $selection,
///                                   description: "Of dreaming boys and wide-eyed girls",
///                                   image: MISOImage(asset: Image(decorative: "il_someImage"), renderingMode: .original),
///                                   isReversed: true)
///
///     // Flip the icon for RTL layouts using MISOImage.
///     MISOCheckboxItemIndeterminate("Cocorico !",
///                                   selection: $selection,
///                                   image: MISOImage(asset: Image(systemName: "figure.handball"),
///                                                    flipped: layoutDirection == .rightToLeft),
///                                   isReversed: layoutDirection == .rightToLeft)
///
///     // If on error, add an error message can help user to understand error context
///     MISOCheckboxItemIndeterminate("We live in a fabled world",
///                                   selection: $selection,
///                                   isError: true,
///                                   errorText: "Something wrong",
///                                   hasDivider: true)
///
///     // A leading checkbox with a label, but disabled.
///     MISOCheckboxItemIndeterminate("Hello world", selection: $selection)
///         .disabled(true)
///
///     // Never disable a read only or an error-related checkbox as it will crash
///     // This is forbidden by design!
///     MISOCheckboxItemIndeterminate("Hello world", selection: $selection, isError: true).disabled(true) // fatal error
///     MISOCheckboxItemIndeterminate("Hello world", selection: $selection, isReadOnly: true).disabled(true) // fatal error
/// ```
///
/// - Version: 2.4.0 (Figma component design version)
/// - Since: 0.12.0
@available(iOS 15, macOS 13, visionOS 1, watchOS 11, tvOS 16, *)
public struct MISOCheckboxItemIndeterminate: View {

    // MARK: - Properties

    @Binding private var selection: MISOCheckboxIndicatorState
    private let layoutData: ControlItemLabel.LayoutData
    private let action: (() -> Void)?

    @Environment(\.isEnabled) private var isEnabled

    // MARK: - Initializers

    /// Creates a checkbox with label and optional helper text, icon, divider.
    ///
    /// ```swift
    ///     MISOCheckboxItemIndeterminate("Select all", selection: $state)
    ///
    ///     MISOCheckboxItemIndeterminate("Select all",
    ///                                   selection: $state,
    ///                                   image: MISOImage(asset: Image(decorative: "ic_heart")))
    /// ```
    ///
    /// **The design system does not allow to have both an error situation and a read only mode for the component.**
    ///
    /// **Remark: If `label` and `description` strings are wording keys from strings catalog stored in `Bundle.main`, they are automatically localized. Else, prefer to
    /// provide the localized string if key is stored in another bundle.**
    ///
    /// - Parameters:
    ///   - label: The main label text of the checkbox, must not be empty
    ///   - selection: A binding to a property that determines whether the indicator is ticked, unticked or preticked (indeterminate / partially ticked)
    ///   - description: A description, an additional helper text, should not be empty
    ///   - image: An optional ``MISOImage`` encapsulating the asset, its flip flag and its rendering mode. Default set to `nil`.
    ///   - isReversed: `true` if the checkbox indicator must be in trailing position, `false` otherwise. Default to `false`
    ///   - isError: `true` if the look and feel of the component must reflect an error state, default set to `false`
    ///   - errorText: An optional error message to display at the bottom. This message is ignored if `isError` is `false`.
    ///   - isReadOnly: True if component is in read only, i.e. not really disabled but user cannot interact with it yet, default set to `false`
    ///   - hasDivider: If `true` a divider is added at the bottom of the view, by default set to `false`
    ///   - constrainedMaxWidth: When `true`, the item width is constrained to a maximum value defined by the design system.
    ///     When `false`, no specific width constraint is applied, allowing the component to size itself or follow external
    ///     modifier. Defaults to `false`.
    ///   - action: An additional action to trigger when the checkbox has been pressed, default set to `nil`
    public init(_ label: String,
                selection: Binding<MISOCheckboxIndicatorState>,
                description: String? = nil,
                image: MISOImage? = nil,
                isReversed: Bool = false,
                isError: Bool = false,
                errorText: String? = nil,
                isReadOnly: Bool = false,
                hasDivider: Bool = false,
                constrainedMaxWidth: Bool = false,
                action: (() -> Void)? = nil)
    {
        if isError, isReadOnly {
            ML.fatal("It is forbidden by design to have an MISOCheckboxItemIndeterminate in an error context and in read only mode")
        }

        if label.isEmpty {
            ML.warning("Label given to an MISOCheckboxItemIndeterminate is defined but empty, prefer MISOCheckboxIndeterminate(isOn:accessibilityLabel:) instead")
        }

        if let description, description.isEmpty {
            ML.warning("Description text given to an MISOCheckboxItemIndeterminate is defined but empty, is it expected? Prefer use of `nil` value instead")
        }

        // swiftlint:disable force_unwrapping
        if isError, errorText == nil || errorText!.isEmpty {
            ML.warning("Error text given to an MISOCheckboxItemIndeterminate must be defined in case of error")
        }
        // swiftlint:enable force_unwrapping

        _selection = selection
        self.action = action

        let errorTextContent: TextualContent? = if let errorText {
            .raw(errorText)
        } else {
            nil
        }

        layoutData = .init(
            label: label.localized(),
            extraLabel: nil,
            description: description?.localized(),
            icon: image,
            isOutlined: false,
            isError: isError,
            errorText: errorTextContent,
            isReadOnly: isReadOnly,
            hasDivider: hasDivider,
            constrainedMaxWidth: constrainedMaxWidth,
            orientation: isReversed ? .reversed : .default)
    }

    // swiftlint:disable function_default_parameter_at_end
    /// Creates a checkbox with a localized label, looking up the key in the given bundle.
    ///
    /// ```swift
    ///     MISOCheckboxItemIndeterminate(LocalizedStringKey("select_all"), bundle: Bundle.module, selection: $state)
    ///
    ///     MISOCheckboxItemIndeterminate(LocalizedStringKey("select_all"),
    ///                                   bundle: Bundle.module,
    ///                                   selection: $state,
    ///                                   image: MISOImage(asset: Image(decorative: "ic_heart")))
    /// ```
    ///
    /// **The design system does not allow to have both an error situation and a read only mode for the component.**
    ///
    /// - Parameters:
    ///   - key: A `LocalizedStringKey` used to look up the label in the given bundle
    ///   - tableName: The name of the `.strings` file, or `nil` for the default
    ///   - bundle: The bundle in which to look up the localized string. Defaults to `Bundle.main`.
    ///   - selection: A binding to a property that determines whether the indicator is ticked, unticked or preticked
    ///   - description: A description, an additional helper text, should not be empty
    ///   - image: An optional ``MISOImage`` encapsulating the asset, its flip flag and its rendering mode. Default set to `nil`.
    ///   - isReversed: `true` if the checkbox indicator must be in trailing position, `false` otherwise. Default to `false`
    ///   - isError: `true` if the look and feel of the component must reflect an error state, default set to `false`
    ///   - errorText: An optional error message to display at the bottom. This message is ignored if `isError` is `false`.
    ///   - isReadOnly: True if component is in read only, default set to `false`
    ///   - hasDivider: If `true` a divider is added at the bottom of the view, by default set to `false`
    ///   - constrainedMaxWidth: When `true`, the item width is constrained to a maximum value defined by the design system.
    ///   - action: An additional action to trigger when the checkbox has been pressed, default set to `nil`
    public init(_ key: LocalizedStringKey,
                tableName: String? = nil,
                bundle: Bundle = .main,
                selection: Binding<MISOCheckboxIndicatorState>,
                description: String? = nil,
                image: MISOImage? = nil,
                isReversed: Bool = false,
                isError: Bool = false,
                errorText: String? = nil,
                isReadOnly: Bool = false,
                hasDivider: Bool = false,
                constrainedMaxWidth: Bool = false,
                action: (() -> Void)? = nil)
    {
        self.init(key.resolved(tableName: tableName, bundle: bundle),
                  selection: selection,
                  description: description,
                  image: image,
                  isReversed: isReversed,
                  isError: isError,
                  errorText: errorText,
                  isReadOnly: isReadOnly,
                  hasDivider: hasDivider,
                  constrainedMaxWidth: constrainedMaxWidth,
                  action: action)
    }

    // swiftlint:enable function_default_parameter_at_end

    // MARK: Body

    public var body: some View {
        ControlItem(indicatorType: .checkBox($selection), layoutData: layoutData, action: action)
            .accessibilityRemoveTraits([.isButton]) // .isToggle trait for iOS 17+
            .accessibilityLabel(accessibilityLabel)
            .accessibilityValue(accessibilityValue)
            .accessibilityHint(accessibilityHint)
    }

    // MARK: - A11Y helpers

    /// Forge a string to vocalize the component label based on label, extraLabel and description
    private var accessibilityLabel: String {
        let extraLabel = layoutData.extraLabel?.isEmpty != false ? "" : ", \(layoutData.extraLabel ?? "")"
        let description = layoutData.description?.isEmpty != false ? "" : ", \(layoutData.description ?? "")"
        return "\(layoutData.label)\(extraLabel)\(description)"
    }

    /// Forges a string to vocalize with *Voice Over* describing the component trait, value, state and error
    private var accessibilityValue: String {
        let traitDescription = "core_checkbox_trait_a11y".localized() // Fake trait for Voice Over vocalization
        let valueDescription = selection.a11yDescription
        let stateDescription = !isEnabled || layoutData.isReadOnly ? "core_common_disabled_a11y".localized() : ""

        let errorPrefix = "core_common_onError_a11y".localized()
        let errorText = layoutData.errorText?.rawValue ?? ""
        let errorDescription = layoutData.isError ? "\(errorPrefix), \(errorText)" : ""

        return "\(traitDescription). \(valueDescription). \(stateDescription). \(errorDescription)"
    }

    /// Forges a string to vocalize with *Voice Over* describing the component hint
    private var accessibilityHint: String {
        if layoutData.isReadOnly || !isEnabled {
            ""
        } else {
            selection.a11yHint
        }
    }
}
