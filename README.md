# Schedula

**Schedula** is a Flutter-based mobile application designed to streamline student life by providing essential tools for managing class schedules, sharing announcements, taking notes, and accessing academic resources through an AI-powered chatbot. Built with a Firebase backend, Schedula offers a seamless user experience with features tailored to students' academic needs.

---

## Features

### 🎓 Academic Management
- **Class Schedule**: Set and manage your class schedules efficiently.
- **Class Notes**: Add, organize, and view your class notes for easy reference.
- **Announcements**: Share and view important announcements within your academic circle.

### 🤖 AI-Powered Chatbot
- Get instant study help through an AI chatbot designed to assist with academic queries.

### 🧑‍🤝‍🧑 Profile Section
- View all your batchmates and their profiles.
- Call batchmates directly through the app.

### 🔒 Account Creation
To use this app, you need to create an account with the following information:
- **Academic Gmail**
- **Full Name**
- **Student ID**
- **Registration Number**
- **Department**
- **Semester**
- **University Name**

---

## 🔧 Technology Stack

- **Frontend**: Flutter
- **Backend**: Firebase (Authentication, Firestore, and Storage)
- **AI Chatbot**: Integration with AI for study assistance
- **Communication**: In-app call functionality using third-party libraries or Firebase.

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK installed.
- Firebase account configured with your app.
- A valid academic Gmail address for account creation.

### Setup Instructions
1. Clone the repository:
   ```bash
   git clone https://github.com/Azrul16/Schedula.git
   ```
2. Navigate to the project directory:
   ```bash
   cd schedula
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Ensure Flutter is Properly Configured
Make sure Flutter is installed and configured on your system. If Flutter is not yet set up, visit the [Flutter official website](https://flutter.dev/docs/get-started/install) for installation instructions.

5. Configure Firebase
Follow these steps to configure Firebase for the project:

   #### Android
      1. Download the `google-services.json` file from your Firebase console.
      2. Place the file in the `android/app/` directory of your Flutter project.

   #### iOS
      1. Download the `GoogleService-Info.plist` file from your Firebase console.
      2. Place the file in the `ios/Runner/` directory of your Flutter project.

### 3. Final Step
After adding the configuration file(s), run the following command to ensure your project is set up correctly:
```bash
flutter pub get
```

