# Learning Hub

A mobile application for learning purposes with a built-in chat function to connect with everyone using the app.

## Getting Started

These instructions will guide you on how to download, install, and run the app on your Android device.

### Prerequisites

- Flutter SDK: [Installation Guide](https://flutter.dev/docs/get-started/install)
- Android Studio or VS Code with Flutter extension
- Android device or emulator

### Installation

1. Clone the repository to your local machine:

```
git clone https://github.com/TheFrenchDodo/flutter_application.git
```

Navigate to the project directory:

```
cd your-project
```

Install dependencies:

```
flutter pub get
```

### Build and Run

For Debug Mode:

```
flutter run
```

For Release Mode:

```
flutter build apk --release
```

### Install on Android Device

Ensure USB Debugging is enabled on your Android device.

Connect your Android device to your computer.

Run the following command to install the APK:

```
flutter install
```

Alternatively, you can locate the APK file in the build/app/outputs/flutter-apk directory and install it manually on your Android device.

### Usage

Any user of the application registers with an email address.
The main function is to share documents, of any type. The documents are listed by category, for the moment only "Science", "news" and "entertainment" exist, but others will appear with the possibility of searching by keyword to easily find this or that article. The concept was designed to easily communicate between teacher and student, however this is not limited to schools. Anyone can have access to it.
Sometimes a teacher may not want to share their course publicly, a password feature to access certain documents will also be deployed.
Once registered, users have access to a messaging platform to facilitate communication between them.

### Contributing

If you'd like to contribute to this project, please follow the
[Contributing Guidelines](https://github.com/TheFrenchDodo/flutter_application/blob/main/Contributing.md).

### Acknowledgments

- Flutter framework : The foundation of the project, Flutter provides a reactive framework for building natively compiled applications.
- Flutter Documentation: Official documentation for Flutter, a valuable resource.
- Flutter Localizations : Supports the localization of the app for various languages and regions.
- intl package : Provides internationalization and localization support, crucial for adapting the app to different languages.
- File picker : Enables file selection and picking functionality, allowing users to upload files.
- English words package : Used for generating English words, potentially for placeholder text or naming.
- Provider package : State management package to efficiently manage and share app state between widgets.
- HTTP package: Facilitates making HTTP requests, essential for fetching data from APIs or servers.
- Shared Preferences : Allows for persistent storage of simple data, such as user preferences.
- Firebase Auth : Provides Firebase-based user authentication, securing user access to the app.
- Firebase Core : Foundation for Firebase services, including analytics and authentication.
- YouTube Player Flutter : Integrates videos within the app, enhancing multimedia capabilities (for later implementation).
- YouTube Explode Dart : A Dart library for interacting with the YouTube API, essential for fetching YouTube video data (for later implementation).
- Firebase Firestore : A NoSQL cloud database for storing and syncing data, supporting real-time updates.
- Package Info : Retrieves information about the application package, useful for displaying app details (for later implementation).
- Path package : Provides facilities for working with file and directory paths.
- Flutter Lints : A set of lint rules for Dart to enforce best practices and style conventions.
- Flutter Launcher Icons : Simplifies the process of customizing app launcher icons for both Android and iOS.

