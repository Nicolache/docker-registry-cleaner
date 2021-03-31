# docker-registry-cleaner
Tool to leave only a few latest images in docker regestry
### Usage:  
 * set root variable that could be something like /var/lib/registry/docker/registry/v2/repositories so your repos were right in there  
 * set filter paths_filter to start with some not crusial repos  
 * set the number to leave to each image (like '-3' - leave 3 latest builds)
here  
```
delrevs=`ls -1tr | head -n -3`
```
and here
```
deltags=`ls -1tr | head -n -3`
```
 * think twice  
 * launch  
```
./registry-clean.sh
```
