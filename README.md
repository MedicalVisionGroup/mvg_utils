# mvg_utils

#### Commonly used commands

```
squeue -u wpq
squeue --format="%.18i %.9P %.30j %.8u %.8T %.10M %.9l %.6D %R"

scancel -j <jobid>
scancel -n <jobname>

sinfo
sinfo --summarize
sinfo --node <nodename> --long
```

#### FAQ

**What are the specifications of the machines in the cluster?**

Details in [GroupMachines](https://projects.csail.mit.edu/cgi-bin/wiki/view/Gollandgrp/GroupMachines). Some points: 
- `basil` is the cluster master node.
- `turmeric` is a GPU machine that Maz took off cluster for personal use.

**How to revive a machine that is down?**

If a machine is down, try to reboot the machines remotely. If ssh hangs, ask TIG to manually reboot the machines, with a hard press, by emailing `help@csail.mit.edu` with the node names. The rebooted machines has drain slurm state, use `scontrol` to set the state to idle.

```
# Check for machine that is down
sinfo | grep down
# Fix drained node
sinfo | grep drain
sudo scontrol update nodename=<nodename> state=idle
```

**How to check which machine has nvml driver/library version mismatch error?**

After CUDA driver is updated, a machine may generate error message `Failed to initialize NVML: Driver/library version mismatch` when running `nvidia-smi`. Fix it with a system reboot, e.g., `sudo reboot`. Instead of logging in to every machine to check for version mismatch, run the following commands to find out which machine has version mismatch, and reboot manually only those machines.

```
cd check_gpu_available
make check_gpu
```

**How are cuda managed on cluster?**

The cluster has its cuda installation managed by `puppet`. Use puppet to check if an accompanying package, e.g., `cudnn`, is installed alongside with the driver and software. 

```
puppet resource package | grep cudnn
```

**How to manage dotfiles, e.g., `~/.zshrc`, on cluster machines?**

One way is to create symlinks on every machine in the cluster to a target file that is update-to-date and version-controlled. `symlink_dotfiles.sh` achieves this. 

```
./symlink_dotfiles.sh
```


**How to run multiple scripts in parallel, i.e., for sweeping through hyperparameters?**




#### Info 

- cheatsheet: http://www.physik.uni-leipzig.de/wiki/files/slurm_summary.pdf
- slides explaining sbatch/slurm: https://www.cism.ucl.ac.be/Services/Formations/slurm/2016/slurm.pdf


#### Todo 


- a script that, when given a list of python 1-liner commands, submit all jobs 
    - a script that handles setting resource parameters, conda env
    - a list of python commands with potentially different arguments