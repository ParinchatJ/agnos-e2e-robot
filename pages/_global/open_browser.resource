*** Keywords ***

Open Browser With URL
    [Arguments]         ${server}           ${browser}
    #Get Home path to use other mac
    ${home}             Get Environment Variable            HOME
    Open Browser        ${server}                 ${browser}  
    ...     options=binary_location="/${home}/Documents/Chrome/Google Chrome for Testing.app/Contents/MacOS/Google Chrome for Testing";add_experimental_option("detach", True)         
    ...     executable_path=/${home}/Documents/Chrome/chromedriver

    Maximize Browser Window
    

Screenshot flow1
    Capture Page Screenshot     ${CURDIR}/../../screenshot/E2E_AID_001_{index}.png