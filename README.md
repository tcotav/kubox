## kubox

Simple utility/troubleshooting container to drop into a kubernetes cluster for troubleshooting.  Inspired by toolbox for CoreOS.

## Build

Modify the Dockerfile to add whatever additional utilities you want to use.  Based on alpine linux. Here are the [available packages](http://pkgs.alpinelinux.org/packages).

Build as you like -- the `build.sh` script included creates my image, tcotav/kubox.

## Run

The `run.sh` script is included for local troubleshooting (i.e. outside the k8s cluster).

`kubox.sh` is the script to launch a pod inside of your kubernetes cluster.  If you look inside the script, we do a `kubectl run`.  It is assumed you've got all your kubectl configuration working. 
   
You'll be dumped on to a sh prompt and you can go about your business.  `exit` as you would any other shell to get out of container.  You will get prompted with the command to use to clean up after yourself.

*Note* that kubox uses my image on dockerhub -- tcotav/kubox.  If your org is sensitive about external images, build and push to your repo and then change the `IMAGE` variable in the `kubox.sh` script.

