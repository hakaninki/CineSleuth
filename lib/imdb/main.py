from flask import Flask, request, jsonify
from imdb import Cinemagoer
import http.client
import json

app = Flask(__name__)

# Your API key for the CollectAPI service
APIKEY = 'YourApiKey'

# Function to get the IMDb ID of a movie based on its name and release year
def get_imdb_id(movie_name, year):
    # Establish an HTTPS connection to the CollectAPI service
    conn = http.client.HTTPSConnection("api.collectapi.com")
    headers = {
        'content-type': "application/json",
        'authorization': f"apikey {APIKEY}"
    }
    # Send a GET request to search for the movie by name and year
    conn.request("GET", f"/imdb/imdbSearchByName?query={movie_name}&year={year}", headers=headers)
    res = conn.getresponse()
    data = res.read()
    data_str = data.decode("utf-8")
    data_dict = json.loads(data_str)
    # Check if the response is successful and return the IMDb ID
    if data_dict['success']:
        imdb_id = data_dict['result'][0]['imdbID']
        return imdb_id
    return None

# Function to scrape IMDb reviews for a given IMDb ID
def scrape_imdb_reviews(imdb_id):
    ia = Cinemagoer()
    movie = ia.get_movie(imdb_id) # Get the movie details by IMDb ID
    ia.update(movie, 'reviews') # Update the movie object to include reviews
    reviews = []
    # Extract up to 5 reviews and format them
    for review in movie['reviews'][:5]:
        reviews.append({
            'author': review.get('author', 'Unknown'),
            'date': review.get('date', 'Unknown'),
            'helpfulCount': review.get('helpful', 0),
            'notHelpfulCount': review.get('not_helpful', 0),
            'rating': review.get('rating', 0.0),
            'title': review.get('title', 'No Title'),
            'content': review.get('content', ''),
        })
    return reviews

# Define the Flask route to handle GET requests for reviews
@app.route('/getReviews', methods=['GET'])
def get_reviews():
    # Get the movie name and year from the request arguments
    name = request.args.get('name')
    year = request.args.get('year')
    try: 
        # Get the IMDb ID for the given movie name and year
        imdb_id = get_imdb_id(name, year)
        # Extract the numerical part of the IMDb ID
        int_id = ''.join([char for char in imdb_id if char.isdigit()])
        # Scrape the reviews using the IMDb ID
        reviews = scrape_imdb_reviews(int_id)
    except Exception as e:
        # Handle any exceptions and set reviews to an empty list
        reviews = []
        print(e)
    return jsonify(reviews)

if __name__ == '__main__':
    # Run the Flask app in debug mode
    app.run(debug=True)
