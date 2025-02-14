use bufio;
use fmt;
use os;
use strings;

export fn main() void = {
    const path = os::args[1];
    const other_path = os::args[2];
    fmt::printfln("Comparing file '{}' to '{}'", path, other_path)!;
};
