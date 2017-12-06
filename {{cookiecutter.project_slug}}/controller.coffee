Backbone = require 'backbone'
Marionette = require 'backbone.marionette'
tc = require 'teacup'
ms = require 'ms'

ToolbarView = require 'tbirds/views/button-toolbar'
{ MainController } = require 'tbirds/controllers'
{ ToolbarAppletLayout } = require 'tbirds/views/layout'
navigate_to_url = require 'tbirds/util/navigate-to-url'
scroll_top_fast = require 'tbirds/util/scroll-top-fast'

MainChannel = Backbone.Radio.channel 'global'
MessageChannel = Backbone.Radio.channel 'messages'
ResourceChannel = Backbone.Radio.channel 'resources'
AppChannel = Backbone.Radio.channel 'todos'

toolbarEntries = [
  {
    button: '#list-button'
    label: 'List'
    url: '#{{ cookiecutter.project_slug }}'
    icon: '.fa.fa-list'
  }
  {
    button: '#calendar-button'
    label: 'Calendar'
    url: '#{{ cookiecutter.project_slug }}/calendar'
    icon: '.fa.fa-calendar'
  }
  ]


toolbarEntryCollection = new Backbone.Collection toolbarEntries
AppChannel.reply 'get-toolbar-entries', ->
  toolbarEntryCollection

class Controller extends MainController
  layoutClass: ToolbarAppletLayout
  setup_layout_if_needed: ->
    super()
    toolbar = new ToolbarView
      collection: toolbarEntryCollection
    @layout.showChildView 'toolbar', toolbar

  view_index: ->
    @setup_layout_if_needed()
    # https://jsperf.com/bool-to-int-many
    completed = completed ^ 0
    require.ensure [], () =>
      View = require './views/index-view.coffee'
      view = new View
      @layout.showChildView 'content', view
    # name the chunk
    , '{{ cookiecutter.project_slug }}-view-index'
      
module.exports = Controller

