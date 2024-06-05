Hotel (Hotel_ID, Name, Address, Phone)
    Primary Key: Hotel_ID

Room (Room_ID, Hotel_ID, Type, Capacity, Price)
    Primary Key: Room_ID
    Foreign Key: Hotel_ID (references Hotel(Hotel_ID))

Guest (Guest_ID, First_Name, Last_Name, Address, Phone, Email)
    Primary Key: Guest_ID

Reservation (Reservation_ID, Guest_ID, Room_ID, Check_In_Date, Check_Out_Date)
    Primary Key: Reservation_ID
    Foreign Key: Guest_ID (references Guest(Guest_ID))
    Foreign Key: Room_ID (references Room(Room_ID))

Payment (Payment_ID, Reservation_ID, Amount, Payment_Date)
    Primary Key: Payment_ID
    Foreign Key: Reservation_ID (references Reservation(Reservation_ID))

Employee (Employee_ID, First_Name, Last_Name, Position, Salary)
    Primary Key: Employee_ID
