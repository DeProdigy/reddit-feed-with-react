@Posts = React.createClass
  getDefaultProps: ->
    pinned_posts: []

  getInitialState: ->
    all_posts: []

  populatePosts: (posts) ->
    @replaceState all_posts: posts

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

  unpinPost: (post) ->
    posts = @props.pinned_posts.slice()
    index = posts.indexOf post
    posts.splice index, 1
    @replaceProps pinned_posts: posts


  pinPost: (post) ->
    posts = @props.pinned_posts.slice()
    posts.push post
    @replaceProps pinned_posts: posts

  render: ->
    React.DOM.div null,
      React.DOM.div null,
        React.DOM.h1
          className: 'title'
          'Pinned Posts'
        for post, index in @props.pinned_posts
          React.createElement PinnedPost, key: index, unpinPost: @unpinPost, post: post
      React.DOM.div null,
        React.DOM.h1
          className: 'title'
          'All Posts'
        for post, index in @state.all_posts
          React.createElement Post, key: index, pinPost: @pinPost, post: post.data