--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-11-24 17:17:51

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16823)
-- Name: addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.addresses (
    id character varying(36) NOT NULL,
    user_id character varying(36),
    name character varying(100),
    is_primary boolean,
    city_id character varying(255),
    province_id character varying(255),
    address1 character varying(255),
    address2 character varying(255),
    phone character varying(255),
    email character varying(255),
    post_code character varying(255),
    created_at timestamp with time zone,
    update_at timestamp with time zone
);


ALTER TABLE public.addresses OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16860)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id character varying(36) NOT NULL,
    parent_id character varying(36),
    section_id character varying(36),
    name character varying(100),
    slug character varying(100),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16937)
-- Name: order_customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_customers (
    id character varying(36) NOT NULL,
    user_id character varying(36),
    order_id character varying(36),
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    city_id character varying(100),
    province_id character varying(100),
    address1 character varying(100),
    address2 character varying(100),
    phone character varying(100),
    email character varying(100),
    post_code character varying(100),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.order_customers OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16918)
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    id character varying(36) NOT NULL,
    order_id character varying(36),
    product_id character varying(36),
    qty bigint,
    base_price numeric(16,2),
    base_total numeric(16,2),
    tax_amount numeric(16,2),
    tax_percent numeric(16,2),
    discount_amount numeric(16,2),
    discount_percent numeric(16,2),
    sub_total numeric(16,2),
    sku character varying(36),
    name character varying(255),
    weight numeric(16,2),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16901)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id character varying(36) NOT NULL,
    user_id character varying(36),
    code character varying(50),
    status bigint,
    order_date timestamp with time zone,
    payment_due timestamp with time zone,
    payment_status character varying(50),
    payment_token character varying(100),
    base_total_price numeric(16,2),
    tax_amount numeric(16,2),
    tax_percent numeric(16,2),
    discount_amount numeric(16,2),
    discount_percent numeric(16,2),
    shipping_cost numeric(16,2),
    grand_total numeric(16,2),
    note text,
    shipping_courier character varying(100),
    shipping_service_name character varying(100),
    approved_by character varying(100),
    approved_at timestamp with time zone,
    cancelled_by character varying(100),
    cancelled_at timestamp with time zone,
    cancellation_note character varying(100),
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16957)
-- Name: payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payments (
    id character varying(36) NOT NULL,
    order_id character varying(36),
    number character varying(100),
    amount numeric(16,2),
    method character varying(100),
    status character varying(100),
    token character varying(100),
    payload character varying(100),
    payment_type character varying(100),
    va_number character varying(100),
    bill_code character varying(100),
    bill_key character varying(100),
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone
);


ALTER TABLE public.payments OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16872)
-- Name: product_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_categories (
    category_id character varying(36) NOT NULL,
    product_id character varying(36) NOT NULL
);


ALTER TABLE public.product_categories OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16887)
-- Name: product_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_images (
    id character varying(36) NOT NULL,
    product_id character varying(36),
    path text,
    extra_large text,
    large text,
    medium text,
    small text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.product_images OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16837)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id character varying(36) NOT NULL,
    parent_id character varying(36),
    user_id character varying(36),
    sku character varying(255),
    name character varying(255),
    slug character varying(255),
    price numeric(16,2),
    stock bigint,
    weight numeric(16,2),
    short_description text,
    description text,
    status bigint DEFAULT 0,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16854)
-- Name: sections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sections (
    id character varying(36) NOT NULL,
    name character varying(100),
    slug character varying(100),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.sections OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16973)
-- Name: shipments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipments (
    id character varying(36) NOT NULL,
    user_id character varying(36),
    order_id character varying(36),
    track_number character varying(36),
    status character varying(36),
    total_qty bigint,
    total_weight numeric(10,2),
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    city_id character varying(100),
    province_id character varying(100),
    address1 character varying(100),
    address2 character varying(100),
    phone character varying(100),
    email character varying(100),
    post_code character varying(100),
    shipped_by character varying(100),
    shipped_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone
);


ALTER TABLE public.shipments OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16814)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id character varying(36) NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    remember_token character varying(255) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    deleted_at timestamp with time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 4894 (class 0 OID 16823)
-- Dependencies: 216
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.addresses (id, user_id, name, is_primary, city_id, province_id, address1, address2, phone, email, post_code, created_at, update_at) FROM stdin;
\.


--
-- TOC entry 4897 (class 0 OID 16860)
-- Dependencies: 219
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, parent_id, section_id, name, slug, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4902 (class 0 OID 16937)
-- Dependencies: 224
-- Data for Name: order_customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_customers (id, user_id, order_id, first_name, last_name, city_id, province_id, address1, address2, phone, email, post_code, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4901 (class 0 OID 16918)
-- Dependencies: 223
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (id, order_id, product_id, qty, base_price, base_total, tax_amount, tax_percent, discount_amount, discount_percent, sub_total, sku, name, weight, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4900 (class 0 OID 16901)
-- Dependencies: 222
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, code, status, order_date, payment_due, payment_status, payment_token, base_total_price, tax_amount, tax_percent, discount_amount, discount_percent, shipping_cost, grand_total, note, shipping_courier, shipping_service_name, approved_by, approved_at, cancelled_by, cancelled_at, cancellation_note, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 4903 (class 0 OID 16957)
-- Dependencies: 225
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payments (id, order_id, number, amount, method, status, token, payload, payment_type, va_number, bill_code, bill_key, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 4898 (class 0 OID 16872)
-- Dependencies: 220
-- Data for Name: product_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_categories (category_id, product_id) FROM stdin;
\.


--
-- TOC entry 4899 (class 0 OID 16887)
-- Dependencies: 221
-- Data for Name: product_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_images (id, product_id, path, extra_large, large, medium, small, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4895 (class 0 OID 16837)
-- Dependencies: 217
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, parent_id, user_id, sku, name, slug, price, stock, weight, short_description, description, status, created_at, updated_at, deleted_at) FROM stdin;
775ba6ad-f475-4bca-ae58-248e7be8d619		00f42124-59e2-4ece-bb96-7937887e8eb2	prince-antwan-waters	Prince Antwan Waters	prince-antwan-waters	1473884.88	59	0.80	Accusantium voluptatem aut perferendis sit consequatur.	Aut accusantium perferendis consequatur voluptatem sit. Consequatur sit accusantium voluptatem aut perferendis. Aut voluptatem sit accusantium consequatur perferendis. Consequatur accusantium voluptatem aut sit perferendis.	1	2024-11-21 15:51:28.94596+07	2024-11-21 15:51:28.94596+07	\N
			SPH456	Smartphone		700.00	50	0.30		A high-quality smartphone.	0	2024-11-22 21:45:16.937844+07	2024-11-22 21:45:16.937844+07	\N
78c1a359-4d56-4d42-92be-c4092e4b21bf				Gaming Laptop		1500.00	8	0.00			0	0001-01-01 06:42:04+06:42:04	2024-11-22 21:47:31.723689+07	\N
4d9a115d-87c2-44fa-a185-560ecd186909		63d3424e-dacf-4d50-8e06-b0e9b3bbb54f		Mr. Sheridan Abbott	mr-sheridan-abbott	2616.57	79	0.07	Voluptatem aut perferendis sit consequatur accusantium. Sit aut accusantium voluptatem consequatur perferendis. Sit perferendis voluptatem consequatur accusantium aut. Voluptatem accusantium aut consequatur perferendis sit.	Accusantium perferendis aut voluptatem consequatur sit. Voluptatem consequatur accusantium perferendis aut sit. Perferendis voluptatem aut accusantium consequatur sit. Aut accusantium consequatur voluptatem sit perferendis. Accusantium perferendis sit aut consequatur voluptatem. Consequatur accusantium sit voluptatem aut perferendis. Perferendis aut consequatur voluptatem sit accusantium. Accusantium aut voluptatem consequatur sit perferendis. Voluptatem sit consequatur accusantium aut perferendis. Sit voluptatem perferendis aut accusantium consequatur.	1	2024-11-21 06:22:17.023292+07	2024-11-21 06:22:17.023292+07	2024-11-22 21:49:00.286118+07
4e47c7a9-c15a-4102-9b68-5830b3f394b9		07fc435d-54a0-4448-86c5-d26969ac58a5	prince-zack-barrows	Prince Zack Barrows	prince-zack-barrows	5721.72	62	0.92	Consequatur accusantium sit perferendis voluptatem aut.	Sit voluptatem aut consequatur perferendis accusantium. Aut accusantium sit consequatur perferendis voluptatem. Sit aut consequatur perferendis accusantium voluptatem. Perferendis aut accusantium sit voluptatem consequatur. Accusantium consequatur voluptatem sit perferendis aut. Consequatur voluptatem sit perferendis accusantium aut. Consequatur sit accusantium aut perferendis voluptatem. Aut perferendis sit accusantium voluptatem consequatur. Voluptatem sit accusantium consequatur aut perferendis. Perferendis voluptatem sit consequatur aut accusantium.	1	2024-11-22 21:50:02.30018+07	2024-11-22 21:50:02.30018+07	\N
\.


--
-- TOC entry 4896 (class 0 OID 16854)
-- Dependencies: 218
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sections (id, name, slug, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 4904 (class 0 OID 16973)
-- Dependencies: 226
-- Data for Name: shipments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipments (id, user_id, order_id, track_number, status, total_qty, total_weight, first_name, last_name, city_id, province_id, address1, address2, phone, email, post_code, shipped_by, shipped_at, created_at, updated_at, deleted_at) FROM stdin;
\.


--
-- TOC entry 4893 (class 0 OID 16814)
-- Dependencies: 215
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, first_name, last_name, email, password, remember_token, created_at, updated_at, deleted_at) FROM stdin;
032c150b-32b8-4c73-afef-5884104a7875	Vince	Kassulke	UxahtqD@ATKefmx.org	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi		2024-11-21 06:14:24.779315+07	2024-11-21 06:14:24.779315+07	\N
2e281583-d35a-4052-86dd-a39367f691eb	Laverna	Conroy	EmYWmhV@wBQplbq.org	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi		2024-11-21 06:18:37.009733+07	2024-11-21 06:18:37.009733+07	\N
794f1ffc-51ce-4e08-b6ed-af22a274ed15	Rico	Wiegand	oGyJBnF@jyIuRaA.biz	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi		2024-11-21 06:18:37.017143+07	2024-11-21 06:18:37.017143+07	\N
63d3424e-dacf-4d50-8e06-b0e9b3bbb54f	Granville	Gerlach	CtVQBlT@dboChqV.info	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi		2024-11-21 06:22:17.013096+07	2024-11-21 06:22:17.013096+07	\N
6acbe0e1-2658-4421-8938-64ca7cc8ae87	Alba	Kilback	ZpnitCK@rRgqrBq.biz	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi		2024-11-21 06:22:17.021709+07	2024-11-21 06:22:17.021709+07	\N
0fd8d3c5-4447-4d5b-bb97-76b77bd63617	Hilbert	Abshire	BkacdcO@prNeXQS.ru	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi		2024-11-21 06:23:54.398164+07	2024-11-21 06:23:54.398164+07	\N
6f139f30-6462-4f2d-96d6-f31c3278863c	Adela	Zulauf	tSEsZFI@mVXrVIk.net	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi		2024-11-21 06:23:54.412583+07	2024-11-21 06:23:54.412583+07	\N
00f42124-59e2-4ece-bb96-7937887e8eb2	Robyn	Bernier	FMPdwto@cSAsvdd.com	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi		2024-11-21 15:51:28.928847+07	2024-11-21 15:51:28.928847+07	\N
			jane.doe@example.com	securepassword123		2024-11-22 21:14:08.479125+07	2024-11-22 21:14:08.479125+07	\N
eaa62e18-7b42-464d-b479-a262571a2f84			vikyarthya@example.com	vikysan		2024-11-22 21:32:14.596333+07	2024-11-22 21:32:14.596333+07	\N
55e3fdc8-3a56-4797-a762-424e07fadaf9			john.smith@example.com			0001-01-01 06:42:04+06:42:04	2024-11-22 21:35:11.578894+07	\N
be77b2aa-01b8-49b7-9dcc-f5214846b192	Elyse	Hahn	NdobJKJ@FXVUGmk.org	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi		2024-11-21 15:51:28.942085+07	2024-11-21 15:51:28.942085+07	2024-11-22 21:40:23.569261+07
07fc435d-54a0-4448-86c5-d26969ac58a5	Tobin	Dare	KVbdgEu@uEhOifp.info	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi		2024-11-22 21:50:02.287511+07	2024-11-22 21:50:02.287511+07	\N
92a408a3-e90f-43e8-97d9-26475ef64bbd	Kelsi	Miller	QuQwKcH@EAhJFvI.net	$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi		2024-11-22 21:50:02.297725+07	2024-11-22 21:50:02.297725+07	\N
\.


--
-- TOC entry 4683 (class 2606 OID 16829)
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- TOC entry 4696 (class 2606 OID 16864)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 4722 (class 2606 OID 16943)
-- Name: order_customers order_customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_customers
    ADD CONSTRAINT order_customers_pkey PRIMARY KEY (id);


--
-- TOC entry 4717 (class 2606 OID 16922)
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- TOC entry 4711 (class 2606 OID 16907)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 4728 (class 2606 OID 16963)
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- TOC entry 4700 (class 2606 OID 16876)
-- Name: product_categories product_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_pkey PRIMARY KEY (category_id, product_id);


--
-- TOC entry 4704 (class 2606 OID 16893)
-- Name: product_images product_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_pkey PRIMARY KEY (id);


--
-- TOC entry 4691 (class 2606 OID 16844)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 4694 (class 2606 OID 16858)
-- Name: sections sections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (id);


--
-- TOC entry 4735 (class 2606 OID 16979)
-- Name: shipments shipments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipments
    ADD CONSTRAINT shipments_pkey PRIMARY KEY (id);


--
-- TOC entry 4681 (class 2606 OID 16820)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4684 (class 1259 OID 16835)
-- Name: idx_addresses_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_addresses_id ON public.addresses USING btree (id);


--
-- TOC entry 4685 (class 1259 OID 16836)
-- Name: idx_addresses_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_addresses_user_id ON public.addresses USING btree (user_id);


--
-- TOC entry 4697 (class 1259 OID 16870)
-- Name: idx_categories_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_categories_id ON public.categories USING btree (id);


--
-- TOC entry 4698 (class 1259 OID 16871)
-- Name: idx_categories_section_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_categories_section_id ON public.categories USING btree (section_id);


--
-- TOC entry 4718 (class 1259 OID 16956)
-- Name: idx_order_customers_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_order_customers_id ON public.order_customers USING btree (id);


--
-- TOC entry 4719 (class 1259 OID 16954)
-- Name: idx_order_customers_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_order_customers_order_id ON public.order_customers USING btree (order_id);


--
-- TOC entry 4720 (class 1259 OID 16955)
-- Name: idx_order_customers_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_order_customers_user_id ON public.order_customers USING btree (user_id);


--
-- TOC entry 4712 (class 1259 OID 16936)
-- Name: idx_order_items_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_order_items_id ON public.order_items USING btree (id);


--
-- TOC entry 4713 (class 1259 OID 16935)
-- Name: idx_order_items_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_order_items_order_id ON public.order_items USING btree (order_id);


--
-- TOC entry 4714 (class 1259 OID 16934)
-- Name: idx_order_items_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_order_items_product_id ON public.order_items USING btree (product_id);


--
-- TOC entry 4715 (class 1259 OID 16933)
-- Name: idx_order_items_sku; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_order_items_sku ON public.order_items USING btree (sku);


--
-- TOC entry 4705 (class 1259 OID 16916)
-- Name: idx_orders_code; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_code ON public.orders USING btree (code);


--
-- TOC entry 4706 (class 1259 OID 16913)
-- Name: idx_orders_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_orders_id ON public.orders USING btree (id);


--
-- TOC entry 4707 (class 1259 OID 16915)
-- Name: idx_orders_payment_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_payment_status ON public.orders USING btree (payment_status);


--
-- TOC entry 4708 (class 1259 OID 16914)
-- Name: idx_orders_payment_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_payment_token ON public.orders USING btree (payment_token);


--
-- TOC entry 4709 (class 1259 OID 16917)
-- Name: idx_orders_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_orders_user_id ON public.orders USING btree (user_id);


--
-- TOC entry 4723 (class 1259 OID 16972)
-- Name: idx_payments_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_payments_id ON public.payments USING btree (id);


--
-- TOC entry 4724 (class 1259 OID 16970)
-- Name: idx_payments_number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_payments_number ON public.payments USING btree (number);


--
-- TOC entry 4725 (class 1259 OID 16971)
-- Name: idx_payments_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_payments_order_id ON public.payments USING btree (order_id);


--
-- TOC entry 4726 (class 1259 OID 16969)
-- Name: idx_payments_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_payments_token ON public.payments USING btree (token);


--
-- TOC entry 4701 (class 1259 OID 16900)
-- Name: idx_product_images_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_product_images_id ON public.product_images USING btree (id);


--
-- TOC entry 4702 (class 1259 OID 16899)
-- Name: idx_product_images_product_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_product_images_product_id ON public.product_images USING btree (product_id);


--
-- TOC entry 4686 (class 1259 OID 16850)
-- Name: idx_products_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_products_id ON public.products USING btree (id);


--
-- TOC entry 4687 (class 1259 OID 16853)
-- Name: idx_products_parent_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_products_parent_id ON public.products USING btree (parent_id);


--
-- TOC entry 4688 (class 1259 OID 16851)
-- Name: idx_products_sku; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_products_sku ON public.products USING btree (sku);


--
-- TOC entry 4689 (class 1259 OID 16852)
-- Name: idx_products_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_products_user_id ON public.products USING btree (user_id);


--
-- TOC entry 4692 (class 1259 OID 16859)
-- Name: idx_sections_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_sections_id ON public.sections USING btree (id);


--
-- TOC entry 4729 (class 1259 OID 16994)
-- Name: idx_shipments_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_shipments_id ON public.shipments USING btree (id);


--
-- TOC entry 4730 (class 1259 OID 16992)
-- Name: idx_shipments_order_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_shipments_order_id ON public.shipments USING btree (order_id);


--
-- TOC entry 4731 (class 1259 OID 16990)
-- Name: idx_shipments_status; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_shipments_status ON public.shipments USING btree (status);


--
-- TOC entry 4732 (class 1259 OID 16991)
-- Name: idx_shipments_track_number; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_shipments_track_number ON public.shipments USING btree (track_number);


--
-- TOC entry 4733 (class 1259 OID 16993)
-- Name: idx_shipments_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_shipments_user_id ON public.shipments USING btree (user_id);


--
-- TOC entry 4678 (class 1259 OID 16821)
-- Name: idx_users_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_users_email ON public.users USING btree (email);


--
-- TOC entry 4679 (class 1259 OID 16822)
-- Name: idx_users_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_users_id ON public.users USING btree (id);


--
-- TOC entry 4745 (class 2606 OID 16949)
-- Name: order_customers fk_order_customers_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_customers
    ADD CONSTRAINT fk_order_customers_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4743 (class 2606 OID 16923)
-- Name: order_items fk_order_items_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_order_items_product FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 4746 (class 2606 OID 16944)
-- Name: order_customers fk_orders_order_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_customers
    ADD CONSTRAINT fk_orders_order_customer FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- TOC entry 4744 (class 2606 OID 16928)
-- Name: order_items fk_orders_order_items; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_orders_order_items FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- TOC entry 4742 (class 2606 OID 16908)
-- Name: orders fk_orders_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4747 (class 2606 OID 16964)
-- Name: payments fk_payments_order; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT fk_payments_order FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- TOC entry 4739 (class 2606 OID 16882)
-- Name: product_categories fk_product_categories_category; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT fk_product_categories_category FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- TOC entry 4740 (class 2606 OID 16877)
-- Name: product_categories fk_product_categories_product; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT fk_product_categories_product FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 4741 (class 2606 OID 16894)
-- Name: product_images fk_products_product_images; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT fk_products_product_images FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 4737 (class 2606 OID 16845)
-- Name: products fk_products_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_products_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4738 (class 2606 OID 16865)
-- Name: categories fk_sections_categories; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT fk_sections_categories FOREIGN KEY (section_id) REFERENCES public.sections(id);


--
-- TOC entry 4748 (class 2606 OID 16985)
-- Name: shipments fk_shipments_order; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipments
    ADD CONSTRAINT fk_shipments_order FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- TOC entry 4749 (class 2606 OID 16980)
-- Name: shipments fk_shipments_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipments
    ADD CONSTRAINT fk_shipments_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4736 (class 2606 OID 16830)
-- Name: addresses fk_users_addresses; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT fk_users_addresses FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2024-11-24 17:17:51

--
-- PostgreSQL database dump complete
--

