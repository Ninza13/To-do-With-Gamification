# to_do_app

A new Flutter project.

## Getting Started
# 📝 ToDo App

This Flutter application is a clean and simple task management tool. Users can add, edit, mark as completed, and delete their tasks. The app uses modern Flutter packages such as `provider`, `auto_route`, and `localstorage` for state management and navigation.

## 🚀 Features

- ✅ Add and edit tasks
- 📅 Mark tasks as completed
- 🗑️ Delete tasks
- 🧭 Bottom navigation for tab switching
- ⚙️ Settings page (expandable)
- 🧠 State management using `provider`
- 🔁 Navigation powered by `auto_route`
- 💾 Local data persistence via `localstorage`

## 📁 Project Structure

lib/
├── app/
│ ├── provider/ # State management (ToDoProvider)
│ ├── router/ # auto_route configuration
├── ui/
│ ├── screens/ # Home, Profile, Settings, etc.
│ ├── constants/ # Colors, images
├── common/ # Shared colors, widgets



## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.0
  auto_route: ^7.8.4
  localstorage: ^4.0.0+1
  intl: ^0.18.1
  collection: ^1.17.2
