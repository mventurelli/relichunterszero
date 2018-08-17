//homage to Mark Venturelli, who loves bit operations
//from http://graphics.stanford.edu/~seander/bithacks.html

v = argument[0];

v--;
v |= v >> 1;
v |= v >> 2;
v |= v >> 4;
v |= v >> 8;
v |= v >> 16;
v++;

return v;