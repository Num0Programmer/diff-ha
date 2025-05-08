use fmt;
use io;
use os;


export fn main() void = {
    let num = 4;
    inc(&num);
    inc(&num);
    fmt::printfln("num = {}", num)!;
    inc(&num);
    fmt::printfln("num = {}", num)!;
};

fn inc(num: *int) void = {
    *num += 1;
};
