class Buoy
{
  PVector o, pos, f = new PVector(0, 0);
  Buoy(float p_x, float p_y)
  {
    o = new PVector(p_x, p_y);
    pos = o.get();
  }

  void move()
  {
    f.mult(.92);
    PVector tmpv;
    float d = PVector.dist(pos, m);
    if (d < 6) d = 6;//prevent erratic behavior
    if (d < maxD)//buoy is disturbed by the mouse
    {
      tmpv = m.get();
      tmpv.sub(pos);
      float a = 0.0083 * cos(map(d, 0, maxD, 0, HALF_PI));
      tmpv.mult((mousePressed ? 1 : -1) * a * 100 / d);
      f.add(tmpv);
    }
    //buoy is attracted to its original position
    tmpv = o.get();
    tmpv.sub(pos);
    tmpv.mult(.03);
    f.add(tmpv);   
    pos.add(f);
  }
}