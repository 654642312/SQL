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