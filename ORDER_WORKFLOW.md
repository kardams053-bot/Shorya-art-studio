# Shorya Art Studio – Order & Notification Flow

1. Customer selects artwork, uploads reference photo and payment screenshot.
2. Customer selects 25%, 50% or 100% advance and submits the order.
3. Order is saved to Supabase with status PENDING and uploaded files are stored in Cloudinary.
4. Admin opens `admin.html`, reviews the order and payment screenshot.
5. **Confirm + Notify Customer** changes the order to CONFIRMED and opens WhatsApp to the customer's number with a pre-filled confirmation message. The admin presses **Send** to deliver it.
6. **Reject + Notify Customer** does the same for a rejection message.

## Important
Static HTML cannot silently send WhatsApp messages in the background. The notification flow therefore opens the customer's WhatsApp chat with the message ready; one tap on **Send** is required. Fully automatic WhatsApp notifications require the WhatsApp Business Cloud API or another messaging provider.
