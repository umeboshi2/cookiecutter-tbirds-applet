import Backbone from 'backbone'
import Marionette from 'backbone.marionette'
import AppRouter from 'marionette.approuter'
import TkApplet from 'tbirds/tkapplet'
import capitalize from 'tbirds/util/capitalize'

import Controller from './controller'

appName = '{{ cookiecutter.project_slug }}'

MainChannel = Backbone.Radio.channel 'global'
AppChannel = Backbone.Radio.channel appName


appletMenu = [
  {
    label: 'List'
    url: '#{{ cookiecutter.project_slug }}'
    icon: '.fa.fa-list'
  }
  {
    label: 'Calendar'
    url: '#{{ cookiecutter.project_slug }}/calendar'
    icon: '.fa.fa-calendar'
  }
  ]

class Router extends AppRouter
  appRoutes:
    '{{ cookiecutter.project_slug }}': 'viewIndex'
    
class Applet extends TkApplet
  Controller: Controller
  Router: Router
  appletEntries: [
    {
      label: "#{capitalize appName} Menu"
      menu: appletMenu
    }
  ]

export default Applet
