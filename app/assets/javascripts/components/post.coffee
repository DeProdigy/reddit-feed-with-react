@Post = React.createClass
  getDefaultProps: ->
    pinned: false
    disabled: false
    post: null
    onClick: ->

  handleClick: ->
    @props.onClick @props.post

  buttonName: ->
    if @props.pinned
      'Unpin'
    else
      if @props.disabled
        'Already Pinned'
      else
        'Pin it'

  render: ->
    React.DOM.div
      className: 'card'
      React.DOM.h3
        className: 'post-item post-title'
        "#{@props.post.title}"
      React.DOM.p
        className: 'post-item post-score'
        "Score: #{@props.post.score}"
      React.DOM.a
        className: 'post-item post-permalink'
        target: 'blank'
        href: "https://www.reddit.com#{@props.post.permalink}"
        'Link to Reddit'
      React.DOM.br null,
      React.DOM.a
        className: 'post-item post-outbound-link'
        target: 'blank'
        href: @props.post.url
        'Outbound Link'
      React.DOM.br null,
      React.DOM.img
        className: 'post-item post-thumbnail'
        src: @props.post.thumbnail
      React.createElement PostComment, post_url: "https://www.reddit.com#{@props.post.permalink}"
      React.DOM.button
        type: 'submit'
        className: if @props.disabled then 'button button-disabled' else 'button'
        disabled: @props.disabled
        onClick: @handleClick
        @buttonName()