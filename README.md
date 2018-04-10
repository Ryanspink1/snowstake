# Snow Stake

### About
Snow Stake is an minimalistic, mobile oriented application built for winter sports enthusiasts to provide them quick and easy access to resort and highway weather conditions. The application relies primarily on the [OpenSnow API](https://opensnow.com/about/api), various DOT twitter feeds, and resort snow stake video feeds to give the user access to this. The application updates forecasts hourly, DOT feeds instantly, and snow stakes as they are updated by the resort.

## Getting Started Locally
Follow these instructions to setup and serve Snow Stake locally.

Clone & Setup environment:
```
git clone https://github.com/Ryanspink1/snowstake.git
cd snowstake
bundle exec install
```

Once bundled, the open_snow_key environment variable will need to be set. Currently, new OpenSnow API keys are not available to the public. More information about the OpenSnow API can be found [here](https://opensnow.com/about/api).

Set Token:

```
# config/application.yml
open_snow_key: #your_key
```

With the token configured, the database can now be created and populated via rake tasks.
In your terminal:

```
#terminal
rake db:create
rake db:migrate
```

To populate with states, resorts, and forecasts:

```
#terminal
rake db:seed
```

To retrieve and update forecasts:

```
#terminal
rake db:update_forecast
```

## Schema
![alt text](https://i.imgur.com/jpwjf2m.png)

## Testing

Test suite (both rspec and selenium) may be run in the terminal:

```
#terminal
rspec
```

## Built With
- [Rails 5 Back-End](http://rubyonrails.org/)
- [JavaScript populated front-end](https://www.javascript.com/)
- [PostgreSQL database](https://www.postgresql.org/)


## Author
Ryan Spink (2017 - Current)

## License
This project is licensed under the MIT License.
