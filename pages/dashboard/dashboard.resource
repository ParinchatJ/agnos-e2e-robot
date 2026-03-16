*** Keywords ***

Select one record by search
    # 1. Open the target status tab
    dashboard.Select Open Tab
    # 2. Enter Record ID in the Search field and click Search
    dashboard.Enter RecordID and search         ${Data.Flow1.input_data}        ${Data.Flow1.expected_data}
    # 3. Click a record from the search result list
    dashboard.Select recordid by search         ${Data.Flow1.expected_data}

Move Record to In Progress
    # 1. Click Move to In Progress
    dashboard.Select Move to In Progress     ${Data.Flow1.expected_data}

Move Record to Complete
    dashboard.Select Move to Complete        ${Data.Flow1.expected_data}

Log Out
    dashboard.Log Out from the AI Dashboard