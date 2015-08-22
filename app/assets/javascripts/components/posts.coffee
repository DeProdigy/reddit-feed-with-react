@Posts = React.createClass
	getInitialState: ->
    posts: []

  populatePosts: (posts) ->
    @replaceState posts: posts

  componentDidMount: ->
  	$.ajax
      method: 'GET'
      url: 'https://www.reddit.com/search.json?q=react.js'
      dataType: 'JSON'
      success: (data) =>
        @populatePosts data.data.children
      error: (data) =>
        alert("Well that didn't work as expected")

  render: ->
    React.DOM.div null,
      React.DOM.h2
        className: 'title'
        'Posts'
      for post, index in @state.posts
        do (post, index) ->
          React.createElement Post, key: index, post: post.data