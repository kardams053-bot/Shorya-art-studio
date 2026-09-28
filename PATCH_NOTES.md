The supplied index.html is the current Shorya Art Studio customer site. The auto-confirm backend files are included, but the live frontend should be switched from the old screenshot/UPI QR flow to Cashfree Checkout after the merchant credentials are configured.

Recommended frontend changes:
- Add Cashfree JS SDK: https://sdk.cashfree.com/js/v3/cashfree.js
- Before checkout, insert the order into Supabase with status PENDING and the calculated `payment_amount`.
- Call `cashfree-create-order` with `{order_id}`.
- Open Cashfree Checkout with the returned `payment_session_id`.
- Remove the mandatory payment screenshot requirement.
- Keep the existing Cloudinary reference-photo upload.
- Webhook changes Supabase status to CONFIRMED after verified SUCCESS.
