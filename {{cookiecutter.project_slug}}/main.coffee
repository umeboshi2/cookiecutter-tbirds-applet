Backbone = require 'backbone'
Marionette = require 'backbone.marionette'
TkApplet = require 'tbirds/tkapplet'

Controller = require './controller'

MainChannel = Backbone.Radio.channel 'global'
AppChannel = Backbone.Radio.channel '{{ cookiecutter.project_slug }}'

class Router extends Marionette.AppRouter
  appRoutes:
    '{{ cookiecutter.project_slug }}': 'view_index'
    
class Applet extends TkApplet
  Controller: Controller
  Router: Router

module.exports = Applet
