# CineSleuth

CineSleuth is a Flutter-based movie discovery application that fetches and displays trending, top-rated, and upcoming movies using The Movie Database (TMDb) API. Additionally, it provides IMDb reviews for movies by scraping data using a Flask backend.

## Features

- Display trending movies
- Display top-rated movies
- Display upcoming movies
- Fetch and display IMDb reviews for movies

## Technologies Used

- **Flutter**: For building the cross-platform mobile application.
- **Flask**: For creating the backend server to scrape IMDb reviews.
- **IMDb Cinemagoer**: For fetching movie reviews.
- **The Movie Database (TMDb) API**: For fetching movie details.
- **CollectAPI**: For retrieving IMDb IDs of movies.

## Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install)
- [Python](https://www.python.org/downloads/)
- [Pipenv](https://pipenv.pypa.io/en/latest/install/#installing-pipenv)

### Installation

1. Clone the repository:

```bash
git clone https://github.com/your-username/cinesleuth.git
cd cinesleuth
2. Set up the Flutter app:
cd flutter_app
flutter pub get
3. Set up the Flask backend:
cd backend
pipenv install

Running the Application
Flutter App
  1. Navigate to the Flutter app directory:
    cd flutter_app
  2. Run the Flutter app:
    flutter run
Flask Backend
  1. Navigate to the backend directory:
    cd backend
  2. Start the Flask server:
    pipenv run python app.py
Configuration
Create a constants.dart file in the lib directory of the Flutter app to store your API keys and other constants:
class Constants {
  static const apiKey = 'YOUR_TMDB_API_KEY';
  static const imagePath = 'https://image.tmdb.org/t/p/w500/';
}
Replace YOUR_TMDB_API_KEY with your actual TMDb API key.

API Endpoints
Get Reviews
Endpoint: /getReviews

Method: GET

Query Parameters:

name (string): The name of the movie.
year (string): The release year of the movie.
Example Request:
http://127.0.0.1:5000/getReviews?name=Inception&year=2010

Acknowledgements:
-Flutter
-Flask
-The Movie Database (TMDb) API
-IMDb Cinemagoer
-CollectAPI
