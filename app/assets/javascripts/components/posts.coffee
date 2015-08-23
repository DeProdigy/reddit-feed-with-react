@Posts = React.createClass
  getDefaultProps: ->
    pinned_posts: []

  getInitialState: ->
    all_posts: [],
    pinned_posts: @props.pinned_posts

  populatePosts: (posts) ->
    @setState all_posts: posts.map (post) ->
      post.reddit_id = post.id
      post

  fetchPosts: ->
    $.ajax
      method: 'GET'
      url: 'https://www.reddit.com/search.json?q=react.js'
      dataType: 'JSON'
      success: (response) =>
        @populatePosts response.data.children.map (child) -> child.data
      error: (response) =>
        alert("Couldn't fetch the posts")

  pinPost: (post) ->
    $.ajax
      method: 'POST'
      url: '/posts'
      dataType: 'JSON'
      data:
        post: post
      success: (response) =>
        new_pinned_posts = @state.pinned_posts.concat [post]
        @setState pinned_posts: new_pinned_posts
      error: (response) =>
        alert("Couldn't save the pinned post")

  unPinPost: (post) ->
    $.ajax
      method: 'DELETE'
      url: '/posts/' + post.reddit_id
      dataType: 'JSON'
      success: (response) =>
        new_pinned_posts = @state.pinned_posts.filter (pinned_post) -> pinned_post.reddit_id  != post.reddit_id
        @setState pinned_posts: new_pinned_posts
      error: (response) =>
        alert("Couldn't delete the pinned post")

  componentDidMount: ->
    @fetchPosts()
    setInterval @fetchPosts, 30000

  componentWillUnmount: ->
    clearInterval @fetchPosts

  is_disabled: (post) ->
    pinned_posts = @state.pinned_posts.filter (pinned_post) -> pinned_post.reddit_id == post.reddit_id
    pinned_posts.length > 0

  renderPinnedPosts: (posts) ->
    posts.map (post) =>
      React.createElement Post, key: "pinned-#{post.reddit_id}", onClick: @unPinPost, post: post, pinned: true

  renderPosts: (posts) ->
    posts.map (post) =>
      disabled = @is_disabled(post)
      React.createElement Post, key: post.reddit_id, onClick: @pinPost, post: post, disabled: disabled

  render: ->
    React.DOM.div
      className: 'container'
      React.DOM.div null,
        React.DOM.h1
          className: 'title'
          'Pinned Posts'
        @renderPinnedPosts @state.pinned_posts
      React.DOM.div null,
        React.DOM.h1
          className: 'title'
          'All Posts'
        @renderPosts @state.all_posts