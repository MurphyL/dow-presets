# 参考资料

Set-Variable ErrorActionPreference 'Stop'

# 拼接字符串 - https://code-examples.net/zh-CN/q/e69cc5

# 工作目录
$workspace = "${PSScriptRoot}\.workspace"
# 临时目录相对路径
$Temp_Name = ".workspace\temp"
# 临时目录绝对路径
$Temp_Path = "${workspace}\temp"

if (Test-Path -Path $Temp_Path) {
    Write-Output "清理历史文件……"
    Remove-Item -Path "${Temp_Path}" -Recurse -Force
}

Write-Output "创建缓存目录：${Temp_Name}"
New-Item -Path $PSScriptRoot -Name $Temp_Name -ItemType Directory -Force > $null


# 依赖目录相对路径
$Deps_Name = ".workspace\deps"