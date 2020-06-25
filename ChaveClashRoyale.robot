*** Settings ***
Documentation     Efetua login e cria chave no site Clash Royale
Library           SeleniumLibrary
Resource          ./RequestAPI.robot

*** Variables ***
${LOGIN_URL}      https://developer.clashroyale.com/#/login
${BROWSER}        Chrome
${username}       paullynha.linux@gmail.com
${password}       Paula#01
${NEW_KEY}        https://developer.clashroyale.com/#/new-key

*** Test Cases ***
Busca IP Externo
    Buscar IP

Abre site Clash Royale
    Open Browser Para Logon

Informacoes Acesso
    Input Username
    Input Password

Envio Informacoes Acesso
    Submit Credentials

Navegacao menu
    Menu My Account

Criacao Chave
    Criar nova chave

Pegar Token
    Guardar Token

Busca dos Clans Clash Royale
    Conectar API
    Buscar Lista Cla

*** Keywords ***
Buscar IP
    Log  Abre site meuip para pegar IP externo e carrega informação na variável IP
    Open Browser    https://www.meuip.com.br/   ${BROWSER}
    Wait Until Page Contains    Qual é o Meu IP?
    ${IP}   Get Text  xpath=//*/h3[@class="m-0 font-weight-bold"]
    Log  IP externo: ${IP}
    Set Global Variable   ${IP}
    ##${IP2} 	Get Substring	 ${IP}	 8	 15
    ##Log    ${IP2}
    ##Set Global Variable   ${IP2}
    Close Browser

Open Browser Para Logon
    Log  Abrindo Site
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Title Should Be    Clash Royale API
    Wait Until Element Is Visible    id=email
    Log  Site aberto com sucesso

Input Username
    Log   Input login e senha
    Input Text    id=email    ${username}

Input Password
    Input Text    id=password    ${password}

Submit Credentials
    Click Button    Log In
    Wait Until Element Is Visible   class=dropdown-toggle__text
    Log   Logon efetuado com sucesso.

Menu My Account
    Log  Seleciona menu My Account
    Click Element  xpath=//*/button[@class="btn btn-default dropdown-toggle"]
    Click Element  xpath=//*[@id="content"]/div/div[2]/div/header/div/div/div[3]/div/div/ul/li[1]/a
    Wait Until Page Contains    My Keys
    Log  Menu selecionado com sucesso

Criar Nova Chave
    Log  Iniciando processo criação Chave
    Go to   ${NEW_KEY}
    Wait Until Page Contains    Key Name
    Input Text    id=name   teste
    Input Text    id=description    ${IP}
    #Input Text    id=range-0   ${IP2}
    Input Text    id=range-0   152.250.89.213
    Click Element   xpath=//*[@id="content"]/div/div[2]/div/div/section/div/div/div[2]/form/div[5]/button
    ##${STATUS}   Get Text    xpath=//*[@id="content"]/div/div[2]/div/div/section/div/div/div[2]/form/div[3]/div[2]/span
    ##Run Keyword If    ${STATUS}   ==    Invalid IP address.   Guardar Token   Log  Erro ao criar chave.

Guardar Token
    Wait Until Page Contains    Key created successfully.
    Log   Chave criada com sucesso.
    Log   Entra na chave criada e pega Token
    Wait Until Element Is Visible   xpath=//*[@id="content"]/div/div[2]/div/div/section[2]/div/div/div[2]/ul/li[1]/a
    Click Element   xpath=//*[@id="content"]/div/div[2]/div/div/section[2]/div/div/div[2]/ul/li[1]/a
    Wait Until Page Contains   Token
    ${TOKEN}   Get Text  xpath=//*[@id="content"]/div/div[2]/div/div/section/div/div/div[2]/form/div[1]/div/samp
    Log  IP externo: ${TOKEN}
    Set Global Variable   ${TOKEN}
    Log  Token ${TOKEN}
    Close Browser
