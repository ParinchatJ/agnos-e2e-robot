*** Variables ***
&{dict_dash_page}
...     lbl_opentab=//div[@class='css-10nf7hq']//div[text()='Open']
...     lbl_inprogresstab=//div[@class='css-10nf7hq']//div[text()='In progress']
...     lbl_completetab=//div[@class='css-10nf7hq']//div[text()='Completed']
...     lbl_input_search=//div[@class='css-qijmwz']//input
...     lbl_textarea_comment=//div[@class='css-1ae2x4h']//textarea

...     txt_recordID=//div[contains(text(),'{}')]
...     txt_patient_doc=//div[text()='Patient symptoms']
...     txt_completeby=//th[text()='Completed by']

...     btn_moveto_inprogress=//button[text()='Move to In-progress']
...     btn_complete=//button[text()='Complete']
...     btn_search=//button[text()='Search']
...     btn_inprogress=//div[text()='In-progress']
...     btn_AI_list=//div[@class='css-tn58i0']//div[text()='Diagnosis List']
...     btn_complete_record=//div[text()='Complete']
...     btn_confirm_modal_close_case=//div[text()='ยืนยัน']
...     btn_send_comment=//button[@class='css-4v9iy']
...     btn_logout=//div[@class='css-14a8myp']

*** Keywords ***
Back To List
    Wait Until Element Is Visible       ${dict_dash_page}[btn_AI_list]
    Click Element        ${dict_dash_page}[btn_AI_list]
    verify open tab is visible
    open_browser.Screenshot flow1

Select Open Tab
    # 1 verify open tab is visible
    Wait Until Element Is Visible       ${dict_dash_page}[lbl_opentab]
    # 2 click open tab
    Click Element        ${dict_dash_page}[lbl_opentab]
    # 3 verify data in open tab is show
    verify open tab is visible
    open_browser.Screenshot flow1

Select In Progress Tab
    # 1 verify In Progress tab is visible
    Wait Until Element Is Visible       ${dict_dash_page}[lbl_inprogresstab]
    # 2 click In Progress tab
    Click Element        ${dict_dash_page}[lbl_inprogresstab]
    # 3 verify data in In Progress tab is show
    verify In Progress tab is visible
    open_browser.Screenshot flow1

Select Complete Tab
    # 1 verify In Progress tab is visible
    Wait Until Element Is Visible       ${dict_dash_page}[lbl_completetab]
    # 2 click In Progress tab
    Click Element        ${dict_dash_page}[lbl_completetab]
    # 3 verify data in In Progress tab is show
    verify Complete tab is visible  
    open_browser.Screenshot flow1

verify open tab is visible
    # - btn move to in Progress is visible
    Wait Until Element Is Visible       ${dict_dash_page}[btn_moveto_inprogress]
    # - btn complete is visivble
    Wait Until Element Is Visible       ${dict_dash_page}[btn_complete]

verify In Progress tab is visible
    # - btn move to in Progress is not visible
    Wait Until Element Is not Visible       ${dict_dash_page}[btn_moveto_inprogress]
    # - btn complete is visivble
    Wait Until Element Is Visible       ${dict_dash_page}[btn_complete]

verify Complete tab is visible 
    Wait Until Element Is Visible       ${dict_dash_page}[txt_completeby]

Enter RecordID and search
    [Arguments]     ${input_data}       ${expected_data}
    # 1 verify input search is visible
    Wait Until Element Is Visible       ${dict_dash_page}[lbl_input_search]
    # 2 enter data
    Input Text      ${dict_dash_page}[lbl_input_search]     ${input_data.ByrecordID}
    # 3 verify data in input search
    ${recordID}     Get Value    ${dict_dash_page}[lbl_input_search]
    Should Be Equal    ${recordID}    ${expected_data.ByrecordID}
    open_browser.Screenshot flow1
    # 4 verify btn search is show
    Wait Until Element Is Visible       ${dict_dash_page}[btn_search] 
    # 5 click btn
    SeleniumLibrary.Click button       ${dict_dash_page}[btn_search] 
    # 6 verify record have the same recordid
    verify open tab is visible
    # - set locator to use dynamic recordID
    ${locator_recordID}=    Replace String    ${dict_dash_page}[txt_recordID]    {}    ${expected_data.ByrecordID}
    Wait Until Element Is Visible    ${locator_recordID}
    # - compare recordID by check text in locator
    Element Text Should Be    ${locator_recordID}    Record ID : ${expected_data.ByrecordID}
    open_browser.Screenshot flow1

Select recordid by search
    [Arguments]       ${expected_data}
    # 1 click record
    ${locator_recordID}=    Replace String    ${dict_dash_page}[txt_recordID]    {}    ${expected_data.ByrecordID}
    Click Element       ${locator_recordID}
    # 2 verify doc record is show    
    Wait Until Element Is Visible       ${dict_dash_page}[txt_patient_doc]
    open_browser.Screenshot flow1

Select Move to In Progress 
    [Arguments]       ${expected_data}
    # 1. Click Move to In Progress
    Wait Until Element Is Visible       ${dict_dash_page}[btn_inprogress]
    Scroll Element Into View            ${dict_dash_page}[btn_inprogress]
    Click Element       ${dict_dash_page}[btn_inprogress]
    # 2. Navigate back to the record list page to verify record in inprogress tab 
    Back To List
    Select In Progress Tab
    ${locator_recordID}=    Replace String    ${dict_dash_page}[txt_recordID]    {}    ${expected_data.ByrecordID}
    Wait Until Element Is Visible       ${locator_recordID}
    open_browser.Screenshot flow1
    
Select Move to Complete
    [Arguments]       ${expected_data}
    Select recordid by search       ${expected_data}
    Wait Until Element Is Visible       ${dict_dash_page}[btn_complete_record]
    Scroll Element Into View            ${dict_dash_page}[btn_complete_record]
    Click Element       ${dict_dash_page}[btn_complete_record]
    Wait Until Element Is Visible       ${dict_dash_page}[btn_confirm_modal_close_case]
    open_browser.Screenshot flow1
    Click Element       ${dict_dash_page}[btn_confirm_modal_close_case]
    open_browser.Screenshot flow1
    Back To List
    Select Complete Tab
    # check recordID
    ${locator_recordID}=    Replace String    ${dict_dash_page}[txt_recordID]    {}    ${expected_data.ByrecordID}
    Wait Until Element Is Visible       ${locator_recordID}
    open_browser.Screenshot flow1

Log Out from the AI Dashboard
    # 1 click log out btn
    Wait Until Element Is Visible       ${dict_dash_page}[btn_logout]
    Click Element       ${dict_dash_page}[btn_logout]
    open_browser.Screenshot flow1
    # 2 back to login page
    login.Login Page Should Be Open
