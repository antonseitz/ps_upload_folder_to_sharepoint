# ps_upload_folder_to_sharepoint

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
