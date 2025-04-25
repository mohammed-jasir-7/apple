# 📱 Apple

Apple is a Flutter-based application designed to display iPhone product listings with advanced UI components, Google authentication, and PDF generation for product details. This app follows **Clean Architecture**, ensuring modularity, scalability, and maintainability.

---

## 🔑 Key Features

- ✅ **Google Sign-In** – Secure authentication using Firebase OAuth  
- ✅ **Fetch iPhone Products** – Displays product listings from a mock API  
- ✅ **Product Detail Page** – Carousel images, specifications, and descriptions  
- ✅ **Generate PDF** – Users can download iPhone specifications as PDFs  
- ✅ **Downloaded PDFs Tab** – Stores PDFs locally with listing functionality  
- ✅ **Dark/Light Mode** – Toggle between themes  
- ✅ **Search & Filters** – Enhance product discoverability  
- ✅ **Pull-to-Refresh** – Refresh product listings dynamically  
- ✅ **PDF Sharing** – Allows users to share product details easily  

---

## 📂 Project Structure

This app follows **Clean Architecture**, maintaining separation of concerns for UI, business logic, and data handling.

```
lib/
├── core/
│   └── connection/            # Network utilities & shared resources
├── features/
│   ├── authentication/        # Google Sign-In
│   │   ├── presentation/      # UI layer (Bloc, Pages, Widgets)
│   │   ├── domain/            # Business & domain logic
│   │   └── data/              # API calls & data sources
│   ├── products/              # Product listing and details
│   ├── pdf_generation/        # PDF creation & storage
│   ├── themes/                # Dark/light mode implementation
│   └── common_widgets/        # Custom UI components
```

---

## 🚀 Installation

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install): Ensure Flutter is installed on your machine.

### Clone Repository

```bash
git clone https://github.com/your-repo/Apple.git
cd Apple
```

### Install Dependencies

```bash
flutter pub get
```

### Run the App

```bash
flutter run
```

---

## 📲 Technologies Used

- **Flutter** – Cross-platform mobile development  
- **Provider** – State management  
- **Flutter Secure Storage** – Secure data handling  
- **HTTP** – API integration  
- **Firebase Auth** – Google Sign-In  
- **Path Provider** – Local file storage  
- **Flutter PDF** – PDF generation  
- **Cached Network Image** – Efficient image loading  
- **Carousel Slider** – Image carousel implementation  
- **Get It** – Dependency injection  
- **Shimmer** – Loading animations  
- **Equatable** – Simplifies data class comparisons  

---

## 🤝 Contributing

1. Fork the repository.  
2. Create a feature branch:
   ```bash
   git checkout -b feature/new-feature
   ```
3. Commit your changes:
   ```bash
   git commit -m 'Add new feature'
   ```
4. Push to the branch:
   ```bash
   git push origin feature/new-feature
   ```
5. Create a Pull Request.

---
# project 
Flutter 3.29.3 • channel stable • https://github.com/flutter/flutter.git
Framework • revision ea121f8859 (2 weeks ago) • 2025-04-11 19:10:07 +0000
Engine • revision cf56914b32
Tools • Dart 3.7.2 • DevTools 2.42.3


## 📜 License

This project is licensed under the [MIT License](LICENSE).