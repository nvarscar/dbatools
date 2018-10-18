﻿$commandname = $MyInvocation.MyCommand.Name.Replace(".Tests.ps1", "")
Write-Host -Object "Running $PSCommandpath" -ForegroundColor Cyan
. "$PSScriptRoot\constants.ps1"

Describe "$commandname Unit Tests" -Tag "UnitTests" {
    It "Returns dacpac export options" {
        New-DbaDacOption -Action Export | Should -Not -BeNullOrEmpty
    }
    It "Returns bacpac export options" {
        New-DbaDacOption -Action Export -Type Bacpac | Should -Not -BeNullOrEmpty
    }
    It "Returns dacpac publish options" {
        New-DbaDacOption -Action Publish  | Should -Not -BeNullOrEmpty
    }
    It "Returns bacpac publish options" {
        New-DbaDacOption -Action Publish -Type Bacpac | Should -Not -BeNullOrEmpty
    }
}
