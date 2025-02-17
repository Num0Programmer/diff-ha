use fmt;
use io;
use os;
use strings;

export fn main() void = {
    const path = os::args[1];
    const fh = os::open(path)!;
    const file_contents = io::drain(fh)!;
    const file_contents = strings::fromutf8(file_contents)!;

    const other_path = os::args[2];
    const other_fh = os::open(other_path)!;
    const other_file_contents = io::drain(other_fh)!;
    const other_file_contents = strings::fromutf8(other_file_contents)!;

    fmt::printfln("Comparing file '{}' to '{}'", path, other_path)!;
};


fn compare() uint = {
    return 0;
};
