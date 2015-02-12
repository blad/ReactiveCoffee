React = require 'react'

# TodoList Component
TodoList = React.createClass
  displayName: "TodoList",
  render: ->
    createItem = (itemText) -> React.createElement "li", null, itemText
    React.createElement "ul", null, @props.items.map(createItem)

# TodoApp Component.
TodoApp = React.createClass

  displayName: "TodoApp"

  getInitialState: ->
    items: [], text: ''

  onChange: (e) ->
    @setState {text: e.target.value}

  handleSubmit: (e) ->
    e.preventDefault();
    nextItems = @state.items.concat [@state.text]
    nextText = ''
    @setState {items: nextItems, text: nextText}

  render: ->
    React.createElement "div", null,
      React.createElement("h3", null, "TODO"),
      React.createElement(TodoList, {items: @state.items}),
      React.createElement("form", {onSubmit: @handleSubmit},
        React.createElement("input", {onChange: @onChange, value: @state.text}),
        React.createElement("button", null, 'Add #' + (@state.items.length + 1)))

window.onload = ->
  React.render(React.createElement(TodoApp, null), document.getElementById('container'))
