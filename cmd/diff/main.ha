use bufio;
use fmt;
use os;
use strings;

export fn main() void = {
    fmt::println("Enter 2 files to compare:")!;
    const path = bufio::read_line(os::stdin)! as []u8;
    const other_path = bufio::read_line(os::stdin)! as []u8;
    const path = strings::fromutf8(path)!;
    const other_path = strings::fromutf8(other_path)!;
    fmt::printfln("Comparing file '{}' to '{}'", path, other_path)!;
};
