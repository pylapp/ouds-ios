---
name: miso-ios-components-controls
description: Usage and code examples for MISO iOS Controls components — MISOCheckbox / MISOCheckboxItem / MISOCheckboxPicker / MISOCheckboxIndeterminate, MISORadio / MISORadioItem / MISORadioPicker, MISOSwitch / MISOSwitchItem, MISOSuggestionChip / MISOFilterChip / MISOChipPicker, MISOPinCodeInput, MISOPasswordInput, MISOTextInput, MISOTextArea. Load the miso-ios-framework-usage skill first for imports, themes and image rules.
license: MIT
---

# MISO Controls components

> Prerequisite: load `miso-ios-framework-usage` first for imports, themes and image rules
> (`MISOImage`, `// swiftlint:disable:next accessibility_label_for_image`).

## Common patterns (shared across most Controls)

These patterns apply to Checkbox, Radio, Switch, TextInput, TextArea, PinCodeInput, PasswordInput unless noted otherwise.

| Pattern | Syntax |
|---|---|
| Error state | `isError: true, errorText: "Message"` |
| Rich error | `errorText: AttributedString` |
| Plain helper | `helperText: "…"` |
| Rich helper | `helperText: AttributedString` |
| Error status (inputs) | `status: .error(message: "…")` |
| Rich error status | `status: .richError(message: AttributedString)` |
| Read-only | `isReadOnly: true` |
| Disabled | `.disabled(true)` — never combine with `isError` or `isReadOnly` |

> **Forbidden combinations** (fatal error at runtime): `isError` + `isReadOnly`, `isError` + `.disabled`, `isReadOnly` + `.disabled`

---

## Checkbox

```swift
MISOCheckbox(isOn: $isOn, accessibilityLabel: "Label")
MISOCheckboxIndeterminate(selection: $selection, accessibilityLabel: "Label")
MISOCheckboxItem("Label", isOn: $isOn)
MISOCheckboxItem("Label", isOn: $isOn, description: "Helper",
                 icon: MISOImage(asset: Image(decorative: "ic")))
MISOCheckboxItem("Label", isOn: $isOn,
                 icon: MISOImage(asset: Image(decorative: "ic")), isReversed: true)
// Raw (non-tinted) image:
MISOCheckboxItem("Label", isOn: $isOn,
                 icon: MISOImage(asset: Image(decorative: "il_brand"), renderingMode: .original))
// Flip icon for RTL:
MISOCheckboxItem("Label", isOn: $isOn,
                 icon: MISOImage(asset: Image(systemName: "figure.handball"),
                                 flipped: layoutDirection == .rightToLeft))
// LocalizedStringKey:
MISOCheckboxItem(LocalizedStringKey("agree_terms"), bundle: Bundle.module, isOn: $isOn,
                 icon: MISOImage(asset: Image(decorative: "ic")))
// Indeterminate (three states) — also accepts LocalizedStringKey:
MISOCheckboxItemIndeterminate("Label", selection: $selection,
                               icon: MISOImage(asset: Image(decorative: "ic")))
MISOCheckboxItemIndeterminate(LocalizedStringKey("select_all"), bundle: Bundle.module,
                               selection: $selection)
// Error / helper / disabled → see "Common patterns" above
```

> Parameter order: `(_ label:, isOn:, description:, icon:, isReversed:, isError:, errorText:, isReadOnly:, hasDivider:, constrainedMaxWidth:, action:)`

```swift
// Picker — icon is MISOImage?
MISOCheckboxPicker(selections: $selections, checkboxes: [
    .init(tag: "a", label: "Option A"),
    .init(tag: "b", label: "Option B", description: "Details", isReversed: true),
    .init(tag: "c", label: "Option C", icon: MISOImage(asset: Image(systemName: "flame"))),
    .init(tag: "d", label: "Option D",
          icon: MISOImage(asset: Image(decorative: "il_brand"), renderingMode: .original)),
])
MISOCheckboxPicker(selections: $selections, checkboxes: data,
                   placement: .verticalRooted("All options", .textAndCount))
MISOCheckboxPicker(selections: $selections, checkboxes: data,
                   isReversed: true, placement: .horizontal(true))
```

---

## Radio Button

```swift
MISORadio(isOn: $isOn, accessibilityLabel: "Label")
MISORadioItem("Label", isOn: $isOn)
MISORadioItem("Label", isOn: $isOn, icon: MISOImage(asset: Image(decorative: "ic")))
// Raw (non-tinted) image:
MISORadioItem("Label", isOn: $isOn,
              icon: MISOImage(asset: Image(decorative: "il_brand"), renderingMode: .original))
// Flip icon for RTL:
MISORadioItem("Label", isOn: $isOn,
              icon: MISOImage(asset: Image(systemName: "chevron.right"),
                              flipped: layoutDirection == .rightToLeft))
// LocalizedStringKey:
MISORadioItem(LocalizedStringKey("option_label"), bundle: Bundle.module, isOn: $isOn,
              icon: MISOImage(asset: Image(decorative: "ic")))
// Error / helper / disabled → see "Common patterns" above
MISORadioPicker(selection: $selection,
                radios: [
                    .init(tag: "a", label: "Option A"),
                    .init(tag: "b", label: "Option B",
                          icon: MISOImage(asset: Image(systemName: "flame"))),
                    .init(tag: "c", label: "Option C",
                          icon: MISOImage(asset: Image(decorative: "il_brand"),
                                         renderingMode: .original)),
                ],
                placement: .vertical)
```

---

## Switch

```swift
MISOSwitch(isOn: $isOn, accessibilityLabel: "Label")
MISOSwitchItem("Label", isOn: $isOn)
MISOSwitchItem("Label", isOn: $isOn,
               icon: MISOImage(asset: Image(decorative: "ic")))
// Raw (non-tinted) image:
MISOSwitchItem("Label", isOn: $isOn,
               icon: MISOImage(asset: Image(decorative: "il_brand"), renderingMode: .original))
// Flip icon for RTL:
MISOSwitchItem("Label", isOn: $isOn,
               icon: MISOImage(asset: Image(systemName: "figure.handball"),
                               flipped: layoutDirection == .rightToLeft))
// LocalizedStringKey:
MISOSwitchItem(LocalizedStringKey("wifi_setting"), bundle: Bundle.module, isOn: $isOn,
               icon: MISOImage(asset: Image(decorative: "ic")))
// Error / helper / disabled → see "Common patterns" above
```

---

## Pin Code Input

Available lengths: `.four`, `.six` (default).

```swift
MISOPinCodeInput($value)
MISOPinCodeInput($value, length: .four, autofocus: true)
MISOPinCodeInput($value, helperText: "Enter your PIN")
// Error status → see "Common patterns" (status: .error / .richError)
```

---

## Password Input

> `status` is of type `MISOTextInput.Status` (shared with `MISOTextInput`).

```swift
MISOPasswordInput(label: "Password", password: $password, isHiddenPassword: $isHidden)
MISOPasswordInput(label: "Password", password: $password, isHiddenPassword: $isHidden,
                  placeholder: "Min. 8 chars", prefix: "🔑", lockIcon: true)
// Helper / error status → see "Common patterns"
```

---

## Chips

```swift
MISOSuggestionChip(text: "Label") {}
MISOSuggestionChip(icon: MISOImage(asset: Image("ic")), text: "Label") {}
MISOSuggestionChip(icon: MISOImage(asset: Image("ic"), renderingMode: .original), text: "Label") {} // raw image (not tinted)
MISOSuggestionChip(icon: MISOImage(asset: Image("ic")), accessibilityLabel: "Label") {}
MISOSuggestionChip(icon: MISOImage(asset: Image("ic"), renderingMode: .original), accessibilityLabel: "Label") {} // raw image (not tinted)
MISOFilterChip(text: "Label") {}
MISOFilterChip(icon: MISOImage(asset: Image("ic")), text: "Label") {}
MISOFilterChip(icon: MISOImage(asset: Image("ic"), renderingMode: .original), text: "Label") {} // raw image (not tinted)
MISOFilterChip(icon: MISOImage(asset: Image("ic")), accessibilityLabel: "Label") {}
MISOFilterChip(icon: MISOImage(asset: Image("ic"), renderingMode: .original), accessibilityLabel: "Label") {} // raw image (not tinted)
MISOChipPicker(title: "Title", selection: $selection, chips: [
    .init(tag: .value1, layout: .textAndIcon("Label", image: MISOImage(asset: Image("ic")))),
    .init(tag: .value2, layout: .textAndIcon("Brand", image: MISOImage(asset: Image("ic_brand"), renderingMode: .original))), // raw image
    .init(tag: .value3, layout: .icon(MISOImage(asset: Image("ic")), accessibilityLabel: "Label")),
    .init(tag: .value4, layout: .icon(MISOImage(asset: Image("ic_brand"), renderingMode: .original), accessibilityLabel: "Brand")), // raw image
])
```

---

## Text Input

```swift
MISOTextInput(label: "Label", text: $text)
MISOTextInput(label: "Label", text: $text, placeholder: "…", prefix: "Pre", suffix: "Suf")
MISOTextInput(label: "Label", text: $text, leadingIcon: MISOImage(asset: Image("ic")))
MISOTextInput(label: "Label", text: $text,
              leadingIcon: MISOImage(asset: Image("ic"), renderingMode: .original)) // raw image (not tinted)
MISOTextInput(label: "Label", text: $text,
              leadingIcon: MISOImage(asset: Image("ic"), flipped: layoutDirection == .rightToLeft)) // flip for RTL
MISOTextInput(label: "Label", text: $text,
              trailingAction: .init(icon: MISOImage(asset: Image("ic")), actionHint: "Hint") {})
MISOTextInput(label: "Label", text: $text,
              trailingAction: .init(icon: MISOImage(asset: Image("ic"), renderingMode: .original),
                                    actionHint: "Hint") {}) // raw image
// Helper / error status → see "Common patterns"
```

---

## Text Area

`helperText` type: `.plain(String)` | `.rich(AttributedString)` | `.charactersMaxCount(UInt16)`

```swift
MISOTextArea(label: "Label", text: $text)
MISOTextArea(label: "Label", text: $text, placeholder: "Describe…")
MISOTextArea(label: "Label", text: $text, helperText: .plain("Max 500 chars."))
MISOTextArea(label: "Label", text: $text, helperText: .charactersMaxCount(500))
MISOTextArea(label: "Label", text: $text,
             helperLink: .init(text: "Learn more") { openUrl(url) })
// Fixed height — no vertical growth, scroll from first overflow line
MISOTextArea(label: "Label", text: $text, constrainedMaxHeight: true)
// Error status → see "Common patterns"
```

> Height is controlled by two component tokens on `theme.textArea`:
> - `sizeMinHeightInput` (72 pt by default) — minimum height, always applied
> - `sizeMaxHeightInput` (240 pt by default) — maximum height before scroll (used when `constrainedMaxHeight: false`, the default)
>
> When `constrainedMaxHeight: true`, `maxHeight` is capped to `sizeMinHeightInput`, keeping the component at a fixed compact size.
