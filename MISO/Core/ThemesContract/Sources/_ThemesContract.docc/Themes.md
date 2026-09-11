# Themes

@Metadata {
    @PageImage(purpose: icon, source: "ic_theme_intro")
    @PageImage(purpose: card, source: "ic_theme_intro")
}

_Themes_ are applications of specific values for _components tokens_ and _semantic tokens_ using in the end _raw tokens_.(thus final usable low level values).
A _theme_ contains any relevant tokens which can be used for components rendering.
A _theme_ can use its own assets like fonts and icons.

This framework exposes today following themes:

Theme                                                                                                      | Description                          
---------------------------------------------------------------------------------------------------------- | ------------------------------------- 
Wireframe                                                                                                   | For mockups, prototypes and prooves of concepts without any brand-flavoured styles

All themes are based on a theme contract called `MISOTheme`.

_Themes_ use *tokens providers* which provide the *semantic tokens* and *component tokens* to apply in the project. 
These tokens in most of cases can be overridden thanks to `@objc open` combination so as to make possible to override these values in extensions (thanks to `@objc`) and from objects outside the module (thanks to `open`). 
Thus we can split values and responsabilities in different _Swift Package Manager_ targets and keep overriding and inheritance possible.

> Important: It is possible to subclass an existing theme, or to build its own theme from scratch.

## Architecture

A theme is a *Swift class* which several tokens providers providing their own definition of tokens. 

We choose to pack all semantic tokens in protocols, so as to force any theme to manage them through tokens providers. Because Swift does not have notions of abstract classes compared to Kotlin, the `MISOTheme` which can be considered like an almost-abstract class.
Then, a white label theme may just inherit from this class and override the tokens it needs. A concrete example is the `WireframeTheme`, providing in its module its own colors and overriding some tokens with the suitable values.

Themes can be able to override semantic tokens and components tokens, and use its own raw or semantic tokens without sharing them to other themes. The existing raw tokens, shared between all themes, are not overridable because their definitions are frozen.

A theme can use its own tokens providers, implemented from scratch or by inheriting from existing tokens providers.

## Use themeable view

```swift
// Add themeable view to your root view to use the WireframeTheme
MISOThemeableView(theme: WireframeTheme()) {
    YourRootView()
}

// Or use your custom theme if you want
MISOThemeableView(theme: YourCustomTheme()) {
    YourRootView()
}
```

## Theme tuning

### Tunable themes or not

A theme can be made tunable so as to be more flexible and adapt to different contexts or constraints.
By default, the `WireframeTheme` is not tuned.

> Note: Tuning represents the group of "flexibility points" a theme can expose to tailor and customize itself for particular contexts.

### Tuned values

If your theme supports tuning, define the elements which can be tuned and provide predefined tunings if relevant.

### Tuning usages

The tuning to apply must be done at theme init, for a theme that supports it, for example:

```swift
    // Define your theme tuning with for example only rounded corners for buttons
    let tuning = Tuning(hasRoundedButtons: true)

    // Apply it to your theme
    let theme = YourAppTheme(tuning: tuning)
    // Or in one line
    let theme = YourAppTheme(tuning: Tuning(hasRoundedButtons: true))
```

## Define a custom theme if needed

You will have to create a _Swift class_ which will inherit from an existing theme like `WireframeTheme` (if you need its assets and resources) or from `MISOTheme` directly.
You can see `WireframeTheme` as more specified and less abstract as `MISOTheme` which is the base of all themes.
We do not recommend to use directly the `MISOTheme` as is, but you can of course, you just will have to add your own tokens providers or pick existing ones.

Then, you should override the _semantic tokens_ and _components tokens_ you want using the providers; we recommend to use _Swift extensions_ for clarity reasons. You can use existing tokens providers or override them.

If your theme needs to define its own _raw tokens_, you can also define them using a `enum` and the _raw tokens types_.

### By subclassing

You may want to define your own theme, thus you can override an existing theme like `WireframeTheme` with your own class or just override the providers.
For clarity reasons maybe you should define your own class inheriting from `WireframeTheme`, or, more difficult, from `MISOTheme` but we do not recommand that.

You must consider the tokens provider you need (to inherit from for overriding, or to use as is):
- spaces tokens are `WireframeThemeSpaceSemanticTokensProvider`
- sizes tokens are in `WireframeThemeSizeSemanticTokensProvider`
- colors tokens are all defined in `WireframeThemeColorSemanticTokensProvider`
- borders tokens are in `WireframeThemeBorderSemanticTokensProvider`
- elevations tokens are in `WireframeThemeElevationSemanticTokensProvider`
- opacity tokens are in `WireframeThemeOpacitySemanticTokensProvider`
- grid tokens are in `WireframeThemeGridSemanticTokensProvider`
- font tokens are in `WireframeThemeFontSemanticTokensProvider`
- and same logic for component tokens

Find below some example

```swift
// Token provider for spaces

class YourAppThemeSpaceTokensProvider: WireframeThemeSpaceSemanticTokensProvider {
    override var fixedMedium: SpaceSemanticToken {
        DimensionRawTokens._400
    }
    override var scaledSmall: MultipleSpaceSemanticToken {
        MultipleSpaceSemanticToken(compact: fixed5xl, regular: fixed5xl)
    }
}

// Token provider for sizes

class YourAppThemeSizeTokensProvider: WireframeThemeSizeSemanticTokensProvider {
    override var iconDecorative2xl: SizeSemanticToken {
        DimensionRawTokens._300
    }
    override var iconDecorativeMd: SizeSemanticToken {
        DimensionRawTokens._900
    }
}

// Token provider for colors

class YourAppThemeColorTokensProvider: WireframeThemeColorSemanticTokensProvider {
    override var bgSecondary: MultipleColorSemanticToken {
        MultipleColorSemanticToken(light: ColorRawTokens.colorDecorativeAmber500, dark: WireframeBrandColorRawTokens.royalBlue300)
    }
    override var actionEnabled: MultipleColorSemanticToken {
        MultipleColorSemanticToken(light: ColorRawTokens.colorDecorativeShockingPink100, dark: ColorRawTokens.functionalScarlet600)
    }
}

// Token provider for border

class YourAppThemeBorderTokensProvider: WireframeThemeBorderSemanticTokensProvider {
    override var styleDefault: BorderStyleSemanticToken {
        BorderRawTokens.styleDashed
    }
    override var widthw: BorderWidthSemanticToken {
        BorderRawTokens.width100
    }
    override var radiusLarge: BorderRadiusSemanticToken {
        BorderRawTokens.radius800
    }
}

// Token provider for elevation

class YourAppThemeElevationTokensProvider: WireframeThemeElevationSemanticTokensProvider {
    override var stickyEmphasized: ElevationCompositeSemanticToken {
        ElevationCompositeSemanticToken(ElevationRawTokens.bottom_4_600)
    }
}

// Token provider for opacity

class YourAppThemeOpacityTokensProvider: WireframeThemeOpacitySemanticTokensProvider {
    override var strong: OpacitySemanticToken {
        OpacityRawTokens._920
    }
}

// Token provider for grid

class YourAppThemeGridTokensProvider: WireframeThemeGridSemanticTokensProvider {
    override var extraCompactColumnGap: GridSemanticToken {
        GridRawTokens.columnGap200
    }
    override var compactColumnGap: GridSemanticToken {
        GridRawTokens.columnGap200
    }
    override var regularColumnGap: GridSemanticToken {
        GridRawTokens.columnGap200
    }
}

// Token provider for font

class YourAppThemeFontTokensProvider: WireframeThemeFontSemanticTokensProvider {
    override var displayLarge: MultipleFontCompositeSemanticToken { 
        MultipleFontCompositeSemanticToken(FontCompositeSemanticToken(
            size: sizeDisplayLargeMobile,
            lineHeight: lineHeightDisplayLargeMobile,
            weight: weightDisplay,
            letterSpacing: letterSpacingDisplayLargeMobile))) 
    }
}
```

You can instead of overriding existing semantic tokens provider implement your own provider but it will imply to implement maybe hundreds of tokens. Your own provider must match the suitable signature.

Then define your own theme class and assign the providers. You can just use some custom providers and leave the others as they are.

```swift
import MISOThemesWireframe // To get WireframeTheme

// Define your theme
class YourAppTheme: WireframeTheme {
    
    override init() {
        super.init(colors: YourAppThemeColorTokensProvider(),
                   borders: YourAppThemeBorderTokensProvider(),
                   elevations: YourAppThemeElevationTokensProvider(),
                   fonts: YourAppThemeFontTokensProvider(),
                   grids: YourAppThemeGridTokensProvider(),
                   opacities: YourAppThemeOpacityTokensProvider(),
                   sizes: YourAppThemeSizeTokensProvider(),
                   spaces: YourAppThemeSpaceTokensProvider(),
                   button: YourAppThemeButtonComponentTokensProvider,
                
                    Etc...)
    }
}
```

Finaly for your app root view:

```swift
struct MyAppRootView: View {

    var body: some View {
        MISOThemeableView(theme: YourAppTheme()) {
            // ...
        }
    }
}
```

You can define your own set of raw tokens, and asign them in the semantic tokens you override as values, for example:

```swift
public typealias MyOwnFontRawTokens = FontRawTokens // Refer to type FontRawTokens for consistency, declared in MISOTokensRaw

public enum MyOwnFontRawTokens {
    public static let someFontBody: MyOwnFontRawTokens = "Arial"
}
```

All components the MISO library provides are based on themes, handle through the abstract `MISOTheme`, exposing *semantic tokens*, defined by *raw tokens* assigned to usable final values.
In few words, if you want to change the look and feel for the MISO components you use, you will have to override the matching *semantic tokens* or *component tokens*, but it will bring side effects as these *semantic tokens* are shared accross several components.

You are also able to define your *components tokens* and your *semantic tokens* used by them.
