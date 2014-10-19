function UploadFile([string]$ftpUrl, [string]$ftpUsername, [string]$ftpPassword, [string]$localFilePath) {
    
    $webclient = New-Object System.Net.WebClient 

    $webclient.Credentials = New-Object System.Net.NetworkCredential($ftpUsername,$ftpPassword)  

    $fileName =  [System.IO.Path]::GetFileName($localFilePath)
    $uriPath = "$ftpUrl/$fileName"
    write-host "uploading file to $uriPath ..."

    $uri = New-Object System.Uri($uriPath) 
    $webclient.UploadFile($uri,$localFilePath)

    write-host "successfully uploaded file" -foreground "green"
}