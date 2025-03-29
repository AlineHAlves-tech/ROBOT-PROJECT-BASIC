*** Settings ***

Library    SeleniumLibrary

Documentation    Suíte de testes para login
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

Abrir o site
    Open Browser    ${URL_ADOPET}    chrome
    Maximize Browser Window

Fechar site
    Close Browser

Acessar página de login
    Scroll Element Into View    //a[@data-test="login-button" and text()="Fazer login"]
    Click Link    xpath=//a[@data-test="login-button" and text()="Fazer login"]
    Sleep    2s

Preencher formulário de Login
    Wait Until Element Is Visible    //*[@id="root"]/main/section/form/label[1]
    Input Text    //input[@data-test='input-loginEmail']    ${EMAIL}
    Input Text    //input[@data-test='input-loginPassword']    ${PASSWORD}

Entrar no sistema
    Click Element    //button[@data-test='submit-button' and text()='Entrar']
    Sleep    3s

    
*** Test Cases ***

Cenário 01: Fazer Login
    [Documentation]    O usuário deve conseguir logar com as credenciais corretas.
    Desativar Screenshots
    Acessar página de login
    Preencher formulário de Login
    Entrar no sistema