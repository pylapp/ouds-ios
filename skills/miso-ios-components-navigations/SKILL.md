---
name: miso-ios-components-navigations
description: Usage and code examples for MISO iOS Navigations components — MISOLink (text, indicator, icon, size), MISOTabBar (iOS 15–25 and iOS 26+ APIs) and Toolbars (toolBarTop / toolBarBottom + MISOToolBarItem with back / close / icon / label / badge / prominent style). Load the miso-ios-framework-usage skill first for imports, themes and image rules.
license: MIT
---

# MISO Navigations components

> Prerequisite: load `miso-ios-framework-usage` first for imports, themes and image rules
> (`MISOImage`, `// swiftlint:disable:next accessibility_label_for_image`).

## Link

```swift
MISOLink(text: "Text", size: .default) {}
MISOLink(text: "Text", indicator: .back, size: .default) {}
MISOLink(text: "Text", icon: MISOImage(asset: Image("ic")), size: .default) {}
MISOLink(text: "Text", icon: MISOImage(asset: Image("ic"), renderingMode: .original), size: .default) {} // raw image (not tinted)
```

---

## Tab Bar

> Never combine with `MISOToolBarBottom` on the same screen.

```swift
// iOS 15–25
@State private var selectedTab = 0
MISOTabBar(selectedTab: $selectedTab, count: 3) {
    SomeView().tabItem { Label("Tab 1", image: "ic_1") }.tag(0)
    OtherView().tabItem { Label("Tab 2", image: "ic_2") }.tag(1)
}

// iOS 26+
MISOTabBar {
    SomeView().tabItem { Label("Tab 1", image: "ic_1") }
    OtherView().tabItem { Label("Tab 2", image: "ic_2") }
}
```

> Tab bar images: 26×26 pt. `MISOTabBar(selected:count:content:)` (plain `Int`) is deprecated — use `selectedTab: Binding<Int>`.

---

## Toolbars

> Availability: iOS 15+, visionOS 1+. Not available on watchOS, tvOS, macOS.

**Setup (top toolbar):**
- Must be inside `NavigationStack`.
- Call `.misoNavigationBarAppearance()` once on the root `NavigationStack`.
- On iOS ≤ 18: add `.accentColor(theme.colors.contentDefault)` on root view for the back chevron.
- `subtitle` rendered on iOS 26+ only; ignored when `hasLargeTitle: true`.
- `principalItem` (at most one item, center position): when set, `subtitle` is **never** displayed (whatever `hasLargeTitle` is —
  `.principal` only replaces the inline bar title, not `.navigationSubtitle()` on iOS 26+); `title` is displayed only if
  `hasLargeTitle: true` (shown below the bar, large mode — never inside the bar next to `principalItem`).

**Setup (bottom toolbar):**
- Never combine with `MISOTabBar` on the same screen.
- `groupedItems` layout meaningful on iOS 26+ only.

```swift
// Top — minimal
NavigationStack {
    ContentView().toolBarTop("Title")
}

// Top — with items
NavigationStack {
    ContentView()
        .toolBarTop("Title",
            leadingItems: { MISOToolBarItem(navigation: .back()) },
            principalItem: MISOToolBarItem(icon: Image("ic_search"), accessibilityLabel: "Search") {},
            trailingItems: {
                MISOToolBarItem(icon: Image("ic_settings"), accessibilityLabel: "Settings") {}
            })
}

// Top — principalItem + hasLargeTitle: title shown below the bar (large mode), subtitle never shown
ContentView()
    .toolBarTop("Title", hasLargeTitle: true, subtitle: "Never shown",
        principalItem: MISOToolBarItem(icon: Image("ic_search"), accessibilityLabel: "Search") {})

// Top — principalItem without hasLargeTitle: neither title nor subtitle shown
ContentView()
    .toolBarTop("Title", principalItem: MISOToolBarItem(icon: Image("ic_search"), accessibilityLabel: "Search") {})

// Top — large title + subtitle (subtitle iOS 26+ only)
ContentView().toolBarTop("Title", hasLargeTitle: true, subtitle: "Sub")

// Bottom — leading/trailing split
ContentView()
    .toolBarBottom(
        leadingItems: { MISOToolBarItem(label: "Edit") {} },
        trailingItems: { MISOToolBarItem(icon: Image("ic_share"), accessibilityLabel: "Share") {} })

// Bottom — grouped (iOS 26+ only)
ContentView()
    .toolBarBottom(groupedItems: {
        MISOToolBarItem(label: "Save") {}
        MISOToolBarItem(icon: Image("ic_delete"), accessibilityLabel: "Delete") {}
    })
```

**`MISOToolBarItem` reference:**

```swift
MISOToolBarItem(label: "Edit") {}                              // text action
MISOToolBarItem(icon: Image("ic"), accessibilityLabel: "X") {} // icon action
MISOToolBarItem(navigation: .back())                           // back — auto dismiss
MISOToolBarItem(navigation: .back(label: "Cancel"))            // back with label (ignored iOS 26+)
MISOToolBarItem(navigation: .back(label: "Back") { saveDraft() }) // back + custom action
MISOToolBarItem(navigation: .close)                            // close — NO closure, auto dismiss

// Badge on icon (v2.0.0+) — icon actions only
MISOToolBarItem(action: .icon(asset: Image("ic_bell"), accessibilityLabel: "Notif",
                              badgeType: .standard))
MISOToolBarItem(action: .icon(asset: Image("ic_mail"), accessibilityLabel: "Mail",
                              badgeType: .number(count: 9)))

// Action style — iOS 26+ only
if #available(iOS 26, *) {
    MISOToolBarItem(action: .label("Save", emphasized: false, accessibilityHint: nil) {},
                    style: .prominent)  // .default | .prominent | .tinted
}

// Custom view
MISOToolBarItem { Menu("More") { Button("Option 1") {} } }

// Conditional (result-builder syntax)
.toolBarTop("Title", principalItem: showSearch ? MISOToolBarItem(icon: Image("ic_search"), accessibilityLabel: "Search") { showSearch = false } : nil, trailingItems: {
    if isEditing {
        MISOToolBarItem(label: "Done") { isEditing = false }
    } else {
        MISOToolBarItem(label: "Edit") { isEditing = true }
    }
})
```

> Badge rendering: iOS ≤ 25 → `MISOBadge`; iOS 26+ top → native system badge; iOS 26+ bottom → `MISOBadge` forced.

---

## List Items

### Common Patterns

**Shared types:**

| Type | Purpose |
|------|---------|
| `MISOListItemData` | Textual data: label, description, overline, extraLabel, helperText, textSlot, bottomSlot |
| `MISOListItemLeading` | Leading element: icon, image, flag, avatar, custom view |
| `MISOListItemTrailing` | Trailing element: text, badge, tag, icon, image, flag, avatar, custom view |

> `.custom { ... }` accepts any `@ViewBuilder` content (e.g. `MISOCircularProgressIndicator`, custom control). Unlike `.flag`/`.avatar`,
> it is **not** auto-hidden from accessibility — the custom view must carry its own accessibility label/value.

**Shared view modifiers:**

```swift
.misoListItemSize(.standard)   // or .small
.misoListItemContainerAlignment(.center)  // or .top
.misoListItemStyle(divider: true, background: false)
.misoListCardStyle(.outlined())
.misoListItemRoundedMedia(true)
```

---

### Static List Item

```swift
// Minimal
MISOStaticListItem(data: MISOListItemData(label: "Label"))

// Full textual content
MISOStaticListItem(data: MISOListItemData(
    label: "Label",
    description: "Description",
    overline: "Overline",
    extraLabel: "Extra"
))

// With leading icon
MISOStaticListItem(
    data: MISOListItemData(label: "Info"),
    leading: .icon(MISOListItemIcon(status: .info, description: "", size: .medium))
)

// With trailing badge
MISOStaticListItem(
    data: MISOListItemData(label: "Notifications"),
    trailing: .badge(.count(.init(3, accessibilityLabel: "3", status: .negative, size: .medium)))
)

// With avatar + tag
MISOStaticListItem(
    data: MISOListItemData(label: "Profile"),
    leading: .avatar(MISOListItemAvatar(type: .icon, size: .medium, accessibilityLabel: "")),
    trailing: .tag(MISOTag(label: "New", size: .small))
)

// With trailing text
MISOStaticListItem(
    data: MISOListItemData(label: "Status"),
    trailing: .text(.labelMuted("Active"))
)

// With flag
MISOStaticListItem(
    data: MISOListItemData(label: "Country"),
    leading: .flag(MISOListItemFlag(asset: Image("flag_fr"), description: "France"))
)

// With slot (view under texts, before helper text)
MISOStaticListItem(
    data: MISOListItemData(label: "With slot", textSlot: .init { Text("Additional content") })
)

// With bottomSlot (view under main content, before helper text)
MISOStaticListItem(
    data: MISOListItemData(label: "With bottom slot", bottomSlot: .init { Text("Bottom content") })
)

// With both slot and bottomSlot
MISOStaticListItem(
    data: MISOListItemData(
        label: "Label",
        textSlot: { Text("Slot content") },
        bottomSlot: { Text("Bottom content") },
        helperText: "Helper text"
    )
)

// With a custom view in leading/trailing (e.g. a gauge for a remaining SMS credit)
MISOStaticListItem(
    data: MISOListItemData(label: "SMS credit"),
    trailing: .custom {
        MISOCircularProgressIndicator(progress: 0.75)
    }
)
```

---

### Navigation List Item

```swift
// Forward navigation (default)
MISONavigationListItem(data: MISOListItemData(label: "Next")) {
    // action
}

// Backward navigation
MISONavigationListItem(data: MISOListItemData(label: "Back"), indicatorType: .previous) {
    // action
}

// External navigation
MISONavigationListItem(data: MISOListItemData(label: "Website"), indicatorType: .external) {
    openURL(url)
}

// With leading/trailing
MISONavigationListItem(
    data: MISOListItemData(label: "Profile", description: "View details"),
    leading: .avatar(MISOListItemAvatar(type: .initials("JD"), size: .medium)),
    trailing: .text(.labelMuted("Details"))
) {
    // navigate
}

// With slot (view under texts, before helper text)
MISONavigationListItem(
    data: MISOListItemData(label: "Settings", textSlot: .init { Text("Configure options") })
) {
    // navigate
}

// With bottomSlot (view under main content, before helper text)
MISONavigationListItem(
    data: MISOListItemData(label: "Profile", bottomSlot: .init { Text("Additional info") })
) {
    // navigate
}

// With both slot and bottomSlot
MISONavigationListItem(
    data: MISOListItemData(
        label: "Settings",
        textSlot: .init { Text("Slot content") },
        bottomSlot: .init { Text("Bottom content") },
        helperText: "Helper text"
    )
) {
    // navigate
}

// With a custom view in leading/trailing (e.g. a gauge for a remaining SMS credit)
MISONavigationListItem(
    data: MISOListItemData(label: "SMS credit"),
    trailing: .custom {
        MISOCircularProgressIndicator(progress: 0.75)
    }
) {
    // navigate to SMS credit details
}

// With external link + badge
MISONavigationListItem(
    data: MISOListItemData(label: "Documentation"),
    indicatorType: .external,
    trailing: .badge(.standard(.init(accessibilityLabel: "New", status: .accent, size: .small)))
) {
    openURL(url)
}
```

---

### Associated Types — Icon

```swift
// Status icons
MISOListItemIcon(status: .info, description: "", size: .medium)
MISOListItemIcon(status: .warning, description: "", size: .large)
MISOListItemIcon(status: .negative, description: "", size: .medium)
MISOListItemIcon(status: .positive, description: "", size: .medium)

// Custom neutral icon
MISOListItemIcon(status: .neutral(asset: Image("ic"), description: "Label"), size: .medium)

// Custom neutral icon with notification badge
MISOListItemIcon(status: .neutral(asset: Image("ic"), description: "Label", badge: true), size: .medium)
```

---

### Associated Types — Avatar

```swift
// Avatar types
MISOListItemAvatar(type: .icon, size: .medium)
MISOListItemAvatar(type: .image(Image("photo")), size: .large)
MISOListItemAvatar(type: .initials("AB"), size: .extraLarge)

// Avatar with badge
MISOListItemAvatar(
    type: .icon,
    size: .medium,
    badgeType: .standard(.init(accessibilityLabel: "Online", status: .positive, size: .small))
)

MISOListItemAvatar(
    type: .initials("JD"),
    size: .large,
    badgeType: .icon(.init(status: .negative, accessibilityLabel: "Offline", size: .small))
)
```

---

### Associated Types — Image & Flag

```swift
// Image (static)
MISOListItemImage(asset: Image("photo"), size: .medium)
MISOListItemImage(asset: Image("photo"), size: .large)

// Image (async from URL)
MISOListItemImage(asyncImage: AsyncImage(url: URL(string: "https://example.com/photo.png")), description: "Photo", size: .medium)

// Image (async from URL with MISOAsyncImage — cached)
MISOListItemImage(
    asyncImage: MISOAsyncImage(url: URL(string: "https://example.com/photo.png")),
    description: "Photo",
    size: .medium
)

// Image (async with custom content/placeholder)
MISOListItemImage(
    asyncImage: AsyncImage(url: URL(string: "https://example.com/photo.png")) { image in
        image.resizable()
    } placeholder: {
        ProgressView()
    },
    description: "Photo",
    size: .medium
)

// Flag
MISOListItemFlag(asset: Image("flag_fr"), description: "France")
MISOListItemFlag(asset: Image("flag_us"), description: "USA")
```
