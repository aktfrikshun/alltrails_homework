# AllTrails Homework

AllTrails Homework Solution

## Technical Details:

- Ruby 2.7.3
- Rails 6.1.6
- Postgres DB for persisting FavoritePlaces

## Functional Details

### Backend

- API provided to list nearby places, map markers and map geometry
- API allows for input of a Search parameter to filter results
- API provided to toggle (add/remove) a user favorited place

### CLient

- Landing page is an rails view template which serves up a Main react component utilizing the rails_react gem
- The Main react component is made of of subcomponents
-- Header ( App Title and Search Box )
-- Body
---- Places ( List of nearby Places)
------Place ( Place Details)
---- Map ( The Google Map )
- The Map is rendered with a marker representing each place result
- Clicking on a map marker will display place detail

## Project Notes

### What I would do if I had more time to make this applicaton more production ready

- Add UserAuthentication with Devise to manage users via SSO/OAUTH
- Add API permissions using something like pundit
- Add localization support for both the API can client
- Build deployment env and and CI/CD actions
- Make the front end more SPA like with update management between components
- Take a class in Front End Design with React so that the UI is more responsive and looks more like the provided Graphical Artifacts
- Jasper specs for React front end
- Propose and demo another front end client using Rails 7 and Stimulus

## Development environment setup

### Preparation
1. Copy .env.sample to .env and enter your Google Maps API key
```
GMAPS_API_KEY=
```

2. Setup your development environment. There are two options. Using Docker or a doing a local installation on Ubuntu.

### Local installation
The following are instructions for installing AllTrails_Homework on your local machine.  Consider using a ruby version manager like [rvm]

#### Install ruby

Install ruby.  Ensure that you're using the version of ruby listed in [.ruby-version](.ruby-version).

```shell
$ rvm install ruby 2.7.3
$ rvm use 2.7.3
```

#### Install dependencies

AllTrails_Homework assumes an available PostgresDB

Install application gems and node packages:

```shell
$ cd $RAILS_ROOT
$ bundle install
$ yarn install

```

#### Configure database

Update config/database.yml with DB connection details

Now we're ready to populate our development database.

```shell
$ rails db:setup
```

```

#### Start the app

Start the app as normal:

```shell
$ rails server
```

Visit http://localhost:3000

## Testing

### Running RSpec tests

```shell
$ rspec
```

## API

### Authentication

This app performs not user authentication.  Instead a user uuid is stashed in a browser cookie.  This cookie is used to track FavoritePlaces selected by the user

### Places

Fetch nearby places with map state.
```console
$ curl -H "Content-Type: application/json"  -X GET http://localhost:3000/api/v1/places
```
A MapState object is returned which includes:

An array of places
```
	"places": [
	{
		"id": null,
		"place_id": "ChIJ3dPGXsmSrIkRG0slE2jVG4s",
		"name": "JD's Tavern",
		"address": "800 W Williams St Suite #100, Apex, NC 27502, United States",
		"rating": 4.5,
		"price_level": 2,
		"photo_url": "https://maps.googleapis.com/maps/api/place/photo?photo_reference=Aap_uEBqmSPb_FDERFlXfOstW1XZYw18mhXCQWU93VTltVXbsTI0AEMtw34zhoijvAbFA_aYOaR1bdiC2bmiVfbt0fvutCFmdXK2l1Y3Irg5WgJ4ete8Jt8awvoJjTBgs5Qocd-R3JVe0MuJoW5EVhOJr2wEWGQHhFdnAveFLmapAZ_1gADp&maxheight=75&key=AIzaSyDiBuH9HP7yISpI7LHoHAWMxb8yACHnGCo",
		"is_favorite": false
	},
```
Note:  the is_favorite attribute is derived by merging the places data from the GoogleMaps API with the FavoritePlaces persisted by the user

An array of map markers useful for drawing pins on a map in the client
```
"markers": [
  {
    "id": null,
    "lat": 35.7392413,
    "lng": -78.8642366,
    "name": "JD's Tavern",
    "address": "800 W Williams St Suite #100, Apex, NC 27502, United States"
  },
```

And map geometry details
```
"center": [
	35.741577084999996,
	-78.87009645499998
],
"zoom": 12
```

Peform a search ( simply pass in a "search" to the same API endpoint as above)
```console
$ curl -H "Content-Type: application/json" -X GET --data '{"search":"Sushi"}' http://localhost:3000/api/v1/places
```

Toggle a user's FavoritePlace ( alternate between creating/destroying the FavorityPlace specified by the place_id param and current user id )
```console
$ curl -H "Content-Type: application/json" -X GET --data '{"place_id":"123"}' http://localhost:3000/api/v1/favorites/toggle
{
  "id": 22,
  "user_id": "506d6d34-97fc-4185-bc29-537de8be93ff",
  "place_id": "123",
  "created_at": "2022-06-12T16:21:30.359Z",
  "updated_at": "2022-06-12T16:21:30.359Z"
}

```


