*** Variables ***
&{dict_login_page}
...     txt_header=//div[text()='AI SCREENING DASHBOARD']
...     txt_login=//div[@class='css-d6m9hb']//div[@class='css-46tzz6']
...     txt_AI_list=//div[@class='css-liwf9t']//div[text()='Diagnosis List']

...     lbl_email=id=Email
...     lbl_pwd=id=password

...     btn_login=//button//div[text()='Sign in']

*** Keywords ***

Login Page Should Be Open
    # 1 verify AI screening text is visible
    Wait Until Element Is Visible       ${dict_login_page}[txt_header]
    # 2 verify login header is visible
    Wait Until Element Is Visible       ${dict_login_page}[txt_login]
    # 3 verify email field is show
    Wait Until Element Is Visible       ${dict_login_page}[lbl_email]
    # 4 verify password field is show
    Wait Until Element Is Visible       ${dict_login_page}[lbl_pwd]
    # 5 verify login btn is show
    Wait Until Element Is Visible       ${dict_login_page}[btn_login]
    open_browser.Screenshot flow1

Login user
    [Arguments]     ${input_data}       ${expected_data}
    # 1 enter email
    Input Text      ${dict_login_page}[lbl_email]     ${input_data.user}
    # 2 varify email have a value
    ${email}     Get Value    ${dict_login_page}[lbl_email]
    Should Be Equal    ${email}    ${expected_data.user}
    # 3 enter pwd
    Input Text      ${dict_login_page}[lbl_pwd]     ${input_data.pwd}
    # 4 varify pwd have a value
    ${pwd}     Get Value    ${dict_login_page}[lbl_pwd]
    Should Be Equal    ${pwd}    ${expected_data.pwd}
    open_browser.Screenshot flow1
    # 5 click signin btn
    Double Click Element       ${dict_login_page}[btn_login]
   

Diagnosis List Page Should Be Open
    Wait Until Element Is Visible       ${dict_login_page}[txt_AI_list]
    open_browser.Screenshot flow1