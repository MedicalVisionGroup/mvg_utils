# cluster_utils

#### Commonly used commands

```
squeue -u wpq
squeue --format="%.18i %.9P %.30j %.8u %.8T %.10M %.9l %.6D %R"

scancel -j <jobid>
scancel -n <jobname>

sinfo
sinfo --summarize
sinfo --node <nodename> --long

# Fix drained node
sinfo | grep drain
sudo scontrol update nodename=<nodename> state=idle
```

#### Utilities

**Check which machine has nvml driver/library version mismatch error**

After CUDA driver is udpated, a machine may generate error message `Failed to initialize NVML: Driver/library version mismatch` when running `nvidia-smi`. This problem can be fixed with a system reboot, e.g., `sudo reboot`. Instead of logging in to every machine to check if version mismatch happens, run the following commands to find out which machine has this problem, and reboot only those machines.

```
cd check_gpu_available
make check_gpu
```

**Sweep hyperparameters**






#### Info 

- cheatsheet: http://www.physik.uni-leipzig.de/wiki/files/slurm_summary.pdf
- slides explaining sbatch/slurm: https://www.cism.ucl.ac.be/Services/Formations/slurm/2016/slurm.pdf


#### Todo 


- a script that, when given a list of python 1-liner commands, submit all jobs 
    - a script that handles setting resource parameters, conda env
    - a list of python commands with potentially different arguments
