# HRMS App - Flutter GetX Project

A Human Resource Management System (HRMS) built with Flutter using GetX for state management.

## Project Structure

```
lib/
├── app/
│   ├── core/
│   │   ├── constants/
│   │   │   └── app_constants.dart      # App-wide constants
│   │   ├── theme/
│   │   │   ├── app_colors.dart         # Color definitions
│   │   │   ├── app_text_styles.dart    # Text style definitions
│   │   │   └── app_theme.dart          # Main theme configuration
│   │   └── utils/
│   │       └── app_utils.dart          # Utility functions
│   ├── data/
│   │   ├── models/
│   │   │   └── user_model.dart         # Data models
│   │   ├── repositories/               # Data repositories
│   │   └── services/                   # API services
│   ├── global_widgets/
│   │   └── custom_button.dart          # Reusable widgets
│   ├── modules/
│   │   ├── auth/
│   │   │   ├── login_controller.dart
│   │   │   ├── login_binding.dart
│   │   │   ├── login_view.dart
│   │   │   ├── register_controller.dart
│   │   │   ├── register_binding.dart
│   │   │   └── register_view.dart
│   │   ├── home/
│   │   │   ├── home_controller.dart
│   │   │   ├── home_binding.dart
│   │   │   └── home_view.dart
│   │   ├── onboarding/
│   │   │   ├── onboarding_controller.dart
│   │   │   ├── onboarding_binding.dart
│   │   │   └── onboarding_view.dart
│   │   └── profile/
│   │       ├── profile_controller.dart
│   │       ├── profile_binding.dart
│   │       └── profile_view.dart
│   └── routes/
│       ├── app_pages.dart              # GetX route configuration
│       └── app_routes.dart             # Route constants
└── main.dart                           # App entry point
```

## Features

### Implemented
- ✅ GetX State Management setup
- ✅ Clean Architecture structure
- ✅ Theme system with custom colors based on design
- ✅ Onboarding screen with role selection (HR/Employee)
- ✅ Authentication (Login/Register)
- ✅ Home dashboard with role-based navigation
- ✅ Profile management
- ✅ Responsive design
- ✅ Custom widgets and utilities

### Design Theme
- **Primary Color**: Green (#7DB442) - Based on the logo in the design
- **Typography**: Clean, modern font hierarchy
- **Components**: Material Design 3 with custom styling
- **Layout**: Card-based interface with proper spacing

### User Roles
1. **HR**: Access to employee management, attendance, leave management, payroll
2. **Employee**: Access to personal attendance, leave requests, payslips, profile

## Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / VS Code
- Emulator or physical device

### Installation

1. Clone the repository
```bash
git clone <repository-url>
cd hrms_app
```

2. Install dependencies
```bash
flutter pub get
```

3. Run the app
```bash
flutter run
```

## Dependencies

- **get**: ^4.6.6 - State management and navigation
- **http**: ^1.2.0 - HTTP requests
- **shared_preferences**: ^2.2.2 - Local storage
- **cached_network_image**: ^3.3.1 - Image caching

## Architecture

This project follows Clean Architecture principles with GetX:

- **Controllers**: Business logic and state management
- **Views**: UI components
- **Bindings**: Dependency injection
- **Models**: Data structures
- **Services**: External API communication
- **Repositories**: Data access layer

## Navigation Flow

1. **Onboarding** → Role selection (HR/Employee)
2. **Authentication** → Login/Register
3. **Main App** → Role-based dashboard
4. **Features** → Based on user role and permissions

## Customization

### Adding New Features
1. Create module folder in `lib/app/modules/`
2. Add controller, binding, and view files
3. Register routes in `app_routes.dart` and `app_pages.dart`
4. Update navigation in relevant controllers

### Theming
- Modify colors in `app_colors.dart`
- Update text styles in `app_text_styles.dart`
- Adjust theme in `app_theme.dart`

## Contributing

1. Fork the project
2. Create feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open Pull Request

## License

This project is licensed under the MIT License.
