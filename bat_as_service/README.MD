# Bat file as a service

These examples try to launch a bat file as a service explaining when something works, or doesn't.

## Test Environment

* Created a bin directory with `sample_python.bat`
  * The name is `sample_python.bat` to differentiate with the python.exe already in the path. We don't want to accidentally launch that one.
* The bin directory is relative to config files. This means we can find it using `%BASE%/bin/sample_python.bat`
* Testing 4 configurations: 
  * file_name_no_extension.xml  
  * file_name_with_extension.xml
  * full_path_no_extension.xml  
  * full_path_with_extension.xml
* The service is a python http server so we have a long running process that is easy to start and kill.

## Results

| Config Name                  | Pass/Fail |
|------------------------------|-----------|
| file_name_no_extension.xml   | ❌       |
| file_name_with_extension.xml | ✔️       |
| full_path_no_extension.xml   | ❌       |
| full_path_with_extension.xml | ✔️       |

See logs for example output errors.

## Why it doesn't work? (Speculation)

Lookign at the source code of WinSW, it starts the child process with `UseShellExecute=False`.
With this setting, it looks like it cannot find a bat file unless the file extension is given.

Online search tells me that `UseShellExecute=False` always requires a full path,
but this testing and the [Microsoft Example in UseShellExecute](https://learn.microsoft.com/en-us/dotnet/api/system.diagnostics.processstartinfo.useshellexecute?view=net-9.0#examples) say otherwise.

Regarless, the use of `UseShellExecute=False` is required to capture the output of the service and put it into the logs.