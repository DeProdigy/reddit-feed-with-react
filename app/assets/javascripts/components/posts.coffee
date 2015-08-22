@Posts = React.createClass
  getInitialState: ->
    posts: []

  populatePosts: (posts) ->
    @replaceState posts: posts

  fetchPosts: ->
    $.ajax
      method: 'GET'
      url: 'https://www.reddit.com/search.json?q=react.js'
      dataType: 'JSON'
      success: (response) =>
        @populatePosts response.data.children
      error: (response) =>
        alert("Couldn't fetch the posts")

  componentDidMount: ->
    @fetchPosts()
    setInterval(@fetchPosts, 30000)

  render: ->
    React.DOM.div null,
      React.DOM.h1
        className: 'title'
        'Posts'
      for post, index in @state.posts
        do (post, index) ->
          React.createElement Post, key: index, post: post.data