*** Settings ***
Resource          ${CURDIR}/../config/config.resource
# Test Teardown     Close browser

*** Test Cases ***
E2E_AID_001:E2E Move Record from open to Completed and Log Off successfully
    [Documentation]      Verify that the user can log in, move a record to In Progress, move the record to Completed, and successfully log off from the system.
    [Tags]               E2E     success     mainflow      regression
    # 0. Open browser
    open_browser.Open Agnos Browser
    # 1. Log in with a valid account
    login.Login user to AI Dashboard
    # 2. Select record by search
    dashboard.Select one record by search
    # 3. Move Record to In Progress
    dashboard.Move Record to In Progress
    # 4. Move Record to Complete
    dashboard.Move Record to Complete
    # 5. Log Out from the AI Dashboard
    Log Out