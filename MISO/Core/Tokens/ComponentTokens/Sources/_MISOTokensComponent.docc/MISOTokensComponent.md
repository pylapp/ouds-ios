# ``MISOTokensComponent``

@Metadata {
    @PageImage(purpose: icon, source: "ic_design_token_figma_component")
    @DisplayName("Tokens for components", style: symbol)
    @TitleHeading("Library")
}
<!-- 
Do not add @PageImage(purpose: card) because not managed for landing page of online doc.
See https://github.com/swiftlang/swift-docc/issues/1283
-->

These _tokens_ are defined for components and refer to semantic tokens or raw tokens.
They can be seen as a kind of bridge between components and in the end primitive values of the design kit.

## Overview

<!-- NOTE: Do not forget to update tokens version -->
```
🧬 Core version: 1.11.0
```

Thus if a component need to change for example its _background color_, and if a _component token_ is used for it, then only the value of this _token_ should be changed without any modification on the _component_ definition.
_Components_ use _component tokens_ exposed through the _theme_ thanks to token providers to get their style values.

Components tokens are defined and gathered inside _Swift protocol_ so as to be exposed then through implementation of `MISOTheme` thanks to dedicated tokens providers.
Because we choose to split responsabilities and objects into their own modules, we faced troubles to make possible for children themes or providers to override properties declared in _protocols_ and defined in _extensions_.
That is the reason why tokens are exposed as `@objc open` to be available and overridable anywhere. 

Example with ``ButtonComponentTokens``:

```swift
// Declare some component tokens for buttons with properties they must apply
public protocol ButtonComponentTokens {
    var sizeMaxHeightIconOnly: SizeSemanticToken { get }
    var borderWidthDefault: BorderWidthSemanticToken { get }
    var borderRadius: BorderRadiusSemanticToken { get }
    var colorBgDefaultPressedMono: MultipleColorSemanticToken { get }
    var spacePaddingBlock: SpaceSemanticToken { get }
}

// There is an existing provider for such tokens
open class WireframeThemeButtonComponentTokensProvider { }

// Define the components tokens exposed through the theme thanks to provider
extension WireframeThemeButtonComponentTokensProvider: ButtonComponentTokens {

    // Raw tokens can be used

    @objc open var sizeMaxHeightIconOnly: SizeSemanticToken { DimensionRawTokens._600 }
    
    // And also semantic tokens

    @objc open var borderWidthDefault: BorderWidthSemanticToken { borders.widthThicker }
    @objc open var borderRadius: BorderRadiusSemanticToken { borders.radiusMedium }
    @objc open var colorBgDefaultPressedMono: MultipleColorSemanticToken { colors.repositoryOpacityBlackHigher }
    @objc open var spacePaddingBlock: SpaceSemanticToken { spaces.paddingInlineSpacious }
}

// This provider is then exposed through MISOTheme as an AllButtonComponentTokensProvider
```

## How to use component tokens

In fact, the component tokens are declared and gathered in _Swift protocol_ so as to force any theme to implement them, and also to allow any theme to expose such properties whathever the implementation of the theme is, across providers.
Because *component tokens* have for values *raw tokens* or *semantic tokens*, and in the end for values primitive types, and all these tokens are declared with *type aliases* refering all together, you can handle a *component token* directly in your view because the final value will be used.
Thus, get the theme and call the needed property with some helpers.

```swift
struct SomeView: View {

    @Environment(\.theme) private var theme // Supposed you used in your root view the `MISOThemeableView` to register the theme
    @Environment(\.colorScheme) private var colorScheme

    var body: some View {
        Button {
            // Some action
        } label: {
            Text("Some label")
                .cornerRadius(theme.button.borderRadius)
        }
        .padding(.leading, theme.button.spacePaddingInlineChevronStartDefault)
        .padding(.trailing, theme.button.spacePaddingInlineChevronEndDefault)
        .background(theme.button.colorBgStrongEnabledMono)
        .overlay(
            RoundedRectangle(cornerRadius: theme.button.borderRadius)
                .stroke(Color.blue, lineWidth: theme.button.borderWidthDefault)
        )
    }
/*
    - The theme provides border semantic tokens "borderRadius" and "borderWidthDefault"
    - The theme provides a color semantic token "colorBgStrongEnabledMono"
    - The theme provides spaces semantic token "spacePaddingInlineChevronStart" and "spacePaddingInlineChevronEnd"
*/
}

// Do not forget in your app to use the `MISOThemeableView` for your theme, e.g. `WireframeTheme`
@main
struct DesignToolbox: App {

    var body: some Scene {
        WindowGroup {
            MISOThemeableView(theme: WireframeTheme()) {
                // Your root view
                ...
            }
        }
    }
}
```

The components tokens are wrapped in tokens provider accessible through the themes:

Components tokens provider     | Target component                          
------------------------------ | ------------------------------------- 
accordion / accordionFaq       | For accordions components
alert                          | For alert mesdsages and inline alert components like `MISOAlertMessage` and `MISOInlineAlert`
bar                            | For bars components like bottom and navigation bars
badge                          | For badges like `MISOBadgeStandard`, `MISOBadgeIcon` and `MISOBadgeCount`.
button                         | For buttons like `MISOButton` 
bulletList                     | For list of elements with bullets like `MISOBulletList`
checkbox                       | For checkboxes like `MISOCheckbox`, `MISOCheckboxItem` and their indeterminate variants 
chip                           | For chips like `MISOSuggestionChip` and `MISOFilterChip`  
divider                        | For dividers like `MISOHorizontalDivider` and `MISOVerticalDivider` 
icon                           | For components containing icons like `MISOTag`
link                           | For links like `MISOLink` 
listItem                       | Shared and used for switch, checkbox, radio items and list items layouts
pinCodeInput                   |  
quantityInput                  | 
radioButton                    | For radio components like `MISORadio` and `MISORadioItem` 
selectInput                    |
skeleton                       |
switch                         | For switch components like `MISOSwitch` and `MISOSwitchItem` 
tag                            | For tag components like `MISOTag`
inputTag                       | For input tag components like `MISOInputTag`
textArea                       | For text area components like `MISOTextArea`
textInput                      | For text field input components like `MISOTextInput`
typography                     | For textual components like `MISOText`

## Topics

### Group

- ``AccordionComponentTokens``
- ``AccordionFaqComponentTokens``
- ``AlertComponentTokens``
- ``AlertMessageComponentTokens``
- ``BarComponentTokens``
- ``BadgeComponentTokens``
- ``BulletListComponentTokens``
- ``ButtonComponentTokens``
- ``ButtonMonoComponentTokens``
- ``CategoricalTagComponentTokens``
- ``CheckboxComponentTokens``
- ``ChipComponentTokens``
- ``DividerComponentTokens``
- ``IconComponentTokens``
- ``LinkComponentTokens``
- ``LinkMonoComponentTokens``
- ``ListItemComponentTokens``
- ``PinCodeInputComponentTokens``
- ``ProgressIndicatorComponentTokens``
- ``QuantityInputComponentTokens``
- ``RadioButtonComponentTokens``
- ``SelectInputComponentTokens``
- ``SkeletonComponentTokens``
- ``SwitchComponentTokens``
- ``TagComponentTokens``
- ``ToastComponentTokens``
- ``InputTagComponentTokens``
- ``TextAreaComponentTokens``
- ``TextInputComponentTokens``
- ``TypographyComponentTokens``
