FROM microsoft/windowsservercore

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# Git for Winows 2.7.2
RUN Write-Host ('Downloading Git for Windows 2.7.2'); \
	Invoke-WebRequest "https://github.com/git-for-windows/git/releases/download/v2.7.2.windows.1/Git-2.7.2-64-bit.exe" -OutFile $env:TEMP\Git-2.7.2-64-bit.exe -UseBasicParsing; \
	Write-Host ('Installing Git for Windows 2.7.2'); \
    Start-Process $env:TEMP\Git-2.7.2-64-bit.exe -ArgumentList '/VERYSILENT /SUPPRESSMSGBOXES /CLOSEAPPLICATIONS /DIR=c:\git' -Wait; \
    Remove-Item -Force $env:TEMP\Git-2.7.2-64-bit.exe; \
	setx /M PATH $($Env:PATH + ';c:\git\cmd');

# OpenJDK 8u141
RUN Write-Host ('Downloading OpenJDK 8u141'); \
	Invoke-WebRequest -Uri 'https://github.com/ojdkbuild/ojdkbuild/releases/download/1.8.0.141-1/java-1.8.0-openjdk-1.8.0.141-1.b16.ojdkbuild.windows.x86_64.zip' -OutFile $env:TEMP\java-1.8.0-openjdk-1.8.0.141-1.b16.ojdkbuild.windows.x86_64.zip; \
	Write-Host 'Expanding OpenJDK 8u141'; \
	Expand-Archive $env:TEMP\java-1.8.0-openjdk-1.8.0.141-1.b16.ojdkbuild.windows.x86_64.zip -DestinationPath 'C:\java'; \
	Remove-Item $env:TEMP\java-1.8.0-openjdk-1.8.0.141-1.b16.ojdkbuild.windows.x86_64.zip -Force; \
	Write-Host ('Adding OpenJDK 8u141 to PATH' -f $newPath); \
	setx /M PATH $($Env:PATH + ';c:\java\java-1.8.0-openjdk-1.8.0.141-1.b16.ojdkbuild.windows.x86_64\bin');

# Jenkins remoting 3.13
RUN Write-Host ('Downloading Jenkins remoting 3.13'); \
	New-Item -ItemType Directory -Force -Path "c:\jenkins"; \
	Invoke-WebRequest "https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/3.13/remoting-3.13.jar" -OutFile "c:\jenkins\remoting-3.13.jar";

ENTRYPOINT ["java.exe", "-jar", "c:\\jenkins\\remoting-3.13.jar"]