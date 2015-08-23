@Post = React.createClass
  getDefaultProps: ->
    pinned: false
    disabled: false
    post: null
    onClick: ->

  handleClick: ->
    @props.onClick @props.post

  render: ->
    React.DOM.div
      className: 'card'
      React.DOM.h3
        className: 'post-item post-title'
        "Title: #{@props.post.title}"
      React.DOM.p
        className: 'post-item post-score'
        "Score: #{@props.post.score}"
      React.DOM.a
        className: 'post-item post-permalink'
        target: 'blank'
        href: "https://www.reddit.com#{@props.post.permalink}"
        'Link to Reddit'
      React.DOM.a
        className: 'post-item post-outbound-link'
        target: 'blank'
        href: @props.post.url
        'Outbound Link'
      React.DOM.img
        className: 'post-item post-thumbnail'
        src: @props.post.thumbnail
      React.createElement PostComment, post_url: "https://www.reddit.com#{@props.post.permalink}"
      React.DOM.button
        type: 'submit'
        className: if @props.disabled then 'button button-disabled' else 'button'
        disabled: @props.disabled
        onClick: @handleClick
        if @props.pinned then 'Unpin...' else 'Pin!'