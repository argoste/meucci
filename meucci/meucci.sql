--Using SQL as DDL := Data Definition Language
-- encoding utf8;   For MySQL v5.5
create database Meucci
	character set utf8;
use Meucci;
create table PublishedBook 
	(
	ISBN int not null,
	Title char not null,
	PubYear year check(PubYear >= year(now())),
	Publisher char,
	AuthorID int,
	primary key (ISBN),
	foreign key (AuthorID) references Author (AuthorID)
	);
create table OwnedBook
	(
	Inventory int not null auto_increment,
	ISBN int not null,
	ShelfNum int not null,
	PurchaseDate date,
	PurchaseCost int,
	Loan int,
	primary key (Inventory),
	foreign key (ISBN) references PublishedBook (ISBN),
	foreign key (ShelfNum) references Shelf (ShelfNum),
	foreign key (Loan) references LibUser(ID)
	);
create table Author
	(
	AuthorID int not null auto_increment,
	FirstName char,
	Surname char not null,
	Birth year,
	Death year,
	primary key (AuthorID),
	check(Death > Birth)
	);
create table Theme
	(
	Name char not null,
	primary key (Name)
	);
create table LibUser
	(
	UserID int not null,
	Name char not null,
	Surname char not null,
	Phone int not null,
	Address char not null,
	Good bit not null default 0,
	primary key (UserID)
	);
create table Shelf
	(
	ShelfNum int not null,
	Room int not null,
	primary key (ShelfNum)
	);
create table Loan
	(
	LoanID int not null,
	InvNum int not null,
	FromDate date not null,
	ToDate date not null,
	UserID int not null,
	primary key (LoanID),
	check(FromDate < ToDate),
	foreign key (InvNum) references OwnedBook (InvNum),
	foreign key (UserID) references LibUser (UserID)
	);
create table Writing
	(
	AuthorID int not null,
	ISBN int not null
	);
create table Explaining
	(
	Theme char not null,
	ISBN int not null
	);
