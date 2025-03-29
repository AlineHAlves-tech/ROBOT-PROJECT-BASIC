*** Settings ***

Library    SeleniumLibrary
Suite Setup    Abrir o site
Suite Teardown    Fechar site

*** Variables ***

${URL_ADOPET}    https://adopet-frontend-cypress.vercel.app/
${VERIFY}    //*[@id="root"]/main/section/p
${LOGIN_ADOPET}    https://adopet-frontend-cypress.vercel.app/login 
${EMAIL}    aline.teste@gmail.com
${PASSWORD}    A1234a

${SCREENSHOT_DIR}    C:/Users/Aline Alves/OneDrive/Documentos/ROBOT-PROJECT/screenshots


*** Keywords ***
Desativar Screenshots
    Set Global Variable    ${FAILURE_SCREENSHOT_DIRECTORY}    ${EMPTY}

# Ativar Screenshots
#     Set Global Variable    ${FAILURE_SCREENSHOT_DIRECTORY}    ${SCREENSHOT_DIR}

Abrir o site
    Open Browser    ${URL_ADOPET}    chrome
    Maximize Browser Window

Fechar site
    Close Browser

##Cadastro 

Clicar em Cadastrar
    Wait Until Element Is Visible    //*[@id="root"]/main/section/div/div/a[1]    3s
    Scroll Element Into View    //*[@id="root"]/main/section/div/div/a[1]
    Click Link    xpath=//a[@data-test="register-button" and text()="Cadastrar"]

Inserir dados de cadastro
    Input Text    //*[@id="name"]    Aline Testes
    Input Text    //*[@id="email"]   ${EMAIL}
    Input Text    //*[@id="pass-create"]    ${PASSWORD}
    Input Text    //*[@id="pass-confirm"]   ${PASSWORD}

Enviar cadastro
    Scroll Element Into View    xpath=//*[@id="root"]/main/section/form/button[text()="Cadastrar"]
    Click Element    xpath=//button[@data-test="submit-button" and text()="Cadastrar"]

Verificar cadastro
    Wait Until Element Is Visible   ${VERIFY}    5s
    Sleep    5s
    Element Should Be Visible    ${VERIFY}


*** Test Cases ***

Cenário 01: Cadastro adopet
    Desativar Screenshots
    Clicar em Cadastrar
    Inserir dados de cadastro
    Enviar cadastro
    Verificar cadastro
