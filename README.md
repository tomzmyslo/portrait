# Portrait with Full User Security

For my enhancements to the Portrait app, I picked to boost the user security of the app. With the goal of turning Portrait into a scalable business, I figured that would be the best place to start. I also chose this enhancement because of my past work designing the UX in previous apps I've worked on.

### My Process

There was one change I made from the start and that was to not use HAML and switch back to regular ERB templates. I made this decision for the sake of timing, ease of use and personal preference on my part.

After changing the templating language, I broke the process into the following pieces:

* Setup Bootstrap to provide UI pieces that would be required
* Changed the Bootstrap primary color to keep the brand green color
* Add jQuery gem for Bootstrap dependencies
* Overhauled the `User` MVC pieces and implemented `:has_secure_password`
* Added `strong_parameters` to the `User` and `Site` controllers
* Added an `:admin` boolean attribute to the `User` model
* Added an `/admin` namespace to better separate the administration layer from regular users
* Added `:current_user` helper method
* Added basic authorization constraints for being logged in and if a user was an administrator
* Updated the test suite to pass for the above changes

### Timing & Roadblocks

For timing, I chose to put in around 8-10 hours into the task. My thought was to mimic a regular work day and for the most part I think I came in pretty close to that timeframe implementing the above features (I did split it up over a few days however).

The only roadblock in my timing was understanding the test suite, updating it and getting everything back to green. There are a couple of tests commented out because I didn't get to implement my updates for those pieces.

And that brings me to the couple features that didn't make it into the update that would have really completed the user security picture. I wanted to mention them because I did give thought to how I would implement them but ultimately just ran out of time and they were relegated to the fictional "Day 2".

1. **Forgot My Password**\
Basic functionality through email that includes a single-use link that expires in a predetermined amount of time.

2. **API Namespace & Versioning**\
Like it's `/admin` counterpart, the `/api` namespace would better separate pure JSON API calls from the main site UI code plus have the options to add versioning `/api/v1` for future proofing.

3. **Thumbnail Variants**\
I wanted to implement thumbnail variants to use in the main UI to allow the user to more quickly navigate their site portraits and provide and overall better experience.

### Added Gems/Non-Original Code

* bcrypt
* bootstrap
* friendly_id
* jquery-rails
* will_paginate-bootstrap4
