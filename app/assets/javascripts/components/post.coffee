@Post = React.createClass
	getDefaultProps: ->
		post: ''

	render: ->
    React.DOM.div null,
    	React.DOM.h4
    		className: 'post-item post-title'
    		@props.post.title
    	React.DOM.p
    		className: 'post-item post-score'
    		@props.post.score
    	React.DOM.a
    		className: 'post-item post-permalink'
    		target: 'blank'
    		href: "http://www.reddit.com#{@props.post.permalink}"
    		'Link to Reddit'
    	React.DOM.a
    		className: 'post-item post-outbound-link'
    		target: 'blank'
    		href: @props.post.url
    		'Outbound Link'
    	React.DOM.img
    		className: 'post-item post-thumbnail'
    		src: @props.post.thumbnail