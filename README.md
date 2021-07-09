# Environments
* [arch](./arch)
* [ubuntu / master](./ubuntu)
    ./run.sh "mypassword" "/src/of/opensnitch_repo"

## General Structure
```
cd <folder>/
./build.sh
./run.sh "mypassword"
# or specify geometry
GEOMETRY=1920x1024 ./run.sh "mypassword"
# connect with vnc client of choice
krdc vnc://localhost:5900
```
