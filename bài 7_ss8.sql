SELECT ten_san_pham,
SUM (so_luong) AS tong_so_ly_ban,
SUM(thanh_tien) AS tong_doanh_thu,
COUNT(DISTINCT ma_don_hang) AS so_don_hang_chua_sp

FROM ChiTietDonHang
GROUP BY ten_san_pham
ORDER BY tong_doanh_thu DESC;

