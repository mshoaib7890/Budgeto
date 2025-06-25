💰 Budgeto – Budget Management App (Flutter + GetX)
Budgeto is a simple yet powerful budget management app that helps users efficiently track daily expenses, set monthly budgets, and analyze spending through visual insights. Built with Flutter and GetX using the MVVM architecture, the app ensures fast performance and a reactive user experience.

📱 Key Features
✅ Expense Management
Add, edit, and delete daily expenses.

Assign categories, amounts, and dates to each expense.

Real-time UI updates using GetX (Obx and GetBuilder).

🏦 Budget Planning
Set and manage monthly budget goals.

Get alerts when budget limits are exceeded.

View remaining and used budget at a glance.

📊 Smart Dashboard
Summary of total spending, remaining budget, and available balance.

Interactive pie and bar charts for category-wise analysis.

🔍 Filter & Search
Filter expenses by category, date range, or amount.

Instant results with dynamic UI updates using GetX state management.

📂 Category Management
Add, edit, or delete custom expense categories.

🌙 Light & Dark Mode
Seamless theme switching (light/dark).

Theme state controlled via ThemeController using GetX.

⚙️ Architecture
Follows MVVM Pattern with GetX

bash
Copy
Edit
lib/
├── models/         # Data models (Expense, Category, Budget)
├── views/          # UI screens
├── controllers/    # ViewModels (GetX controllers)
├── services/       # Local data handling (Hive/SharedPreferences)
├── bindings/       # Dependency injection
└── main.dart       # App entry point
💾 Local Storage
Data stored locally using Hive or SharedPreferences.

All data persists across app restarts.

🛠️ Tech Stack
Flutter 💙

GetX for State Management 🚀

MVVM Architecture 🧠

Hive / SharedPreferences for local persistence

fl_chart or similar package for data visualization 📊
