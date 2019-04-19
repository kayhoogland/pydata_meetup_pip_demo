# Pip require virtualenv trick

Add the following lines to your bash_profile

```dot
export PIP_REQUIRE_VIRTUALENV=true

gpip() {
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}
```
