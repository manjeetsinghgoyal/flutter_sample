# chat

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

lib/
│
├── data/
│   ├── api/
│   │   ├── api_client.dart        # Retrofit API definitions
│   │   ├── auth_interceptor.dart  # Token based header injection
│   │   └── product_service.dart   # ApiClient + Dio setup
│   │
│   ├── db/
│   │   ├── hive_manager.dart      # Hive init + box open
│   │   ├── product_dao.dart       # DAO interface
│   │   ├── product_dao_hive.dart  # Hive implementation of DAO
│   │   └── product_dao_sqlite.dart# SQLite implementation of DAO
│   │
│   ├── models/
│   │   ├── product.dart           # Product model (Hive + JSON)
│   │   └── user.dart              # User model (for login response)
│   │
│   └── repository/
│       └── product_repository.dart # Repository (API + local cache)
│
├── ui/
│   ├── login_screen.dart          # Login UI
│   ├── product_screen.dart        # Products list UI
│   └── widgets/
│       └── product_tile.dart      # Product tile widget
│
└── main.dart                      # App entry point

