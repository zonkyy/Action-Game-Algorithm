#!ruby -Ks
require 'dxruby'
require 'scene'
require 'character'
require 'stage1'


DEMO = CLeverDashMan
SCALE = 0.2

class DemoScene < Scene::Base
  def init
    @player = DEMO.new
  end

  def update
    @player.update
  end

  def render
    @player.render
  end
end

Window.width = 1280
Window.height = 720
Scene.main_loop DemoScene
