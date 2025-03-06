# 🍏 Fruits Hub Dashboard  

The **Fruits Hub Dashboard** is an admin panel built with **Flutter** and **Supabase** to manage products for the **Fruits Hub E-commerce App**. This dashboard allows admins to **add new products**, **upload images**, and store product details in the **Supabase database**, which the main app fetches from.

---

## ✨ Features  

### 🛠 **Product Management**  
- Add new products with the following fields:  
  - **Product ID**  
  - **Price**  
  - **Calories**  
  - **Description**  
  - **Type**: Vegetable or Fruit  
  - **Organic**: Yes/No  
  - **Upload Image** (Stored in **Supabase Storage**)  
- Validate all fields before adding a product to the database  
- Upload product images and retrieve their **image URLs**  
- Store product details in **Supabase Database**, allowing the main **Fruits Hub E-commerce App** to fetch them  

---

## 🏗️ Project Structure  

The project follows a **clean and scalable architecture**, keeping separation of concerns in mind:  
lib/
# Project Structure (`lib/`)

The `lib/` directory contains the core application code, organized into a modular structure for better maintainability and scalability. Below is the detailed breakdown of the folder structure:

## Description of Each Folder

### `Core/`
This folder contains the core functionality and shared resources used across the application.

- **`services/`**: Houses services like `StorageService`, API handlers, and other business logic services.
- **`assets/`**: Stores app-wide constants such as colors, text styles, and other reusable assets.
- **`utils/`**: Contains utility functions, helper classes, and extensions that are used throughout the app.

### `Features/`
This folder follows a feature-based modular architecture, where each feature is self-contained and organized into layers.

- **`Screen/`**: Contains app screen and UI elements.
  - **`Data/`**: Represents the data layer of the app.
    - **`model/`**: Contains data models (e.g., `ProductModel`) that represent the structure of the data.
    - **`repo/`**: Implements the repository pattern to manage data sources (e.g., local database, API).
  - **`Presentation/`**: Represents the UI layer of the app.
    - **`view/`**: Contains the screens and layouts for the app.
      - **`widgets/`**: Houses reusable UI components (e.g., buttons, cards, lists).
     - **`cubit/`**: Manages the state of the app using the Cubit state management pattern.

---

This structure ensures a clean separation of concerns, making the codebase easier to maintain, test, and scale. Each feature is modular, allowing for independent development and testing.



---

## 🚀 Tech Stack  
- **Flutter** – Cross-platform UI framework  
- **Supabase** – Backend-as-a-service for database and storage  
- **Dart** – Programming language for Flutter  
- **Cubit (BLoC Pattern)** – State management  

---

## 📷 Screenshots  

![screenshot](https://github.com/user-attachments/assets/cfcc28e7-4536-4fb5-abac-c772347156aa)

---

## 🚀 How to Run the Project  

### 1️⃣ Prerequisites  
- Install **Flutter** & **Dart**  
- Set up **Supabase** and configure your **API keys**  

### 2️⃣ Clone the Repository  
```sh
git clone https://github.com/1-abdelrahman-khalil-1/Fruits-Hub-App.git
cd Fruits-Hub-App
```
### 3️⃣ Install Dependencies  
```sh
flutter pub get
```
### 4️⃣ Run the App
```sh
flutter run
```
