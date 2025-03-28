*** Settings ***

Library    SeleniumLibrary

*** Variables ***

${QUANTIDADE}    2
${URL_ADOPET}    https://adopet-frontend-cypress.vercel.app/
${LOGIN_ADOPET}    https://adopet-frontend-cypress.vercel.app/login
${VERIFY}    //*[@id="root"]/main/section/p
${EMAIL}    aline.teste@gmail.com
${PASSWORD}    A1234a

${SCREENSHOT_DIR}    C:/Users/Aline Alves/OneDrive/Documentos/ROBOT-PROJECT/screenshots

*** Keywords ***

Desativar Screenshots
    Set Global Variable    ${FAILURE_SCREENSHOT_DIRECTORY}    ${EMPTY}
Realizar Login
    Given que o usuário acessou o site
    And acessou a tela de login
    And inseriu o dado de EMAIL
    And inseriu o dado de senha
    And clica em entrar
    And a tela home será exibida

Given que o usuário acessou o site
    Open Browser    ${URL_ADOPET}    chrome

And acessou a tela de login
    Scroll Element Into View    //a[@data-test="login-button" and text()="Fazer login"]
    Sleep    2s
    Wait Until Element Is Visible    //a[@data-test="login-button" and text()="Fazer login"]
    Click Link    xpath=//a[@data-test="login-button" and text()="Fazer login"]
    Sleep    2s

And inseriu o dado de EMAIL
    # Wait Until Element Is Visible    //*[@id="root"]/main/section/form/label[1]
    Input Text    //input[@data-test='input-loginEmail']    ${EMAIL}

And inseriu o dado de senha
    Input Text    //input[@data-test='input-loginPassword']    ${PASSWORD}

And clica em entrar
    Sleep    2s
    Scroll Element Into View    //button[@data-test='submit-button' and text()='Entrar']
    Click Element    //button[@data-test='submit-button' and text()='Entrar']

And a tela home será exibida
    Wait Until Element Is Visible    ${VERIFY}

Then o Site será Fechado
    Close Browser