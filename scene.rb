require 'dxruby'

module Scene
  class Exit
  end

  class Base
    attr_accessor :next_scene
    attr_reader :frame_counter

    def initialize
      @next_scene = nil
      @frame_counter = 0
      init
    end

    def __update
      @frame_counter += 1
      update
    end
    private :__update

    def init
    end

    def quit
    end

    def update
    end

    def render
    end
  end

  def self.main_loop(scene_class, fps = 60, step = 1)
    scene = scene_class.new
    default_step = step

    Window.loop do
      if Input.keyPush?(K_PGDN)
        step += 1
        Window.fps = fps * default_step / step
      end

      if Input.keyPush?(K_PGUP) and step > default_step
        step -= 1
        Window.fps = fps * default_step / step
      end

      step.times do
        break if scene.next_scene
        scene.__send__ :__update
      end

      scene.render

      if scene.next_scene
        scene.quit
        break if Exit == scene.next_scene
        scene = scene.next_scene.new
      end
    end
  end
end
