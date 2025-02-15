use fmt;
use strconv;

export fn main() void = {
    const byte_hello = strconv::stou8("Hello world!", strconv::base::BIN)!;
    fmt::bsprint(byte_hello)!;
};
