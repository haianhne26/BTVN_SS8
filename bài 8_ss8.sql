SELECT
    ma_khach_hang,
    SUM(tong_gia_tri)            AS tong_chi_tieu,
    COUNT(*)                     AS tong_so_don_hang,
    AVG(tong_gia_tri)            AS chi_tieu_trung_binh,
    MIN(ngay_dat_hang)           AS ngay_dau_tien,
    MAX(ngay_dat_hang)           AS ngay_gan_nhat
FROM DonHang
GROUP BY ma_khach_hang
ORDER BY tong_chi_tieu DESC;

SELECT
    ma_khach_hang,
    tong_chi_tieu,
    tong_so_don_hang,
    chi_tieu_trung_binh,
    ngay_dau_tien,
    ngay_gan_nhat,
    CASE
        WHEN (tong_chi_tieu >= 2500000) THEN 'Bạch Kim'           -- khách chi mạnh (kể cả 1 đơn lớn)
        WHEN (tong_chi_tieu >= 2000000 AND tong_so_don_hang >= 3) THEN 'Bạch Kim' -- hoặc chi nhiều + thường xuyên
        WHEN (tong_chi_tieu >= 800000 AND tong_so_don_hang >= 2) THEN 'Vàng'      -- khách chi trung bình & có tần suất
        WHEN (chi_tieu_trung_binh >= 500000 AND tong_so_don_hang >= 1) THEN 'Vàng' -- hoặc trung bình đơn lớn
        ELSE 'Bạc'
    END AS hang_khach_hang
FROM (

    SELECT
        ma_khach_hang,
        SUM(tong_gia_tri)            AS tong_chi_tieu,
        COUNT(*)                     AS tong_so_don_hang,
        AVG(tong_gia_tri)            AS chi_tieu_trung_binh,
        MIN(ngay_dat_hang)           AS ngay_dau_tien,
        MAX(ngay_dat_hang)           AS ngay_gan_nhat
    FROM DonHang
    GROUP BY ma_khach_hang
) AS customer_profile
ORDER BY
    CASE
        WHEN ( (tong_chi_tieu >= 2500000) OR (tong_chi_tieu >= 2000000 AND tong_so_don_hang >= 3) ) THEN 1
        WHEN ( (tong_chi_tieu >= 800000 AND tong_so_don_hang >= 2) OR (chi_tieu_trung_binh >= 500000 AND tong_so_don_hang >= 1) ) THEN 2
        ELSE 3
    END,
    tong_chi_tieu DESC;
