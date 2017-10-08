FROM plugandtrade/dotnetbuild

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# git 2.7.2
RUN Invoke-WebRequest "https://github.com/git-for-windows/git/releases/download/v2.7.2.windows.1/Git-2.7.2-64-bit.exe" -OutFile $env:TEMP\Git-2.7.2-64-bit.exe -UseBasicParsing; \
    Start-Process $env:TEMP\Git-2.7.2-64-bit.exe -ArgumentList '/VERYSILENT /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS /DIR=c:\git' -Wait; \
    Remove-Item -Force $env:TEMP\Git-2.7.2-64-bit.exe
RUN setx /M PATH "$env:Path;c:\git\cmd"