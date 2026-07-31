DROP DATABASE IF EXISTS ola;
CREATE DATABASE ola;
USE ola;
select *
from booking;

# Retrieve all successful bookings:
Create View Successful_booking As
select * 
from booking
where Booking_Status = 'Success';

#2. Find Vehicle_Type the average ride distance for each vehicle type:
create View ride_distance_for_each_vehicle As
select Vehicle_Type,avg(Ride_Distance) as avg_distance
from booking
group by Vehicle_Type;

#3. Get the total number of cancelled rides by customers:
create view cancelled_rides_by_customers As
select count(*) 
from booking
where Booking_Status ='Canceled By Customer' ;

#4. List the top 5 customers who booked the highest number of rides:
create view top_5_customers As
select Customer_ID,count(Booking_ID) As total_rides
from booking
group by Customer_ID
order by total_rides desc limit 5;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
create view cancelled_by_drivers_P_C_Issues As
select count(*)
from booking
where Canceled_Rides_by_Driver = 'Personal & Car Related Issue';

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings
create view Max_Min_Driver_Rating As
select max(Driver_Ratings) As max_rating , min(Driver_Ratings) As min_rating
from booking
where Vehicle_Type = 'Prime Sedan';

#7. Retrieve all rides where payment was made using UPI:
create view UPI_Payment As
select *
from booking
where Payment_Method = 'UPI';

#8. Find the average customer rating per vehicle type:
create view Avg_Cust_Rating As
select Vehicle_Type,avg(Customer_Rating) As avg_customer_rating
from booking
group by Vehicle_Type;

#9. Calculate the total booking value of rides completed successfully:
create view total_successull_ride_value As
select SUM(Booking_Value) As total_successull_ride_value
from booking 
where Booking_Status ='Success';
 
#10. List all incomplete rides along with the reason:
create view incomplete_ride_reason As
select Booking_ID,Incomplete_Rides_Reason 
from booking
where Incomplete_Rides ='Yes';

# 1. Retrieve all successful bookings:
select * from Successful_booking;

#2. Find Vehicle_Type the average ride distance for each vehicle type:
select * from ride_distance_for_each_vehicle;

#3. Get the total number of cancelled rides by customers:
select * from cancelled_rides_by_customers;

#4. List the top 5 customers who booked the highest number of rides:
select * from top_5_customers ;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues:
select * from cancelled_by_drivers_P_C_Issues;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings
select * from  Max_Min_Driver_Rating;

#7. Retrieve all rides where payment was made using UPI:
select * from UPI_Payment ;

#8. Find the average customer rating per vehicle type:
select * from Avg_Cust_Rating;

#9. Calculate the total booking value of rides completed successfully:
 select * from total_successull_ride_value;
 
 #10. List all incomplete rides along with the reason:
select * from incomplete_ride_reason;


