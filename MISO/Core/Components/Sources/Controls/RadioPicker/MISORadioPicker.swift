// SPDX-FileCopyrightText: Copyright (c) Orange SA, Pierre-Yves Lapersonne
// SPDX-License-Identifier: MIT

#if !os(watchOS) && !os(tvOS)
import MISOFoundations
import MISOTokensSemantic
import SwiftUI

/// A picker allowing to expose several radio buttons and choose only one within the others.
/// Each radio button contains a "tag", i.e. a supposed to be unique value.
/// The picker will expose the choosen value through this "tag".
/// It has also some configuration elements which will override the one applied to nested ``MISORadioItem`` (divider, read only and error mode, layout and outlined)
///
/// ## Accessibility considerations
///
/// *Voice Over* will use several elements to describe the component: if component disabled / read only, if error context, the label and helper texts and a custom radio trait.
/// The picker itself does no have any defined accessiiblity value, label or identifier ; it remains in the users hands to define which one will be used.
/// However if defined in the ``MISORadioPickerData`` the items inside the picker will have such accessibility identifiers.
///
/// ## Forbidden by design
///
/// The design system does not allow to have ``MISORadioItem`` in both an error situation and a read only state.
/// The design system does not allow to have ``MISORadioItem`` in both an error situation and a disabled state.
/// The design system does not allow to have ``MISORadioItem`` in both a read only and a disabled state.
///
/// ## Code samples
///
/// ```swift
///     // Define the elements to display in radio buttons using MISORadioPickerData.
///     // This object has the same properties as the MISORadioItem,
///     // and some of them are optional withdefault values set
///     var someDataToPopulate: [MISORadioPickerData<String>] {
///         [
///             MISORadioPickerData<String>(tag: "Choice_1",
///                                         label: "Virgin Holy Lava",
///                                         extraLabel: "Very spicy",
///                                         description: "No alcohol, only tasty flavors",
///                                         image: MISOImage(asset: Image(systemName: "flame")),
///
///             MISORadioPickerData<String>(tag: "Choice_2",
///                                         label: "IPA beer",
///                                         description: "From Brewdog company",
///                                         image: MISOImage(asset: Image(systemName: "dog.fill")),
///
///             MISORadioPickerData<String>(tag: "Choice_3",
///                                         label: "Mineral water",
///                                         image: MISOImage(asset: Image(systemName: "waterbottle.fill")),
///         ]
///     }
///
///     // Prepare the selection, with a value previously selected
///     // Use the data and the binding for the picker.
///     @State var selection: String = "Choice_1"
///
///     // Here the picker is vertical
///     MISORadioPicker(selection: $selection, radios: someDataToPopulate)
///
///     // The picker can apply some settings to all its radio buttons.
///     // It can be also horitzontal with a scroll indicator.
///     // Here all the the radio buttons are in read only mode and use reversed layout.
///     MISORadioPicker(selection: $selection,
///                     radios: someDataToPopulate,
///                     isReversed: true,
///                     isReadOnly: true,
///                     placement: .horitzontal(true))
/// ```
///
/// - Since: 0.14.0
@available(iOS 15, macOS 13, visionOS 1, *)
public struct MISORadioPicker<Tag>: View where Tag: Hashable {

    // MARK: - Properties

    /// The tag of the selected radio button
    var selection: Binding<Tag>

    /// The list of data to wrap in ``MISORadiooItem`` inside this picker
    private let radios: [MISORadioPickerData<Tag>]

    /// The type of layout the picker must have
    private let placement: MISORadioPickerPlacement

    /// Overrides any configuration applied to embedded ``MISORadioItem`` and forces them to apply the outlined layout
    private let isOutlined: Bool

    /// Overrides any configuration applied to embedded ``MISORadioItem`` and forces them to apply the reversed layout
    private let isReversed: Bool

    /// Overrides any configuration applied to embedded ``MISORadioItem`` and forces them to error mode
    private let isError: Bool

    /// Overrides any configuration applied to embedded ``MISORadioItem`` and forces them to read only mode
    private let isReadOnly: Bool

    /// Overrides any configuration applied to embedded ``MISORadioItem`` and displays a divider (except for the last one)
    private let hasDivider: Bool

    /// The custom spacing to apply between items by user
    private let customItemsSpacing: SpaceSemanticToken?

    @Environment(\.theme) private var theme

    // MARK: - Init

    /// Defines the picker view which displays using ``MISORadioItem`` view the ``MISORadioPickerData``
    ///
    /// ```swift
    ///     MISORadioPicker(selection: $selection, radios: [
    ///         MISORadioPickerData(tag: "a", label: "Option A"),
    ///         MISORadioPickerData(tag: "b", label: "Option B"),
    ///     ])
    /// ```
    ///
    /// - Parameters:
    ///    - selection: The current selected value
    ///    - radios: The raw data to wrap in ``MISORadioItem`` for display
    ///    - placement: How radio buttons must be placed (default set to *vertical*)
    ///    - isOutlined: If *true*, force all ``MISORadioItem`` to be outlined (default set to *false*)
    ///    - isReversed: If *true*, force all ``MISORadioItem`` to have reversed layout (default set to *false*)
    ///    - isError: If *true*, force all ``MISORadioItem`` to be in error mode (default set to *false*)
    ///    - isReadOnly: If *true*, force all ``MISORadioItem`` to be in read only mode (default set to *false*)
    ///    - hasDivider: If *true*, force all ``MISORadioItem`` except the last one to have a divider (default set to *false*)
    ///    - itemsSpacing: The custom spacing to apply between utems, default set to *nl*. If *nil* token *theme.spaces.fixedNone* will be used.
    public init(selection: Binding<Tag>,
                radios: [MISORadioPickerData<Tag>],
                placement: MISORadioPickerPlacement = .vertical,
                isOutlined: Bool = false,
                isReversed: Bool = false,
                isError: Bool = false,
                isReadOnly: Bool = false,
                hasDivider: Bool = false,
                itemsSpacing: SpaceSemanticToken? = nil)
    {
        self.selection = selection
        self.radios = radios
        self.placement = placement
        self.isOutlined = isOutlined
        self.isReversed = isReversed
        self.isError = isError
        self.isReadOnly = isReadOnly
        self.hasDivider = hasDivider
        customItemsSpacing = itemsSpacing
        verifySelection()
    }

    // MARK: - Body

    public var body: some View {
        switch placement {
        case let .horizontal(showsIndicator):
            ScrollView(.horizontal, showsIndicators: showsIndicator) {
                HStack(alignment: .center, spacing: itemsSpacing) {
                    content(for: radios)
                }
            }
        case .vertical:
            VStack(alignment: .leading, spacing: itemsSpacing) {
                content(for: radios)
            }
        }
    }

    private func content(for radios: [MISORadioPickerData<Tag>]) -> some View {
        ForEach(radios, id: \.tag) { radio in
            if let a11yidentifier = radio.accessibilityIdentifier {
                content(for: radio,
                        noDivider: radios[radios.count - 1].tag == radio.tag) // No divider for last item
                    .accessibilityIdentifier(a11yidentifier)
            } else {
                content(for: radio,
                        noDivider: radios[radios.count - 1].tag == radio.tag) // No divider for last item
            }
        }
    }

    private func content(for radio: MISORadioPickerData<Tag>, noDivider: Bool) -> some View {
        MISORadioItem(radio.label,
                      isOn: selection.wrappedValue == radio.tag ? .constant(true) : .constant(false),
                      extraLabel: radio.extraLabel,
                      description: radio.description,
                      image: radio.icon,
                      isOutlined: isOutlined ? true : radio.isOutlined,
                      isReversed: isReversed ? true : radio.isReversed,
                      isError: isError ? true : radio.isError,
                      isReadOnly: isReadOnly ? true : radio.isReadOnly,
                      hasDivider: hasDivider && !noDivider ? true : radio.hasDivider)
        {
            selection.wrappedValue = radio.tag
        }
    }

    // MARK: - Helpers

    /// If user does not define a custom spacing, use a default one
    private var itemsSpacing: SpaceSemanticToken {
        customItemsSpacing ?? theme.spaces.fixedNone
    }

    /// Checks if the given selection is available only one time within the radio configurations.
    /// If not, displays a error message in the logs.
    private func verifySelection() {
        let selection = selection.wrappedValue
        let selectionCount = radios.count(where: { $0.tag == selection })
        if selectionCount == 0 {
            OL.error("It seems the selection '\(selection)' is not available inside the radio buttons. Be sure the value is available in only one tag.")
        } else if selectionCount > 1 {
            OL.error("It seems the selection '\(selection)' is available more than one time. Be sure the value is available in only one tag.")
        }
    }
}
#endif
