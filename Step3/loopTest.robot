*** Settings ***

Resource    keywords.resource

*** Test Cases ***

Cenário 01: Fazer Login
    FOR    ${i}    IN RANGE    ${QUANTIDADE}
        Realizar Login
    END

