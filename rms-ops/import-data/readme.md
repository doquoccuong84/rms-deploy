# Contraints
1. CSV file must be named "rms_data.csv" and place inside this folder
2. CSV file "rms_data.csv" must have the correct format:
    - One title row on top
    - Columns:
      UserName, Email, FirstName, LastName, ContactNumber, Department, HrmEmployeeId, PositionName, SkillName, SkillLevel, YearOfExperience, IsMain
3. "Department" column cannot be empty
4. "Hardskill" column should contain only 1 string value. If a person has more than 1 skill, duplicates that row.
5. "Departments" "Roles" "HardSkills" must be empty in DB
# Instructtion

How to run this service to import external resource data  

1. Change connection information in "docker-compose.yml" to match your connection:   
    - DB_USER=...
    - DB_PASSWORD=...
    - DB_HOST=[YOUR DB IP ADDRESS]
    - DB_PORT=...
    - DB_NAME=[YOUR DB NAME]  


2. Run:

```
docker compose -f docker-compose.yml up --build
```

