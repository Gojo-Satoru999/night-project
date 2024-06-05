        +------------------+
        |   Gymnasium      |
        +------------------+
        | Name (PK)        |
        | Address          |
        | Telephone Number |
        +------------------+
                 | 1
                 |
                 |
                 |
                 |
                 |
        +--------v--------+
        |    Member       |
        +-----------------+
        | ID (PK)         |
        | Last Name       |
        | First Name      |
        | Address         |
        | Date of Birth   |
        | Gender          |
        | Gymnasium ID (FK)|
        +-----------------+
                 |
                 | N
                 |
                 |
                 |
                 |
        +--------v--------+
        |    Session      |
        +-----------------+
        | Type of Sport   |
        | Schedule        |
        | Maximum Capacity|
        | Gymnasium ID (FK)|
        +-----------------+
                 | 1
                 |
                 |
                 |
                 |
                 |
        +--------v--------+
        |    Coach        |
        +-----------------+
        | Last Name       |
        | First Name      |
        | Age             |
        | Specialty       |
        | Session ID (FK) |
        +-----------------+


-- Create a table for gymnasiums
CREATE TABLE Gymnasium (
    GymnasiumID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255),
    TelephoneNumber VARCHAR(20)
);

-- Create a table for members
CREATE TABLE Member (
    MemberID INT PRIMARY KEY,
    LastName VARCHAR(50),
    FirstName VARCHAR(50),
    Address VARCHAR(255),
    DateOfBirth DATE,
    Gender CHAR(1),
    GymnasiumID INT,
    FOREIGN KEY (GymnasiumID) REFERENCES Gymnasium(GymnasiumID)
);

-- Create a table for sessions
CREATE TABLE Session (
    SessionID INT PRIMARY KEY,
    TypeOfSport VARCHAR(50),
    Schedule DATETIME,
    MaximumCapacity INT,
    GymnasiumID INT,
    FOREIGN KEY (GymnasiumID) REFERENCES Gymnasium(GymnasiumID)
);

-- Create a table for coaches
CREATE TABLE Coach (
    CoachID INT PRIMARY KEY,
    LastName VARCHAR(50),
    FirstName VARCHAR(50),
    Age INT,
    Specialty VARCHAR(50),
    SessionID INT,
    FOREIGN KEY (SessionID) REFERENCES Session(SessionID)
);

