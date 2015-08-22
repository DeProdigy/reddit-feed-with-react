@PinnedPost = React.createClass
  getDefaultProps: ->
    post: ''

  handleUnpinPost: ->
    @props.unpinPost @props.post

  render: ->
    React.DOM.div null,
      React.DOM.h2
        className: 'title'
        @props.post.title
      React.DOM.button
        type: 'submit'
        onClick: @handleUnpinPost
        'unpin'