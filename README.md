# 📱 Apple - Flutter Application
Version: 1.0.0
Platform: Android, iOS

Apple is a Flutter-based application designed to display iPhone product listings with advanced UI components, Google authentication, and PDF generation for product details. This app follows **Clean Architecture**, ensuring modularity, scalability, and maintainability.

---

## 🔑 Key Features

- ✅ **Google Sign-In** – Secure authentication using Firebase OAuth  
- ✅ **Fetch iPhone Products** – Displays product listings from a mock API  
- ✅ **Product Detail Page** – Carousel images, specifications, and descriptions  
- ✅ **Generate PDF** – Users can download iPhone specifications as PDFs  
- ✅ **Downloaded PDFs Tab** – Stores PDFs locally with listing functionality  
- ✅ **Search & Filters** – Enhance product discoverability  
- ✅ **Pull-to-Refresh** – Refresh product listings& pdf list dynamically  
- ✅ **PDF Sharing** – Allows users to share product details easily  
## add on
- ✅ **internet monitor** – Allows users if loss internetConnection
- ✅ **api queue** – if no internet when open app api call added in queue . stored api will call later retore internet
- ✅ **responsive & adaptive layout** – adapive layout for tablet desktop are easy to implement . currently only implement mobile becouse of time 
- ✅ **PDF share and clearAll, delete** – Allows users if pdf share and clear all .if u need one by one delete al methods are avialble
- ✅ **Dark/Light thme** – user can change thme and state persist even after app closed



---


## 📂 Project Structure

This app follows **Clean Architecture**, maintaining separation of concerns for UI, business logic, and data handling.

lib/
├── core/
│   └── connection/            # Network utilities & shared resources
├── features/
│   ├── authentication/        # Google Sign-In
│   │   ├── presentation/      
│   │   │   ├── mobile/        # UI components specific to mobile
│   │   │   ├── desktop/       # UI components specific to desktop
│   │   │   ├── tablet/        # UI components specific to tablets
│   │   ├── domain/            # Business & domain logic
│   │   └── data/              # API calls & data sources
│   ├── products/              # Product listing and details
│   ├── pdf_generation/        # PDF creation & storage
│   ├── themes/                # Dark/light mode implementation
│   └── common_widgets/        # Custom UI components


## 🌐 API Integration
Mocky API Details
Base API URL:

sh
https://run.mocky.io/v3/9c07478b-4692-44da-b41d-cb

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


## 📲 Technologies Used

- **Flutter** – Cross-platform mobile development  
- **Provider** – State management  
- **Dartz** – Functional programming utilities  
- **Equatable** – Simplified data class comparisons  
- **Get It** – Dependency injection  
- **Injectable** – Code generation for DI  
- **HTTP** – API integration  
- **Connectivity Plus** – Internet connection checker  
- **Firebase Core** – Core Firebase services  
- **Firebase Auth** – Authentication (Email/Password, Google Sign-In)  
- **Google Sign-In** – OAuth with Google  
- **Flutter ScreenUtil** – Responsive design adaptation  
- **Cached Network Image** – Efficient image caching  
- **Carousel Slider** – Image carousel implementation  
- **Shimmer** – Loading animations  
- **Photo View** – Zoomable image viewer  
- **Lottie** – Animations (JSON based)  
- **Flutter SVG** – SVG image support  
- **Google Fonts** – Custom fonts support  
- **Cupertino Icons** – iOS-style system icons  
- **Shared Preferences** – Local key-value storage  
- **Permission Handler** – Runtime permission handling  
- **Path Provider** – Local file storage access  
- **Share Plus** – Native file sharing  
- **Flutter Native Splash** – Native splash screen    
- **Flutter PDF** – PDF generation  
- **Open File** – Native file opening  
- **Intl** – Internationalization and localization  
- **Build Runner** – Code generation utility  
- **Injectable Generator** – Dependency injection code generator  
- **Change App Package Name** – Easy app package name changer  
- **Flutter Launcher Icons** – Custom launcher icon generator  

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

---

## 👩‍💻 Developer Note

This project emphasizes **high modularity**, enabling each feature to operate independently for better scalability, maintenance, and testability.

It follows key software design principles:

- **Dependency Injection (DI):** Managing dependencies efficiently using `GetIt` and `Injectable`.
- **Loose Coupling:** Ensuring components are flexible and replaceable without impacting other modules.
- **Separation of Concerns (SoC):** Through clearly defined layers: Presentation, Domain, and Data.

-----

# project 
Flutter 3.29.3 • channel stable • https://github.com/flutter/flutter.git
Framework • revision ea121f8859 (2 weeks ago) • 2025-04-11 19:10:07 +0000
Engine • revision cf56914b32
Tools • Dart 3.7.2 • DevTools 2.42.3


## 📜 License

This project is licensed under the [MIT License](LICENSE).