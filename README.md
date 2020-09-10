# Weather App

This is a simple Rails app used for an interview pairing exercise.

## Goal

The exercise goal is to add a weather API integration so that this app lets the user look up weather by city and state.

The app starts pre-configured as a Rails 4.2 app (running with most any Ruby 2.x version, **up to Ruby 2.6! Ruby 2.7 will not work!**). It includes SQLite so no external DB is required. It is already bootstrapped with RSpec, Cucumber and includes some sample tests.

The candidate will drive and the interviewer will navigate while working through the two phases of feature as described below.

There are optional, bonus additions that can be tackled if time and interest permit.

**NOTE:** _There are setup instructions below that you can follow right away, but please refrain from starting on the exercise itself until your pairing session. Thank you!_

## Remember

Take a deep breath and have fun with this! The goal is just to do your best and see what you can accomplish in the time allotted.
The interviewer/pair will be there to help guide you and help with getting you unstuck.

### Main Feature - Phase 1

This is the primary use case that the business requests for this application:

    Use case:
      As a visitor to the site
      When I submit a city and state via the form
      Then I should see the current weather for that city and state
      And the current weather should include:
        - current condition
        - current temperature
        - current wind speed
        - current wind direction

There is a lot of flexibility in how you implement this. The UI is intentionally left vague so feel free to build it out however you like.

Here are some further guidelines:

1. The weather should be pulled in real time from an external weather API
2. Feel free to use any API you like. There a LOT of them out there.
3. The form for submitting the city and state can be however you like.
4. There are existing tests to get you started.
5. This is more about the journey than the destination. Don't worry about getting this _just right_.

### Main Feature - Phase 2

Once you have completed Phase 1, the feature is expanded as follows:

    Use case:
      As a visitor to the site
      When I submit a city and state via the form
      And that same city and state has been submitted within the last 1 hour
      Then I should see the current weather for that city and state
      And the current weather should be pulled from a client-side cache
      And the current weather should include:
        - current condition
        - current temperature
        - current wind speed
        - current wind direction

This phase 2 of the main feature is about building a **Javascript-based, client-side cache** so that multiple submits of the same city+state combination within one hour will return a cached result on the page rather than submitting to the Rails controller and calling the API.

You can implement this however you like, but this _must be a client-side cache, not a server-side cache_ (there is a bonus feature about this that you can tackle later, if time and interest permits)

Here are some further guidelines:

1. You can use any framework you like, or none at all. jQuery, React, Vue.js, Angular, Ember.js, or any other.
2. We only have a short time for this exercise, so any choice that requires a lot of setup time/effort may not be worth choosing. Please keep that in mind!
3. The actual shape of the cache can be however you like.
4. If you need to modify the back-end to support your client-side cache, that is fine.

### Setup

To get started, you'll want to clone this repo locally and get it set up to run locally:

1. It's running Rails 4.2 (defined in the Gemfile)
2. It should run on any Ruby 2.x variant, **up through Ruby 2.6**, but we use 2.5.5 if you want to be exact
3. Use whatever Ruby manager you like (rvm, rbenv, chruby, whatever)
4. You _may_ need to install Bundler (`gem install bundler`). Otherwise start with `bundle install` in the repo to build the gems.
5. Run the app and make sure it looks like this: (`rails s` or if you need to `bundle exec rails s`)

<img width="475" alt="Screen Shot 2020-09-10 at 6 00 09 PM" src="https://user-images.githubusercontent.com/20147/92828096-e3721980-f38f-11ea-8466-078035714fef.png">

6. You should be able to run all the tests with `rake` (or possibly: `bundle exec rake`) and see similar output to this:


```
♯ rake
/path.../ruby -I/various...paths.../lib /path.../exe/rspec --pattern spec/\*\*\{,/\*/\*\*\}/\*_spec.rb
Running via Spring preloader in process 85185

WelcomeController
  GET /
    returns 200 success
    renders the root page

Home Page Request Tests
  GET /
    shows the homepage content

welcome/index
  renders an H1 with welcome text
  renders a 'Have fun and code well!'

Finished in 0.24918 seconds (files took 2.48 seconds to load)
5 examples, 0 failures

/path.../ruby -S bundle exec cucumber --profile default
Running via Spring preloader in process 85193
Using the default profile...
# home_page.feature
Feature: Show Home Page
  As the product owner
  I want visitors to see a greeting when they visit the home page
  So that they have a better experience

  Scenario: Visitor sees the home page    # features/home_page.feature:7
    Given I am a visitor                  # features/step_definitions/home_page_steps.rb:1
    When I go to the home page            # features/step_definitions/home_page_steps.rb:6
    Then I should see the welcome message # features/step_definitions/home_page_steps.rb:10

1 scenario (1 passed)
3 steps (3 passed)
0m0.238s
```

7. And with that, you are ready to get going!

### Preparation For Pairing

Once you are set up, you'll want to spend a little time choosing a Weather API. There are lots out there, so do some Googling and pick one you like. You should create an account and make sure you have an API key and whatever else you need to pull weather data.

If you are really struggling to find one, I recommend WeatherBit: https://www.weatherbit.io/ as it seems to be a nice, easy API.

**NOTE**

Even though you have been given some time to prepare with the above instructions, we request that you do not start the actual coding/testing work on the exercise until the pairing session starts. We trust that you will honor this request and wait for the pairing.

You may create a branch and be ready to go before the pairing starts, if you like.

Thanks!

### Testing

This app is already bootstrapped with RSpec and Cucumber.

It includes a sample vew test, sample controller test, sample request test and a sample cucumber feature.

_It does not (at this time) include any Javascript testing framework._

Feel free to test your work however you think best. You do not need to use all of the test options, but you can if that's how you are most comfortable.

#### Running the tests

These can be run with a variety of options:

* run them all: `rake` (or `bundle exec rake`)
* run the cucumber features: `rake cucumber` (or `bundle exec rake cucumber`)
* run just the rspec tests: `rake spec` (or `bundle exec rake spec`)
* run a specific rspec test: `rspec spec/controllers/welcome_controller_spec.rb`

### GIT and commits

Your git workflow is not a primary focus of this exercise but please feel free to make/modify commits however you would normally when working on a codebase.

# Optional Bonus Features

If things are working well, after both phases of the feature are complete, you can decide to tackle some bonus features.

They are in no particular order. You could try one or multiple of them.

## Bonus Feature 1: Add some eye candy

This bonus feature involves using JS to add some fanciness to this app.

The fanciness could include any or all of these:

* Add a spinner/progress bar while the app is loading the data from Rails
* Add a pop-up modal to prevent resubmit while loading (maybe with a spinner or in place of one)
* Disable/lock the input field(s) upon submit
* Add some client-side validation: avoid sbumitting a blank form, or form with obviously bad/incomplete data
* Show/update the result with some fancy transition (fade in, slide in, whatever)


## Bonus Feature 2: Choose Units

This bonus feature involves letting the user choose the units: Celcius, Fahrenheit, and maybe even scientific (Kelvin). The unit chosen would be "remembered" between page loads so that the user doesn't have to re-choose it each time.

    Use case:
      As a visitor to the site
      When I submit a city and state via the form
      And choose unit X
      Then I should see the current weather for that city and state
      And the data should be using unit X
      And the current weather should include:
        - current condition
        - current temperature
        - current wind speed
        - current wind direction

    Use case:
      As a visitor to the site
      When I have previously chosen unit X
      And submitted the form previously
      And I reload the page
      Then it should still show the results with unit X


## Bonus Feature 3: Multiple APIs

This bonus feature is about introducing a 2nd (or 3rd, 4th?) weather API and allowing the visitor to choose:

    Use case:
      As a visitor to the site
      When visit the home page
      Then I can choose between weather provider X and weather provider Y

    Use case:
      As a visitor to the site
      When I submit a city and state via the form
      And choose API provider X
      Then I should see the current weather for that city and state
      And the data should be from provider X
      And the current weather should include:
        - current condition
        - current temperature
        - current wind speed
        - current wind direction

    Use case:
      As a visitor to the site
      When I submit a city and state via the form
      And choose API provider Y
      Then I should see the current weather for that city and state
      And the data should be from provider Y
      And the current weather should include:
        - current condition
        - current temperature
        - current wind speed
        - current wind direction

You could even consider offering a "show all" option and showing the weather from both (or many) providers!


## Bonus Feature 4: Caching Results - Server Side

This bonus feature involves implementing a server-side cache so that the results from city/state X are cached for up to 1 hour. If the user requests the same city/state within that 1 hour, it returns the cached results and does not call the API.

    Use case:
      As a visitor to the site
      When I have submitted the form for city/state X
      And it's been less than 1 hour since the API received data for city/state X
      And I submit the form for city/state X
      Then the data should be loaded from a server-side cache
      And the current weather should include:
        - current condition
        - current temperature
        - current wind speed
        - current wind direction

NOTE: this overlaps to some degree with Phase 2 but is a more general cache. This server-side cache would mean that any visitor requesting a city/state combination within 1 hour from when it was requested by any other visitor would receive the cached results.


## Bonus Feature 5: Forecast

This bonus feature involves pulling the forecast as well as current conditions and displaying that data in a nice, readable format

    Use case:
      As a visitor to the site
      When I submit a city and state via the form
      Then I should see the current weather for that city and state
      And I should see the current forecast for that city and state
      And the current weather should include:
        - current condition
        - current temperature
        - current wind speed
        - current wind direction
      And the current forecast for each day (next 7 days) should include:
        - high temperature
        - low temperature
        - condition
        - wind speed
        - wind direction
