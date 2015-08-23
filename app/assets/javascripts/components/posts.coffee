@Posts = React.createClass
  getDefaultProps: ->
    pinned_posts: []

  getInitialState: ->
    all_posts: [],
    pinned_posts: @props.pinned_posts

  populatePosts: (posts) ->
    @setState all_posts: posts

  fetchPosts: ->
    $.ajax
      method: 'GET'
      url: 'https://www.reddit.com/search.json?q=react.js'
      dataType: 'JSON'
      success: (response) =>
        @populatePosts response.data.children.map (child) -> child.data
      error: (response) =>
        alert("Couldn't fetch the posts")

  componentDidMount: ->
    @fetchPosts()
    setInterval @fetchPosts, 30000

  componentWillUnmount: ->
    clearInterval @fetchPosts

  removePinnedPosts: (posts) ->
    filteredAllPosts = @state.all_posts.filter (post) => posts.indexOf(post) >= 0
    @setState all_posts: filteredAllPosts

  unPinPost: (post) ->
    # ajax delete to Rails
    newPinnedPosts = @state.pinned_posts.filter (pinnedPost) -> pinnedPost.id  != post.id
    @setState pinned_posts: newPinnedPosts

  pinPost: (post) ->
    # ajax post to Rails
    newPinnedPosts = @state.pinned_posts.concat [post]
    @setState pinned_posts: newPinnedPosts

  renderPinnedPosts: (posts) ->
    posts.map (post) =>
      React.createElement Post, key: "pinned-#{post.id}", onClick: @unPinPost, post: post, pinned: true

  renderPosts: (posts) ->
    posts.map (post) =>
      React.createElement Post, key: post.id, onClick: @pinPost, post: post

  render: ->
    React.DOM.div null,
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