/// log(arg0, [arg1, ...])
if (argument_count > 0) {
    var msg = string(argument[0]), i;
    for (i = 1; i < argument_count; i++) {
        msg += ", " + string(argument[i])
    }
    show_debug_message(msg)
}
