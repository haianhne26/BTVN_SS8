SELECT ten_goi,
       COUNT(*) AS so_luot_dang_ky,
       SUM(phi_hang_thang) AS tong_doanh_thu
FROM DangKyGoi
GROUP BY ten_goi;

SELECT ma_khach_hang,
       SUM(phi_hang_thang) AS tong_chi_tieu,
       COUNT(*) AS so_goi_da_mua,
       MIN(ngay_bat_dau) AS ngay_tham_gia_dau_tien
FROM DangKyGoi
GROUP BY ma_khach_hang;
