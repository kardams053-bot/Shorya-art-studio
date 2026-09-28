# Shorya Art Studio — Cashfree Auto-Confirm

This package upgrades the existing Shorya Art Studio site from screenshot-based payment confirmation to Cashfree hosted checkout + server-side payment verification + webhook auto-confirmation.

## Flow
1. Customer fills the artwork order.
2. Site uploads the reference photo to Cloudinary.
3. Site creates a `PENDING` order in Supabase.
4. Supabase Edge Function creates the Cashfree order using the server-side secret.
5. Customer pays through Cashfree checkout (UPI supported).
6. Cashfree webhook is signature-verified.
7. Supabase order status changes automatically to `CONFIRMED` only for a successful payment.

## Required one-time Supabase SQL
Run `supabase.sql` in Supabase SQL Editor.

## Required Supabase secrets
Set these in Supabase Edge Functions secrets (never put them in index.html):
- CASHFREE_CLIENT_ID
- CASHFREE_CLIENT_SECRET
- CASHFREE_ENV = sandbox (for testing) or production (for live)

## Deploy
Install Supabase CLI and run from this folder:

```bash
supabase login
supabase link --project-ref axyojwdqtcirqpjjyjsu
supabase secrets set CASHFREE_CLIENT_ID=YOUR_ID CASHFREE_CLIENT_SECRET=YOUR_SECRET CASHFREE_ENV=sandbox
supabase functions deploy cashfree-create-order --no-verify-jwt
supabase functions deploy cashfree-webhook --no-verify-jwt
supabase functions deploy cashfree-status --no-verify-jwt
```

The webhook URL will be:
`https://axyojwdqtcirqpjjyjsu.supabase.co/functions/v1/cashfree-webhook`

Configure this URL in Cashfree Dashboard webhooks for payment success events.

## Important
- Do not commit Cashfree client secret to GitHub.
- Test with Cashfree Sandbox before production.
- The current static Samsung UPI QR can remain as a fallback, but it cannot itself provide automatic payment verification.
