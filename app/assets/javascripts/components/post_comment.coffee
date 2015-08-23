@PostComment = React.createClass
  getDefaultProps: ->
    post_url: ''

  getInitialState: ->
    top_comment: null

  populateComments: (comment) ->
    @setState top_comment: comment

  commentsUrl: ->
    @props.post_url.split('?')[0] + ".json?sort=top"

  componentDidMount: ->
    $.ajax
      method: 'GET'
      url: @commentsUrl()
      dataType: 'JSON'
      success: (response) =>
        @populateComments if response[1].data.children[0] then response[1].data.children[0].data
        $('.post-comment-body').readmore({
          speed: 600,
          collapsedHeight: 80
        });
      error: (response) =>
        alert("Couldn't fetch the comments")

  renderComment: ->
    React.DOM.div null,
      React.DOM.p
        className: 'post-item post-comment-body'
        "Top Comment: #{@state.top_comment.body}"
      React.DOM.h4
        className: 'post-item post-comment-author'
        "- #{@state.top_comment.author}"
      React.DOM.h6
        className: 'post-item post-comment-score'
        "Top Comment Score: #{@state.top_comment.score}"

  renderNoComment: ->
    React.DOM.div null,
      "no comments..."

  render: ->
    if @state.top_comment
      @renderComment()
    else
      @renderNoComment()