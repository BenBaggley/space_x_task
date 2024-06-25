This project uses the Space X api to display lists of rockets and ships

## Prerequisites ✅

This project requires Flutter 3.22.0 or higher, and Dart 3.4.0 or higher.

---

## FVM

The project uses [FVM](https://fvm.app/) for version management. To install the correct Flutter version for the project, just run this command in the project root:

```bash
$ fvm install
```

---

## Getting Started 🚀

To run the app either use the launch configuration in VSCode/Android Studio or use the following command:

```sh
$ fvm flutter run --target lib/main.dart
```
---

## Code Generation 🏗️

This project relies on generated code. Generators are provided by various packages and executed using `build_runner`. You can run the generators using this command:

```sh
$ fvm dart run build_runner build --delete-conflicting-outputs
```

There is also a `watch` command which will run continuously and update generated code whenever a source code file is changed.

---