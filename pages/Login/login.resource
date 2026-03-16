*** Keywords ***

Login user to AI Dashboard
    # 1. Log in with a valid account
    # verify is a login page
    login.Login Page Should Be Open
    # step login
    login.Login user        ${Data.Flow1.input_data}        ${Data.Flow1.expected_data}
    # Diagnosis List should be open
    login.Diagnosis List Page Should Be Open