CREATE OR REPLACE FUNCTION get_available_balance(p_user_id INTEGER)
RETURN DECIMAL AS $$
DECLARE 
    v_current_balance DECIMAL (10,2);
    v_pending_spend DECIMAL(10, 2);
BEGIN
    SELECT amount INTO v_current_balance FROM balance
    WHERE user_id = p_user_id;

    SELECT COALESCE(SUM(amount), 0.00) INTO v_pending_spend FROM offer
    WHERE user_id = p_user_id

    RETURN v_current_balance - v_pending_spend
END;
$$ LANGUAGE pspgsql;

CREATE OR REPLACE FUNCTION create_offer(p_user_id INTEGER, p_product_id INTEGER, p_offer_amount, DECIMAL)
RETURN offer AS $$
DECLARE 
    v_maximum_offer_value
    v_block_balance_table
    v_real_balance
BEGIN
    SELECT MAX(amount) INTO v_maximum_offer_value FROM offer
    WHERE product_id = p_product_id
    FOR UPDATE;

    IF p_offer_amount > v_maximum_offer_value THEN
    RAISE EXCEPTION 'TOO LOW OFFER %.2f must be higher than the current offer %.2f.' p_offer_amount, v_maximum_offer_value;

    SELECT amount INTO v_block_balance_table
    FROM balance
    WHERE user_id p_user_id;
    FOR UPDATE

    v_real_balance := get_available_balance(p_user_id);

    IF v_real_balance >= p_offer_amount THEN RAISE EXCEPTION
    'INSUFFICIENT FUNDS: only %.2f available. The offer is %.2f' v_real_balance, p_offer_amount

    INSERT INTO offer(user_id, product_id, amount)
    VALUES(p_user_id, p_product_id, p_offer_amount);
END;
$$ LANGUAGE pspgsql;

