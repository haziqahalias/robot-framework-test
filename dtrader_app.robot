*** Settings ***
Library  SeleniumLibrary

*** Variable ***
#declaring variables
${login_btn}            dt_login_button
${email_field}          name=email
${pw_field}             //*[@type="password"]
${login_oauth_btn}      //*[text()="Log in"]
${acc_info}             //*[@class="acc-info__wrapper"]
${demo_tab}             //*[text()="Demo" and @id="dt_core_account-switcher_demo-tab"]
${demo_acc}             //*[@class="acc-switcher__account"]
${loading_icon}         //*[@class="chart-container__loader"]
${market_selection}     //*[@class="cq-symbol-select-btn"]
${volatility_10}        //*[@class="sc-mcd__item__name" and text()="Volatility 10 (1s) Index"]
${vol10_chosen}         //*[@class="cq-symbol" and text()="Volatility 10 (1s) Index"]
${virtual_acc}          //*[@class="acc-info acc-info--is-virtual"]
${market_list}          //*[@class="sc-dialog__body"]
${Synthetic_indices}    //*[@class="subcategory" and text()="Continuous Indices"]
${Rise/Fall}            //*[text()="Rise/Fall"]
${Ticks/Minute}         //*[@class="trade-container__fieldset"]
${Tick_Slider}          //*[@class="range-slider__ticks]
${Purchase_btn}         //*[@id="dt_purchase_call_button"]
${Recent_position}      //*[@class="positions-drawer__header"]
${Forex}                //*[@class="sc-mcd__filter__item " and text()="Forex"]
${AUD/USD}              //*[@class="sc-mcd__item__name" and text()="AUD/USD"]
${Contract_dropdown}    //*[@data-testid="dt_contract_dropdown"]
${Higher/Lower}         //*[text()="Higher/Lower"]
${Dur}                  //*[@class="advanced-simple-toggle"]
${Day_input}            //*[@class="dc-input__field"]
${Payout_option}        //*[@id="dc_payout_toggle_item"]
${Payout_input}         //*[@id="dt_amount_input"]
${Buy_fall}             //*[@class="btn-purchase btn-purchase--2"]
${Barrier_input}        //*[@name="barrier_1"]
${Barrier_error}        //*[@class="dc-popover__bubble dc-popover__bubble--error"]
${volatility_50}        //*[@class="sc-mcd__item__name" and text()="Volatility 50 Index"]
${vol50_chosen}         //*[@class="cq-symbol" and text()="Volatility 50 Index"]
${Multiplier}           //*[@class="dc-text contract-type-item__title" and text()="Multipliers"]
${Take_profit}          //*[@id="dc_take_profit-checkbox_input"]
${Stop_loss}            //*[@id="dc_stop_loss-checkbox_input"]
${Deal_cancellation}    //*[@id="dt_cancellation-checkbox_input"]

*** Keyword ***
#functions
Login
    Open Browser    url=https://app.deriv.com   browser=chrome
    Maximize browser window
    Wait until page does not contain element    dt_core_header_acc-info-preloader   60
    Wait until page contains element    ${login_btn}     60
    Click Element   ${login_btn}
    Wait until page contains element    ${email_field}  30
    Input text      ${email_field}      ${my_email}
    Input text      ${pw_field}       ${my_pw}
    Click Element   ${login_oauth_btn}

Virtual Account
    Wait until page does not contain element    dt_core_header_acc-info-preloader   60
    Wait until page contains element    ${acc_info}     120
    Wait until element is enabled       ${acc_info}     60
    Click element       ${acc_info}
    Wait until element is enabled       ${demo_tab}     60
    Click element       ${demo_tab}
    Wait until element is enabled       ${demo_acc}     60
    Click element       ${demo_acc}

Select Vol10
    Wait until page does not contain element        ${loading_icon}     300
    Wait until page contains element    ${virtual_acc}          120
    Wait until page contains element    ${market_selection}     120
    Click element       ${market_selection}
    Wait until page contains element    ${market_list}          120
    Wait until page contains element    ${Synthetic_indices}    120
    Wait until element is visible    ${volatility_10}        120
    Wait until element is enabled       ${volatility_10}        120
    Click element       ${volatility_10}
    Wait until page contains element    ${vol10_chosen}          120

Buy Rise
    Wait until page contains element    ${Rise/Fall}
    Wait until page contains element    ${Ticks/Minute}
#    Drag and drop       locator=${Tick_slider}
    Wait until page does not contain element        ${loading_icon}
    Wait until element is enabled       ${Purchase_btn}
    Click element       ${Purchase_btn}
    Wait until page contains element    ${Recent_position}      120

Select AUD/USD
    Click element       ${market_selection}
    Wait until page contains element    ${Synthetic_indices}    120
    Wait until element is visible       ${volatility_10}        120
    Click element       ${Forex}
    Wait until element is visible       ${AUD/USD}
    Click element       ${AUD/USD}

Change Duration
    Wait until element is enabled       ${Dur}     120
    Click element   ${Dur}
    Wait until element is visible       ${Day_input}
    Click element                ${Day_input}
    Press keys      ${Day_input}        CTRL+a+BACKSPACE
    Press keys      ${Day_input}        2

Higher/Lower Contract
    Wait until element is visible   ${Contract_dropdown}
    Wait until element is enabled   ${Contract_dropdown}
    Click element       ${Contract_dropdown}
    Wait until element is visible   ${Higher/Lower}
    Click element       ${Higher/Lower}

15.50 Payout
    Wait until element is visible   ${Payout_option}    120
    Wait until element is enabled   ${Payout_option}    120
    Click element   ${Payout_option}
    Wait until element is visible   ${Payout_input}
    Click element       ${Payout_input}
    Press keys      ${Payout_input}      CTRL+a+BACKSPACE
    Press keys      ${Payout_input}      1+5+.+5+0

Buy Lower
    Wait until element is visible   ${Buy_fall}
    Wait until element is enabled   ${Buy_fall}
    Click element   ${Buy_fall}

Change Barrier
    Wait until element is visible   ${Barrier_input}
    Wait until element is enabled   ${Barrier_input}
    Click element       ${Barrier_input}
    Press keys      ${Barrier_input}        CTRL+a+BACKSPACE
    Press keys      ${Barrier_input}        SHIFT+=
    Press keys      ${Barrier_input}        0+.+1
    Wait until element is visible   ${Barrier_error}

10 Payout
    Wait until element is visible   ${Payout_option}    120
    Wait until element is enabled   ${Payout_option}    120
    Click element   ${Payout_option}
    Wait until element is visible   ${Payout_input}
    Click element       ${Payout_input}
    Press keys      ${Payout_input}      CTRL+a+BACKSPACE
    Press keys      ${Payout_input}      1+0

Select Vol50
    Wait until page does not contain element        ${loading_icon}     300
    Wait until page contains element    ${virtual_acc}          120
    Wait until page contains element    ${market_selection}     120
    Click element       ${market_selection}
    Wait until page contains element    ${market_list}          120
    Wait until page contains element    ${Synthetic_indices}    120
    Wait until element is visible    ${volatility_50}        120
    Wait until element is enabled       ${volatility_50}        120
    Click element       ${volatility_50}
    Wait until page contains element    ${vol50_chosen}          120

Multiplier Contract
    Wait until element is visible   ${Contract_dropdown}
    Wait until element is enabled   ${Contract_dropdown}
    Click element       ${Contract_dropdown}
    Wait until element is visible   ${Multiplier}       120
    Wait until element is enabled   ${Multiplier}       120
    Click element       ${Multiplier}
    Wait until page does not contain element        ${Payout_option}    120

Take Proft/Stop Loss
    Wait until element is visible       ${Take_profit}      120
    Wait until element is enabled       ${Take_profit}      120
    Select checkbox                     ${Take_profit}
    Select checkbox                     ${Stop_loss}
    Checkbox should be selected         ${Take_profit}
    Checkbox should be selected         ${Stop_loss}
    Checkbox should not be selected     ${Deal_cancellation}



*** Test Cases ***
Open Virtual Account
    Login
    Then Virtual Account

Select Volatility 10
    Then Select Vol10

Buy Rise
    Then Buy Rise

Select AUD/USD
    Then Select AUD/USD

Lower
    Then Higher/Lower Contract
    Then Change Duration
    Then 15.50 Payout
    Then Buy Lower

Barrier Testing
    Then Change Barrier
    Then 10 Payout

Multiplier Testing
    Then Select Vol50
    Then Multiplier Contract

Take/Stop Checkbox
    Take Proft/Stop Loss

