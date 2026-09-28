alter table public.orders add column if not exists payment_amount numeric;
alter table public.orders add column if not exists cashfree_order_id text;

create index if not exists orders_cashfree_order_id_idx on public.orders(cashfree_order_id);

-- Customer checkout can create the initial pending order.
grant insert on table public.orders to anon;

-- No public SELECT/UPDATE is granted here. The Edge Functions use the server-side
-- Supabase service role key, which stays inside Supabase and is never exposed to customers.
