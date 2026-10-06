# Shorya Art Studio — New Order Notification

- Customer order is saved to Supabase `orders`.
- Admin panel (`admin.html`) uses Supabase authentication with admin email `Kardams053@gmail.com`.
- New pending orders are checked every 10 seconds while the admin panel is open.
- New order notification: browser notification + sound + banner.
- Confirm & Notify updates order status to `CONFIRMED` and opens WhatsApp to the customer's saved WhatsApp number with the confirmation message.
- Reject & Notify updates order status to `REJECTED` and opens WhatsApp to the customer's saved WhatsApp number.
- Browser notifications require the user to allow notifications.
- Supabase RLS must allow authenticated admin SELECT/UPDATE using the existing admin-email policies.
