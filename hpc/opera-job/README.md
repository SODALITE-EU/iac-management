# Usage

Assuming the xOpera was installed in a venv (see instruction [here](https://github.com/xlab-si/xopera-opera)) 

```
(.venv) $ . opera.rc
(.venv) $ make
(.venv) $ make deploy
(.venv) $ make outputs-yaml
(.venv) $ make outputs-json
(.venv) $ make clean
```

# Notes

When specifying implemetation playbooks for the interfaces, xOpera copies them to the /tmp location, therefore the absolute paths to the artifacts and library templates were hardcoded.

In the next releases when it will be fixed, the library will be changed