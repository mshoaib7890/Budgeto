💰 Budgeto – Budget Management App (Flutter + GetX)

Budgeto ek simple aur powerful budget management app hai jo users ko apne daily expenses track karne, budget set karne aur category-wise spending dekhne ki sahulat deta hai. Ye app Flutter aur GetX (MVVM architecture) ka use karti hai for fast and reactive performance.

📱 Features

✅ Expense Management

Add, edit, delete daily expenses

Assign category, amount, and date to each expense

Real-time updates with GetX Obx and GetBuilder

🏦 Budget Planning

Set monthly budget goals

Alerts on exceeding the budget

Track remaining and used budget

📊 Smart Dashboard

Summary of total expenses, remaining budget, and balance

Pie chart / bar chart view for category-wise expenses

🔍 Filter & Search

Filter expenses by category, date range, or amount

Dynamic UI updates using GetX state management

📂 Category Control

Manage expense categories (add/edit/delete)

🌙 Dark & Light Mode

Toggle between light and dark theme

Theme state managed with GetX ThemeController

⚙️ Architecture
This app uses MVVM architecture with GetX:
lib/
│
├── models/         # Data models (Expense, Category, Budget)
├── views/          # UI screens
├── controllers/    # ViewModels with GetX logic
├── services/       # Data handling (e.g., local DB)
├── bindings/       # Dependency injections
└── main.dart       # Entry point

💾 Local Storage

Expenses and budget data are stored using Hive or SharedPreferences (based on your setup).

Data persists even after app restarts.

🛠️ Tech Stack

Flutter 💙

GetX for State Management 🚀

MVVM Architecture 🧠

Hive / SharedPreferences (for local storage)

Charts package (for data visualization)
