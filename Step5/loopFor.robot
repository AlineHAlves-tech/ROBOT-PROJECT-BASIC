*** Settings ***

Library    SeleniumLibrary

*** Variables ***

@{FRUTAS}    CAJU    LARANJA    MELANCIA    BANANA
${COUNT}    0

*** Keywords ***

01 - Usando FOR com RANGE
    FOR    ${COUNT}    IN RANGE    1    11
        Log    Meu contador atual é: ${COUNT}.
        Run Keyword If    ${COUNT} == 11    Log    Acabou o loop!!!
    END

02 - Usando FOR com LISTA
    FOR    ${ITEM}    IN    @{FRUTAS}
        Log      Minha fruta é: ${ITEM}
        Run Keyword If    '${ITEM}' == 'BANANA'    Log    Acabou o Loop!
    END

03 - Saindo de um FOR
    FOR    ${ITEM}    IN    @{FRUTAS}
        Exit For Loop If    '${ITEM}' == 'MELANCIA'
        Log    Minha fruta é: ${ITEM}
    END

04 - Usando a Keyword REPEAT
    Repeat Keyword    4    Log    Vamos logar essa fruta 4 vezes!

05 - Usando o While Loop
    WHILE    ${COUNT} < 5
        log o contador é: ${COUNT}
        ${COUNT}=    Evaluate    ${COUNT} + 1
        
    END

*** Test Cases ***
Caso de teste FOR
    01 - Usando FOR com RANGE
    02 - Usando FOR com LISTA
    03 - Saindo de um FOR
    04 - Usando a Keyword REPEAT