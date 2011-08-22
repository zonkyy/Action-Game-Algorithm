class Character
  def initialize
    @x = 0
    @y = 0
    @vx = 0
    @vy = 0
    create_image
    init
  end

  def create_image
    @image = Image.load("texture/Man.png")
  end

  def move
  end

  def update
    move
  end

  def render
    Window.drawScale(@x, @y, @image, SCALE, SCALE)
  end
end
