CREATE TYPE cart_status AS ENUM('OPEN', 'ORDERED');

CREATE TABLE carts (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    created_at DATE NOT NULL,
    updated_at DATE NOT NULL,
    status cart_status NOT NULL
);

CREATE TABLE cart_items (
    cart_id UUID NOT NULL,
    product_id UUID,
    count INTEGER,
    FOREIGN KEY(cart_id) REFERENCES carts(id)
);

INSERT INTO carts(id, user_id, created_at, updated_at, status)
VALUES
    ('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', current_date, current_date, 'OPEN'),
    ('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'd0eebc99-9c0b-4ef8-bb6d-6bb9bd380a44', current_date, current_date, 'ORDERED');

INSERT INTO cart_items(cart_id, product_id, count)
VALUES
    ('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'bb0ddc99-9c0b-4ef8-bb6d-6bb9bd380add', 3),
    ('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a33', 'dd0bbc99-9c0b-4ef8-bb6d-6bb9bd380abb', 1);