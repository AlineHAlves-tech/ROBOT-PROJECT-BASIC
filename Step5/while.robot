*** Settings ***

Library    SeleniumLibrary

*** Variables ***
${COUNT}    0

*** Keywords ***
01 - Usando o While Loop
    WHILE    ${COUNT} < 5
        log    o contador é: ${COUNT}
        ${COUNT}=    Evaluate    ${COUNT} + 1
        
    END

*** Test Cases ***

Caso de teste FOR
    01 - Usando o While Loop