# Scube Task App

A Flutter application built with **GetX** and **Clean Architecture**. This project features a complete authentication flow, an energy monitoring dashboard, and detailed analytics views, all designed with a focus on maintainability and pixel-perfect UI implementation.

## Key Features

### Authentication
- **Flow**: Includes Login, Signup, Forgot Password, and OTP Verification screens.
- **Security**: Implemented secure input handling, field validation, and email masking for privacy.
- **Navigation**: Uses stateless, type-safe navigation via GetX.

### Dashboard & Energy Monitoring
- **Real-time Display**: Circular power widget for tracking electricity sources and loads.
- **Dynamic Views**: Toggle between Source and Load data seamlessly.
- **UI Components**: Interactive data cards with status indicators (Active/Inactive) and visual feedback.

### Analytics Details
- **Data View**: Features interactive energy charts with date selection capabilities.
- **Revenue View**: A dedicated financial view with collapsible cost breakdowns.
- **Components**: Custom-built widgets including a dynamic circular gauge that adapts units (`kWh` vs `tk`) based on context.

## Technical Overview

- **Framework**: Flutter & Dart (3.9.2+)
- **State Management**: GetX
- **Architecture**: Modular, feature-first Clean Architecture
- **Routing**: Direct, widget-based routing (removed named routes for simplicity)
- **Design**: fully responsive implementation using custom widgets and Google Fonts.

## Setup Instructions

1.  **Clone the repository**
    ```bash
    git clone https://github.com/yourusername/scube_task_app.git
    ```

2.  **Install dependencies**
    ```bash
    flutter pub get
    ```

3.  **Run the application**
    ```bash
    flutter run
    ```

## Assets

- **Launch Icons**: Configured adaptive launcher icons with a black background for Android.
- **Splash Screen**: Native splash screen configured for both Android and iOS.
- **Design adherence**: The app is built to strictly follow the provided design mockups.
