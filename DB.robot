*** Settings ***
Library     DatabaseLibrary
Library     OperatingSystem

Suite Setup        Connect To Database     pymysql    ${DBName}     ${DBUser}
                   ...    ${DBPass}   ${DBHost}    ${DBPort}
Suite Teardown     Disconnect From Database
*** Variables ***
${DBName}    testsql
${DBUser}    root
${DBPass}
${DBHost}    127.0.0.1
${DBPort}    3306
*** Keywords ***
Inset DB
     ${Output}=  Execute Sql String     INSERT INTO testsql.robottestdb (robottestdbcol,robottestdbcol1) VALUES ('tes6', 'test7')
     Log To Console    ${Output}
     Should Be Equal As Strings    ${Output}   None

*** Test Case ***
Test DB
     Inset DB
