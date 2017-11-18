///scr_f_key
if (place_meeting(x,y,obj_player))
{
    if (!instance_exists(obj_f_key))
    {
        instance_create(x+16,y-8,obj_f_key)
    }
}
else
{
    if (instance_exists(obj_f_key))
    {
        instance_destroy(obj_f_key)
    }
}
