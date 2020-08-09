@echo off

title vmstart
set VMWARE_HOME=D:\VMware
set MACHINE_HOME=D:\VMware\Virtual Machines

set vm_array=hadoop1 hadoop2 hadoop3
(for %%a in (%vm_array%) do ( 
    "%VMWARE_HOME%\vmrun.exe" start "%MACHINE_HOME%\%%a\%%a.vmx" nogui
    echo %%a has been started
))

exit
