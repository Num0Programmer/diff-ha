use fmt;
use io;
use os;
use strings;

export fn main() void = {
    const path = os::args[1];
    const fh = os::open(path)!;

    const other_path = os::args[2];
    const other_fh = os::open(other_path)!;

    fmt::printfln("Comparing file '{}' to '{}'", path, other_path)!;
    compare_files(fh, other_fh);
};


fn compare_files(lhh: io::handle, rhh: io::handle) uint = {
    const lhh_contents = io::drain(lhh)!;
    const lhh_contents = strings::fromutf8(lhh_contents)!;

    const rhh_contents = io::drain(rhh)!;
    const rhh_contents = strings::fromutf8(rhh_contents)!;


    return 0;
};
