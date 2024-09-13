@echo off
pushd "%~dp0"
dir /b %SystemRoot%\servicing\Packages\*Hyper-V*.mum >hyperv.txt
for /f %%i in ('findstr /i . hyperv.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i"
del hyperv.txt
DISM /Online /Enable-Feature /All /FeatureName:Microsoft-Hyper-V /LimitAccess /NoRestart
