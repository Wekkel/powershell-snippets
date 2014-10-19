function CreateZIP([string]$inputDirectory, [string]$outputPath) {
   
    write-host "creating a zip file from directory $inputDirectory..."
    if(Test-Path $outputPath){
        rm $outputPath
    }
    [Reflection.Assembly]::LoadWithPartialName( "System.IO.Compression.FileSystem" )
    [System.IO.Compression.ZipFile]::CreateFromDirectory($inputDirectory, $outputPath)
    write-host "sucessfully created zip file $outputPath" -foreground "green"
}