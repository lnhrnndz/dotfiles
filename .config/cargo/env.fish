#!/bin/fish
# rustup shell setup
# affix colons on either side of $PATH to simplify matching
switch ":$PATH:"
    case "*:$HOME/.cargo/bin:*"
    case '*'
        # Prepending path in case a system-installed rustc needs to be overridden
        export PATH="$HOME/.cargo/bin:$PATH"
end
