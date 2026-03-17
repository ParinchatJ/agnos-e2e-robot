# agnos-e2e-robot

## Test Case Description 
This automation script is created solely for the purpose of a job application test for Agnos.  
Any use, reproduction, modification, or distribution of this code is strictly prohibited  
without prior written permission from the owner.

Automate script นี้จัดทำขึ้นเพื่อใช้สำหรับการทดสอบในการสมัครงานของบริษัท Agnos เท่านั้น  
ห้ามนำโค้ดไปใช้งานต่อ ทำซ้ำ ดัดแปลง หรือเผยแพร่ ไม่ว่าด้วยวัตถุประสงค์ใด ๆ  
โดยไม่ได้รับอนุญาตอย่างเป็นลายลักษณ์อักษรจากเจ้าของผลงาน

## Preconditions 
1. Before running the project, the following must be installed
- Python 3.8 or higher 
- Web browser (chrome)
- Browser driver (ChromeDriver)  </br>

2. Project dependencies from requirements.txt  

```bash 
pip install -r requirements.txt 
```

3. Additionally:
- Test data must be prepared  
- Test environment must be accessible  
- Valid test user account must be available  

## Test Data
- You can define the test data in the `data.yaml` file.
- It is important to specify the record ID of the document to be tested, and the document must be created in the system before running the test.
- The username and password can also be configured in this file.

## How to Run
```bash 
robot ./tests/index.robot
```

## Test Results
| Test Case | Description | Status |
|----------|------------|--------|
| E2E_AID_001 | E2Esuccessflow | Pass |
| E2E_AID_002 | Download | Waiting |
| E2E_AID_003 | Filter | Waiting |

## Screenshot
Test execution screenshots can be viewed at `screenshot` folder