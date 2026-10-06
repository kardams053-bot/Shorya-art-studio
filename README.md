# Shorya Art Studio — UPI + Notifications Package

Files:
- index.html — customer artwork order page
- admin.html — Supabase admin order panel with 10-second refresh and browser notifications
- assets/SamsungPay_QR.png — UPI QR for poweredbysamsung05@pingpay

Deployment on GitHub/Render:
1. Upload index.html to repository root.
2. Upload admin.html to repository root.
3. Upload assets/SamsungPay_QR.png inside an `assets` folder.
4. Render Static Site: build command blank, publish directory `.`.
5. Admin page: /admin.html

Important: browser notifications require permission. WhatsApp is opened with a prefilled message; the seller/customer must still press Send.
