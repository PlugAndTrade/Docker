FROM microsoft/windowsservercore

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

# MSBuild Tools 15.3
RUN Invoke-WebRequest "https://download.visualstudio.microsoft.com/download/pr/11425249/e64d79b40219aea618ce2fe10ebd5f0d/vs_BuildTools.exe" -OutFile $env:TEMP\vs_BuildTools.exe -UseBasicParsing; \
    Start-Process $env:TEMP\vs_BuildTools.exe -ArgumentList '--add Microsoft.VisualStudio.Workload.MSBuildTools --quiet' -Wait; \
    Remove-Item -Force $env:TEMP\vs_BuildTools.exe
RUN setx /M PATH $($Env:PATH + ';C:/Program Files (x86)/Microsoft Visual Studio/2017/BuildTools/MSBuild/15.0/Bin/');

# .NET 4.5.2
RUN Invoke-WebRequest "https://download.microsoft.com/download/4/3/B/43B61315-B2CE-4F5B-9E32-34CCA07B2F0E/NDP452-KB2901951-x86-x64-DevPack.exe" -OutFile $env:TEMP\NDP452-KB2901951-x86-x64-DevPack.exe -UseBasicParsing; \
    Start-Process $env:TEMP\NDP452-KB2901951-x86-x64-DevPack.exe -ArgumentList '/q' -Wait; \
    Remove-Item -Force $env:TEMP\NDP452-KB2901951-x86-x64-DevPack.exe

# .NET 4.6
RUN Invoke-WebRequest "https://download.microsoft.com/download/8/2/F/82FF2034-83E6-4F93-900D-F88C7AD9F3EE/NDP46-TargetingPack-KB3045566.exe" -OutFile $env:TEMP\NDP46-TargetingPack-KB3045566.exe -UseBasicParsing; \
    Start-Process $env:TEMP\NDP46-TargetingPack-KB3045566.exe -ArgumentList '/q' -Wait; \
    Remove-Item -Force $env:TEMP\NDP46-TargetingPack-KB3045566.exe

# .NET 4.6.1
RUN Invoke-WebRequest "https://download.microsoft.com/download/F/1/D/F1DEB8DB-D277-4EF9-9F48-3A65D4D8F965/NDP461-DevPack-KB3105179-ENU.exe" -OutFile $env:TEMP\NDP461-DevPack-KB3105179-ENU.exe -UseBasicParsing; \
    Start-Process $env:TEMP\NDP461-DevPack-KB3105179-ENU.exe -ArgumentList '/q' -Wait; \
    Remove-Item -Force $env:TEMP\NDP461-DevPack-KB3105179-ENU.exe

# .NET 4.6.2
RUN Invoke-WebRequest "https://download.microsoft.com/download/E/F/D/EFD52638-B804-4865-BB57-47F4B9C80269/NDP462-DevPack-KB3151934-ENU.exe" -OutFile $env:TEMP\NDP462-DevPack-KB3151934-ENU.exe -UseBasicParsing; \
    Start-Process $env:TEMP\NDP462-DevPack-KB3151934-ENU.exe -ArgumentList '/q' -Wait; \
    Remove-Item -Force $env:TEMP\NDP462-DevPack-KB3151934-ENU.exe

# .NET 4.7
RUN Invoke-WebRequest "https://download.microsoft.com/download/A/1/D/A1D07600-6915-4CB8-A931-9A980EF47BB7/NDP47-DevPack-KB3186612-ENU.exe" -OutFile $env:TEMP\NDP47-DevPack-KB3186612-ENU.exe -UseBasicParsing; \
    Start-Process $env:TEMP\NDP47-DevPack-KB3186612-ENU.exe -ArgumentList '/q' -Wait; \
    Remove-Item -Force $env:TEMP\NDP47-DevPack-KB3186612-ENU.exe

# .NET core 2.0
RUN Invoke-WebRequest "https://dotnetcli.blob.core.windows.net/dotnet/Sdk/2.0.0/dotnet-sdk-2.0.0-win-x64.zip" -OutFile $env:TEMP\dotnet-sdk-2.0.0-win-x64.zip; \
    Expand-Archive $env:TEMP\dotnet-sdk-2.0.0-win-x64.zip -DestinationPath $Env:ProgramFiles\dotnetcore2.0; \
    Remove-Item -Force $env:TEMP\dotnet-sdk-2.0.0-win-x64.zip
RUN setx /M PATH $($Env:PATH + ';' + $Env:ProgramFiles + '\dotnetcore2.0')

# NuGet
RUN Invoke-WebRequest "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe" -OutFile $env:TEMP\nuget.exe -UseBasicParsing; \
    Copy-Item $env:TEMP\nuget.exe -Destination (New-Item $Env:ProgramFiles\nuget -Type container -Force) -Force; \
    Remove-Item -Force $env:TEMP\nuget.exe
RUN setx /M PATH $($Env:PATH + ';' + $Env:ProgramFiles + '\nuget')