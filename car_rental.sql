Create database RentCar;
use RentCar;

CREATE TABLE car_type (
	typeID varchar(4) NOT NULL,
	typeLabel varchar(45) NOT NULL,
    typeDescr varchar(45) DEFAULT NULL,
    PRIMARY KEY (typeID),
    UNIQUE KEY typeID_UNIQUE (typeID)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    
CREATE TABLE car (
	carID varchar(3) NOT NULL,
    currentLocationID varchar(3) NOT NULL,
	typeID varchar(4) NOT NULL,
	color varchar(45) NOT NULL,
    brand varchar(45) NOT NULL,
    model varchar(45) NOT NULL,
    description varchar(45) DEFAULT NULL,
    purchDate date NOT NULL,
    PRIMARY KEY (carID),
    UNIQUE KEY typeID_UNIQUE (typeID),
    UNIQUE KEY currentLocationID_UNIQUE (currentLocationID),
    UNIQUE KEY carID_UNIQUE (carID),
    CONSTRAINT currentLocationID foreign key (currentLocationID) references crc_office (locationID) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT locationID foreign key (currentLocationID) references crc_office (locationID) ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT typeID foreign key (typeID) references car_type (typeID) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    
CREATE TABLE office_tel (
	defaultTel int(11) NOT NULL,
    tel1 int(11) DEFAULT NULL,
    tel2 int(11) DEFAULT NULL,
    tel3 int(11) DEFAULT NULL,
    PRIMARY KEY (defaultTel),
    UNIQUE KEY defaultTel_UNIQUE (defaultTel)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE crc_office (
	locationID varchar(3) NOT NULL,
    defaultTel int(11) NOT NULL,
    street varchar(45) NOT NULL,
    number varchar(45) NOT NULL,
    city varchar(45) NOT NULL,
    state varchar(45) NOT NULL,
    country varchar(45) NOT NULL,
    PRIMARY KEY (locationID),
    UNIQUE KEY locationID_UNIQUE (locationID),
    UNIQUE KEY defaultTel_UNIQUE (defaultTel),
    KEY defaultTel_idx (defaultTel),
    CONSTRAINT defaultTel foreign key (defaultTel) references office_tel (defaultTel) ON DELETE CASCADE ON UPDATE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    
CREATE TABLE customers (
    customerID int(11) NOT NULL,
    ssn int(11) NOT NULL,
    firstName varchar(45) NOT NULL,
    lastName varchar(45) NOT NULL,
    mobile varchar(45) NOT NULL,
    state varchar(45) NOT NULL,
    country varchar(45) NOT NULL,
    email varchar(45) DEFAULT NULL,
    PRIMARY KEY (customerID),
    UNIQUE KEY ssn_UNIQUE (ssn),
    UNIQUE KEY customerID_UNIQUE (customerID)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
    
CREATE TABLE reservation (
	reservationID varchar(3) NOT NULL, 
    amount double NOT NULL,
	pickupDate	date NOT NULL, 
    returnDate	date NOT NULL,
	pickupLocationID varchar (3) NOT NULL ,
	returnLocationID varchar(3) NOT NULL,
	customerID int(11) NOT NULL, 
    carID varchar (3) NOT NULL, 
    PRIMARY KEY (reservationID),
	UNIQUE KEY	reservationID_UNIQUE (reservationID), 
    KEY pickupLocationID_idx (pickupLocationID), 
    KEY customerID_idx (customerID) ,
	KEY	carID_idx (carID),
	CONSTRAINT carID FOREIGN KEY (carID) REFERENCES car (carID) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT customerID FOREIGN KEY (customerID) REFERENCES customers (customerID) ON DELETE NO ACTION ON UPDATE NO ACTION,
	CONSTRAINT pickupLocationID FOREIGN KEY (pickupLocationID) REFERENCES crc_office (locationID) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


insert into car_type values(101, 'SUV', 'Good for Off-road');
insert into car_type values(102, 'Sedan', 'Good luxury feel');
insert into car_type values(103, 'Hatchback', 'Mini car to get through traffic');
insert into car_type values(104, 'Truck', 'For the Adventurer');
insert into car_type values(105, 'Bus', 'For the huge extended family');

insert into office_tel values(1234567890, 567890123, 671463903, 347271036);

insert into crc_office values('Brk', 1234567890 , '634 74th Street', '3472554501', 'NYC', 'NY', 'USA');
insert into car values(1, 'Brk', 101, 'Grey', 'Fiat', 'Basic', 'Family drive', '2020-05-01');
insert into customers values(111, 45678246, 'Sam', 'Hodd', '3474569087', 'NY', 'USA', 'sam.hodd@gmail.com');
insert into customers values(112, 76251027, 'Sanj', 'Jang', '3256794561', 'LA', 'USA', 'sanj@hotmail.com');
insert into customers values(113, 52463917, 'Tejas', 'Rathod', '4561237890', 'MD', 'USA', 'tejas@gmail.com');
insert into customers values(114, 12539027, 'Kim', 'Un', '6789075634', 'NY', 'USA', 'kimun@outlook.com');
insert into customers values(115, 42815292, 'Mahe', 'Gayles', '2451345678', 'IL', 'USA', 'mgayles@yahoo.com');
insert into customers values(116, 28262821, 'Tassamai', 'Sawetpibul', '6785641324', 'NJ', 'USA', 'ts@hotmail.com');
insert into customers values(117, 63827383, 'Katrina', 'Kaif', '7896785534', 'NY', 'USA', 'kkkaif@gmail.com');
insert into customers values(118, 23519625, 'Aish', 'Kore', '5678905680', 'IL', 'USA', 'kasih@yahoo.com');
insert into reservation values(10, 500, '2020-05-01', '2020-05-03', 'Brk', 'Mhn', 111, '1');


insert into office_tel values(1234567890, 567890123, 671463903, 347271036);
insert into office_tel values(1452729122, 567890123, 671463903, 347271036);
insert into office_tel values(456789679, 567890123, 671463903, 347271036);
insert into office_tel values(671819833, 567890123, 671463903, 347271036);
insert into office_tel values(572819382, 567890123, 671463903, 347271036);

insert into crc_office values('Mhn', 456789679 , '45th West Street', '567890123', 'NYC', 'NY', 'USA');
insert into crc_office values('Spr', 1452729122 , '46th SpringField Street', '347271036', 'SpringField', 'IL', 'USA');
insert into crc_office values('Bru', 671819833 , '4th Brunswick Street', '567890123', 'New Brunswick', 'NJ', 'USA');
insert into crc_office values('Blt', 572819382 , '104th Baltimore Street', '671463903', 'Baltimore', 'MD', 'USA');

-- insert into crc_office values('Chi', 2562792213 , '12th Chicago Street', '347271036', 'Chicago', 'IL', 'USA');


-- insert into car values(6, 'Brk', 101, 'Red', 'Volkswagen', 'Basic', 'Family drive', '2019-05-02');
insert into car values(2, 'Mhn', 102, 'Green', 'Mercedes', 'Medium', 'Romantic drive', '2015-05-01');
-- insert into car values(3, 'Bru', 102, 'Maroon', 'Tesla', 'Basic', 'Romantic drive', '2013-04-15');
-- insert into car values(4, 'Brk', 104, 'Sky blue', 'Tesla', 'Top End', 'Adventurous drive', '2020-03-01');
insert into car values(5, 'Spr', 105, 'Pink', 'Fiat', 'Top End', 'Extended Family drive', '2018-02-20');

insert into reservation values(11, 700, '2020-05-02', '2020-05-03', 'Mhn', 'Brk', 117, '2');
insert into reservation values(12, 2500, '2020-05-03', '2020-05-05', 'Mhn', 'Spr', 114, '5');
insert into reservation values(13, 3700, '2020-05-01', '2020-05-06', 'Spr', 'Brk', 115, '2');
insert into reservation values(9, 4700, '2020-03-05', '2020-03-08', 'Brk', 'Spr', 117, '5');
insert into reservation values(8, 5500, '2020-02-13', '2020-02-17', 'Brk', 'Blt', 111, '2');


select * from car_type;
select * from car;
select * from office_tel;
select * from crc_office;
select * from customers;
select * from reservation;


# a. Show the reservation number and the location ID of all rentals in 5/20/2015

select reservationID, pickupLocationID 
from reservation
where pickupDate = '2020-05-01';

#Show the first and the last name and the mobile phone number of those customers that have rented a car in the category that has label = 'sedan'

select distinct c.firstName, c.lastName, c.mobile
from customers as c, reservation as r, car_type as t, car 
where c.customerID=r.customerID and r.carID=car.carID and car.typeID=t.typeID and t.typeLabel='Bus';

#Show the total amount of rentals per location ID (pick up)

select pickupLocationID, count(carID)
from reservation 
group by pickupLocationID;

#Show the total amount of rentals per car's category ID and month

select car.typeID,  extract(year from r.pickupDate) "Year", extract(month from r.pickupDate) "Month", count(r.carID) "No. of Cars"
from  reservation as r, car
where r.carID=car.carID 
group by car.typeID, year, month
order by car.typeID ASC, year ASC, month ASC;

#For each rental’s state (pick up) show the top renting category

create view State as
select o.state, t.typeLabel, count(reservationID) as rentals
from reservation as r, CRC_office as o, car as c, car_type as t
where r.pickupLocationID=o.locationID and r.carID=c.carID and c.typeID=t.typeID 
group by o.state, c.typeID
order by o.state, rentals DESC;

select state, typeLabel , max(rentals) 
from State
group by state;

drop view State;

#f. Show how many rentals there were in May 2015 in ‘NY’, ‘NJ’ and ‘CA’ (in three columns)

create view transpose as
select o.state, count(r.reservationID) as rentals
from reservation as r, CRC_office as o
where r.pickupLocationID=o.locationID and (o.state="NY" or o.state="NJ" or o.state="IL") and extract(year from r.pickupDate)=2020 and extract(month from r.pickupDate)=5
group by o.state; 

drop view transpose;

select 
  sum(if(state = 'NY', rentals, 0)) AS 'NY', 
  sum(if(state = 'NJ', rentals, 0)) AS 'NJ', 
  sum(if(state = 'IL', rentals, 0)) AS 'IL'
        from transpose;

#g. For each month of 2015, count how many rentals had amount greater than - this - month's average rental amount

SELECT year(a.pickupdate) as yr, month(a.pickupDate) as mnth, count(a.reservationID) as counter
FROM reservation as a
WHERE year(a.pickupDate)=2020 and a.amount > 
(SELECT avg(b.amount)
from reservation as b
where month(a.pickupDate)=month(b.pickupDate) and year(a.pickupDate)=year(b.pickupDate) 
group by month(b.pickupDate))
group by month(a.pickupDate);

#g. For each month of 2015, count how many rentals had amount greater than - every - month's average rental amount

select year(pickupdate) as yr, month(pickupDate) as mnth, count(reservationID) as counter
from reservation
where amount>all
(select avg(amount)
from reservation
group by month(pickupDate))
and reservationID in
(select reservationID 
from reservation
where year(pickupDate)=2020 )
group by month(pickupDate);
																				
#h. For each month of 2015, show the percentage change of the 
#total amount of rentals over the total amount of rentals of the same month of 2014

SELECT year(t.pickupdate) as yr, month(t.pickupdate) as mnth, ROUND((t.amount- l.amount) * 100 / 
       t.amount, 2) as percent
FROM      reservation as l
INNER JOIN reservation as t 
ON month(t.pickupdate) = month(l.pickupdate) AND year(l.pickupdate) = year(t.pickupdate) - 1 where year(t.pickupdate)=2020;

#For each month of 2015, show in three columns: the total rentals’ amount of the previous months,
# the total rentals’ amount of this month and the total rentals’ amount of the following months


select cumTi-ti as prevMonths, ti as thisMonth, cumulativeTotal-cumTi as nextMonths  from
	(SELECT 
			year(b.pickupdate) AS yr, month(b.pickupdate) AS mnth,
			sum(b.amount) AS ti, (select sum(amount) from reservation where year(pickupdate)=2020) as cumulativeTotal,

				(SELECT   
						 sum(a.amount) as cumTi 
					  FROM reservation as a
					  WHERE month(a.pickupdate) <= mnth and year(a.pickupdate)=yr
                      GROUP BY mnth ASC
				)as cumTi
			
            FROM reservation AS b
			where year(b.pickupdate)=2020
			GROUP BY month(b.pickupdate) ASC
		) as tiandTi
        
        
