# Get the hostname of the computer
$hostname = hostname

# Get the operating system name and version
$os = Get-WmiObject -Class Win32_OperatingSystem

# Get the total amount of physical memory in bytes
$memory = Get-WmiObject -Class Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum

# Get the number of CPU cores
$cores = Get-WmiObject -Class Win32_Processor | Measure-Object -Property NumberOfCores -Sum

# Get the system uptime
$uptime = (Get-Date) - (Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -Property LastBootUpTime).LastBootUpTime

# Get the list of disks and their properties
$disks = Get-WmiObject -Class Win32_LogicalDisk | Select DeviceID, VolumeName, Size, FreeSpace

# Get the list of network adapters and their properties
$adapters = Get-WmiObject -Class Win32_NetworkAdapter | Select Name, MACAddress, IPAddress

# Get the list of installed security updates
$updates = Get-WmiObject -Class Win32_QuickFixEngineering | Select HotFixID, InstalledOn

# Print the system information
Write-Output "Hostname: $hostname"
Write-Output "Operating System: $($os.Caption) $($os.Version)"
Write-Output "Total Memory: $($memory.Sum / 1GB) GB"
Write-Output "CPU Cores: $($cores.Sum)"
Write-Output "Up time: $($uptime.Days) days $($uptime.Hours) hours $($uptime.Minutes) minutes"

# Print the disk information
Write-Output "Disks:"
$disks | Format-Table -AutoSize

# Print the network adapter information
Write-Output "Network Adapters:"
$adapters | Format-Table -AutoSize

# Print the security update information
Write-Output "Security Updates:"
$updates | Format-Table -AutoSize
