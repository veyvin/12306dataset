param
(
    $mkdirormktxt = (Read-Host -Prompt '输入 md 由文本生成目录,输入 mt 由目录生成文本'),
    $labelfile=(Read-Host -Prompt '输入文本路径'),
    $labeldir =(Read-Host -Prompt '输入文件夹目录')
)



#从文本生成目录
if ($mkdirormktxt -eq 'md') {
    $line = Get-Content $labelfile
    foreach ($i in $line)
    {
        New-Item -ItemType "directory"  -Name $i -Path $labeldir
    }
    
}

#从目录生成文本

if ($mkdirormktxt -eq 'mt') {
    if(-not (Test-Path -Path $labelfile)){
        New-Item -ItemType 'file' -Name 'label.txt'
    }
    foreach ($i in Get-ChildItem $labeldir)
    {
        
       $i.Name| Out-File -Append $labelfile
    }
    
}