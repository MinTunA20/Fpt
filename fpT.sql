create database fpt;

create table NHACUNGCAP(
MaNhaCC int primary key,
TenNhaCC varchar(255),
DiaChi varchar(255),
SDT varchar(20),
MaSoThue varchar(20)
);

create table LoaiDichVu(
MaLoaiDV int primary key,
TenLoaiDV varchar(255)
);

create table MucPhi(
MaMP int primary key,
DonGia varchar(255),
Mota varchar(255)
);

create table Dongxe(
Dongxe int primary key,
Hangxe varchar (20),
Sochongoi varchar(20)
);

create table DangKyCungCap(
MaDKCC int primary key,
MaNhacc int,
MaLoaiDV int,
Dongxe int,
MaMP int,
NgayBatDauCungCap date,
NgayKetThucCungCap date,
SoLuongXeDangKy int,
foreign key (MaNhacc) references NHACUNGCAP(MaNhacc),
foreign key (MaLoaiDV) references LOAIDICHVU(MaLoaiDV),
foreign key (Dongxe) references DONGXE(Dongxe),
foreign key (MaMP) references MUCPHI(MaMP)
);

-- câu 3
select * from dongxe where songuoingoi > 5;
-- câu 4
select * from nhacungcap  join dongxe on nhacungcap.dongxecc = dongxe.dongxe
where dongxe.hangxe = 'toyota';
-- câu 5
select * from nhacungcap order by tennhacc ASC;
select * from nhacungcap order by masothue desc;
-- câu 6
select  nhacungcap.manhacc , nhacungcap.tennhacc, count(maDKCC) as 'số lần đăng ký cung cấp'
From dangkycungcap  join nhacungcap  on dangkycungcap.manhacc = nhacungcap.manhacc
where dangkycungcap.BdCCdate > '2019-12-15'
group by nhacungcap.manhacc;

-- cau7
select DISTINCT dx.hangxe as "hang xe" from dongxe as dx;

-- câu 8
select dangkycungcap.MaDKCC, dangkycungcap.MaNhaCC, nhacungcap.TenNhaCC, NhaCungCap.DiaChi, nhacungcap.MaSoThue, loaidichvu.TenLoaiDV, mucphi.DonGia, dongxe.HangXe, dangkycungcap.bdccdate, dangkycungcap.ktccdate,count(maDKCC)
from dangkycungcap  join NhaCungCap  on dangkycungcap.manhacc = nhacungcap.manhacc and dangkycungcap.dongxe = nhacungcap.dongxecc join dongxe  on dangkycungcap.dongxe = dongxe.dongxe join loaidichvu  on dangkycungcap.maloaidv = loaidichvu.maloaiDV join mucphi  on dangkycungcap.mamucphi = mucphi.mamucphi
group by nhacungcap.MaNhaCC;

-- cau10
select TenNhaCC from NHACUNGCAP as NHACC
where NHACC.MaNhaCC not in (select MaNhaCC from DANGKYCUNGCAP);
