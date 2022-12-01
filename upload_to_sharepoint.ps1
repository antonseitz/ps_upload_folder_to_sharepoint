param(
[string] $localpath,
[string] $remotepath,
[string] $url,
[switch] $move,
[switch] $login
)
#$URL = "PATH"
#$ErrorActionPreference ="Stop"
#$PSDefaultParameterValues['*:ErrorAction']='Stop'

#First time tasks

#Install-Module SharePointPnPPowerShellOnline 

if($login){
$c = get-credential
Connect-PnPOnline -url $url -credentials $c
}

if( $url -and $localpath -and $remotepath){

#import-Module SharePointPnPPowerShellOnline 

$Files = Get-ChildItem $localpath -Recurse
foreach($File in $Files){
    

    if($File.PSIsContainer -ne $true){
    $file.FullName
    $folderpath=(split-path $file.FullName).Substring(2)
    $remotefolder=$remotepath + $folderpath
    $remotefolder
        Add-PnPFile -Folder $remotefolder -Path $File.FullName
        $move_dir_path="\Imported\" + $folderpath
        if ( $true -ne (test-path $move_dir_path) ) {
        new-item -ItemType directory $move_dir_path.TrimStart(".\") }
        
        if($move){
        
        $move_full_path = $move_dir_path + "\" + $file.Name
        "move" + $move_full_path
        move-Item -Path $File.FullName -Destination $move_full_path }
    }
}
}
else {

"

Script which uploads local folders to sharepoint

USAGE:
 -localpath ./local_folder/subfolder
 -remotepath /folder/Subfolder
 -url  https://tenant.sharepoint.com/sites/library_name  (taken from Sharepoint onloine in browser
 -move if set, uploadede files will be moved to this folder
 -login if set, script asks for credentials and try to log in

Files will be uploaded from 
C:\local_folder

to 

https://tenant.sharepoint.com/sites/library_name/folder/Subfolder
"}
