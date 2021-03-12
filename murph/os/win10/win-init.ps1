# �ο�����

Set-Variable ErrorActionPreference 'Stop'

# ƴ���ַ��� - https://code-examples.net/zh-CN/q/e69cc5

# ����Ŀ¼
$workspace = "${PSScriptRoot}\.workspace"
# ��ʱĿ¼���·��
$Temp_Name = ".workspace\temp"
# ��ʱĿ¼����·��
$Temp_Path = "${workspace}\temp"

if (Test-Path -Path $Temp_Path) {
    Write-Output "������ʷ�ļ�����"
    Remove-Item -Path "${Temp_Path}" -Recurse -Force
}

Write-Output "��������Ŀ¼����"
New-Item -Path $PSScriptRoot -Name $Temp_Name -ItemType Directory -Force > $null

# Write-Output "��������MinGit��BusyBox�汾������"
# $MinGit_URL="https://npm.taobao.org/mirrors/git-for-windows/v2.30.0.windows.1/MinGit-2.30.0-busybox-32-bit.zip"
# Invoke-WebRequest -Uri $MinGit_URL -OutFile "${Temp_Path}/mingit-busybox.zip"

# Write-Output "��MinGit����ȡBusyBox����"
# Expand-Archive "${Temp_Path}/mingit-busybox.zip" "${Temp_Path}\mingit-busybox" -Force
# Copy-Item "${Temp_Path}\mingit-busybox\mingw32\bin\busybox.exe" "$workspace\busybox.exe" -Force

# Write-Output "����MinGit����ļ�����"
# Remove-Item -Path "${Temp_Path}\mingit-busybox*" -Recurse -Force

# ����Ŀ¼���·��
$Deps_Name = ".workspace\deps"

# Write-Output "��������Ŀ¼����"
New-Item -Path $PSScriptRoot -Name $Deps_Name -ItemType Directory -Force > $null

foreach($item in (Select-Xml -Path "${PSScriptRoot}\deps.xml" -XPath "/deps/item")) {
	$url = $item.node.url;
	$group = $item.node.GetAttribute('group');
	$name = $item.node.GetAttribute('name');
	$target = "${group}/${name}.zip";
	Write-Output "�������أ�${name}"
	New-Item -Path $Temp_Path -Name $group -ItemType Directory -Force > $null
    Invoke-WebRequest -Uri $url -OutFile "${Temp_Path}/${target}"
    Expand-Archive "${Temp_Path}/${target}" "${PSScriptRoot}\${Deps_Name}\${group}\${name}" -Force
    Write-Output "- ${group} - ${name} - ��ʼִ�лص��ű���"
    Invoke-Expression $item.node.script
    Write-Output "- ${group} - ${name} - �ص��ű�ִ����ɣ�"
}