# Use-cases

Use `make` commands to copy `modules` folder containing generic SODALITE types into use-cases folders. Examples are outlined below:

```bash
make clinical # copies modules that are relevant only to Clinical Trials UC 
make vehicle # copies modules that are relevant only to Vehicle IoT UC 
make snow # copies modules that are relevant only to Snow UC
make all # copies modules to all use-cases
```

To clean up, use the following `make` commands:

```bash
make clean-clinical # deletes modules from Clinical Trials UC 
make clean-vehicle # deletes modules from Vehicle IoT UC 
make clean-snow # deletes modules from Snow UC
make clean-all # deletes modules from all use-cases
```