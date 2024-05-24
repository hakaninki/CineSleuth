from flask import Flask, request, jsonify
from imdb import Cinemagoer
import http.client
import json

app = Flask(__name__)
APIKEY = '64L8XBqhtD9iRjdYaabsle:04fcEu8a5AiKiPcCxLM0VF'

def get_imdb_id(movie_name, year):
    conn = http.client.HTTPSConnection("api.collectapi.com")
    headers = {
        'content-type': "application/json",
        'authorization': f"apikey {APIKEY}"
    }
    conn.request("GET", f"/imdb/imdbSearchByName?query={movie_name}&year={year}", headers=headers)
    res = conn.getresponse()
    data = res.read()
    data_str = data.decode("utf-8")
    data_dict = json.loads(data_str)
    if data_dict['success']:
        imdb_id = data_dict['result'][0]['imdbID']
        return imdb_id
    return None

def scrape_imdb_reviews(imdb_id):
    ia = Cinemagoer()
    movie = ia.get_movie(imdb_id)
    ia.update(movie, 'reviews')
    reviews = []
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

@app.route('/getReviews', methods=['GET'])
def get_reviews():
    name = request.args.get('name')
    year = request.args.get('year')
    try: 
        imdb_id = get_imdb_id(name, year)
        int_id = ''.join([char for char in imdb_id if char.isdigit()])
        reviews = scrape_imdb_reviews(int_id)
    except Exception as e:
        reviews = []
        print(e)
    return jsonify(reviews)

if __name__ == '__main__':
    app.run(debug=True)
