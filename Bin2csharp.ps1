#Legge il file in input e produce un byte array per c#

$inputFile = "C:\.........\file.exe"
$outputFile = "C:\..............\hexout.txt"

$fileBytes = [System.IO.File]::ReadAllBytes($inputFile)
$hexString = $fileBytes | ForEach-Object { '{0:X2}' -f $_ }
$formattedHex = "byte[] fileBytes = new byte[] { " + ($hexString -join ", ") + " };"
$formattedHex | Out-File -FilePath $outputFile

Write-Output "Output written to $outputFile"
