import os, time
from subprocess import Popen, PIPE


def execute_cmd_blocking(cmd):
    p = Popen(cmd, shell=True, stdout=PIPE, stderr=PIPE)
    p.wait()
    stdoutv, stderrv = p.communicate()
    return stdoutv, stderrv, p.returncode

    
cmd = 'sbatch --nodelist=caraway check_gpu_available.sh'
stdoutv, stderrv, code = execute_cmd_blocking(cmd)


print(stdoutv, stderrv, code)