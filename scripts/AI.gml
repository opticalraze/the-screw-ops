if (Direction = "Right")
{ if (place_free(x + 2,y)) && (place_meeting(x + 2,y + 1, obj_floor))
    { hspeed = 2
      image_xscale = -1  
    }  else
        {  
            Direction = "Left"
            hspeed = 0
        }
}


if (Direction = "Left")
{ if (place_free(x - 2,y)) && (place_meeting(x - 2,y, obj_floor))
    { hspeed = -2
      image_xscale = 1   
    }else
        {  
            Direction = "Right"
            hspeed = 0
        }
}


