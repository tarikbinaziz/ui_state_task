# ui_state_task

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


# Mvvm Architecture

lib/
│── main.dart
│── models/                # Data models
│   ├── course_model.dart
│── repositories/          # Handles data fetching
│   ├── course_repository.dart
│── viewmodels/            # Manages state with Riverpod
│   ├── course_viewmodel.dart
│── views/                 # UI Screens
│   ├── search_screen.dart
│   ├── details_screen.dart
│── utils/                 # Utility classes
│   ├── debouncer.dart
├── assets/
│   ├── universities.json   # Mock database
