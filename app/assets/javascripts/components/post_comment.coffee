@PostComment = React.createClass
  getDefaultProps: ->
    post_url: ''

  getInitialState: ->
    top_comment: @nullComment()

  nullComment: ->
    {
      score: 0,
      author: '',
      body: ''
    }

  populateComments: (comment) ->
    @replaceState top_comment: comment

  commentsUrl: ->
    @props.post_url.split('?')[0] + ".json?sort=top"

  componentWillMount: ->
    $.ajax
      method: 'GET'
      url: @commentsUrl()
      dataType: 'JSON'
      success: (response) =>
        @populateComments if response[1].data.children[0] then response[1].data.children[0].data else @nullComment()
      error: (response) =>
        alert("Couldn't fetch the comments")

  render: ->
    React.DOM.div null,
      React.DOM.h4
        className: 'post-item post-comment-author'
        "Comment Author: #{@state.top_comment.author}"
      React.DOM.p
        className: 'post-item post-comment-body'
        "Comment Body: #{@state.top_comment.body}"
      React.DOM.h6
        className: 'post-item post-comment-score'
        "Comment Score: #{@state.top_comment.score}"

