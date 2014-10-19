function ZipAndUpload([string]$ftpUrl, [string]$ftpUsername, [string]$ftpPassword, [string]$inputDirectory) {
    
    $webclient = New-Object System.Net.WebClient 

    $webclient.Credentials = New-Object System.Net.NetworkCredential($ftpUsername,$ftpPassword)  

    $fileName = [System.IO.Path]::GetDirectoryName($inputDirectory)
    $uniqueFormatPart = Get-Date -format yyyyMMddHHmmssfff
    $destinationPath = $fileName + "_" + $uniqueFormatPart + ".zip"
    $destinationFileName = [System.IO.Path]::GetFileName($destinationPath)

    write-host $destinationPath

    [Reflection.Assembly]::LoadWithPartialName( "System.IO.Compression.FileSystem" )
    [System.IO.Compression.ZipFile]::CreateFromDirectory($inputDirectory, $destinationPath)
    write-host "sucessfully created zip file $destinationFileName" -foreground "green"

    $uriPath = "$ftpUrl/$destinationFileName"
    write-host "uploading file to $uriPath ..."

    $uri = New-Object System.Uri($uriPath) 
    $webclient.UploadFile($uri,$destinationPath)

    write-host "successfully uploaded file" -foreground "green"
}