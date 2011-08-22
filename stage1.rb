class CLeverDashMan < Character
  def init
    @max_speed = 4
    @accel = 0.1
  end

  def move
    if Input.x > 0
      # 右に入力があれば加速
      @vx += Input.x * @accel
    elsif Input.x < 0
      # 左に入力があれば減速
      @vx += Input.x * @accel * 2
    else
      # 入力がなかったら緩やかに減速
      @vx -= @accel * 1/2
    end

    @vx = 0 if @vx < 0
    @vx = @max_speed if @vx > @max_speed

    @x += @vx
  end
end
