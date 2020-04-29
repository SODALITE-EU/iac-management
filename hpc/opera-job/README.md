# Usage

```
$ . opera.rc
$ make
$ make deploy
$ make outputs-yaml
$ make outputs-json
$ make clean
```

# Notes

When specifying implemetation playbooks for the interfaces, xOpera copies them to the /tmp location, therefore the absolute paths to the artifacts and library templates were hardcoded.

In the next releases when it will be fixed, the library will be changed