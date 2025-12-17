CREATE TABLE message (
    id SERIAL PRIMARY KEY,
    chat_id INT NOT NULL REFERENCES chats(id) ON DELETE CASCADE,
    sender_id INT NOT NULL REFERENCES users(id),
    content VARCHAR(500) NOT NULL,
    parent_message_id INT REFERENCES messages(id) ON DELETE SET NULL,
    count_delivered INT NOT NULL DEFAULT 0,
    count_read INT NOT NULL DEFAULT 0,
    total_receivers INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);