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

Write-Output "创建缓存目录……"
New-Item -Path $PSScriptRoot -Name $Temp_Name -ItemType Directory -Force > $null

# Write-Output "正在下载MinGit（BusyBox版本）……"
# $MinGit_URL="https://npm.taobao.org/mirrors/git-for-windows/v2.30.0.windows.1/MinGit-2.30.0-busybox-32-bit.zip"
# Invoke-WebRequest -Uri $MinGit_URL -OutFile "${Temp_Path}/mingit-busybox.zip"

# Write-Output "从MinGit中提取BusyBox……"
# Expand-Archive "${Temp_Path}/mingit-busybox.zip" "${Temp_Path}\mingit-busybox" -Force
# Copy-Item "${Temp_Path}\mingit-busybox\mingw32\bin\busybox.exe" "$workspace\busybox.exe" -Force

# Write-Output "清理MinGit相关文件……"
# Remove-Item -Path "${Temp_Path}\mingit-busybox*" -Recurse -Force

# 依赖目录相对路径
$Deps_Name = ".workspace\deps"

# Write-Output "创建依赖目录……"
New-Item -Path $PSScriptRoot -Name $Deps_Name -ItemType Directory -Force > $null

foreach($item in (Select-Xml -Path "${PSScriptRoot}\deps.xml" -XPath "/deps/item")) {
	$url = $item.node.url;
	$group = $item.node.GetAttribute('group');
	$name = $item.node.GetAttribute('name');
	$target = "${group}/${name}.zip";
	Write-Output "正在下载：${name}"
	New-Item -Path $Temp_Path -Name $group -ItemType Directory -Force > $null
    Invoke-WebRequest -Uri $url -OutFile "${Temp_Path}/${target}"
    Expand-Archive "${Temp_Path}/${target}" "${PSScriptRoot}\${Deps_Name}\${group}\${name}" -Force
    Write-Output "- ${group} - ${name} - 开始执行回调脚本："
    Invoke-Expression $item.node.script
    Write-Output "- ${group} - ${name} - 回调脚本执行完成！"
}