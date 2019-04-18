This repository contains the code to reproduce the demo I gave during the Pydata Meetup on the 18th of April 2019.

# Pip require virtualenv trick

Add the following lines to your bash_profile

```dot
export PIP_REQUIRE_VIRTUALENV=true

gpip() {
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
```
