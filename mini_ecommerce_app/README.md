# Mini Mart — Mini E-commerce Flutter App

A small, fully-functional mock e-commerce app built with Flutter for the CyphLab Flutter Developer Intern practical task. All data is local/mock — there is no backend.

## Features

**Required**
- Splash screen with a brand animation, followed by a mock login screen (any email containing `@` and a password of 4+ characters logs you in — no real auth/backend).
- Product home screen — responsive grid of products with image, name, price, and star rating.
- Product details screen — image, name, price, description, rating, quantity selector, and an animated "Add to Cart" button.
- Cart screen — quantity increase/decrease, remove item (swipe or button), live total price, and checkout.
- Profile / Orders screen — static profile card, dark mode toggle, and order history (seeded with mock orders, plus any orders placed via checkout).

**Bonus**
- 🔎 Product search (by name) and category filter chips on the home screen.
- 🌓 Dark mode, toggleable from the home app bar or the Profile screen.
- 💾 Local persistence via `shared_preferences` — cart contents, theme choice, and order history all survive an app restart.
- ✨ Animations — Hero image transitions between the product grid and details screen, a tap-feedback animation on "Add to Cart", an animated cart badge, and fade transitions for splash/login.
- 📱 Responsive layout — the product grid adapts from 2 columns (phone) up to 4 columns (tablet/wide screens) using `LayoutBuilder`.
- 🧾 Clean, incremental Git commit history (see `git log`).
- 📦 Release APK build.

## Tech stack

- **Flutter** (Dart 3.8, Material 3)
- **State management:** [`provider`](https://pub.dev/packages/provider) — `CartProvider`, `ThemeProvider`, `OrdersProvider`
- **Persistence:** [`shared_preferences`](https://pub.dev/packages/shared_preferences)
- **Formatting:** [`intl`](https://pub.dev/packages/intl) for currency display

## Project structure

```
lib/
  main.dart                  # entry point, provider setup
  app.dart                   # MaterialApp, theme wiring
  models/                    # Product, CartItem, Order
  data/                      # mock product catalog
  providers/                 # CartProvider, ThemeProvider, OrdersProvider
  screens/
    splash_screen.dart
    login_screen.dart
    main_screen.dart         # bottom navigation shell
    home/                    # product grid, search, category filter
    product_details/
    cart/
    profile/
  widgets/                   # shared widgets (rating stars, cart badge)
  utils/                     # currency formatter, app theme
```

## Getting started

1. Install [Flutter](https://docs.flutter.dev/get-started/install) (3.32+ recommended) and run `flutter doctor` to confirm your setup.
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Run the app on a connected device/emulator or Chrome:
   ```bash
   flutter run
   ```
4. Run the tests:
   ```bash
   flutter test
   ```
5. Build a release APK:
   ```bash
   flutter build apk --release
   ```
   The APK is output to `build/app/outputs/flutter-apk/app-release.apk`.

## AI tool usage disclosure

This project was developed with assistance from AI tools (ChatGPT and Claude) for brainstorming, UI/UX suggestions, debugging, code optimization, and documentation. AI was also used to help resolve technical issues encountered during development.
