# 参考资料

Set-Variable ErrorActionPreference 'Stop'

# 拼接字符串 - https://code-examples.net/zh-CN/q/e69cc5

# ${PSScriptRoot}
# 工作目录
$WORKSPACE = ".workspace"
# 临时目录相对路径
$TEMP = ".workspace\temp"
$DEPS = ".workspace\deps"

if (Test-Path -Path ${WORKSPACE}) {
    Write-Output "清理历史文件……"
    Remove-Item -Path ${WORKSPACE} -Recurse -Force
}

Write-Output "创建缓存目录……"
New-Item -Path $PSScriptRoot -Name ${TEMP} ${DEPS} -ItemType Directory -Force > $null
