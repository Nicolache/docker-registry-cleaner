#/bin/bash

#root=/mnt/home/nik/73G/docker/registry/v2/repositories
root=/var/lib/registry/docker/registry/v2/repositories
maxdepth=4
maxdepthrev=5
paths_filter='crm-stage'

cd $root
revdirs=`find -maxdepth $maxdepthrev -type d -name "sha256" | grep _manifests | grep $paths_filter`
echo $revdirs
tagdirs=`find -maxdepth $maxdepth -type d -name "tags" | grep $paths_filter`
echo $tagdirs

for dir in $revdirs
do
  cd $root
  cd $dir
  echo $dir
  ls -1tr
  delrevs=`ls -1tr | head -n -3`
  echo $delrevs
  for hash in $delrevs
  do
    rm -rf $hash
    echo $hash
  done
  echo '\n'
done

for dir in $tagdirs
do
  cd $root
  cd $dir
  echo $dir
  ls -1tr
  deltags=`ls -1tr | head -n -3`
  echo $deltags
  for hash in $deltags
  do
    rm -rf $hash
    echo $hash
  done
  echo '\n'
done

registry garbage-collect /etc/docker/registry/config.yml
