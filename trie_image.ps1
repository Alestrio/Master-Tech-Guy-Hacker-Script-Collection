# This functions takes all images from an android phone folder as format IMG_AAAAMMDD_HHMMSS.jpg 
# and sort them in folders based on AAAAMM

ls images | select -ExpandProperty Name | % { 
    # Create directory if not exists
    $file = $_ | Out-String
    # $file | gm
    $folder_path = "trie/$($file.Substring(4,4))-$($file.Substring(8,2))"
    if((Test-Path -Path $folder_path) -eq $False) {
        mkdir -Path $folder_path
    }
    # Move image to trie folder
    $file_path = "images/$file"
    # Remove trailing line break
    $file_path = $file_path -replace "\r\n"
    # Copying the files
    copy -Path $file_path -Destination $folder_path
}