# Setup

`bundle`

`rake db:create`

## Start
`rails s`

### Task

Your task is to build a simple app that will monitor Reddit for relevant links being posted based on a specific search term. 

At Fundera we are using a mix of React and Ruby on Rails, so if possible it would be great if you use React.JS for this example, but is ok if you would rather use Angular/Ember/raw (but clean) jQuery.

You can access the JSON endpoint here:

http://www.reddit.com/search.json?q=react.js [where the 'q' parameter is the search term']

You will also need an endpoint to collect comments for an existing article. You can poll the comments like so:

http://www.reddit.com/r/javascript/comments/2yn5ww/i_made_a_thing_react_013_immutablejs_and_es6_via/.json

### Functionality

- Poll the JSON endpoint with a given interval (say 30 seconds)
- Every time the endpoint is polled, re-render a list of results sorted by newest first based on the search query
- Each link item should show:
  - Title
  - Score
  - Outbound Link
  - Link to Reddit discussion
  - Thumbnail if available
  - The comment body and creator with the highest score for that article
  - .. anything else you think is relevant
- A visitor should have the ability to "pin" an item. Pinned items show at the top of the list at all times and are not displaced by the scheduled refreshes. The "Pin" can show as an icon image, star, etc.
  - When the pin is activated, it should persist to a Rails backend into a database table.
  - If the page is refreshed, the pins should stay where they are.

### Design

- Layout should be responsive and able to be viewed on both a phone and large desktop screen
- Gridding: Feel free to use Bootstrap / Flexbox / etc., whatever you think is appropriate
- Styling: Whatever you think is appropriate.

### Deliverables

Send us an archive of the project by end of day. Also please include a README to start the app.