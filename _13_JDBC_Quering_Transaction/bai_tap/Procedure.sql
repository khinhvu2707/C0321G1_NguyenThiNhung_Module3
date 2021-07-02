
Delimiter $$
create procedure show_user()
begin
select * from users;
end $$
delimiter ;

Delimiter $$
create procedure edit_user(IN user_name varchar(50),IN user_email varchar(50),IN user_country varchar(50),in editId int)
begin
update users set name = user_name,email= user_email, country =user_country where id = editId;
end $$
delimiter ;
call edit_user(1,"Nhung","123@gmail.com","VN");
Delimiter $$
create procedure delete_user(in deleteId int)
begin
delete from users where id = deleteId;
end $$
delimiter ;