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

## How to Use
1. **Login**: Users must have an account to log in. Provide your email and password to access the app.
2. **Create Account**: New users must provide:
   - Full Name
   - Semester
   - ID
   - Registration Number
   - Department
   - University Name
   - Email
   - Password
3. **Features**:
   - Navigate to the scheduling section to set up your timetable.
   - Upload and view notes under the notes section.
   - Check announcements for updates.
   - Chat with the AI assistant for help.
   - Manage and edit your profile, and access classmates' details in the profile section.

## Contributors
If you would like to contribute to Schedula, follow these steps:

1. **Fork the Repository**: Click on the "Fork" button at the top of the repository page to create a personal copy.
2. **Clone the Repository**:
   ```bash
   git clone https://github.com/Azrul16/schedula.git
   ```
3. **Create New Branch**:
   ```bash
   git checkout -b feature/your-feature-name
   ```
4. **Make changes:** Impliment your changes or new features in the project
5. **Tast your changes:** Ensure that your changes work as expected without breaking existing functionality
6. **Commit Your Changes**:
   ```bash
   git commit -m "Add: description of your changes"
   ```
7. **Push Your Changes**:
   ```bash
   git push origin feature/your-feature-name
   ```
8. **Submit a Pull Request**: Go to the original repository, click on "Pull Requests," and submit your PR. Include a clear description of the changes you’ve made.

## We appreciate your contributions to improving Schedula!



### Author
- [**Azrul Amaline**](https://github.com/Azrul16)  
- **Email**: [azrul.amaline16@gmail.com](mailto:azrul.amaline16@gmail.com)
