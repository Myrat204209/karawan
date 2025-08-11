# Karawan - Smart Home Application

A modern Flutter application built with Clean Architecture and BLoC pattern, featuring a dual-section marketplace for both store and restaurant services.

## 🏗️ Architecture Overview

### Clean Architecture Implementation
The project follows Clean Architecture principles with clear separation of concerns:

```
lib/
├── app/                    # Application layer
│   ├── core/              # Core app functionality
│   ├── router/            # Navigation configuration
│   └── view/              # Main app view
├── blocs/                 # Business Logic Components
│   ├── cart/              # Shopping cart state management
│   └── favorites/         # Favorites state management
├── features/              # Feature modules
│   ├── market/            # Store section features
│   ├── restaurant/        # Restaurant section features
│   ├── payment/           # Payment processing
│   └── profile/           # User profile management
├── repositories/          # Data access layer
└── main/                  # Application entry point
```

### State Management
- **BLoC Pattern**: Used for complex state management
- **Repository Pattern**: Data access abstraction
- **Dependency Injection**: GetIt for service locator pattern

## 🚀 Features

### Dual-Section Application
1. **Store Section** (`/store/*`)
   - Product browsing and search
   - Shopping cart management
   - Favorites system
   - User authentication
   - Profile management

2. **Restaurant Section** (`/restaurant/*`)
   - Menu browsing with infinite scroll
   - Order management
   - Favorites system
   - User profile
   - Real-time order tracking

### Core Features
- **Infinite Scrolling**: Efficient content loading with pagination
- **Local Storage**: Hive-based persistent storage for cart and favorites
- **Navigation**: GoRouter for declarative routing
- **Responsive Design**: ScreenUtil for adaptive layouts
- **Error Handling**: Comprehensive error states and retry mechanisms

## 🛠️ Technology Stack

### Core Dependencies
- **Flutter**: 3.8.1+
- **Dart**: 3.8.1+
- **flutter_bloc**: State management
- **go_router**: Navigation
- **hive_ce**: Local database
- **get_it**: Dependency injection

### UI & UX
- **flutter_screenutil**: Responsive design
- **hugeicons**: Icon library
- **carousel_slider_plus**: Image carousels
- **input_quantity**: Quantity input widgets

### Development Tools
- **talker**: Logging and debugging
- **equatable**: Value equality
- **flutter_hooks**: React-style hooks
- **flutter_secure_storage**: Secure token storage

## 📱 Project Structure

### Packages
```
packages/
├── app_ui/               # Shared UI components
│   ├── assets/           # Images, fonts, icons
│   ├── src/
│   │   ├── colors/       # Color schemes
│   │   ├── widgets/      # Reusable widgets
│   │   ├── storage/      # Local storage utilities
│   │   └── theme/        # App theming
└── data_provider/        # Data layer abstraction
    ├── api/              # HTTP client and interceptors
    ├── client/           # API clients
    ├── models/           # Data models
    └── storage/          # Storage implementations
```

### Feature Modules
Each feature follows a consistent structure:
```
feature_name/
├── bloc/                 # Business logic
├── view/                 # UI components
├── widgets/              # Feature-specific widgets
└── feature.dart          # Feature exports
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.8.1 or higher
- Dart SDK 3.8.1 or higher
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd karawan
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

### Development Setup

1. **Code Generation** (if needed)
   ```bash
   flutter packages pub run build_runner build
   ```

2. **Linting**
   ```bash
   flutter analyze
   ```

3. **Testing**
   ```bash
   flutter test
   ```

## 🏛️ Architecture Patterns

### BLoC Pattern Implementation
```dart
// Event
abstract class CartEvent extends Equatable {
  const CartEvent();
}

// State
class CartState extends Equatable {
  final Map<String, int> items;
  final CartStatus status;
  
  const CartState({
    this.items = const {},
    this.status = CartStatus.initial,
  });
}

// BLoC
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required CartRepository repository})
      : super(const CartState()) {
    on<CartInitialized>(_onInitialized);
    on<CartQuantityUpdated>(_onQuantityUpdated);
  }
}
```

### Repository Pattern
```dart
class CartRepository {
  final StorageProvider _storage;
  final AppSection _section;

  Map<String, int> getCart() => _storage.getCart(_section);
  Future<void> updateQuantity(String productId, int quantity) =>
      _storage.updateCartQuantity(productId, quantity, _section);
}
```

## 📊 State Management Flow

1. **UI Event** → User interaction triggers event
2. **BLoC Event** → Event dispatched to BLoC
3. **Repository** → BLoC calls repository method
4. **Data Source** → Repository accesses data (local/remote)
5. **State Update** → BLoC emits new state
6. **UI Update** → Widget rebuilds with new state

## 🔧 Configuration

### Environment Setup
- **Development**: Debug mode with detailed logging
- **Production**: Release mode with optimized performance
- **Testing**: Mock data and test configurations

### Storage Configuration
- **Hive**: Local database for cart and favorites
- **Secure Storage**: Token management
- **Shared Preferences**: App settings

## 🧪 Testing Strategy

### Unit Tests
- BLoC logic testing
- Repository method testing
- Utility function testing

### Widget Tests
- UI component testing
- User interaction testing
- Navigation testing

### Integration Tests
- End-to-end user flows
- Cross-feature integration

## 📈 Performance Optimizations

1. **Lazy Loading**: Infinite scroll with pagination
2. **Memory Management**: Proper disposal of controllers and listeners
3. **Image Caching**: Fast cached network images
4. **Widget Optimization**: const constructors and efficient rebuilds

## 🔒 Security Features

- **Secure Storage**: Sensitive data encryption
- **Token Management**: JWT token handling
- **Input Validation**: Form validation and sanitization
- **Error Handling**: Secure error messages

## 🌐 Internationalization

- **Multi-language Support**: Ready for localization
- **RTL Support**: Right-to-left language support
- **Cultural Adaptation**: Date, number, and currency formatting

## 📱 Platform Support

- **Android**: API level 21+
- **iOS**: iOS 11.0+
- **Web**: Progressive Web App ready
- **Desktop**: Windows, macOS, Linux support

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Follow the coding standards
4. Add tests for new features
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🆘 Support

For support and questions:
- Create an issue in the repository
- Contact the development team
- Check the documentation

---

**Built with ❤️ using Flutter and Clean Architecture**
