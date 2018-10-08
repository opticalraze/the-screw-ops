switch (mpos)
{
    case 0:
    {
        room_goto(rm_map);
        break;
    }
    case 1:
    {
        room_goto(rm_create);
        break;
    }
    case 2:
    {
        room_goto(rm_options);
        break;
    }
    case 3:
    {
        room_goto(global.roomcamefrom);
        break;
    }
    default: break;
}
