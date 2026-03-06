# CineSleuth

[![Primary Language](https://img.shields.io/badge/language-Dart-blue.svg)](https://dart.dev/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Overview
CineSleuth is a cross-platform movie browsing application built with Flutter. It allows users to discover trending, top-rated, and upcoming movies by integrating with TheMovieDB API. A unique feature of CineSleuth is its ability to fetch and display IMDb reviews for specific movies, leveraging a local Python backend for web scraping.

## Features
*   **Movie Discovery**: Browse a curated list of trending, top-rated, and upcoming movies.
*   **Detailed Movie Information**: View comprehensive details for each movie, including overview, release date, and average rating.
*   **IMDb Review Integration**: Access and read IMDb user reviews for movies, fetched dynamically via a local Python scraping service.
*   **Cross-Platform Compatibility**: Available on Android, iOS, Web, Linux, macOS, and Windows.
*   **Responsive UI**: Designed with Flutter for a consistent and engaging user experience across various devices.

## Tech Stack

| Layer                 | Technology                               |
| :-------------------- | :--------------------------------------- |
| **Frontend Framework**| Flutter                                  |
| **Frontend Language** | Dart                                     |
| **Backend Language**  | Python                                   |
| **Backend Framework** | Flask (implied for local server)         |
| **External APIs**     | TheMovieDB API                           |
| **Scraping Libraries**| `requests`, `BeautifulSoup4` (for Python)|
| **Mobile Platforms**  | Android (Kotlin), iOS (Swift)            |
| **Desktop Platforms** | Linux (C++), macOS (Swift), Windows (C++)|

## Project Structure

```
bce17113-65fc-413f-b5e0-0102683fc44f/
├── android/
│   ├── app/
│   │   ├── src/
│   │   │   ├── debug/
│   │   │   │   └── AndroidManifest.xml
│   │   │   ├── main/
│   │   │   │   ├── kotlin/
│   │   │   │   │   └── com/
│   │   │   │   │       └── example/
│   │   │   │   │           └── hakanflix/
│   │   │   │   │               └── MainActivity.kt
│   │   │   │   ├── res/
│   │   │   │   │   ├── drawable/
│   │   │   │   │   │   └── launch_background.xml
│   │   │   │   │   ├── drawable-v21/
│   │   │   │   │   │   └── launch_background.xml
│   │   │   │   │   ├── mipmap-hdpi/
│   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   ├── mipmap-mdpi/
│   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   ├── mipmap-xhdpi/
│   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   ├── mipmap-xxhdpi/
│   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   ├── mipmap-xxxhdpi/
│   │   │   │   │   │   └── ic_launcher.png
│   │   │   │   │   ├── values/
│   │   │   │   │   │   └── styles.xml
│   │   │   │   │   └── values-night/
│   │   │   │   │       └── styles.xml
│   │   │   │   └── AndroidManifest.xml
│   │   │   └── profile/
│   │   │       └── AndroidManifest.xml
│   │   └── build.gradle
│   ├── gradle/
│   │   └── wrapper/
│   │       └── gradle-wrapper.properties
│   ├── .gitignore
│   ├── build.gradle
│   ├── gradle.properties
│   └── settings.gradle
├── assets/
│   ├── 12.png
│   ├── cineSleuth.png
│   ├── logo.png
│   └── logo2.png
├── ios/
│   ├── Flutter/
│   │   ├── AppFrameworkInfo.plist
│   │   ├── Debug.xcconfig
│   │   └── Release.xcconfig
│   ├── Runner/
│   │   ├── Assets.xcassets/
│   │   │   ├── AppIcon.appiconset/
│   │   │   │   ├── Contents.json
│   │   │   │   ├── Icon-App-1024x1024@1x.png
│   │   │   │   ├── Icon-App-20x20@1x.png
│   │   │   │   ├── Icon-App-20x20@2x.png
│   │   │   │   ├── Icon-App-20x20@3x.png
│   │   │   │   ├── Icon-App-29x29@1x.png
│   │   │   │   ├── Icon-App-29x29@2x.png
│   │   │   │   ├── Icon-App-29x29@3x.png
│   │   │   │   ├── Icon-App-40x40@1x.png
│   │   │   │   ├── Icon-App-40x40@2x.png
│   │   │   │   ├── Icon-App-40x40@3x.png
│   │   │   │   ├── Icon-App-60x60@2x.png
│   │   │   │   ├── Icon-App-60x60@3x.png
│   │   │   │   ├── Icon-App-76x76@1x.png
│   │   │   │   ├── Icon-App-76x76@2x.png
│   │   │   │   └── Icon-App-83.5x83.5@2x.png
│   │   │   └── LaunchImage.imageset/
│   │   │       ├── Contents.json
│   │   │       ├── LaunchImage.png
│   │   │       ├── LaunchImage@2x.png
│   │   │       ├── LaunchImage@3x.png
│   │   │       └── README.md
│   │   ├── Base.lproj/
│   │   │   ├── LaunchScreen.storyboard
│   │   │   └── Main.storyboard
│   │   ├── AppDelegate.swift
│   │   ├── Info.plist
│   │   └── Runner-Bridging-Header.h
│   ├── Runner.xcodeproj/
│   │   ├── project.xcworkspace/
│   │   │   ├── xcshareddata/
│   │   │   │   ├── IDEWorkspaceChecks.plist
│   │   │   │   └── WorkspaceSettings.xcsettings
│   │   │   └── contents.xcworkspacedata
│   │   ├── xcshareddata/
│   │   │   └── xcschemes/
│   │   │       └── Runner.xcscheme
│   │   └── project.pbxproj
│   ├── Runner.xcworkspace/
│   │   ├── xcshareddata/
│   │   │   ├── IDEWorkspaceChecks.plist
│   │   │   └── WorkspaceSettings.xcsettings
│   │   └── contents.xcworkspacedata
│   ├── RunnerTests/
│   │   └── RunnerTests.swift
│   └── .gitignore
├── lib/
│   ├── api/
│   │   └── api.dart
│   ├── imdb/
│   │   └── main.py
│   ├── models/
│   │   └── movie.dart
│   ├── screens/
│   │   ├── details_screen.dart
│   │   └── home_screen.dart
│   ├── widgets/
│   │   ├── back_button.dart
│   │   ├── movie_slider.dart
│   │   ├── review_cart.dart
│   │   └── trending_slider.dart
│   ├── backend_bloc.dart
│   ├── colors.dart
│   ├── constants.dart
│   ├── get_review_trial.dart
│   ├── imdb_comments.dart
│   └── main.dart
├── linux/
│   ├── flutter/
│   │   ├── CMakeLists.txt
│   │   ├── generated_plugin_registrant.cc
│   │   ├── generated_plugin_registrant.h
│   │   └── generated_plugins.cmake
│   ├── .gitignore
│   ├── CMakeLists.txt
│   ├── main.cc
│   ├── my_application.cc
│   └── my_application.h
├── macos/
│   ├── Flutter/
│   │   ├── Flutter-Debug.xcconfig
│   │   ├── Flutter-Release.xcconfig
│   │   └── GeneratedPluginRegistrant.swift
│   ├── Runner/
│   │   ├── Assets.xcassets/
│   │   │   └── AppIcon.appiconset/
│   │   │       ├── app_icon_1024.png
│   │   │       ├── app_icon_128.png
│   │   │       ├── app_icon_16.png
│   │   │       ├── app_icon_256.png
│   │   │       ├── app_icon_32.png
│   │   │       ├── app_icon_512.png
│   │   │       ├── app_icon_64.png
│   │   │       └── Contents.json
│   │   ├── Base.lproj/
│   │   │   └── MainMenu.xib
│   │   ├── Configs/
│   │   │   ├── AppInfo.xcconfig
│   │   │   ├── Debug.xcconfig
│   │   │   ├── Release.xcconfig
│   │   │   └── Warnings.xcconfig
│   │   ├── AppDelegate.swift
│   │   ├── DebugProfile.entitlements
│   │   ├── Info.plist
│   │   ├── MainFlutterWindow.swift
│   │   └── Release.entitlements
│   ├── Runner.xcodeproj/
│   │   ├── project.xcworkspace/
│   │   │   └── xcshareddata/
│   │   │       └── IDEWorkspaceChecks.plist
│   │   ├── xcshareddata/
│   │   │   └── xcschemes/
│   │   │       └── Runner.xcscheme
│   │   └── project.pbxproj
│   ├── Runner.xcworkspace/
│   │   ├── xcshareddata/
│   │   │   └── IDEWorkspaceChecks.plist
│   │   └── contents.xcworkspacedata
│   ├── RunnerTests/
│   │   └── RunnerTests.swift
│   └── .gitignore
├── test/
│   └── widget_test.dart
├── web/
│   ├── icons/
│   │   ├── Icon-192.png
│   │   ├── Icon-512.png
│   │   ├── Icon-maskable-192.png
│   │   └── Icon-maskable-512.png
│   ├── favicon.png
│   ├── index.html
│   └── manifest.json
├── windows/
│   ├── flutter/
│   │   ├── CMakeLists.txt
│   │   ├── generated_plugin_registrant.cc
│   │   ├── generated_plugin_registrant.h
│   │   └── generated_plugins.cmake
│   ├── runner/
│   │   ├── resources/
│   │   │   └── app_icon.ico
│   │   ├── CMakeLists.txt
│   │   ├── flutter_window.cpp
│   │   ├── flutter_window.h
│   │   ├── main.cpp
│   │   ├── resource.h
│   │   ├── runner.exe.manifest
│   │   ├── Runner.rc
│   │   ├── utils.cpp
│   │   ├── utils.h
│   │   ├── win32_window.cpp
│   │   └── win32_window.h
│   ├── .gitignore
│   └── CMakeLists.txt
├── .gitignore
├── analysis_options.yaml
├── launch.json
├── pubspec.lock
├── pubspec.yaml
└── README.md
```

## Getting Started

To run CineSleuth locally, you'll need to set up both the Flutter application and a local Python backend server.

### Prerequisites

*   **Flutter SDK**: [Install Flutter](https://flutter.dev/docs/get-started/install) (version 3.x or higher recommended).
*   **Python 3**: [Install Python](https://www.python.org/downloads/) (version 3.8 or higher recommended).
*   **Git**: For cloning the repository.
*   **TheMovieDB API Key**: Obtain a free API key from [TheMovieDB](https://www.themoviedb.org/documentation/api).

### Installation

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/your-username/CineSleuth.git
    cd CineSleuth
    ```

2.  **Install Flutter dependencies**:
    ```bash
    flutter pub get
    ```

3.  **Set up TheMovieDB API Key**:
    Open `lib/constants.dart` and replace `'YourApiKey'` with your actual TheMovieDB API key:
    ```dart
    class Constants {
      static const apiKey = 'YOUR_THEMOVIEDB_API_KEY'; // Replace this!
      static const imagePath = 'https://image.tmdb.org/t/p/w500';
    }
    ```

4.  **Set up Python backend dependencies**:
    Navigate to the `lib/imdb` directory (or a dedicated `backend` directory if you create one) and install the necessary Python packages.
    ```bash
    cd lib/imdb
    pip install requests beautifulsoup4 Flask
    ```
    *Note: The Flask framework is implied by the API calls in `lib/api/api.dart` but a dedicated Flask application file (e.g., `app.py`) is not provided in the project structure. You will need to create a simple Flask server to expose the `get_reviews` function from `main.py`.*

    **Example `backend/app.py` (create this file in a `backend` directory at the project root):**
    ```python
    # Create a 'backend' directory at the project root, then create app.py inside it
    # backend/app.py
    from flask import Flask, request, jsonify
    import sys
    import os

    # Add the parent directory of lib/imdb to the Python path
    sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'lib')))

    from imdb.main import get_reviews as scrape_reviews_from_imdb

    app = Flask(__name__)

    @app.route('/getReviews', methods=['GET'])
    def get_reviews_endpoint():
        name = request.args.get('name')
        year = request.args.get('year')

        if not name or not year:
            return jsonify({"error": "Movie name and year are required"}), 400

        try:
            reviews = scrape_reviews_from_imdb(name, year)
            return jsonify(reviews)
        except Exception as e:
            return jsonify({"error": str(e)}), 500

    if __name__ == '__main__':
        app.run(debug=True, port=5000)
    ```

### Environment Setup

*   Ensure your Flutter environment is correctly set up for your target platform (Android Studio for Android, Xcode for iOS/macOS, etc.).
*   For the Python backend, ensure Python 3 is in your system's PATH.

## Usage

1.  **Start the Python Backend Server**:
    If you created the `backend/app.py` as suggested above, navigate to the `backend` directory and run:
    ```bash
    cd backend # Assuming you created a 'backend' directory at the project root
    python app.py
    ```
    This will start the Flask server, typically on `http://127.0.0.1:5000`. Keep this running while using the Flutter app.

2.  **Run the Flutter Application**:
    From the project root directory, execute:
    ```bash
    flutter run
    ```
    This command will launch the application on your default configured device (emulator, physical device, or web browser). You can specify a target device using `flutter run -d <device_id>`.

## API Reference

### External API (TheMovieDB)

The application interacts with TheMovieDB API to fetch movie data.
*   **Trending Movies**: `GET https://api.themoviedb.org/3/trending/movie/day`
*   **Top Rated Movies**: `GET https://api.themoviedb.org/3/movie/top_rated`
*   **Upcoming Movies**: `GET https://api.themoviedb.org/3/movie/upcoming`

All requests require an `api_key` parameter.

### Local Backend API (Python Flask Server)

The Flutter app communicates with a local Python server to retrieve IMDb reviews.

| Method | Path         | Description                                     | Parameters                                                              |
| :----- | :----------- | :---------------------------------------------- | :---------------------------------------------------------------------- |
| `GET`  | `/getReviews`| Fetches movie reviews from IMDb by scraping.    | `name` (string, movie title without spaces), `year` (string, release year) |

**Example Request (from Flutter app):**
```
http://127.0.0.1:5000/getReviews?name=The%20Dark%20Knight&year=2008
```

## Architecture

```mermaid
graph TD
    A[CineSleuth App (Flutter)] --> B[TheMovieDB API]
    A --> C[Local Python Backend (Flask)]
    C --> D[IMDb (Scraping)]
```

## Contributing
Contributions are welcome! If you have suggestions for improvements, bug fixes, or new features, please open an issue or submit a pull request.

## License
This project is licensed under the MIT License - see the LICENSE file for details.
