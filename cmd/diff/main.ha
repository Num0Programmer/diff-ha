use fmt;
use io;
use os;
use strings;


const DELIM = "\n";


export fn main() void = {
    const path = os::args[1];
    const fh = os::open(path)!;

    const other_path = os::args[2];
    const other_fh = os::open(other_path)!;

    fmt::printfln("Comparing file '{}' to '{}'\n", path, other_path)!;
    compare_files(fh, other_fh);
};


fn compare_files(lhh: io::handle, rhh: io::handle) uint = {
    // get lines from left hand file provided
    const lhh_contents = io::drain(lhh)!;
    const lhh_contents = strings::fromutf8(lhh_contents)!;
    const lhh_lines = strings::split(lhh_contents, DELIM)!;
    const lhh_num_lines = len(lhh_lines);
    // get lines from right hand file provided
    const rhh_contents = io::drain(rhh)!;
    const rhh_contents = strings::fromutf8(rhh_contents)!;
    const rhh_lines = strings::split(rhh_contents, DELIM)!;
    const rhh_num_lines = len(rhh_lines);


    for (let i = 0z; i < lhh_num_lines && i < rhh_num_lines; i += 1) {
        if (lhh_lines[i] != rhh_lines[i]) {
            fmt::printfln("< {}", lhh_lines[i])!;
            fmt::println("---")!;
            fmt::printfln("> {}\n", rhh_lines[i])!;
        };
    };

    return 0;
};
