*** Variables ***
${server}       www.Google.com
${browser}      gc

*** Keywords ***

Open Browser agnos
    # [Arguments]         ${server}           ${browser}
    #Get Home path to use other mac
    ${home}             Get Environment Variable            HOME
    Open Browser        ${server}                 ${browser}  
    ...     options=binary_location="/${home}/Documents/Chrome/Google Chrome for Testing.app/Contents/MacOS/Google Chrome for Testing         
    ...     executable_path=/${home}/Documents/Chrome/chromedriver

    Maximize Browser Window

# Screenshot
#     # Screenshot.Set Screenshot Directory    ./screenshot
#     Capture Page Screenshot     TC_01_member_buy_success_{index}.png