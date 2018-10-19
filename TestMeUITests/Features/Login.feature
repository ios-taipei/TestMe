Feature: TestMe Cucumberish Login Test Exapmle

Scenario Outline: Verify Login Process
Given the app is running
When I enter Account "<acc>" and Password "<pass>"
Then I should see "<result>"

Examples:
|  acc  |  pass   |    result       |
|  aki  |  qaz    |    success      |
|  aki  |  123    |    帳號密碼錯誤   |

