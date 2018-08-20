The  PHP function is basically just (translated to D):

string date(string format, time_t timestamp) {
    char[256] buffer;
    auto ret = strftime(buffer.ptr, buffer.ptr, toStringz(format), gmtime(&timestamp);
    return buffer[0 .. ret].idup;
}


in other words, it is a thin wrapper around the C function.

Let's see, how do we get a time_t out of D's std.datetime?

http://dpldocs.info/locate?q=time_t

The SysTime "toUnixTime" looks good:

http://dpldocs.info/experimental-docs/std.datetime.SysTime.toUnixTime.html



So an overload might be


string date(string format, SysTime time) {
    date(format, time.toUnixTime());
}