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

Write-Output "��������Ŀ¼��${Temp_Name}"
New-Item -Path $PSScriptRoot -Name $Temp_Name -ItemType Directory -Force > $null


# ����Ŀ¼���·��
$Deps_Name = ".workspace\deps"