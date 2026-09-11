# Getting Started with MISO

@Metadata {
    @PageImage(purpose: icon, source: "ic_unified_ds")
    @PageImage(purpose: card, source: "ic_unified_ds")
}

How to add the package as dependency, import libraries and use theme and components for your apps.

## Integrate MISO

### Use Swift Package Manager

If you want to add the iOS library of *MISO*, you need to add our _Swift Package_ into your project.
To do that, add a new _package dependency_ to your _Xcode_ project by refering to it by `github.com/Orange-OpenSource/miso-ios`.
You are free to choose whether or not you want a branch or a specific tag, pick the solution you want.

You can [refer to the wiki](https://github.com/Orange-OpenSource/miso-ios/wiki/50-%E2%80%90-About-versions,-releases-and-builds) for more details about versions, releases and tags. You can find release tags (e.g. *1.0.0*) and release candidates tags (e.g. *1.0.0-rc3*).

### Import the libraries you need

You should use one (or several) of the following imports for your needs, which are basically _Swift Package_ products.

> Tip: We recommend to embed in your apps only the ones you need to avoid to embed useless assets.

```swift
import MISOThemesContract // If you want to define your theme, use themes or MISOThemeableView
import MISOModules // To use modules
import MISOComponents // To use components
import MISOThemesWireframe // To use the Wireframe theme
import MISOTokensComponent // If you need to override or use directly components tokens
import MISOTokenSemantic // If you need to override or use directly semantic tokens
import MISOTokensRaw // If you need to override or use directly raw tokens
import MISOFoundations // For some utilities
```

### Or more simple, import umbrella library

> Note: We do not recommend this solution because from our point of view use of tailored imports is better to import only the needed elements.
> use of umbrella products can increase app sizes and needed storage because it emebds plenty of assets (images, fonts, etc.)
> and useless constants.

Import the _Swift Package_ product which suits your needs:

Umbrella                  | Description                          
------------------------- | ------------------------------------- 
MISOSwiftUI               | All libraries listed above and the Wireframe theme
MISOSwiftUIWireframe      | All libraries listed above but with only Wireframe theme

### Chose your theme

The *MISO* framework provides today one theme:

Theme                     | Description                          
------------------------- | ------------------------------------- 
Wireframe                 | For mockups, prototypes and prooves of concepts without any brand-flavoured styles

### Apply a theme

@Row {
        @Column {
            You will need to use for your application root view the `MISOThemeableView`.
            This special view is here to define some elements as environment variables and injects the choosen theme.
        }
        @Column {
            ```swift
            @main
            struct YourApp: App {
                var body: some Scene {
                   WindowGroup {
                      MISOThemeableView(theme: WireframeTheme()) {
                            // Your root view
                      }
                   }
                }
            }
            ```
        }
}

@Row {
    @Column {
        Then get the current applied theme in your views and use the tokens you want.
        The tokens are wrapped in providers with clear names, you only need to choose the ones you want.        
    }
    @Column {
        ```swift
        // Use it in views as an environment variable
        @Environment(\.theme) var theme
        ```
    }
}

> Tip: Keep in mind only one theme can be used within one `MISOThemeableView`.

### Trick for Xcode Preview

If you use Xcode `#Preview` blocks, you will have to be sure the theme is instanciated and injected through the `MISOThemeableView`.
Because it is not possible today to override the legit `#Preview` block, you can instead use some of our utilities to wrap your content
inside the `MISOThemeableView` automatically. These utilities come with the themes modules. Without them you may face errors about undefined theme.

```swift
// Apply Wireframe theme
#Preview {
    SampleView()
        .wireframePreview()
}
```
