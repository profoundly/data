@echo off

title vmstop
set VMWARE_HOME=D:\VMware
set MACHINE_HOME=D:\VMware\Virtual Machines

set vm_array=hadoop1 hadoop2 hadoop3
(for %%a in (%vm_array%) do ( 
    "%VMWARE_HOME%\vmrun.exe" stop "%MACHINE_HOME%\%%a\%%a.vmx" soft
    echo %%a has been shut down
))

exit
