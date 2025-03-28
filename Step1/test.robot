*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL_GOOGLE}    https://www.google.com
${URL_NASA}    https://www.nasa.gov/

*** Keywords ***
Open site google
    Open Browser    ${URL_GOOGLE}    chrome

Open site nasa
    Open Browser    ${URL_NASA}    chrome

*** Test Cases ***
cenario 1: Test GOOGLE
    Open site google
    Close Browser

cenario 2: Test site NASA
    Open Site NASA
    Close Browser