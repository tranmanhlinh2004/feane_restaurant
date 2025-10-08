create database feane
go
use feane

create table Role(
	Role_id int identity(1,1) primary key not null,
	RoleName nvarchar(30)
)

create table Account(
	Account_id int identity(1,1) primary key not null,
	UserName varchar(100),
	Password char(100),
	Fullname nvarchar(255),
	Email nvarchar(255),
	Phone char(10),
	Role_id int foreign key references Role(Role_id)
)

create table ParentMenu(
	ParentMenu_id int identity(1,1) primary key not null,
	Title nvarchar(50),
	Alias varchar(255),
	Levels int,
	Position int
)

create table SubMenu(
	SubMenu_id int identity(1,1) primary key not null,
	Title nvarchar(50),
	Alias varchar(255),
	Levels int,
	Position int,
	ParentMenu_id int foreign key references ParentMenu(ParentMenu_id)
)

create table ProductCategory(
	Category_id int identity(1,1) primary key not null,	
	CategoryName nvarchar(50),
)

create table Product(
	Product_id int identity(1,1) primary key not null,
	Category_id int foreign key references ProductCategory(Category_id),
	ProductName nvarchar(255),
	Image nvarchar(255),
	Price decimal(10,2),
	Detail nvarchar(255),
)

create table ProductDetail(
	ProductDetail_id int identity(1,1) primary key not null,
	Product_id int foreign key references Product(Product_id),
	ProductName nvarchar(255),
	Detail nvarchar(255),
	Image nvarchar(255),
	Price decimal(10,2),
	Sold int,             -- số lượng đã bán ra
	Star int           -- số sao đánh giá
)

create table Blog(
	Blog_id int identity(1,1) primary key not null,
	Title nvarchar(255),
	Alias nvarchar(255),
	Image nvarchar(255),
	Descipption nvarchar(255),
	CreatedDate Datetime,
	CreatedBy nvarchar(255),
	EditedDate Datetime,
	EditedBy nvarchar(255)
)

create table BlogDetail(
	BlogDetail_id int identity(1,1) primary key not null,
	Blog_id int foreign key references Blog(Blog_id),
	Comment_id int foreign key references Comment(Comment_id),
	Title nvarchar(255),
	Alias nvarchar(255), 
	Content nvarchar(500),
	CreatedDate Datetime,
	EditedDate Datetime,
	EditedBy nvarchar(255)
)

create table Comment(
	Comment_id int identity(1,1) primary key not null,
	Account_id int foreign key references Account(Account_id),
	Content nvarchar(500),
	CommentDate Datetime
)

create table BookTable(
	Book_id int identity(1,1) primary key not null,
	Account_id int foreign key references Account(Account_id),
	BookDate Datetime,
	MountOfPeople int,
	Note nvarchar(255)
)

create table PreOrder(
	Order_id int identity(1,1) primary key not null,
	Account_id int foreign key references Account(Account_id) not null,
	Address nvarchar(255),
	OrderStatus	nvarchar(30), 
	TotalPrice decimal(10,2)
)

create table OrderDetail(
	OrderDetail_id int identity(1,1) primary key not null,
	Order_id int foreign key references PreOrder(Order_id),
	Product_id int foreign key references Product(Product_id),
	Quanlity int, 
	Price decimal(10,2)
)

create table Cart(
	Cart_id int identity(1,1) primary key not null,
	Product_id int foreign key references Product(Product_id),
	Quanlity int, 
	Price decimal(10,2),
	TotalPrice decimal(10,2)
)

create table Payment(
	Payment_id int identity(1,1) primary key not null,
	Account_id int foreign key references Account(Account_id),
	PaymentMethod nvarchar(30),
	PaymentDate Datetime,
)