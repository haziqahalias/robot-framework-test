*** Settings ***
Library  SeleniumLibrary

*** Variable ***
#declaring variables
${login_btn}            dt_login_button
${email_field}          name=email
${pw_field}             //*[@type="password"]
${login_oauth_btn}      //*[text()="Log in"]
${info_preloader}       //*[@id="dt_core_header_acc-info-preloader"]
${acc_info}             //*[@class="acc-info__wrapper"]
${acc_settings}         //*[@class="account-settings-toggle"]
${settings_page}        //*[@class="dc-page-overlay__header-title" and text()="Settings"]
${loading_page}         //*[@class="initial-loader account__initial-loader"]
${API_token_settings}   //*[@id="dc_api-token_link"]
${token_name_input}     //*[@class="dc-input__field"]
${create_token}         //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button"]
${create_success}       //*[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large da-api-token__button da-api-token__button--success"]
${read_scope}           //*[text()="View account activity such as settings, limits, balance sheets, trade purchase history, and more."]
${token_row}            //*[@class="da-api-token__table-cell-row"]
${trade_scope}          //*[text()="Buy and sell contracts, renew expired purchases, and top up demo accounts."]
${payments_scope}       //*[text()="Withdraw to payment agents, and transfer funds between accounts."]
${admin_scope}          //*[text()="Open accounts, manage settings, manage token usage, and more."]
${trading_info_scope}   //*[text()="View the trading history."]
${del_btn}              //*[@class="dc-btn dc-btn--secondary dc-btn__small"]
${yes/no}               //*[@class="dc-btn__group"]
${yes_btn}              //*[@id="app_contents"]/div/div/div/div/div[2]/div/div[2]/div/section/div/div/form/div/div[3]/div[2]/div/div/table/tbody/tr/td[5]/div/button[2]
${copy_icon}            //*[@class="dc-icon dc-clipboard da-api-token__clipboard"]
${token_copied}         //*[@class="dc-text dc-popover__bubble__text" and text()="Token copied!"]

*** Keyword ***
#functions
Login
    Open Browser    url=https://app.deriv.com   browser=chrome
    Maximize browser window
    Wait until page does not contain element    ${info_preloader}   60
    Wait until page contains element    ${login_btn}     60
    Click Element   ${login_btn}
    Wait until page contains element    ${email_field}  30
    Input text      ${email_field}      ${my_email}
    Input text      ${pw_field}       ${my_pw}
    Click Element   ${login_oauth_btn}

Account Settings
    Wait until page does not contain element        ${info_preloader}       60
    Wait until element is visible                   ${acc_settings}         60
    Wait until element is enabled                   ${acc_settings}
    Click element                                   ${acc_settings}
    Wait until element is visible                   ${settings_page}        60

API Token Settings
    Wait until page does not contain element        ${loading_page}         60
    Wait until element is visible                   ${API_token_settings}   60
    Click element                                   ${API_token_settings}

No Scope
    Wait until element is visible                   ${token_name_input}
    Input text      ${token_name_input}             Testing
    Element should be disabled                      ${create_token}
    Press keys      ${token_name_input}             CTRL+a+BACKSPACE

Special Characters
    Wait until element is visible                   ${token_name_input}
    Input text      ${token_name_input}             <test>
    Element should be disabled                      ${create_token}
    Press keys      ${token_name_input}             CTRL+a+BACKSPACE

1 Character
    Wait until element is visible                   ${token_name_input}
    Input text      ${token_name_input}             a
    Click element                                   ${read_scope}
    Element should be disabled                      ${create_token}
    Press keys      ${token_name_input}             CTRL+a+BACKSPACE

33 Characters
    Wait until element is visible                   ${token_name_input}
    Input text      ${token_name_input}             this is a test to see if using 33
    Click element                                   ${read_scope}
    Element should be disabled                      ${create_token}
    Press keys      ${token_name_input}             CTRL+a+BACKSPACE

Read Scope
    Click element                       ${read_scope}
    Input text      ${token_name_input}     Read
    Element should be enabled           ${create_token}
    Click element                       ${create_token}
    Element should be disabled          ${create_token}
    Wait until page does not contain element    ${create_success}   60
    Set browser implicit wait           15

Delete Token
    Wait until element is visible       ${del_btn}
    Click element       ${del_btn}
    Wait until element is visible       ${yes/no}
    Click element       ${yes_btn}

Trade Scope
    Wait until page does not contain element    ${create_success}   60
    Click element                       ${trade_scope}
    Input text      ${token_name_input}     Trade
    Element should be enabled           ${create_token}
    Click element                       ${create_token}
    Element should be disabled          ${create_token}
    Wait until page does not contain element    ${create_success}   60
    Set browser implicit wait           15

Copy Token
    Wait until element is visible       ${copy_icon}
    Click element       ${copy_icon}
    Wait until element is visible       ${token_copied}

Payments Scope
    Click element                       ${payments_scope}
    Input text      ${token_name_input}     Payments
    Element should be enabled           ${create_token}
    Click element                       ${create_token}
    Element should be disabled          ${create_token}
    Wait until page does not contain element    ${create_success}   60
    Set browser implicit wait           15

Admin Scope
    Click element                       ${admin_scope}
    Input text      ${token_name_input}     Admin
    Element should be enabled           ${create_token}
    Click element                       ${create_token}
    Element should be disabled          ${create_token}
    Wait until page does not contain element    ${create_success}   60
    Set browser implicit wait           15

Trading Info Scope
    Click element                       ${trading_info_scope}
    Input text      ${token_name_input}     Trading Info
    Element should be enabled           ${create_token}
    Click element                       ${create_token}
    Element should be disabled          ${create_token}
    Wait until page does not contain element    ${create_success}   60
    Set browser implicit wait           15

Multi Scope
    Click element                       ${read_scope}
    Click element                       ${admin_scope}
    Input text      ${token_name_input}     Multi Scope
    Element should be enabled           ${create_token}
    Click element                       ${create_token}
    Element should be disabled          ${create_token}
    Wait until page does not contain element    ${create_success}   60
    Set browser implicit wait           15

*** Test Cases ***
Open Account Settings
    Login
    Account Settings
    API Token Settings

TC01
    No Scope

TC02
    Special Characters

TC03
    1 Character

TC04
    33 Characters

TC05 Read
    Read Scope

TC06 Delete Token
    Delete token

TC05 Trade
    Trade Scope

TC07 Copy Token
    Copy Token

TC05 Payments
    Payments Scope

TC05 Admin
    Admin Scope

TC05 Trading Info
    Trading Info Scope

TC08 Multiple Scopes
    Multi Scope
