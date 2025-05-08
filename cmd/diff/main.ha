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
    // iteration
    let lhh_i = 0z;
    let rhh_i = 0z;
    let cmp_res = 0i;
    let rhh_mis_buffer: []*str = [];
    let lhh_mis_buffer: []*str = [];


    for (let i = 0z; lhh_i < lhh_num_lines && rhh_i < rhh_num_lines; i += 1) {
        for (let j = 0z;
                rhh_i < rhh_num_lines && lhh_i < lhh_num_lines;
                j += 1) {
            cmp_res = strings::compare(rhh_lines[rhh_i], lhh_lines[lhh_i]);
            if (cmp_res < 0) {
                append(rhh_mis_buffer, &rhh_lines[rhh_i])!;
                rhh_i += 1;
            } else if (cmp_res > 0) {
                append(lhh_mis_buffer, &lhh_lines[lhh_i])!;
                lhh_i += 1;
            } else {
                break;
            };
        };
        if (len(rhh_mis_buffer) > 0 && len(lhh_mis_buffer) > 0) {
            for (let j = 0z; j < len(lhh_mis_buffer); j += 1) {
                fmt::printfln("< {}", *lhh_mis_buffer[j])!;
            };
            fmt::println("---")!;
            for (let j = 0z; j < len(rhh_mis_buffer); j += 1) {
                fmt::printfln("> {}", *rhh_mis_buffer[j])!;
            };
            for (let j = 0z; j < len(rhh_mis_buffer); j += 1) {
                delete(rhh_mis_buffer[j]);
            };
            for (let j = 0z; j < len(lhh_mis_buffer); j += 1) {
                delete(lhh_mis_buffer[j]);
            };
        };

        lhh_i += 1;
        rhh_i += 1;
    };

    free(rhh_mis_buffer);
    free(lhh_mis_buffer);

    return 0;
};
