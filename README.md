# nonstopioassignment - Flutter Project

This is a Flutter project named "nonstopioassignment," created with the intention of serving as a template for your own Flutter application. It is designed to provide a structure that includes some commonly used packages and settings to kickstart your development process. Below, you'll find information about the project's dependencies, development environment, and any additional notes that may be useful.

## Getting Started

To get started with this project, make sure you have Flutter installed on your system. If you don't have it installed, follow the official [Flutter installation guide](https://flutter.dev/docs/get-started/install) to set up your development environment.

## Project Structure

The project follows the standard Flutter project structure, with the following important directories:

- `lib/`: Contains the main Dart code for your application.
- `assets/`: Includes image and font assets.
- `test/`: Contains unit tests for your code.

## Pubspec.yaml

Here's an overview of the project's `pubspec.yaml` file:

```yaml
name: nonstopioassignment
description: A new Flutter project.
publish_to: 'none'
version: 1.0.0+1
environment:
  sdk: '>=3.1.3 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  flutter_bloc: ^8.1.3
  dio: ^5.3.3
  go_router: ^12.0.1
  flutter_svg: ^2.0.9
  flutter_animate: ^4.2.0+1
  firebase_core: ^2.21.0
  dartz: ^0.10.1
  firebase_auth: ^4.12.1
  get_it: ^7.6.4
  cached_network_image: ^3.3.0
  flutter_test:
    sdk: flutter
  mockito: ^5.4.2
  bloc_test: ^9.1.5
  equatable: ^2.0.5

dev_dependencies:
  build_runner: ^2.4.6
  flutter_lints: ^2.0.0

flutter:
  uses-material-design: true
  assets:
    - assets/images/pngs/
    - assets/images/svgs/
  fonts:
    - family: SFProTextFontFamily
      fonts:
        - asset: assets/fonts/SF-Pro-Text-Regular.otf
```

## Dependencies

The project includes various dependencies to help you get started with common Flutter development tasks. Notable packages include:

- **flutter_bloc**: State management library for Flutter.
- **dio**: A powerful HTTP client for making API requests.
- **go_router**: A declarative router for Flutter applications.
- **firebase_core** and **firebase_auth**: Firebase authentication support.
- **get_it**: A simple service locator for Flutter.
- **cached_network_image**: Caching and displaying network images.
- **flutter_test**, **mockito**, and **bloc_test**: Useful for testing your application.
- **equatable**: Simplifies equality comparisons for Dart objects.

## Assets

The `assets/` directory contains images and fonts used in the project. You can expand this directory to include additional assets as needed.

## Fonts

The project includes the "SF-Pro-Text-Regular.otf" font asset with the family name "SFProTextFontFamily." You can replace this font with your custom fonts or add more fonts to suit your design.

## Running the Project

To run the project on your local development environment, use the following command:

```bash
flutter run
```

## Steps to run the test cases

To run the test cases, use the following command:

```bash
flutter test
```

To run specific test files:

```bash
flutter test test/file_name_test.dart
```

Then, run the tests with coverage by running:

```bash
flutter test --coverage
```

https://github.com/sanath-coditas/nsio/assets/111436488/e107c2f4-d6e0-4574-88ea-1f27fb627fd7


