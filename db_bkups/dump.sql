--
-- PostgreSQL database dump
--

\restrict mb7qvmVLYwrVyOBvpcbascDzhv8wNXglcA62DLUizEzC7NOIJGeBxf66R7Y3TYw

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

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
-- Name: categories; Type: TABLE; Schema: public; Owner: r
--

CREATE TABLE public.categories (
    name character varying(255) NOT NULL,
    allocated numeric(10,2) DEFAULT 0
);


ALTER TABLE public.categories OWNER TO r;

--
-- Name: goals; Type: TABLE; Schema: public; Owner: r
--

CREATE TABLE public.goals (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying(255) NOT NULL,
    target_amount numeric(10,2) DEFAULT 0.00 NOT NULL,
    current_amount numeric(10,2) DEFAULT 0.00 NOT NULL,
    target_date date
);


ALTER TABLE public.goals OWNER TO r;

--
-- Name: groups; Type: TABLE; Schema: public; Owner: r
--

CREATE TABLE public.groups (
    id uuid NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.groups OWNER TO r;

--
-- Name: transactions; Type: TABLE; Schema: public; Owner: r
--

CREATE TABLE public.transactions (
    id uuid NOT NULL,
    date date NOT NULL,
    description character varying(255) NOT NULL,
    amount numeric(10,2) NOT NULL,
    category character varying(255),
    group_id uuid,
    is_ignored boolean DEFAULT false,
    raw_data jsonb,
    fingerprint character varying(64) NOT NULL,
    is_split boolean DEFAULT false,
    split_details jsonb,
    receipt_path character varying(255)
);


ALTER TABLE public.transactions OWNER TO r;

--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: r
--

COPY public.categories (name, allocated) FROM stdin;
Mortgage	2239.00
Phone	187.00
Medical	120.00
Utilities	453.99
Rent	91.00
Misc	0.00
Personal Care	150.00
Pets	0.00
Income	9610.00
School	190.00
Car Loans	1385.88
Hobbies	50.00
Home Improvement	50.00
Cards	700.00
Transfers	0.00
Insurance	1041.42
Car Stuff	50.00
Eating Out	250.00
Gas	100.00
Gifts	150.00
Giving	200.00
Groceries	800.00
Personal Spending	480.00
Clothes	100.00
Subscriptions	228.45
Taxes	444.82
Events	0.00
Roof	500.00
Uncategorized	0.00
\.


--
-- Data for Name: goals; Type: TABLE DATA; Schema: public; Owner: r
--

COPY public.goals (id, name, target_amount, current_amount, target_date) FROM stdin;
2bd2d55d-9ea9-41e0-b1f4-f5fdd3fbae57	Savings	10000.00	4000.00	2026-05-31
\.


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: r
--

COPY public.groups (id, name) FROM stdin;
e176d0db-e4e5-4164-b0fc-828ca23085f6	Addie's Birthday
\.


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: r
--

COPY public.transactions (id, date, description, amount, category, group_id, is_ignored, raw_data, fingerprint, is_split, split_details, receipt_path) FROM stdin;
22de9ee2-8334-424c-9cd6-bada5f72b042	2025-11-03	Payment to Service Finance Company	4500.00	Roof	\N	f	{}	58583be22186564ff4b7b69d51d22dfaa33a98830f2e4b224edde96f8b1c9530	t	[{"note": "", "amount": 200, "category": "Roof"}, {"note": "", "amount": 4300, "category": "Misc"}]	\N
6e8880e5-e24d-46fc-843c-903232d0d920	2023-11-17	Chase Credit Card Payment	405.00	Uncategorized	\N	f	{}	dd63a0fb0f738e9364c69c0a49a1dd7126954ac0dd3f748d0216c9dbea519501	f	\N	\N
2b3e6791-888d-4ac4-8b84-899de8ccfcf1	2023-11-17	Capital One Credit Card Payment	400.00	Uncategorized	\N	f	{}	08ece47477803c1f2b2b6aefd288f29f89f089446342c5ab9161bb72c1d3150c	f	\N	\N
645e1811-9c6e-4fcf-9223-f43c2571a57f	2023-06-26	Harris Teeter	22.92	Uncategorized	\N	f	{}	f9e4bbfa5035cb48d486b63a292df12cd430b1fdad5b862cae69b95a6185d704	f	\N	\N
c25a4dd5-7d7e-4c0f-a3b7-c7415b5b094f	2023-06-26	Popeyes Louisiana Kitchen	3.17	Uncategorized	\N	f	{}	7c295c6d9d809b985f2a63fe00649ee2726360c9c9f4029d97044e3e7db08d6d	f	\N	\N
a9a1ae26-bf11-480f-82db-67e1b392d04d	2023-06-26	McDonald's	2.75	Uncategorized	\N	f	{}	46b03b5596bac99197af85290892033bf767e9869982e04c3efb043a5e45359e	f	\N	\N
05a324f6-da0c-4552-8044-c2e5c4550783	2023-06-26	New York Life Insurance Payment	616.54	Uncategorized	\N	f	{}	55a550e1b71c827fdc441cbf3d6a0e8b1f7b198e27a8e9b5273f7e3cd5a4077d	f	\N	\N
5dd0c766-1d5f-470d-bdc0-b300035ddbf5	2023-06-26	Venmo Transfer	20.00	Uncategorized	\N	f	{}	7d21062fbb2d9bf95e5c76842582cb4855a8ccd424b187b2d0ad2f6d8b1face2	f	\N	\N
c82e53fb-f940-4844-b849-59d852c1b13b	2023-06-24	Sam's Club	36.75	Uncategorized	\N	f	{}	015395ef24a7f74ee52caddb1ef29dc5100c366eea2a4ebd3bcddf784cd1d6ab	f	\N	\N
b15946b3-138a-471b-a606-647e352aaef3	2025-11-19	POS DEBIT-DC    8678 BUILD-A-BEAR - 102 COLUMBIA MD	48.46	Gifts	\N	f	\N	eb52b111615d3c7b6a073cac3f36527472536e03d20107ef98a240c5247efd24	f	\N	\N
835ddad4-b633-426d-ba51-97bfff156af6	2025-11-20	POS DEBIT-DC    8678 SAMSCLUB 4771 GAS SEVERN MD	46.22	Gas	\N	f	\N	d72e6c13fe45e79d5a6f82987faaa68cad944c903eadcdc7b0c3e6a9a7771850	f	\N	\N
30f12d13-025b-4933-91a4-9fb1d1e7a48b	2025-11-23	Harris Teeter	157.02	Groceries	\N	f	\N	f99701ff4fe97b8e4ebf07b12ec09b990377811235ddfbaf7552507587d6feb8	f	\N	\N
3288229d-9b54-4f14-894e-887571633695	2025-11-18	POS DEBIT-DC    8678 STARBUCKS 59327 MILLERSVILLE MD	2.76	Eating Out	\N	f	\N	ee95f9726adb389393fdb61b94f6e275293c3136cb0cb1993b27bc313bb52381	f	\N	\N
e53191ab-a3e0-4ab1-b3cb-ab737328aab4	2025-11-19	POS DEBIT-DC    8678 LEDO PIZZA - MILLE 410-7293333 MD	55.06	Eating Out	\N	f	\N	a303d699241c2ec52e991d44ccafc59379dfd1ca7e4203254bec0737c7c04e51	f	\N	\N
a19e644a-a809-4501-a33b-ee301912f4c1	2025-11-21	ZELLE CR CANDACE HOOD-BEY	-310.00	Transfers	\N	f	\N	4a5923c17a6f8cdc4d36b257a03427f3df1428fbc71ba1efd643f4de6393ba2b	f	\N	\N
9af5c7cb-360a-4d1c-a155-747397c57525	2025-11-20	POS DEBIT-DC    4581 WAL-MART #1875 SEVERN  US	32.26	Groceries	\N	f	\N	fe8a92663f443108bf690437a8b6eef9d02c86d994c3fb43d8bbe04a167f32a8	f	\N	\N
6d834aa8-f7a7-43bd-955e-4d91d1e6facf	2025-11-20	ACH Debit - Comp Of Maryland  Dir Db Rad 9100001	56.82	Taxes	\N	f	\N	b0db93e050bea787140482d8a205c0c835213b2e850c1e9cf7400de2c80fac96	f	\N	\N
74609dca-eaba-4596-bcdb-521ab9ebb5c8	2025-11-21	POS DEBIT-DC    4581 TST* THE OLIVE TRE GLEN BURNIE MD	35.99	Eating Out	\N	f	\N	086bacfcd1fc88778b82c2b1a3e5342be220dc60feb7809665aa38ce0252589a	f	\N	\N
a82136fc-2ecb-47f4-a09a-4e9aad3a3cd6	2023-11-03	Cost Plus World Market	44.50	Uncategorized	\N	f	{}	19a3a12f47cbd5b449d0a0ebf835d44dcef2fe52361fa1e00fa40dec88f22e6a	f	\N	\N
06e495cc-c877-4b20-a788-f50248c2f87b	2023-11-03	Target	43.45	Uncategorized	\N	f	{}	a77cc3e7fbe3635c9708f930326bc5fd5f23e8142e57d9ec9749145e8164f9f2	f	\N	\N
17485f4b-db5e-448f-88fa-9c9aa404462a	2023-11-05	LA Fitness	39.99	Uncategorized	\N	f	{}	325f816baef16e2ce3f4f118216e653fbfd1f29e2832a935dba7fbc5bd425734	f	\N	\N
56eb39b5-87ed-4442-b8b6-c8a8b1791d4a	2025-11-08	Target	51.71	Uncategorized	\N	f	{}	809111755c673ca3bba377168c6e5dd9a951019be8e652389a689b410229320e	f	\N	\N
7b196331-a28b-4c96-a47d-d3af3318b9e5	2025-11-05	Target	22.23	Uncategorized	\N	f	{}	0552e1bb53fcfa76e8efe1d0dc21616d787eb80ad6efdb6e964fd418778b4a46	f	\N	\N
05b67189-516d-44b0-abf8-26712061ae1e	2025-11-05	Target	-17.60	Uncategorized	\N	f	{}	4fd49c9483656de6af1f06436b237ffab2b1892b1b4ef7fa0119991fd6dd316c	f	\N	\N
e9d2a6fb-03f5-4d45-abe3-9e356410e8a5	2025-11-04	Target	76.73	Uncategorized	\N	f	{}	fe3cdeead7d9a2e9f899600ba041dbeac834ad36b38f4e6a834bf36e4bb5eda8	f	\N	\N
6e733153-ab53-4684-b796-f14885ba83db	2025-11-04	Deposit Jovial, Spc. Acctverify	-0.09	Uncategorized	\N	f	{}	418dff8a369a0bf442fdca2ff0146119ae555203d2f4f0a27915365de39acbb6	f	\N	\N
e6d07215-fd33-4447-881c-94594ca3081f	2025-11-04	Deposit Jovial, Spc. Acctverify	-0.06	Uncategorized	\N	f	{}	50ab6bc37f5cb0764cd757807d7b0d0b5ca5f3b645e949cbd8031caff59f0ccf	f	\N	\N
49dbf173-9108-467b-a282-05bcafcda1e3	2025-10-31	DEBIT-DC 4581 WWW.LUMINISHE* LUM LUMINISHEALTH MD	78.00	Uncategorized	\N	f	{}	7ca031053e75b4299686169b460f2946f42b5c0a79e098523db34a1711b6d524	f	\N	\N
072caf2f-00aa-46b3-88da-2a3c49a6c892	2025-10-31	DEBIT-DC 4581 VENMO *Claudaya St Visa Direct NY US	60.00	Uncategorized	\N	f	{}	bde60d340fb5d7a4a04f594201330155c9cc1bed1257c8fc816095626fcbd769	f	\N	\N
240ed2d0-6e45-4ebe-9deb-06a514b30795	2025-10-31	DEBIT-DC 4581 LAKESHOREPETHOSPIT XX2028 MD	56.87	Uncategorized	\N	f	{}	185b3a467c3290ea2ec87bdfe4a539fa801482b00bff8c909bdcdfcbf7831ddf	f	\N	\N
c152b4a7-1b5c-4ac4-9d56-e49955ea1bf2	2025-10-31	DEBIT-DC 8678 OTF GAMBRILLS XX7925 MD	43.81	Uncategorized	\N	f	{}	7aae2b3160bffc279feb1c4d7141fce47c578d94d3365e4d32f62ab10ad54690	f	\N	\N
68c31fd5-cebc-41e8-ae26-eaa4e0cfee23	2025-10-31	DEBIT-DC 8678 TST*ATWATERS - CAT CATONSVILLE MD	39.00	Uncategorized	\N	f	{}	4b51cd46db45b45f65dd342b04f0e5ca67aa87c1a607379dc01ed01722e67103	f	\N	\N
d480c7cd-11ee-4af8-bd36-b5f4dffbfa2f	2025-10-31	Giant Food	33.04	Uncategorized	\N	f	{}	4c1f70ea7c6f4c7658776a8a44cc3939e97636ae5d3bf650f468da887f4729db	f	\N	\N
19500b6c-c01a-4190-bda2-c6b7c1947e24	2025-10-31	Dividend	-0.38	Uncategorized	\N	f	{}	414cc55f58c7acbe5f7041796442aca1f9e6d4e5e44632c15a1c0abd0aa8c63f	f	\N	\N
3d27b00d-8e38-4cf7-88c2-707257809c1e	2025-10-31	Transfer To Savings -0387	1600.00	Uncategorized	\N	f	{}	19f59e555a4579583ec4b3ae03fac46695bd70aaa810a299fbac2aed5bd1e280	f	\N	\N
60ff3af0-ceb9-402c-a35e-ba147c15148c	2025-11-09	Walmart	81.87	Groceries	\N	f	{}	c373a27fb5ae495e73d91513f815f4b443be3a39f2962756810872bf1b3bc0ba	f	\N	\N
b38669f4-5b75-48d7-b7f3-2b97714e0ee1	2025-11-08	Walmart	180.51	Groceries	\N	f	{}	838ba69c83fb40d53259933e66eb827bd3e3a917a8a6503941419d5ffa94f8b2	f	\N	\N
04fde006-2dbf-4178-ae0f-0e5874568f41	2025-11-08	Sprouts Farmers Market	12.26	Groceries	\N	f	{}	1fea7247700bfe95c4f52c299193ccc737f4712b5e86f49970f20c4b01fb6da0	f	\N	\N
ca54e9f1-e4d6-437e-a4ef-3f63e1c25c8c	2025-11-08	Giant Food	16.29	Groceries	\N	f	{}	6497d08034301aca94f4ec6b9812f55610c71daa43df26947ce15d05cee77037	f	\N	\N
70891a98-0bd3-46d6-b6fb-ec777b529985	2025-11-13	Walmart	21.12	Groceries	\N	f	{}	a004155abf3968639dcd542a82a5c9e1adabd334f49542aeb376789c5b9b9dec	f	\N	\N
b002c232-7163-4f7d-af02-fe48453b6480	2025-11-08	Food Lion	8.97	Groceries	\N	f	{}	bbf1a91a4e896e927b0a14435071a4baf04e636d5d50aa8aabd5e55759fbba64	f	\N	\N
e88953c7-d669-44d4-acbf-b9075400dbe3	2025-11-07	Totswap	41.49	Clothes	\N	f	{}	369720d587cd38a7a3770eaf286bc5bdcbad9a81831295c500ac7062454a7e0d	f	\N	\N
7e2d4938-f579-4a5a-b090-df3d42a8d329	2025-11-06	Transfer From Savings -0387	-500.00	Transfers	\N	f	{}	287b64f8cd8afef3c51a45d82f92a949c96efd2f8d59fc47ff8db1aebb069233	f	\N	\N
8dc3b6c9-97ff-4bdb-b60c-ceb0f569f08a	2025-11-03	Transfer From Checking -5873	-35.00	Uncategorized	\N	t	{}	2001976d28f5a127a8c2579a01716490a7ff093d5a8b307b22e80bd1959abd70	f	\N	\N
467c3d51-8fc2-4d27-8d7a-32478aa0fbb6	2025-11-04	Harris Teeter	79.45	Groceries	\N	f	{}	6e529fa4a4dd33455601f57a01a3a0926cd007ccd60b49272b62206961e68692	f	\N	\N
b1ae43bd-3bbf-4cc9-bcba-06b00f7aaaf6	2025-11-06	Wegmans	51.48	Groceries	\N	f	{}	8730742d68e210c438cf002b31a3760e964aec67e843b38c5525176f973cb605	f	\N	\N
a961d447-30a1-4a96-bd6b-1605a16e1ebb	2025-11-01	Giant Food	44.63	Groceries	\N	f	{}	d4831b27b4b7035b5cad787988ad1a3891a794876b60efb917923a6f1e36f17c	f	\N	\N
d2541124-4d28-40da-aa48-d0f4ec42afd8	2025-11-03	Walmart	16.72	Groceries	\N	f	{}	dc910a61c8fe1db15074d153efd85d2661caabad5bbf22ac485f34ca2efab972	f	\N	\N
1f57a179-c980-4198-9942-e7b0b0469b39	2025-11-02	Shoppers Food & Pharmacy	5.02	Groceries	\N	f	{}	c96360a0ba36d3f2bf6c87cb1cea3bad49106718992f587baf6c233141200832	f	\N	\N
f1404cca-5163-4c55-8d44-024fcde4dc53	2025-11-13	Microsoft Deposit	-4805.05	Income	\N	f	{}	70c2ba51478aae49cb6847d42265fe61b046296cd97903fdcc0b8773f3ebeba9	f	\N	\N
eac19f16-fa5f-4ed6-bd1a-3e6cebb385d2	2025-11-14	DEBIT-DC 4581 VENMO *Claudaya St New York NY US	120.00	Personal Spending	\N	f	{}	2148f51b0e97a33ebf8d08aee07ced8ec91cd296f8535dff22dc98bdef0b6674	f	\N	\N
6293032d-b25d-4476-ba54-3fea222f678f	2025-11-14	Payment to Synchrony Bank	30.00	Cards	\N	f	{}	dccc5e75e2eedb04f9b30107c7600453312b1e64d954abfaa136312f23a0453e	f	\N	\N
f7dc020c-49b6-4289-8415-9c588e7afda7	2025-11-12	Payment to Verizon	94.99	Utilities	\N	f	{}	2fcc628e301e8b7d8e2becf6084b831fe67ffd45394f8f7fd60b128c64698f3d	f	\N	\N
2a96281f-862e-470f-b812-1fa38dbed648	2025-11-10	Transfer From Savings -0387	-185.00	Transfers	\N	f	{}	916bd3dc70439c01ba07f2555eec540dcf0282bb3bdec4eaccc94a1ce559ee80	f	\N	\N
cba91ef5-7455-44ba-b085-ffaa8caf6bb2	2025-11-10	China Wok	25.86	Eating Out	\N	f	{}	85d8eb3dd34be322f98411efa1c1bef4bede9a334fc06706b8299b637ba5e888	f	\N	\N
ff65cd64-5520-4c57-93b0-c0060a23ed8d	2025-11-10	Transfer From Savings -0387	-250.00	Transfers	\N	f	{}	4d8b7f877266eba3855d2c82d682311c5c3107fac1d85b2d4fc60d2d0688cf8e	f	\N	\N
c3538e6c-eaa4-45b5-ab4c-2558b04ac5a1	2025-11-10	Lowe's	43.00	Home Improvement	\N	f	{}	7fb6e0a44494b0e1f8c6bdd0cbf2071eefc00821f0f44567ab2edf91f5635889	f	\N	\N
b8842514-df7f-45c7-b91b-3f2a178d4db8	2025-11-10	Lowe's	100.00	Home Improvement	\N	f	{}	528d487593cc8759afc88fa7abc5355f8768e3be3312c93f09f16d42f7e3c014	f	\N	\N
e0cde73e-5333-41f8-87f1-9b3b0972e6ae	2025-11-09	Tractor Supply Company	36.55	Gifts	e176d0db-e4e5-4164-b0fc-828ca23085f6	f	{}	6c8e8fbf7982089bdbb8e49252891e9edeea6d03758a045cff8ff49aa2ccff15	f	\N	\N
5b843c86-8604-49aa-93c4-9f9d637bfcf6	2025-11-08	Lowe's	42.85	Home Improvement	\N	f	{}	13e37421743f6a5246487a7482d7974480d9d02d6def2b80eb03d63dcc0a60cc	f	\N	\N
cf26af6a-52ef-48f9-b92e-61173a63fcf4	2025-11-08	Lowe's	6.32	Home Improvement	\N	f	{}	357da75de63e33d96477f5a6600a2913d612dc000a544627451fd35459b502ca	f	\N	\N
d39e5490-a5f4-49f5-9edf-d59053fa9077	2025-11-08	Michaels	36.23	Hobbies	e176d0db-e4e5-4164-b0fc-828ca23085f6	f	{}	202705b1b46083a85ea8d832cf444fc93ab900b3f936d7a8dbaac9080a8bf784	f	\N	\N
298309e8-07a6-4177-9a0f-ee398ddd75db	2025-11-08	McDonald's	3.06	Eating Out	\N	f	{}	919d3c994b6699d1b627ffa9159119a7e000a4f387e0fdd42fd165a044c773b9	f	\N	\N
68ed1e49-42f4-4c69-a2b9-062b48d662a0	2025-11-07	Michaels	41.43	Hobbies	e176d0db-e4e5-4164-b0fc-828ca23085f6	f	{}	e407e7730a849283c581242508fbcdb25f3202c064f6b1113993eec84ac25838	f	\N	\N
b333bb89-9a61-4475-9df0-c833a6d2a16e	2025-11-05	- Catonsville Coop Catonsvill XX7636	285.00	School	\N	f	{}	82bb183de7b4fa4c5870886296b0d3b844c7b25be8aa7d6e4b558acd0b08f697	f	\N	\N
7cfade6f-c1c1-4115-b38a-b5be8ce1f111	2025-11-05	DEBIT-DC 4581 VENMO *Claudaya St Visa Direct NY US	60.00	Personal Spending	\N	f	{}	b526c2c31c9295a3ef8bb35b71fac6137f4ad66f5bfd5b8d089346c4f501cdc1	f	\N	\N
51852d4a-6713-44a8-8018-a6144ae9b639	2025-11-05	Sam's Club	42.65	Gas	\N	f	{}	e6a6fea3c9a265b6ea8569c7340dbf3bac3e33037ff820699490d7f12ca22f14	f	\N	\N
80a73b61-7eaa-4b40-8b3f-05bc5f2071b0	2025-11-04	Payment to AT&T	187.17	Phone	\N	f	{}	c5567f63dea38b8811b28206a64cfd3a8d818bcd853dd6958d400a1eeeb2db02	f	\N	\N
69112926-6955-44c0-a4e9-383d45f69f18	2025-11-04	Transfer From Savings -0387	-746.07	Transfers	\N	f	{}	795bf214f55c0dc79ef268147c563f5102ab2417461fa148b937b3cb965931cd	f	\N	\N
6183894d-c867-40cd-b272-2bd4a81b1b35	2025-11-04	DEBIT-DC 8678 OTF GAMBRILLS XX7925 MD	159.00	Subscriptions	\N	f	{}	ad39817c201dad312c61888713a7f79a87e454b48945bd8ca668c7dd25fc75d1	f	\N	\N
e49d0eb7-6da6-4a90-bd9e-7a47eb3004d8	2025-11-03	Transfer To Checking -5873	100.00	Personal Spending	\N	f	{}	a2f69bf5c775f48d54632535df3dd943fce5ebda0e90174d3ba0e786d9e6da34	f	\N	\N
463750d3-566f-4b5b-9f6b-8095cb1e2cf1	2025-11-03	DEBIT-DC 4581 EASTMOON ASIAN BIS GLEN BURNIE MD	45.00	Eating Out	\N	f	{}	227db80068fc2b51eb791de00be64ba9fa18f6a5949eb31c6e33ddb9b42c4ec7	f	\N	\N
4514efc5-bd04-46d4-b2a2-e9bcb24ffc17	2025-11-03	Lowe's	31.59	Home Improvement	\N	f	{}	ea94d8e3e07f4ac060a662d0d60081347080da156fd90fa8a500e3292c74f6bc	f	\N	\N
ca511379-babb-44f6-bc19-1cd996ed9219	2025-11-03	- Jpmorgan Chase Chase Ach XX0002	2239.11	Mortgage	\N	f	{}	9baa8d60cfc76a58158e1f138c2994d4ee0efa99a710a04225aad7ef4a20e925	f	\N	\N
2f52a32f-4142-4e12-9869-d09834059b43	2025-11-01	Chick-fil-A	17.26	Eating Out	\N	f	{}	875addffd4fbebcbc87cd65b5621a3ce08d03135369e4519abac65625358355c	f	\N	\N
b7bfd34b-d5f8-4aba-ad1c-df021954800a	2025-11-01	DEBIT-DC 8678 SQ *DIABLO DOUGHNU NOTTINGHAM MD	21.14	Eating Out	\N	f	{}	5df8b91e30e20bf24b6fcb63f6367b1a853418a196f79f768d673a1a80dbb314	f	\N	\N
1796dd04-a1da-42fb-bf1d-d481e56cf79b	2025-11-01	Royal Farms	33.85	Gas	\N	f	{}	94eac413b29e8b720e48868d074cb3f692691fd2782a495503523110e8b70f0f	f	\N	\N
cba85038-cf2a-4fe1-958d-ae7e29beabfa	2025-11-01	Payment to Peloton	52.99	Subscriptions	\N	f	{}	0e3c8dcf4c23ebc1c51b1348304ab4fc0fa8255f0aeaee2b4aad91891772b6d1	f	\N	\N
cc735a94-4813-40b1-a4a5-3a549b1f0fdb	2025-11-01	DEBIT-DC 4581 MORNINGSTAR STORAG XX1626 MD	91.00	Rent	\N	f	{}	87c538c03ee2f0fbaba52cb3b154dc816a14bd7aee4a50cee0cd101bb952ecf2	f	\N	\N
86cbe98e-530a-4394-b4cd-e69a92f2193b	2025-11-02	Goodwill	13.86	Clothes	\N	f	{}	e7be627513096dbb37bf4c0135a5b756e7dd9b1c8dad4ddacfc8816f8ab4374c	f	\N	\N
3c80a121-bc2d-4c08-8e38-3e76c0ca2ee2	2025-11-02	Humble Bundle	10.00	Uncategorized	\N	t	{}	e2bd0826a44f0cc79351f1e4f6b986f3ab09c8053faa9ab6441a45637f38d5a3	f	\N	\N
689c76f9-e024-4daf-9969-c55f9a34e3fe	2025-11-02	Humble Bundle	20.00	Uncategorized	\N	t	{}	892faddef39ebca83223b5319257dff49287ce6ed66baa31d2e5fc0b300714a1	f	\N	\N
80f3ca8d-0390-44c6-8046-e095bfe88391	2025-11-02	Tractor Supply Company	16.94	Gifts	\N	f	{}	4d0807b2aea57f67fac74427912b1e317ae92c049d434267277451f786890ead	f	\N	\N
98080610-5e60-4d84-8730-999d2a678ce3	2025-11-02	Royal Farms	10.00	Gas	\N	f	{}	a10f7ee831dc519f6c5432134ade0033569ff4d431f93405302c98a160e960ed	f	\N	\N
da115533-cdde-493d-aeb8-381c214962b7	2025-11-03	Michaels	4.32	Hobbies	e176d0db-e4e5-4164-b0fc-828ca23085f6	f	{}	412cc1fd80a7c5fcf26a403166d0f9a2d5a24dc1121c5e65415b9c40b6df750f	f	\N	\N
f2dde119-1a00-494c-be82-aed191675934	2025-11-03	Payment to Service Finance Company	500.00	Roof	\N	f	{}	1678cc724cd34463454af8d060eb0d90c8df32e0da5390399b758bb82d7ee21b	f	\N	\N
b65a4a39-025b-41db-a745-7dfe3cb67ae4	2025-11-03	Payment to Apple Card	400.00	Cards	\N	f	{}	f6419c2419f989398bedc727bfa6a7e60dabcc9856809c7e50df6dff4114e44f	f	\N	\N
14e3a678-c96a-441f-b692-0f12fac663c3	2025-11-03	Payment to Chase	50.00	Cards	\N	f	{}	bae7a7d3f223ba8d402bd2f7fc53b1e4ff1187d19cf55b710e11d8af86e85a02	f	\N	\N
a84c3dbe-f310-47e0-974e-9113fce951da	2025-11-12	Transfer From Checking -2298	-80.00	Transfers	\N	f	{}	3cf87b4a83f964ad2c12f675e4c18e2e1d200fe7ee4a6f08c20ff99983fc8620	f	\N	\N
380c9486-c743-472c-b96e-f096ea17a562	2025-11-10	Transfer to Venmo	1.00	Transfers	\N	f	{}	26cd1764aee22cf02ab906c386c6f01679e659d63ceff582e01b7872798c3d34	f	\N	\N
ba3829d4-2779-4a9d-869a-e6d303a564a6	2025-11-12	Transfer from Zelle	-70.00	Transfers	\N	f	{}	8b042833da79e253cd8d9da3a339643593657f4ca0a720daa998d4f62ac608e5	f	\N	\N
90b41a81-d025-4cff-95f8-9a48559c8519	2025-11-08	Payment to Amazon Prime	15.89	Misc	\N	f	{}	9c72358dbca6d1fbd6dda1ed720a7c8241702555e9627380e22b4aa175d610ee	f	\N	\N
6ceabc2d-018d-417b-b333-a5cae8ca05e1	2025-11-01	Politics And Prose	141.99	Personal Spending	\N	t	{}	740cb35ac9188681eec21b786eab27763d35d50353d362e2374b7af13435b25e	f	\N	\N
b750e3e6-d072-4713-87d2-859a1a5349b5	2025-10-31	Transfer To Checking -2740	600.00	Uncategorized	\N	f	{}	9199b30f27994fe3de7e627ff0add5941defe743e389f0ccd0a357911db99f58	f	\N	\N
ec1dd6a1-dafa-43bb-a4b9-e2599c377b3e	2025-10-31	Transfer To Checking -2298	575.00	Uncategorized	\N	f	{}	060ad5b9728f04aca7546ca20ea9a9af0f07318dae215be7a3ad59471f64dc9a	f	\N	\N
eed902ce-38e3-4a9a-885d-22e70555ef12	2025-10-31	Transfer To Credit Card -7148	100.00	Uncategorized	\N	f	{}	a2236d74efbadfceb730c35eb84ef38fd92ca428d81b393cc63d016322d39951	f	\N	\N
93719850-8a54-4a80-91cf-d040d87ea62d	2025-10-31	ATM Withdrawal	500.00	Uncategorized	\N	f	{}	ea97dd3b2bf9a53e51b30dbf07bab734793d3a9f03abf4d528c657e36529f6a9	f	\N	\N
40ddc913-39a3-4e61-a119-de32bbcbcd35	2025-10-30	Payment to Baltimore Gas and Electric Company	359.00	Uncategorized	\N	f	{}	c918e85d1e05a91e9ab62338e3bafdaf2079861e3957dd975c0bc3cc7687082d	f	\N	\N
947e4629-7a46-4324-9717-e4ad7c7097f2	2025-10-30	Microsoft Deposit	-12534.54	Uncategorized	\N	f	{}	ceff008a612105611511cfaf2a02a388098fbade8a849e622d158988d521e244	f	\N	\N
c5c4812d-92b5-4f69-a65b-bd405cc506f9	2025-10-27	Chick-fil-A	7.85	Uncategorized	\N	f	{}	6778b086a3cb5b5cdf6068270b7da3dffca1a5911d3f03b4485213094b99a877	f	\N	\N
694d8eb4-1413-4892-818e-b3a2aec14cce	2025-10-28	Payment to Citizens Bank	88.12	Uncategorized	\N	f	{}	8ee7477236e86636e3f72f420feb9de5d252812891c1969aa42bc1a0a6c1e7b7	f	\N	\N
e48515e3-3885-4751-867b-9a612663b0c5	2025-10-27	ALDI	76.26	Uncategorized	\N	f	{}	140adc9169db598c97d4ca883d0420c557f41919d4ac3d23a093af8e5c8fe36d	f	\N	\N
173c338f-7628-472d-b804-e58e8cec9447	2025-10-27	Sam's Club	38.90	Uncategorized	\N	f	{}	4caff9b337e3a86f678288aee14726a7fcb6be9d35697a521a58f4f36b1d73f2	f	\N	\N
621def41-4fee-4a65-ae82-ce1bf5577cd2	2025-10-27	Giant Food	15.92	Uncategorized	\N	f	{}	cd26069ef025024f2528b377a236b29d94052b8b2498f786a6538f225c3191d6	f	\N	\N
0c80b2dd-1b6c-41be-b8a1-54b6249c20c8	2025-10-28	Transfer From Savings	-123.45	Uncategorized	\N	f	{}	b67ce0fafa3477b16f69ac2c65e9a0238b061a4b5bac84f237fddf3abe0e51e4	f	\N	\N
de769caa-fec3-4d65-9dbe-3258d8008689	2025-10-25	DEBIT-DC 4581 CASH APP*LESLIE GE OAKLAND CA	125.00	Uncategorized	\N	f	{}	842b5f8a186cc956b19b4077b5231a34817de22f08d3daea7a74a17c353f0ff5	f	\N	\N
70f9c8e0-bc03-452d-bea7-7a9a1e5a1c59	2025-10-24	DEBIT-DC 4581 JERKHOUSE EATERY SILVER SPRING MD	36.00	Uncategorized	\N	f	{}	f7573b9143423c56d2921f79ef2298c1f950472488ec96f15fd130fe8cb8063b	f	\N	\N
716f568b-aa95-4ffe-86ab-b321b7e22e49	2025-10-18	DEBIT-DC 8678 SQ *AZTK COCINA DAVIDSONVILLE MD	26.50	Uncategorized	\N	f	{}	62679a4976c157b3c2cd806efd9f9d7f3e35cd3a144d3f78a26980698e52f273	f	\N	\N
bea21cd2-66df-4796-bd63-24206fb4d586	2025-10-24	Giant Food	25.34	Uncategorized	\N	f	{}	98fa7cbebf99701643f0c0897a3be8cb7149e89af05be043b94a2c4687a6e385	f	\N	\N
e274cb94-819a-41a9-bfac-520147fb3be9	2025-10-25	DEBIT-DC 8678 TST*SCITTINOS ITAL CATONSVILLE MD	20.84	Uncategorized	\N	f	{}	1bbba54bb7fb1b86cc5229d0faf7267971965ab3e15877ea6fc2da588bfab1af	f	\N	\N
4206ea7c-8de2-4e6f-85a7-bd71a9b991c0	2025-10-25	DEBIT-DC 8678 SQ *SALTY GIRL BOO MILLERSVILLE MD	16.96	Uncategorized	\N	f	{}	a93520528f8c82e51ae89dd233a47dcd2f758d41245a5ec5373e306c6d7a50a6	f	\N	\N
1f0c80a5-786b-480e-b662-7e81f15140d5	2025-10-18	Lola's	14.84	Uncategorized	\N	f	{}	6a90bc0aca1ae440b4153fbdec25d0645f2f4d4d5bf884f88c5c3e6c8a1a47ce	f	\N	\N
1f38ec9d-bdab-4b94-a720-60a1578ac509	2025-10-26	Apple	14.74	Uncategorized	\N	f	{}	ef6fd8b8d19675ea53d4c72575babddf3a44f1d5618d8e958142630da80b824d	f	\N	\N
ba7226d0-b89c-4c86-b797-103c3c8ec6cf	2025-10-17	Rise Up Coffee	11.39	Uncategorized	\N	f	{}	8f137bbd465d6ac5aa2f0967cab33dccc2d4cc54362cd7aecc8d349fbd1773a1	f	\N	\N
613208ea-3d50-4d25-bfe4-f22b00c30220	2025-10-25	Rise Up Coffee	10.54	Uncategorized	\N	f	{}	f799e403ef5d230fb5e3cdff2a2e480eee4386941b08ac8b498acf153284b44f	f	\N	\N
755e5581-dd41-4694-9fae-25625e987667	2025-10-25	Colonial Parking	10.00	Uncategorized	\N	f	{}	f64441cd0351019ba2d926dcd3edf96032f55e6177a3276f420a1eab4c62e7fd	f	\N	\N
f960c1e0-049d-42ff-8436-23030803e158	2025-10-25	DEBIT-DC 8678 TST*SCITTINOS ITAL CATONSVILLE MD	3.85	Uncategorized	\N	f	{}	f3c7ad8ecb1aed53ad32262f5c8064145fafe0eea5dff9cd0763122a197822e0	f	\N	\N
298668b1-25da-47fa-bb24-8bbac8714bec	2025-10-18	Homestead	3.75	Uncategorized	\N	f	{}	9ff3d207e7cc9de6a491c36eb333c14a42c86e0b023ac03844456168f2a8ae7a	f	\N	\N
0daf41b6-2704-4448-8f10-96826d6466b6	2025-10-24	USPS	2.51	Uncategorized	\N	f	{}	5ae8d4a5a88a87a5919ac0323a68e188bf479ed0e7c4b552c99798a1b8f3bb0e	f	\N	\N
ecdd647f-840d-4a9a-8da9-bd804e308ebd	2025-10-27	Transfer From Savings -0387	-125.00	Uncategorized	\N	f	{}	630a6303db29592dbc60abe6555803224a609fcbdedb0c2ab5ad709ffde08d78	f	\N	\N
1c485ca3-8c51-4a55-8bf2-7f380c9f3cbf	2025-10-27	Transfer From Savings -0387	-100.00	Uncategorized	\N	f	{}	fa9ea6b2e194acaa97407befd938ece4729c45464ee84f770bd66f7986d770df	f	\N	\N
7785796d-c924-4a09-b06f-5ebcc45a01db	2025-10-24	Payment to Chase	250.00	Uncategorized	\N	f	{}	bda07c8cf86c28b796645b7063b497279d2696d20a238bc4b3ad093569d96b11	f	\N	\N
82216c9e-52fd-4c69-86eb-51d082fd3394	2025-10-23	Sam's Club	109.07	Uncategorized	\N	f	{}	da8c6e63e12f3bbadb36dddd52a5436fe589cc5f2f04039dc1b9aeb70aa6b288	f	\N	\N
9c8904d9-2257-48bb-8b11-49de28a052d9	2025-10-23	Sam's Club	29.85	Uncategorized	\N	f	{}	84d201d6486df8a3ee9c10b8c1fac5365ead6c102fce040ca4e1160ca88aae2a	f	\N	\N
b2ea48cf-3faa-4560-926f-c40beff3ceb1	2025-10-22	Chick-fil-A	6.13	Uncategorized	\N	f	{}	6c40bd511dd0d3a393cb262f2c92bd614a44c88059856c42ba7e389adc91ea6f	f	\N	\N
3796a34c-c718-4524-a815-f6967bfa7679	2025-10-24	Transfer from Zelle	-400.00	Uncategorized	\N	f	{}	ce3e79d7eea1b529ddd8b5107d83a176a72d4f67ea0de71bf2740b0755c8cba1	f	\N	\N
58a818ea-a0a7-40e1-876c-589eee1f6ef5	2025-10-23	Crate & Barrel	-13.80	Uncategorized	\N	f	{}	3e2aef0784a36d562cd1e8dc272b69fc470aa591d498a6b63dbd9aa1cf4fda64	f	\N	\N
60602f97-907f-44d3-98dc-ee0def6eaaae	2025-10-22	Target	113.23	Uncategorized	\N	f	{}	b6dcf646b407a34cc98ac7c642fe57185e3077f9ee746d02059dbe89c7151fb8	f	\N	\N
d9703920-25df-4bb9-acef-d62fff8d941e	2025-10-23	Walmart	67.57	Uncategorized	\N	f	{}	11139f9dc52c785a9304e73f09e279413111f9ef0548f03e8c0a33359e671961	f	\N	\N
2a2eaa73-784a-47d4-a44c-5066912909fc	2025-10-22	Szechuan Cafe	21.41	Uncategorized	\N	f	{}	c8c1f2cddf10c116131ce9f73bdc5ab904f2ef8b4736f4184f8bcba6a434d702	f	\N	\N
acb6b470-ec36-41be-9726-cb87efab3863	2025-10-22	Giant Food	18.29	Uncategorized	\N	f	{}	e81dbe30816b542739b94eb6355b241fe72c888c7f3ffaf84d27fb9ef86826f4	f	\N	\N
de2278df-44fd-4ff5-a990-00c839337f52	2025-10-22	Giant Food	5.89	Uncategorized	\N	f	{}	ff613ce8b3991e91be75dd7659670eece5f04c3d6caab9c9f08cf4df6fba362a	f	\N	\N
1c0cc29d-ae3d-4c7d-9f11-7fbac7532c2f	2025-10-22	Payment to Liberty Mutual	260.08	Uncategorized	\N	f	{}	68e9b38d35bef28bcb30e133f288f9ddb879ef01beeaa6dc5a0f24678d965a94	f	\N	\N
af9fbadc-5164-4b0c-85d8-43cbcc4be08a	2025-10-21	DEBIT-DC 8678 FIREBIRDS WOOD FIR ANNAPOLIS MD	60.00	Uncategorized	\N	f	{}	29ed012a15be84e376ad93585ef1f327cebf7d30787b42b37fd27d2a6405bdfd	f	\N	\N
dbd1bc02-3a29-4d9b-a1f8-c9dca2080eae	2025-10-21	Sam's Club	40.53	Uncategorized	\N	f	{}	bc3a45096c781afd6cf4b0fceab76bf5ec1c6e28941cc300ad87019fbde51294	f	\N	\N
c084e634-5fc8-4cd4-aa1c-da93d8ce4566	2025-10-21	Wegmans	24.57	Uncategorized	\N	f	{}	a13d60679834eedf78ea2f1db7c128c110e4d8227598cb1dc4245bbf41396c0e	f	\N	\N
e57f5cc8-0ea9-43b5-80a8-4e4ee45bb685	2025-10-20	Cold Stone Creamery	17.20	Uncategorized	\N	f	{}	de155dea99577973052c75959b72e8a103a621c7d5fbf41226666f6da9080446	f	\N	\N
3fc9a9a0-ee2b-483e-bb41-f478fd196a55	2025-10-22	Netflix	8.47	Uncategorized	\N	f	{}	9538967829620ee5b51b7ec5e58f4a04be3c0e90d0f28cbde696667c6f84e235	f	\N	\N
8fb526db-6595-4c6d-97f1-163be7249255	2025-10-22	Transfer From Savings -0387	-200.00	Uncategorized	\N	f	{}	6693c4dc01467675a96889b19a3312636dde020c14754b5d64b5d2a0ca10bab3	f	\N	\N
7a74a254-6a39-48d7-b3d5-389e851f3cd5	2025-10-21	Chking Service Fee	10.00	Uncategorized	\N	f	{}	ef4b2ddd7893d82f7ae79d7e5086cf625666ca9dfdad4fc4a5810ebf6f9f9ab7	f	\N	\N
c170adc8-f514-4306-8f8a-257b5dc05700	2025-10-20	Return To Oz	43.60	Uncategorized	\N	f	{}	e785f553500b482acd1d8fadb85b9f804068cb51048d08e8642a260cd9fd810a	f	\N	\N
1669246a-7694-4bf9-bef2-4e5a6ab78224	2025-10-19	Szechuan Cafe	34.66	Uncategorized	\N	f	{}	46c3a4c39ee41febbb5a05d600e3a6153056435d4fab131155bd394d39a9560e	f	\N	\N
f2a4ff7c-997e-4900-92fe-b6dcc837a46a	2025-10-18	Old Navy	31.77	Uncategorized	\N	f	{}	067c739ef61b6de94c23828fc9851352df21ca84d0cd69994c95118b44a648f1	f	\N	\N
6639ab5a-2fe0-462f-bd4d-063bb4ad5cc0	2025-10-21	Old Navy	21.19	Uncategorized	\N	f	{}	a53cdc5ee1a5549d4877d80649848bfa4ebc61486a011e02f125ff153c176d38	f	\N	\N
f6111372-af0d-4353-8c58-6d44ad99c6af	2025-10-20	Cottonwood	14.30	Uncategorized	\N	f	{}	abf449eaae55811ed05e8321287b354c00d4fa338b7945fa3719b1f87260ec00	f	\N	\N
ff6a341b-ab6f-44ee-9065-e3abd1b4221a	2025-10-20	DEBIT-DC 8678 OTF GAMBRILLS XX7925 MD	14.00	Uncategorized	\N	f	{}	053349f717873d3e345773ab93f95571be1726f7b9ddb2de850882beee08351d	f	\N	\N
51e99dbc-75b3-481b-b5ab-a98d8118ba48	2025-10-20	McDonald's	13.01	Uncategorized	\N	f	{}	a45679d8ec6b11fa196b2d34fe5058ef8c26a95814cbc58a4dbdd11b03501683	f	\N	\N
ea4984bd-b242-47b9-8c92-9d74797b6703	2025-10-17	J.Crew	218.23	Uncategorized	\N	f	{}	2f640f716c58b723717a390420fb0ba27ea39c4eaa144b23458d4bac59e846df	f	\N	\N
89644da8-3c40-4457-a779-c09daa25cc27	2025-10-17	DEBIT-DC 4581 WWW.LUMINISHE* LUM LUMINISHEALTH MD	78.00	Uncategorized	\N	f	{}	23a146bbb65316815793f29fd05ccd71524b2e3bdb873af3d6a11c2d4fd81c3f	f	\N	\N
cf5bf444-9a42-438b-9059-b1d57b6279e1	2025-10-18	Szechuan Cafe	60.00	Uncategorized	\N	f	{}	1ced167e06b924787d75689e8e1fbeaee0b92599a00ad1e9057ea0c69f7dd945	f	\N	\N
5d30165a-18e0-465d-ad9a-99e9fcdccbc3	2025-10-17	Wegmans	33.80	Uncategorized	\N	f	{}	351bb33fc0144a475ad252809002746e87e10da42b0ce7cf8c9989a502799686	f	\N	\N
e5b09fdf-77f2-4b42-8245-fcc8663b6d8a	2025-10-18	Green Tree Gas	30.35	Uncategorized	\N	f	{}	6ed6c6fde93d7ef234bb7cd7095f8d13934ed0efef08818ef0090b429a786c61	f	\N	\N
8e000902-b1c5-4d6a-971e-d286c1e0dc9a	2025-10-18	Yard House	27.48	Uncategorized	\N	f	{}	fff87597b83542395cd131e6e8087eb1d6211fdf7f85e95890ff8aa0174d2aba	f	\N	\N
8c5582b9-38ad-42af-b3d9-8ec3a2e1ba94	2025-10-19	Rise Up Coffee	25.00	Uncategorized	\N	f	{}	af78c7d1137fe61476a3ff126dc8c8337cba601076735906e9411432777c5ba0	f	\N	\N
c598936e-0ffe-4f7e-988e-d9c6cc89ad42	2025-10-17	Uber Bagels	16.80	Uncategorized	\N	f	{}	b2d8a39d0a930bfec7521bb334d9f63fc9637631d1e48822032ebaf3ddaaaac4	f	\N	\N
6bc6fda8-bfd2-4efa-917b-8fa152df2912	2025-10-18	DEBIT-DC 8678 TST*BENNYS FOOD TR EDGEWATER BEA MD	15.90	Uncategorized	\N	f	{}	980f3eedcf9e740fbc8161d56407705dacd62314690ce013d7137eada072464b	f	\N	\N
4bf10ada-4063-487f-a2d3-7364bbaa2951	2025-10-18	Homestead	14.82	Uncategorized	\N	f	{}	28ed401f1106291896761383f984e7863ab576710f490f0157f916a297e9aeac	f	\N	\N
0e052ebe-6819-408d-9708-5c6534e8e90c	2025-10-18	Apple	7.99	Uncategorized	\N	f	{}	a27a492a729c95e0407232d8768f0e990ce7ae0d4be7179f4445f267eceec854	f	\N	\N
b35560c3-d71d-42f7-abea-35178217410d	2025-10-18	Cinemark Theatres	7.16	Uncategorized	\N	f	{}	1b2aea3b70ee285044a9c8b229c328393425c6b5041853164ffd3313d18e7140	f	\N	\N
7bc8a84c-00f7-4ef5-8581-c7f1dc175447	2025-10-16	Target	100.16	Uncategorized	\N	f	{}	7b3e7a002a79bde5b4b8f0e222c838cbc2c9064069ce76b813f54b52bb11b1a0	f	\N	\N
86d3447e-c954-4ddf-a011-0c2e118e0747	2025-10-15	Oscar's Alehouse	31.80	Uncategorized	\N	f	{}	16ea5e8305eba2682bcd8676f8f6059691eb40e0295cfd8b9a76e1bff2e0cffa	f	\N	\N
8dfc67f7-ade1-4748-81af-4cbcfd596321	2025-10-16	Old Navy	28.07	Uncategorized	\N	f	{}	9758bb2fb07027d128ee70828d5ec28d9ed06b7d118b8fdf05d13052d9324c57	f	\N	\N
929ce071-04f4-4a81-862c-7890f208a262	2025-10-16	Transfer to Apple Cash	27.10	Uncategorized	\N	f	{}	653e32e7cb405388c81ef6e1a82bd91a7bbab23787462b3189e7d187dd257e91	f	\N	\N
a0b52a35-73e9-4f74-b96a-248f7b82fa94	2025-10-16	DEBIT-DC 8678 TST* KNEADS ARTISA BALTIMORE MD	23.32	Uncategorized	\N	f	{}	cdc2a86245b528e6d833d95a58d6107d9e498db42925be0257e5a58a1e215e0f	f	\N	\N
8e1428d9-3573-417c-ac1a-917b04686320	2025-10-15	Chick-fil-A	17.31	Uncategorized	\N	f	{}	8c11ac04e11ca114f6f347b4aaef2c6d468d41f8d664acd36ebc786cd6b780b3	f	\N	\N
351dba8e-f5f4-4f79-8962-6c14bf829cf4	2025-10-16	Rise Up Coffee	11.07	Uncategorized	\N	f	{}	c60d2707638fdb6d06e49c808669525233ce4be863f79d7246c2c5550d19ea81	f	\N	\N
8df658cf-eb4a-4381-9dbc-4a10c2371211	2025-10-15	Chick-fil-A	6.41	Uncategorized	\N	f	{}	e2e7ad123a821c3b08ba30d3358e234216ec032d45f40b2ea6445a4f55ca7cc4	f	\N	\N
0719bf13-8219-444c-a562-cfe3dea71211	2025-10-16	Toyota	900.00	Uncategorized	\N	f	{}	636fa17dc1a7946d7a40f0c8da937277676a5450a9c4bf8d616f4c7b80586492	f	\N	\N
bcc2d3e9-b48e-46df-8f39-4bd6f9e63f44	2025-10-16	Payment to New York Life	616.54	Uncategorized	\N	f	{}	02f3ae54f34e9fe4e5bb1c58ef970b605881fd5f36cb3e6cd82c96f3103ff676	f	\N	\N
95e17207-da73-4420-8e27-02ee25d43157	2025-10-16	Payment to Discover Bank	289.00	Uncategorized	\N	f	{}	f54821fc0d1a8a00a3b7eeef1a710dd547b2c6733c8bff20c6581b65201ce89f	f	\N	\N
260351b1-bd33-41f0-b65b-a59033d4b59d	2025-10-16	Payment to ECSI	100.88	Uncategorized	\N	f	{}	b9ff86ebbb356efae32a878bcb8b18022e44ba73f482a35e853c8601959f2344	f	\N	\N
ed427219-cf81-4598-a729-b0814416b592	2025-10-15	Petco	103.33	Uncategorized	\N	f	{}	73370b34e40c6e6084b384204e219dfcb76f55ccfb42d5f817d1bc3f45e91e28	f	\N	\N
9a54ef89-8412-40b4-8561-af1ff9e1f034	2025-10-15	J.Crew	62.80	Uncategorized	\N	f	{}	47cb6537cde40cf26b041ceff05b8e4cdb340b6aec8d6f9e8997730261b49a5c	f	\N	\N
b32bf744-64f6-45bf-9bb8-e4a628ba6da1	2025-10-15	Sam's Club	46.35	Uncategorized	\N	f	{}	f4f0f92dea5c3dba4be8ff4b77aedb094caba489fe2f3979d3beee8cc3125005	f	\N	\N
73a7f614-67b1-48a1-96a0-ed33e612cd32	2025-10-15	DEBIT-DC 8678 MOMS OF SEVERNA PARK SEVERNA PARK MD US	39.87	Uncategorized	\N	f	{}	b7543bc3112c162a6c5dacfcd212fbb0fa4d8cfcf1fb17f078e95d0132a47e37	f	\N	\N
2606ea4e-4d7f-4188-856b-cc716e7a9f88	2025-10-15	DEBIT-DC 8678 SQ *ONEDO COFFEE R BALTIMORE MD	9.59	Uncategorized	\N	f	{}	103ef1cce8861f14a2b4de4f1b4793cfbdc22c5edf9fe2f623757c79ca0c0875	f	\N	\N
b4aef11f-6e2d-4d73-8b23-040fd9fccf68	2025-10-15	Rise Up Coffee	6.09	Uncategorized	\N	f	{}	017f7cb43601f5d01fada5241455a1a4b3c1b8b5ca4f03e64cf87c8def5e6f60	f	\N	\N
fd96af09-c0b7-4562-8c09-de7b08a24f19	2025-10-16	Harris Teeter	4.79	Uncategorized	\N	f	{}	6311b6fc749c0ce8347307d4122a9367f96ca98a785ec12e5f54f8252f5584ff	f	\N	\N
91add3c2-fb82-4ec2-9dd9-8a7f14e3c93b	2025-10-15	Wegmans	1.50	Uncategorized	\N	f	{}	ae613093387809b65b46c27f292dd89a8bbed4b22714ad1b84aae5f9e4683f3f	f	\N	\N
8e0e916a-a62a-4ca0-80fd-1b7f9098ef0a	2025-10-15	Tax Payment to IRS	388.00	Uncategorized	\N	f	{}	b6edaf078056044b944585f0d3e25d06e01b205d4e92f603e74ac5bca7af3495	f	\N	\N
bac89a65-fe4b-4d49-8be0-a1f6f6797bc5	2025-10-15	Payment to The Guardian Life Insurance Company of America	164.80	Uncategorized	\N	f	{}	d59f3a378b7912fc5eca39fa3fe7be0cd2cefdf4f2f04cefbfccdb27ccf739d7	f	\N	\N
2badb598-79c7-4d1d-9a72-380ff8341de7	2025-10-14	Texas Roadhouse	36.00	Uncategorized	\N	f	{}	c673ebce3b6cd6195c908e1eb869af730e000e55ea91f0c9e8aaa0ab3da290d8	f	\N	\N
0927b9c2-d167-4f7b-bff6-e18a6eac4e09	2025-10-14	DEBIT-DC 8678 SQ *CURATE ANNAPOL ANNAPOLIS MD	11.39	Uncategorized	\N	f	{}	c7692f8e6bad293739201c7f8601a542f5bb977628c8975b028f349e28b22b0b	f	\N	\N
7733ed4a-a2bd-4702-81d6-2de42d3bb548	2025-10-14	Payment to Volvo Car Financial Services	485.88	Uncategorized	\N	f	{}	f4e99ca0b33da676c9de9bba1cc296dc94c0bfada56921802b1e28069a8d0bad	f	\N	\N
07eb81d1-0e1a-4a30-9a53-986567d5f29f	2025-10-14	Payment to Synchrony Bank	300.00	Uncategorized	\N	f	{}	3a875e47a435b374a7f05ef2a9fdb41ab0d31fa9d7af23c33d63ab8a2908c3de	f	\N	\N
3d0778e0-7ed2-4420-a7a3-60f7fcfaadd8	2025-10-14	Payment to Verizon	94.99	Uncategorized	\N	f	{}	8ed8694b074361c55e0d5bd60557d51c06bdf7d49a0ad0451a67852c0f7478c7	f	\N	\N
6a16d0f5-1c96-4a63-a66a-6d0e3244908c	2025-10-14	Transfer to Cash App	30.00	Uncategorized	\N	f	{}	3d5164fdf040eff51d96b75cd2a1f3ae97f1c0997f98885a67171e1d18ee43b6	f	\N	\N
2c1aa563-6ab8-459e-bdd1-5ee0318a61e3	2025-10-10	Journeys	42.49	Uncategorized	\N	f	{}	289e910a73f246a1d0bbe24d6f69e403ff1d09c60a6ca98c2e772b1e8535e082	f	\N	\N
b8ae69c8-93a1-45e1-b391-1160d751aedd	2025-10-10	DEBIT-DC 8678 TST* SOUTHERN BLUE HANOVER MD	27.54	Uncategorized	\N	f	{}	fad29ff8db16568b7191cf307f355e32c0d6d8ba79fa0a6c4ef5ba911cbf926c	f	\N	\N
212ccf1d-e087-4cb1-9eca-dd363a307f88	2025-10-10	DEBIT-DC 4581 ARUNDEL MILLS G HANOVER US	25.15	Uncategorized	\N	f	{}	5647998e5d73bbf0ef807d18109a7b305ca30ad791facd78ada925195bf8d3ed	f	\N	\N
da89eba6-6290-4905-a156-5c1dcd2f4163	2025-10-11	DEBIT-DC 8678 SQ *PEREGRINE ESPR WASHINGTON DC	24.00	Uncategorized	\N	f	{}	e0be241134e1e4b40cfcc07b8fc151b9f42c1cdbda7857e1ec15c767d4a52f61	f	\N	\N
bbba3d30-6502-45a3-8a50-2a555ed1b334	2025-10-11	DEBIT-DC 8678 TST*SCITTINOS ITAL CATONSVILLE MD	21.70	Uncategorized	\N	f	{}	7ee967c62587ea6aa08bfd168168975cc578ebc0644bac1a7f1bf60f074f4e39	f	\N	\N
7a9884ec-87a3-4cff-9e16-0ec4e17ef274	2025-10-12	DEBIT-DC 8678 SSA - MARYLAND ZOO BALTIMORE MD	9.52	Uncategorized	\N	f	{}	cb3ca2410726c40a5b50aa57cc87c922be3d9123ec3597cba0e7cabfb5f7fecc	f	\N	\N
826f0fd7-654c-4f9c-967b-263e10c9da3c	2025-10-11	McDonald's	4.45	Uncategorized	\N	f	{}	7776caec3bf57aff3562e57b97260db924d2e430a03af5963a2b9d3f155cb2d8	f	\N	\N
b396afaf-a5c7-48de-bfe4-ef0ac2a3ee14	2025-10-14	Transfer to Zelle	50.00	Uncategorized	\N	f	{}	deb6336377bfeb6f31f36cdbb6c2c40702d00056b83b38b9028fdea49ca07c2f	f	\N	\N
62f0e700-2e7f-438a-b3f4-997c03a483d8	2025-10-14	Dispute - Temp Credit Reversal	130.00	Uncategorized	\N	f	{}	d77f2079400c275bab6d7653eae9df059650b6a8238cde61ec1cb27cab6271da	f	\N	\N
4867a1ac-fa0b-4034-8f54-fef3fefbbb27	2025-10-14	Microsoft Deposit	-4994.80	Uncategorized	\N	f	{}	5c778082c25c0407deb4b83c6efd765447da05c82148e7d2f4bc38b97e8729e5	f	\N	\N
dd04d688-4e5c-4f5b-bdc7-269c7c49f4b4	2025-10-10	Transfer to Venmo	100.00	Uncategorized	\N	f	{}	2a11fde35bd0a60a5232be29e09d9b1490429c01c5eac361e4bf9fe367044cde	f	\N	\N
22114831-df8d-477e-ab3d-76f3157458c1	2025-10-09	DEBIT-DC 4581 ANNEARUNDELCO-NONU XX-1144 MD	288.70	Uncategorized	\N	f	{}	08fcd262721de8f89022afb29289a450541bb57936c0eb7b560316b7e413db9b	f	\N	\N
c4e26112-8d8b-4857-8058-ae8d840cb0fe	2025-10-09	DEBIT-DC 4581 SQ *OAK AND IRON B OWING MILLS MD	118.32	Uncategorized	\N	f	{}	3b2117bf948913d8755615999d0685a603dd75ca554fc718d6c61f20f46009ed	f	\N	\N
0a0e9e08-6832-47e1-b71c-857e96b9eeb4	2025-10-09	Wegmans	64.37	Uncategorized	\N	f	{}	15e6536565cbad39460cda54fafd96538b77b5c7457af4878a4edc291c56f6fe	f	\N	\N
b0bdabdf-d5ae-415d-b115-54a5fff68011	2025-10-09	DEBIT-DC 4581 DI PASQUALES MARKE BALTIMORE MD	32.05	Uncategorized	\N	f	{}	4ec636b950e8c5f9726f48727631b3f04449b03c380fb101a100bf492675e1dc	f	\N	\N
9bb85332-5966-4b38-b5f5-5b0b104c70e3	2025-10-09	Lowe's	32.00	Uncategorized	\N	f	{}	fb60f6192c3884b82498815b287f769aedc8d9d1c73e048f086122d1743bbcc0	f	\N	\N
9ff13979-422d-4bc0-ad13-7106ea4d7a09	2025-10-08	Wegmans	85.06	Uncategorized	\N	f	{}	9df78812c79aed4dce49a278fe276cb6b39381c603ce8b430fbb763249b89af7	f	\N	\N
18c5b89a-1b0a-4c83-8bd4-bbac74907492	2025-10-08	Target	23.93	Uncategorized	\N	f	{}	c4df1c607812d86cce6142f2111d158e5a3c24b76b4cbf854fff29acb855ca11	f	\N	\N
ca506790-7945-486d-86dd-01db010dfc12	2025-10-08	Amazon	15.89	Uncategorized	\N	f	{}	b3998398a73cb0658d139bd5bc1fe5e1cef2152f2d3ca4b92dc5be81aeeea2d8	f	\N	\N
403df74c-a350-4e29-b587-7edb48f59a39	2025-10-09	Transfer From Savings -0387	-954.95	Uncategorized	\N	f	{}	1e7eaabc17250a34155906d7e49dec75efc4e15d584c04e7821f08215f7a7b4d	f	\N	\N
395d8859-62c5-47c0-bcec-0b7f0d8c28f4	2025-10-07	Giant Food	42.86	Uncategorized	\N	f	{}	738017bbf022ce7bfc6eb2ee1be4f66be5b85303daffc3f456ae4207b18c3150	f	\N	\N
51539f46-2268-4c01-bd00-638ccb7a3e38	2025-10-07	DEBIT-DC 8678 SQ *MONTPELIER FAR UPPER MARLBOR MD	29.90	Uncategorized	\N	f	{}	14a3a96a3f7c9bc16aac74e0f62d1c7eabab1022bcb959fba5e046195755ea61	f	\N	\N
eba0080d-db34-405b-a9a5-a6d2fdbffea6	2025-10-07	DEBIT-DC 8678 SQ *MONTPELIER FAR UPPER MARLBOR MD	7.37	Uncategorized	\N	f	{}	78ea3966da6a68a67c06301b303430711e7f7ed1cd9137fa10648a04b640465e	f	\N	\N
dccc5149-4691-425c-b78a-e7c8dd6cdc1a	2025-10-06	Playa Bowls	15.90	Uncategorized	\N	f	{}	5deea70f218cf066177a46b22c7c8ff3777ccab97e37de06ad09395fab139411	f	\N	\N
037a0a34-349b-4059-9a68-697903e0f8d0	2025-10-07	Transfer From Savings -0387	-500.00	Uncategorized	\N	f	{}	d0d03113beaf7757fa79c9eed1a300bdc8b7a4c88df8f6763e186353860eee9e	f	\N	\N
a1e077b2-3f0d-428b-97b0-59903521ab58	2025-10-06	Payment to Chase	279.05	Uncategorized	\N	f	{}	1b6214c1f58a065dcd8980f495c3a87cbef121aa674e2100941a4f71c08cf225	f	\N	\N
c38e6a5f-c2cb-4abe-8573-c5c791e8480a	2025-10-06	Payment to AT&T	186.97	Uncategorized	\N	f	{}	bbc23bc20be786a9a4da2a8422b9f3a612a8ac0077b1188b640eb671a62f4f13	f	\N	\N
ab265561-2c0f-4895-9383-f9c729590932	2025-10-04	DEBIT-DC 8678 OTF GAMBRILLS XX7925 MD	159.00	Uncategorized	\N	f	{}	9ddf52810c330b52c91888892547ef99e95baea84c319492668f9d1c726a2eea	f	\N	\N
cc6f5112-368b-4fc8-8a24-68a38ce36323	2025-10-03	DEBIT-DC 4581 JIANG COURT XX6698 MD	81.70	Uncategorized	\N	f	{}	a4d349dea29a18ea28e11fbcf0516ea5b013b40e62ef58556a1b2151b14ebf3f	f	\N	\N
d393c627-a304-4252-9c31-5a2f620e0869	2025-10-03	DEBIT-DC 4581 WWW.LUMINISHE* LUM LUMINISHEALTH MD	78.00	Uncategorized	\N	f	{}	e9986fe423e5ebe34d96b8a291b91e8fe8eda704bd57c0468669d0693984e9fa	f	\N	\N
bece8ed9-a5aa-4ad6-9758-6fb381c08631	2025-10-03	DEBIT-DC 4581 DI PASQUALES MARKE BALTIMORE MD	58.00	Uncategorized	\N	f	{}	78eda53063a519e96656bfe6082bdfd77bdff6cc63c28e189edacbb38868f589	f	\N	\N
34f4b12c-caf6-4fdb-a6f3-5e4540902f8e	2025-10-05	Office Depot	45.56	Uncategorized	\N	f	{}	bbe9691c3b0d1940ebf5dcff12f62e876031fd5b74e11c37c3e56368a86e9f68	f	\N	\N
01f0fd27-a929-43f1-8dd2-463b6c372565	2025-10-03	Sunoco	33.05	Uncategorized	\N	f	{}	1e21262fdc448259b374a6a9a50ade4fede01c683b6e2127cff864caf5ee354d	f	\N	\N
7c152167-1df3-477d-9fa9-3be84a85ae76	2025-10-03	Giant Food	31.55	Uncategorized	\N	f	{}	5bcba8b3f7cf87ab68b4a4fba3bae8013e49400badaa7b47b3889fe05d732550	f	\N	\N
3c3e2f0d-18af-4adb-9651-c8cfdc332c56	2025-10-03	Ace Hardware	29.62	Uncategorized	\N	f	{}	e49c266d0ccdd813caefe266f2e2a5979f0392da7415656628f289a53fcf1824	f	\N	\N
ba725393-3230-4708-9aa7-80494e7cd441	2025-10-03	DEBIT-DC 8678 SQ *ONEDO COFFEE R BALTIMORE MD	21.20	Uncategorized	\N	f	{}	c9799079aebf8ff871e4464ecb643cb5b051a214ff45f9eb417d858ca2f57577	f	\N	\N
e3908fd3-75ec-4f07-aa92-da147bad7114	2025-10-04	Rise Up Coffee	13.78	Uncategorized	\N	f	{}	7800cec04ca115348855b7db8fb2bc0030b997a73638f604064df3c308c289ea	f	\N	\N
6df555b6-f8c1-4e3b-a233-bcebe0798381	2025-10-05	Zazzle	10.77	Uncategorized	\N	f	{}	32393d44de1bedcae3c8be2cf7dd88fe802ca0bf256c7f22661aa0585d34e04a	f	\N	\N
acebd6c3-36a6-4c57-86e5-e52e9d123670	2025-10-03	DEBIT-DC 8678 SQ *ONEDO COFFEE R BALTIMORE MD	7.78	Uncategorized	\N	f	{}	f67d9404a8e2448971b4725cd4536100e1b44deb216124cae0734515c39ca5e0	f	\N	\N
7bd8f03f-af8f-41a9-a3ca-285dc7065116	2025-10-04	Target	4.23	Uncategorized	\N	f	{}	c2815ca520d2f217fc0ad50ed8be1596d348696b366f0f83e319c3efe7512f2f	f	\N	\N
a705bb02-0a85-4e34-8594-30c6f02ca02d	2025-10-06	Transfer From Savings	-173.51	Uncategorized	\N	f	{}	e6a11911f41aaf68737c971ad714e076f27fada47af8e474212faff46d6b468e	f	\N	\N
8fb589b8-0029-46da-83ab-af74756ea00f	2025-10-03	- Jpmorgan Chase Chase Ach XX0002	2239.11	Uncategorized	\N	f	{}	e119350e13e547d6276f193ff299c931f95b3171a0104ee923359d9c3b09d2ab	f	\N	\N
2926ef75-5218-4067-a530-b5353c9b1de3	2025-10-03	Transfer To Savings -0387	1500.00	Uncategorized	\N	f	{}	8de9a55731b85c302a509fe8b92b642c0bbcc26558bf5fe9dabbf3ce3ef97038	f	\N	\N
38bec82a-d5e7-4d71-b1be-869817640d3b	2025-10-03	Transfer To Credit Card -7148	150.00	Uncategorized	\N	f	{}	cc5909b91790164a776a63cb613e60ac3a8385e185125c637b6cf80181402b58	f	\N	\N
9c40c212-14d5-4d17-85eb-752635feff9d	2025-10-02	Wegmans	137.96	Uncategorized	\N	f	{}	21b0cbe6dabc1c480d9e2737153e6c0d2b961fd299567992e7eba79643f27152	f	\N	\N
28b6cb8e-1326-40b2-b4bf-2fda03574998	2025-10-01	DEBIT-DC 4581 MORNINGSTAR STORAG XX1626 MD	91.00	Uncategorized	\N	f	{}	7b231e759ac5e1ac24904965f8ba57fe5e9de8b83492d58254a1759baefa1245	f	\N	\N
357ce49c-635e-4542-aec9-a09c94c628e3	2025-10-01	Sam's Club	61.42	Uncategorized	\N	f	{}	20641ca70338532532358eb93d8a575fc324edfadcbccef47625389dd661b4ae	f	\N	\N
f98f9205-35d4-4c30-85ad-b50dbda0bc59	2025-10-02	DEBIT-DC 8678 TST*ATWATERS - CAT CATONSVILLE MD	36.00	Uncategorized	\N	f	{}	74dbef9949ee54f9bd1f4f672b4abc7702e843a6a11e42635a4d6d820fca3a6c	f	\N	\N
7b95ec15-fb90-42b4-8c97-546198140b33	2025-10-02	Michaels	22.75	Uncategorized	\N	f	{}	5509bf4f2103dc9c1d958f5f5a3b03580171836bd057576d35fbe36bfbd42a51	f	\N	\N
19795ffd-4488-4ed2-81e6-7a74697eaa69	2025-10-03	Target	15.06	Uncategorized	\N	f	{}	6d3ca44e2ff521d3fd283d1cda971213831d69a591764e3c95487f0021370507	f	\N	\N
77c2e11e-b9e7-4764-90a9-923eac817509	2025-10-02	Papa John's Pizza	11.65	Uncategorized	\N	f	{}	b4d4f1636b89792d4ddf254724e69b9858a27200e8dbaee93d6cbc82a998366d	f	\N	\N
cffc9c4d-356b-4a80-8e47-a8fa81bce02c	2025-10-03	Target	10.58	Uncategorized	\N	f	{}	73aab3270980ceb3bef5970b080afa2fd01bc9e36baedf5ead9d8a5897c5c4db	f	\N	\N
c32c3b83-4405-4aee-87d5-53eac0ced04b	2025-10-03	Transfer From Savings -0387	-3000.00	Uncategorized	\N	f	{}	01c7faa780c096f0ae910bcb050d8ff571df01ef690e02549702d0a791b64eff	f	\N	\N
fe5a1c60-fbfe-472a-b8c7-e58f3abe7c24	2025-10-02	Payment to Apple Card	500.00	Uncategorized	\N	f	{}	cedabf9c4ff588e3ac0d6324cf6d186258e392b866c423d6693562084a7b4018	f	\N	\N
f6352baf-44c7-4dcf-a6d1-6fcaa91c7a21	2025-10-02	Payment to Service Finance Company	500.00	Uncategorized	\N	f	{}	88ad911bec9f323a6a8066dde4d6836f76aec0caede27312edb7ed2f97530be5	f	\N	\N
8d1b4c74-4154-4ed4-abe3-f2a8cedf9ef0	2025-10-02	Transfer To Checking -2740	600.00	Uncategorized	\N	f	{}	87d9b12fb3cde5efb1aa0d9faf84398d0921c91c0b71d612d43e40700a352a59	f	\N	\N
bffc6e84-1927-4c00-af2f-5bf78950ead5	2025-09-30	Sam's Club	63.58	Uncategorized	\N	f	{}	edc5b716ab2d589f545e4071a7e76d262ac124b7c6ddeac245533672b2de4a43	f	\N	\N
468dafde-8e79-4ee7-a13f-af9ef5239d85	2025-10-01	Payment to Peloton	46.64	Uncategorized	\N	f	{}	7c917b55f4b0669cc1f2137311007aba96949bb9afaff36c2d4f647469d5054a	f	\N	\N
7031d748-50f6-44e2-811d-36fa84520624	2025-10-01	DEBIT-DC 8678 OTF GAMBRILLS XX7925 MD	43.81	Uncategorized	\N	f	{}	71841a121cf278894483ca844ac536b67c15766b66fb540df3b032ad420bfef4	f	\N	\N
da9e1f89-1817-42f9-a1cd-2c9c4e58d265	2025-10-01	Sam's Club	41.50	Uncategorized	\N	f	{}	acbba9c25f09e16ee1acb6a86c1c7f4298a169e5ef77984fdc2609e597dedf99	f	\N	\N
ac908067-b0d7-4c9e-bc0d-15b20ba0ee45	2025-10-01	Target	34.97	Uncategorized	\N	f	{}	4d0ddc3621d0e8aadf6b5b27d44be07438f59cea19bd8f3bd5bc27eed1ac4457	f	\N	\N
3d765a42-e7b9-427e-9c3d-e04f11a169e2	2025-10-01	DEBIT-DC 8678 SP JUNGLE LOOM XX1097 DC	32.86	Uncategorized	\N	f	{}	5b9ca13ed6d64848c18b150a7b05e40fe88af10462af119e74a9e6a7a6389cca	f	\N	\N
ac725fac-9e97-477e-a5c4-07da0ae88023	2025-10-01	Rise Up Coffee	19.21	Uncategorized	\N	f	{}	2d436391370f2d694d0eaa78c9780650a20a085c92b0ab0ff22737fb873ce278	f	\N	\N
56533e56-078a-4dc8-b47e-60a72be7698a	2025-09-30	Auntie Anne's	12.70	Uncategorized	\N	f	{}	f5bf31d3613664991f1afbaa4c64aa1e1c25db2ec83ae67e45d5990d6f57d3eb	f	\N	\N
d56fe555-2c21-4949-9a9c-c22f4fe104b6	2025-10-02	ATM Withdrawal	500.00	Uncategorized	\N	f	{}	0c248e07373e2b854039a1b2f2f4fd55f53f215983390e65229c589c15c43615	f	\N	\N
77ed554d-7bf6-4362-879f-e2e44c6d7997	2025-10-01	Shop Fund	104.00	Uncategorized	\N	f	{}	973a522e0c1d62cb8e965d5346ca605ae7f68a9849bc52d04f2e75b4de8da10f	f	\N	\N
3efc44e8-78e8-43b6-b883-04dc6b3d31c1	2025-09-30	Wegmans	72.92	Uncategorized	\N	f	{}	b656744eb45c9d1efbbdca767cbbe2ef1a0e87393065e0a301c27c7e71af30cf	f	\N	\N
0d790fa5-9616-483d-b68a-ad0767fc082e	2025-10-01	Harris Teeter	53.38	Uncategorized	\N	f	{}	21095314dfe83ad7883acf1c85f4a86caf4382534ccfbaf6bd845ff200c4a01f	f	\N	\N
d3c5c1f9-9698-4a70-a59c-876abc2413e1	2025-09-30	Lululemon Athletica	50.88	Uncategorized	\N	f	{}	778b35321be0b0eab76a2dd7fd734c38d433e37eac5fd31521935e8e0af053f3	f	\N	\N
f4222da7-9b42-4280-bdc9-c44358a8a91c	2025-09-29	DEBIT-DC 8678 TST*SCITTINOS ITAL CATONSVILLE MD	31.28	Uncategorized	\N	f	{}	f456172c400e8f2b90f5b6c32f10f19eca6cf9cce26c91d5bc5fd524440f76ca	f	\N	\N
a66443d0-c6f6-4708-8f7f-a81299bce280	2025-10-01	Sprouts Farmers Market	7.00	Uncategorized	\N	f	{}	080678bf57631b42bca9ca7d250b8e93e8af175b109a07d527c5c0615914c36c	f	\N	\N
f751e175-c9e5-4d17-b118-21e1aa1c14ef	2025-10-01	Adjustment - Credit	-0.01	Uncategorized	\N	f	{}	7dec246a6b4650b3ea80a6f3a710db17e3104fc52027509b8f733cc521148ed8	f	\N	\N
1c7f0281-9005-452a-bb24-bfc76c6b5903	2025-09-30	Dividend	-1.00	Uncategorized	\N	f	{}	4582b5d20b0e8259f5a7734d48283ce049fd31dbdb37f52eee056cd842fb713f	f	\N	\N
cb974aa1-cffd-4733-a75c-05b47b47fb11	2025-09-30	Payment to Baltimore Gas and Electric Company	305.00	Uncategorized	\N	f	{}	732885d5caf7b01d590e58887e9b9b732d6109cf8489c85863942f3cdd17a36d	f	\N	\N
06910a8f-18b2-49b0-a4f1-3427b16ec299	2025-09-30	Payment to Citizens Bank	88.12	Uncategorized	\N	f	{}	1dd49aa3ae4dcadb17500cfcff98df69d70a617a322a0b24e6d665531789ca90	f	\N	\N
afca5282-dddc-4a1e-a4a2-39fa66277e4e	2025-09-30	Transfer To Checking -5873	100.00	Uncategorized	\N	f	{}	d92a5ff6d8784f599cbf3d88a15e97dea3097cf1ec97faca77006aecfd2dcd31	f	\N	\N
acde0190-c538-43ab-af72-a2b2058eb358	2025-09-27	Boot Barn	232.65	Uncategorized	\N	f	{}	274eb0ede6105ae52fcc3ef1e3b5a5d1b0008717e257a25090d88e2f20a910e4	f	\N	\N
c7c723c7-d9a7-489a-98a8-fc4b5b6e40d5	2025-09-29	Sam's Club	74.94	Uncategorized	\N	f	{}	f4ff198e7a92215334b341f0c4f12758733a748658c6858abddb1004eb99473b	f	\N	\N
8391dd9c-b12f-4851-b7af-ecc887c84a2b	2025-09-28	DEBIT-DC 4581 LEDO PIZZA - MILLE XX3333 MD	50.33	Uncategorized	\N	f	{}	f2b2016a8d5fac11a670fcace67f27e2e1ad3b711ae10bd4a6e4b2db098c193f	f	\N	\N
e46d98e7-fab1-413e-a08c-cbc809ebd400	2025-09-30	DEBIT-DC 4581 VENMO *Claudaya St Visa Direct NY US	10.00	Uncategorized	\N	f	{}	166094b559d40f87f47c0a8147a6c4320122016cdd98a8ee6365bb235d7abff1	f	\N	\N
4d23b522-966e-4476-bac0-84e566fb4829	2025-09-29	Rise Up Coffee	6.09	Uncategorized	\N	f	{}	1a128ef1c6c8e10b8323265123cd99f7853ef28fac1baba887e0cc90e9149538	f	\N	\N
c8acd8fe-2878-43f9-b6e5-f103d68f7696	2025-09-29	Sam's Club	1.59	Uncategorized	\N	f	{}	5c4d294dad235057c9ded2a68df6d5ab15e70d245dbc5fb822bc89218c9bc339	f	\N	\N
a87d8075-2df6-4f41-90a1-cf46cd51dc4f	2025-09-29	Transfer to Venmo	20.00	Uncategorized	\N	f	{}	d008f1d36b3d5cd09d445051805174b8fbe20299b1741b1f08f8a6f064b9ef29	f	\N	\N
d57a7c69-3d2d-4989-903b-d708dd943fd4	2025-09-28	DEBIT-DC 8678 KENT ISLAND CRAB C PASADENA MD	104.79	Uncategorized	\N	f	{}	04443976d91581a61424a4ae794e43d0029e2197caa7dfc6785a4946102e8e4b	f	\N	\N
5affba21-cb94-4184-be98-01f57e2cb2e6	2025-09-27	DEBIT-DC 4581 SQ *CA(N)E COLLECT BEL AIR MD	55.00	Uncategorized	\N	f	{}	614e35ca12ffaa413fd1456928430b18b75b8da9429331b02b75a9a966e82103	f	\N	\N
4c488a81-5951-4978-8972-213fac154e0c	2025-09-26	DEBIT-DC 8678 FAITHGATEWA XX-4000 TN	54.05	Uncategorized	\N	f	{}	5642d40b75f43643e917e5b4f32b7e810c745164cbb93ba943dce1df41b58266	f	\N	\N
be71543e-bdf8-4a5d-be72-d1ddffd39dcc	2025-09-27	DEBIT-DC 8678 SQ *NOVEMBERBORNAR GAMBRILLS MD	38.00	Uncategorized	\N	f	{}	d1c1400881a2a3a3f73f198ce1fb80f126fd15b431ac8f61fb94b9b51f38b57d	f	\N	\N
815cfa49-b6ab-4614-8fed-ee1bff0a719d	2025-09-26	Politics And Prose	32.85	Uncategorized	\N	f	{}	c480f77f1b57d90dc65eb0cb5e10b5e2311ec916909d6e065944aae4b294f780	f	\N	\N
02c224bd-592b-4d6f-8da2-206fcc74255f	2025-09-27	DEBIT-DC 4581 SQ *ISLAND SPICE G EDGEWOOD MD	27.56	Uncategorized	\N	f	{}	e5427e41acc45f0e822bd90132d20351953977b3fb939f1291fce47d4d94a46e	f	\N	\N
c7c2f8b0-0707-4e0b-8703-c4d81e960fb0	2025-09-28	REI	22.21	Uncategorized	\N	f	{}	2d7c0b0e55e85fddda6116384554224c3f020b4a6fe5eff9da3eda4c0c417993	f	\N	\N
af996dd0-fc65-4ee8-9e51-c476c5f2f942	2025-09-27	DEBIT-DC 8678 SQ *STONY MAN COFF CROFTON MD	21.14	Uncategorized	\N	f	{}	e55c08616988125efa51436c116f601439d44af59d3c5a1b3d7377a5dcc5a6cd	f	\N	\N
ced00e34-49b0-4b3a-a282-e59ac557835a	2025-09-29	Royal Farms	20.00	Uncategorized	\N	f	{}	e0dc06dee06b150d6ad1b94adf340339e2515810df181f9d8c471fdc6d7542a4	f	\N	\N
ddd280d8-e097-47f9-846d-674749d4cf1b	2025-09-27	DEBIT-DC 4581 SQ *CROFTON FARMER CROFTON MD	15.90	Uncategorized	\N	f	{}	bf9921e6cc9c2ed523c99b3524d9a017401daaaf7600eec7535d9e7c558342f0	f	\N	\N
9d1e42f0-2dcc-43a1-a988-e34669291624	2025-09-27	DEBIT-DC 4581 SQ *COZY COOKIES BEL AIR MD	4.36	Uncategorized	\N	f	{}	f4dcd210c32884958bc2d635ee2fe0357a8a3c7c7e080060a69e6b20b2c7f4ec	f	\N	\N
a6e22d2a-2fca-4b01-b451-9833b77dcfe8	2025-09-29	Transfer From Savings -0387	-192.09	Uncategorized	\N	f	{}	7f68356901c300d3db342407ae28edaa402aeac83e28c4d53453aa4448677a5c	f	\N	\N
fa90be34-6be8-4b15-b5ff-aef91edeb4b8	2025-09-29	Transfer From Savings -0387	-115.00	Uncategorized	\N	f	{}	0993a7845eff71142af8480e570e0f85c4ed433b60473ae59e955019d688a0db	f	\N	\N
1a7a5132-83c2-42db-8135-19f3d43d9f85	2025-09-29	Microsoft Deposit	-5180.23	Uncategorized	\N	f	{}	70ff131c96984efd2a7eb630934da1f7b0ba009a1c0f626269ab02e582b7280d	f	\N	\N
9a484626-d949-4fe1-9978-c644254c319d	2025-09-29	Transfer from Venmo	-50.00	Uncategorized	\N	f	{}	1e18c10a3f114443b3efc1dc568c9f60dcdedad6cb57a3f14100fadaa84ac3d8	f	\N	\N
5ac91a01-d6e9-4681-9f79-c5a1e4f30ace	2025-09-25	DEBIT-DC 4581 INDEPENDENT AUTO C PASADENA MD	72.00	Uncategorized	\N	f	{}	aae0b0d5c8c4987106d4e112be92c298e5cdb84b69a5a63b95508a21e622aa9d	f	\N	\N
6232b7f0-17af-484d-b084-9f6a62a85c1b	2025-09-25	Wegmans	69.78	Uncategorized	\N	f	{}	e5ed464fd6a61702dc12eb168d790d181cc6d8193ba6e640687250bfad63d6a9	f	\N	\N
183ab172-ca9b-4b1b-bfdb-ac9b37be465f	2025-09-25	Ace Hardware	54.79	Uncategorized	\N	f	{}	473cc39cf60b23f70a26c178dd62b031a94c93b729ef5440cbd857479f314e5d	f	\N	\N
7ff387d4-6791-4d4b-a304-a20e91c27cae	2025-09-25	Target	37.48	Uncategorized	\N	f	{}	84071c9e62287192bbbc74010fcd270a79e8921bc8df70dcb34b193e491b6442	f	\N	\N
3883a5d5-046e-4346-b1d0-e8dbfa647a3b	2025-09-24	Burger King	5.49	Uncategorized	\N	f	{}	d7b722f39677518de38862ecd055bc03a0cb9adbbb046a79726d451419d9cbc8	f	\N	\N
c3567f4d-3215-4e40-90f0-2e00fe39580f	2025-09-26	Transfer from Zelle	-400.00	Uncategorized	\N	f	{}	afff8c436d237e602dc321e0b9f3f8167656b372622ebb5b0f812d108ca1c20f	f	\N	\N
1085d1b7-6c4b-4514-9b51-a51735d17b92	2025-09-24	Sprouts Farmers Market	86.12	Uncategorized	\N	f	{}	b7f8739d4386bc44d70689722303bdf6af3264d29e3f8a6111acc131a028d520	f	\N	\N
d08b0681-601e-4b37-8df3-6013ec1120d4	2025-09-24	Wegmans	78.47	Uncategorized	\N	f	{}	02c5a4e8764d6986d87d5394cabf45a2130367d4a89540249dbf218c98a9be6b	f	\N	\N
b6f16b7d-f6a4-4d5a-92ae-9f3399f736dd	2025-09-23	DEBIT-DC 8678 LEDO PIZZA - MILLE XX3333 MD	11.12	Uncategorized	\N	f	{}	0b9ef07cde4e425f0a94ef64656ab00512ab6294431bb0ea95243f066108adaa	f	\N	\N
a4f79d15-6c92-427c-86e3-884054441731	2025-09-24	DEBIT-DC 8678 SQ *BLAS MARKET PR GLEN BURNIE MD	5.78	Uncategorized	\N	f	{}	a38a38ae9e98cc972b1b4d676aa810f52a074ef24e96dc5911985264ed2a70e2	f	\N	\N
54d0544e-2bb4-4ecd-a746-ec56b01a820d	2025-09-25	Transfer From Savings -0387	-200.00	Uncategorized	\N	f	{}	592ae8d3cec0e2bb4b871b98bdd0b663707b0941bfd6d0b990b945c4264114cc	f	\N	\N
671266ae-2fb9-4551-9f2c-5c1d6c706a61	2025-09-24	Payment to Liberty Mutual	260.08	Uncategorized	\N	f	{}	59d64179097437cce6518798d7ded0cc0ce9be6b0a636b20fb6d7b9af494d997	f	\N	\N
7e873368-088e-4921-b792-731b66b560d7	2025-09-23	DEBIT-DC 8678 LS SERVICE PHOTO S XX6200 MD	88.01	Uncategorized	\N	f	{}	a9ce3221207514a648dcf7cd78d03e27be5efad2e8a380dfb3e4d0f61c4a5079	f	\N	\N
22f11200-e917-4705-920b-52995f551b4d	2025-09-23	DEBIT-DC 8678 BLUE MOON CAFE LIG BALTIMORE MD	72.45	Uncategorized	\N	f	{}	e6a83e45ac09a8993656a944ee1f7d7bc40b006c91f6191fe528cb22143e134f	f	\N	\N
37670000-b99e-4420-b65a-3614abeb3f0e	2025-09-23	Blick Art Materials	31.91	Uncategorized	\N	f	{}	5b7eef460e11cec7048dcab303b1f93a69489b9b16981b3519931eea037951c9	f	\N	\N
175321c9-d1f2-4ece-8ae3-eebb26d0180b	2025-09-22	Chick-fil-A	28.81	Uncategorized	\N	f	{}	65f58de1e22c621492fd37680ced2b2fe3fb53b78b5036243a48001e3a67accd	f	\N	\N
15ba7b6f-9362-49e9-b94c-82f6d750145a	2025-09-23	Papa John's Pizza	17.06	Uncategorized	\N	f	{}	33495c023c25b1e5e0c278b3dfd481d31b4bc7accfd95bce5ea8a9f2d0395448	f	\N	\N
df450278-2284-4f36-811f-b8ff90eea64f	2025-09-22	Taco Bell	5.30	Uncategorized	\N	f	{}	54e8917e369961635e1e4874b4e8057f1644427706dde0ca4f3a83dcd659444b	f	\N	\N
676185f8-23e5-44cf-bc7a-a9a0531c78d6	2025-09-24	Transfer to Zelle	40.00	Uncategorized	\N	f	{}	2d1f35388dbee5f813612bccc5b654aa7029ee799db74fd12ebb2f6ab2efa244	f	\N	\N
38db3762-83d3-46c9-a3dd-1bea956512ff	2025-09-22	DEBIT-DC 8678 TST*MARIPOSA LATIN SEDONA AZ	140.00	Uncategorized	\N	f	{}	e8ad2d3247aedcdf9d9fe9539104211ed8605fcc68161826bbcb2efac76f08f4	f	\N	\N
ecf20bd0-1cb3-4e46-98e1-fc0fb2c10925	2025-09-22	DEBIT-DC 8678 SQ *FREEFORM COFFE LAS VEGAS NV	79.55	Uncategorized	\N	f	{}	98ba316637922fdf659703cc3da67eb8b58af660ebc8f5929b009bf2632597d4	f	\N	\N
1a1cf6c0-bbf1-4509-b532-9c64354d8673	2025-09-22	Etsy	35.81	Uncategorized	\N	f	{}	501b376a05f04a57a5dce7ae02e3868feac167836b9f71145408374b572c0861	f	\N	\N
faa53770-21d6-4940-9c3d-6baf1b93bbee	2025-09-22	Apple	13.77	Uncategorized	\N	f	{}	0099ad5f14b579496cb283452808919cac8cd63a61ec15f5f8a3976fad46b8bb	f	\N	\N
2023f3b9-30d2-43a3-a321-7fde2227d38c	2025-09-22	Sedonuts	5.00	Uncategorized	\N	f	{}	ba476ae6c45a6e524c3a787819b10097e393690fe4dee2ce286554df6ca151f1	f	\N	\N
1418bc1b-486e-41e9-831f-96a9183f8f34	2025-09-22	Transfer To Credit Card -8715	200.00	Uncategorized	\N	f	{}	80d91877201dfa884bb3ebfc6a9af4b357a381a2c4234b41b44f5a9f9c07c940	f	\N	\N
a13251d0-054f-47eb-a3ee-ae815a53db25	2025-09-20	Fat Olives	85.00	Uncategorized	\N	f	{}	41d200f4d454f230b0e1b9842ee6a65b9ccdc3b412089452c87db921239409a9	f	\N	\N
1b94b267-bbb1-4bd3-92b7-eb6ba7b83aa3	2025-09-19	DEBIT-DC 4581 WWW.LUMINISHE* LUM LUMINISHEALTH MD	78.00	Uncategorized	\N	f	{}	cb336cc83cc588ff4a7101fa84a820b5fac9723461d3b5f7a181026b19af4e25	f	\N	\N
5d1eb421-bb41-40fd-983f-4307c0f07920	2025-09-19	Tractor Supply Company	61.47	Uncategorized	\N	f	{}	946bf518dba0438160c7f013b193c865315d2da9afcc003a560c04dc631b5ccc	f	\N	\N
06d8fc63-5c8b-4955-98e7-2faf1ad5f871	2025-09-20	DEBIT-DC 8678 PINK JEEP STORE SE SEDONA AZ	58.49	Uncategorized	\N	f	{}	deb25432710d768dba97d1ab384e583e6dec1b4a0eb949c03b9559fcbab9e5c4	f	\N	\N
0dd2166e-88f3-4f9e-a98b-83770895026a	2025-09-20	DEBIT-DC 8678 SQ *FREEFORM COFFE LAS VEGAS NV	56.00	Uncategorized	\N	f	{}	60316355a7ee06804b16a84a61ac322b33d9effe0d098ae09700bd346e28abe4	f	\N	\N
1fcc1cc9-108b-4079-b6ef-e39def0915b3	2025-09-20	7-Eleven	41.08	Uncategorized	\N	f	{}	d0f5e6ea13a5be7077b530b7e6c425ff466120f2c76f6800201aac3b42d50b00	f	\N	\N
8c75ec99-a9b0-4b04-8dbf-cbadb28ff42c	2025-09-19	Grand Canyon University	35.00	Uncategorized	\N	f	{}	81c27f56211247cb44fb2625043278baf942b19bc164229cc2b8a57d9063c66b	f	\N	\N
8513114e-b9d4-4bcf-8bbe-f0650ace7fc5	2025-09-21	DEBIT-DC 8678 UEP*SZECHUAN RESTA SEDONA AZ	25.00	Uncategorized	\N	f	{}	2b617620ffe318ebe0e0c39a7adaae7045a4afcd2c24ac3a18f4a0b697c5c889	f	\N	\N
5f4a29e9-fbca-4645-af67-ee8af69872a7	2025-09-19	Dutch Bros. Coffee	23.90	Uncategorized	\N	f	{}	0985e7a9087ed0bd1e9aab29fb7204d639ef6688daa44c1f6e74624adcfdec83	f	\N	\N
6ceb8782-6cbf-4239-ac94-3b2907e67d1a	2025-09-19	Chick-fil-A	19.30	Uncategorized	\N	f	{}	d4faa92e149ddac2b23a6366b4df04faea8fb20bf614e9d152a5bbf30a399168	f	\N	\N
bc175415-6857-4d6c-bbf9-24798cb2fa96	2025-09-20	Alt Gallery	17.66	Uncategorized	\N	f	{}	092f68474221c006086b4c488ccdde0515cbd6ea8b84223a78e1f6dddc72ac31	f	\N	\N
426edb26-5a69-4f08-9f01-edab75942501	2025-09-21	DEBIT-DC 8678 PP*ALT GALLERY LLC SEDONA AZ	8.83	Uncategorized	\N	f	{}	29491aa47639ddcfa2adceaf40447a88739eba9698cd9035b335dc55dfa5e9bb	f	\N	\N
f19189b3-d45d-49d4-8075-f7b30b1c59d5	2025-09-19	DEBIT-DC 8678 PY *ONSITE NEWS - BALTIMORE MD	6.34	Uncategorized	\N	f	{}	a0842c6dcc67ebbeaa50ccddbbe5ad0484510b95ba3206ee43380eff6bd7b7e5	f	\N	\N
bdb9229c-2a03-473a-a0bd-6840e5fff874	2025-09-20	DEBIT-DC 8678 SP GARLANDS XX4070 AZ	5.52	Uncategorized	\N	f	{}	c3a56525bffbb31fe4892e1305cb4358d7976b6d412ebd9e1588dff8473f4455	f	\N	\N
883ee922-73e6-44bd-a6c4-b6ea3f9c6fb0	2025-09-22	Transfer to Zelle	40.00	Uncategorized	\N	f	{}	ded19f3686f1e220a8d6473eab27f6c18b56308394adab9b19c79ddf0ed5ec22	f	\N	\N
8916616e-04e6-447a-b2a9-64ab419656bf	2025-09-19	Transfer to Venmo	100.00	Uncategorized	\N	f	{}	1f2fd966717fd763cbae57065eaa4d0cc5368cb106a65f3bc906774a9bc00bac	f	\N	\N
aaffb247-eb09-4a03-8887-5219f84c81e9	2025-09-18	Banana Republic	127.20	Uncategorized	\N	f	{}	67396768dfe9707e1b26b5b8edda5ae581bfef3afe406508f1059c3347a0793c	f	\N	\N
e143b7d6-450f-417f-8247-5a2b83d66411	2025-09-17	Sam's Club	112.16	Uncategorized	\N	f	{}	8f2ad7ec106f569646642e752ad4d92978608c67c67d133c7aa039e1661d38ba	f	\N	\N
5586d196-de26-4753-9346-0f37d62916ab	2025-09-18	Target	101.22	Uncategorized	\N	f	{}	9e7c200b54a9ad835d5af27a89d940e17d921f4c2c4577ecc9e7ecb87d7b0983	f	\N	\N
46ad3def-4420-4e36-977c-eca60bd9d2b8	2025-09-17	Lululemon Athletica	57.24	Uncategorized	\N	f	{}	9ca17213755d7077255fddc9c63a0efe278914ffaec195171c26fa64e4e66608	f	\N	\N
c671ce58-4b08-4fd2-b946-353e19182ef6	2025-09-18	Apple	7.99	Uncategorized	\N	f	{}	5eda9df6ac60ab3bd15f961478fff323e4860b6e25bf69d6a09fe4e692708331	f	\N	\N
88663c3c-6838-49cf-a67f-2874b7751629	2025-09-18	Target	6.95	Uncategorized	\N	f	{}	d9e50f352f12f82a910a1a44b6c0fbda86be0c046318c067429f54ab9a8751dc	f	\N	\N
a827a667-306e-460b-b006-a0e59edff5f0	2025-09-16	DEBIT-DC 8678 PINK JEEP TOURS IN XX9000 AZ	337.82	Uncategorized	\N	f	{}	9c293e869cff3362a323ba576473bd100a34ad810a8f0d056aec8056c5b30dbe	f	\N	\N
1679b27f-70c4-45a1-a211-7e8f23fd6490	2025-09-17	Wegmans	234.58	Uncategorized	\N	f	{}	c14d713d528ae7f0753e9ff41e55e35c9db3cf23ad2fa056d8398ead1335ec56	f	\N	\N
89b39f91-fdcd-423b-ac28-e3e243a5bd27	2025-09-17	Banana Republic	140.95	Uncategorized	\N	f	{}	97426013ccae58e07f935372a793e92f189ac77c1937e9939931f2635f4f9586	f	\N	\N
8f9a97ba-20a1-46ee-bb3e-db653b443b46	2025-09-17	Sam's Club	45.45	Uncategorized	\N	f	{}	3938579e6f16205b0166296f64a8f428a4a1ac48d4c23a1545e5bd73a495f016	f	\N	\N
c73a51c4-8931-4e55-8480-d190993a7c2c	2025-09-16	Ace Hardware	39.79	Uncategorized	\N	f	{}	49e350c56ff42b464dc3f7306dc0925082699deb98f49682019687c806218070	f	\N	\N
3e41f2b9-e0e4-4f28-8eba-bca4e3296b18	2025-09-17	Giant Food	29.52	Uncategorized	\N	f	{}	1fa4287844485107812fcce9b3ea27dd99efa348ffe201abb80590713c7c11ed	f	\N	\N
885c35c0-01dc-4e3a-b6d7-ec6617f60d32	2025-09-18	Target	16.94	Uncategorized	\N	f	{}	65c420928dd7aa73ec189e46c096f80f30f46a7acd7f31c6384f105b4b5be4da	f	\N	\N
189b1458-6d5a-4d41-a5b0-dad4cded2b32	2025-09-18	DEBIT-DC 8678 COLLEGE TRANSCRIPT CLOVER.COM VA	3.90	Uncategorized	\N	f	{}	b5e1ba05218a1c1d9ae16ac84acafecae6615840c6490d2f4fcfdb4145abe7fd	f	\N	\N
6c0e6330-ab3b-48e7-9f93-eebb7845c611	2025-09-17	Payment to Discover Bank	4982.96	Uncategorized	\N	f	{}	401d888745809a37974c98dbf1e3522c632e141af22abcf7860494faf4c30c84	f	\N	\N
972b47b2-0bc7-4d06-a9e6-9fc807eb8318	2025-09-16	DEBIT-DC 8678 SQ *SACRED REMEMBE GOSQ.COM AZ	255.00	Uncategorized	\N	f	{}	833aa1b93beac49bda08fd67243c7391799b422869b7247ce81c3292c4e6d3f6	f	\N	\N
1b6308ee-ba63-467c-8699-3d41ad79ab8e	2025-09-15	Ace Hardware	51.87	Uncategorized	\N	f	{}	48743ea1c8054b6dfb57d86e3879f1f1f8dda605fc39fe26c9c9660540f4f0cc	f	\N	\N
2badb785-7999-4801-9819-c78e4e36c499	2025-09-16	Rise Up Coffee	7.09	Uncategorized	\N	f	{}	f4905b09c80aeef636083b99bbfc1e6eac76d8e0aaac5c942b3627ad87bb5145	f	\N	\N
2aa515db-89e2-45e3-b4b2-4a252c799ac3	2025-09-16	Toyota	900.00	Uncategorized	\N	f	{}	ee9ba72391acfb399a2ada13e7b21cbe6138e8a1f54cce724c0f9e3f23dcee43	f	\N	\N
a50deb56-c580-4238-a571-e56a5a57d42d	2025-09-16	Payment to New York Life	616.54	Uncategorized	\N	f	{}	5532d856e54c9b8088ddaeac9942e48c4c88848b698111c3bc17c234e16030d1	f	\N	\N
bc709cbb-dde0-4124-a5ab-9c922def40e7	2025-09-16	Payment to Discover Bank	394.00	Uncategorized	\N	f	{}	5f1b625f2e4d1384f600280d3ee5c0e8c6f1dd73bfdca1dece8292853f7e8167	f	\N	\N
5ff00aba-283f-4c66-9e70-dd88d1a604a1	2025-09-16	Payment to Chase	150.00	Uncategorized	\N	f	{}	90974a3124e47a8500bf5f9944f975a6a95dc6cc5fced139eab8fc157fec6bea	f	\N	\N
2aeb32bc-13ef-4fbc-950d-cdb5c248aac5	2025-09-16	Payment to ECSI	100.88	Uncategorized	\N	f	{}	120f733b60f3fef74ee7e1ce4a67e2c6e069d193d6c7c5f3087fb68c436ba697	f	\N	\N
ba8b707c-8c94-46d8-b1e1-2d8ac2993e2d	2025-09-16	Transfer To Savings -0387	150.00	Uncategorized	\N	f	{}	1ae4138433503da62f5cb411d3d69034568939239e807cb9fef287ca7d8f35cc	f	\N	\N
5eaf6bfb-2e59-40da-bd74-ab11cd3fd042	2025-09-15	Target	78.53	Uncategorized	\N	f	{}	af8cf0ffc59459885fe6c36d3dda9fd9b9306caa6ea314fb73f8c8560c1eaf8c	f	\N	\N
7d24cfbe-2d2b-44e9-acfd-e4872841cbe6	2025-09-15	DEBIT-DC 4581 VENMO *Claudaya St Visa Direct NY US	60.00	Uncategorized	\N	f	{}	c2f7ca754d720fe6f0165692cc331531d45de234fe1f9a59d7df99718b3e3aa4	f	\N	\N
6fa3f9d2-0db7-4881-9b09-6ce8de086542	2025-09-15	Target	40.27	Uncategorized	\N	f	{}	8b7ec92e67ee960e09f4f7f617a1cc7068a5b63456fa5f0f8732232373a2f2f2	f	\N	\N
9972f291-ed39-4284-b3ee-079cd097d2fd	2025-09-16	DEBIT-DC 4581 NEBULA SUBSCRIPTIO NEBULA.TV CO	30.00	Uncategorized	\N	f	{}	2b8420709e3cc5cd732c0fcec8f5c83bc83efebe8b7ca79463f2f4eded629126	f	\N	\N
4409c960-8563-4c5f-8873-db835c47643c	2025-09-15	Rise Up Coffee	13.41	Uncategorized	\N	f	{}	4a7e03ea244eff00f20924c72f9c4c00bafa383e6148b979ba7c1c07dc12c652	f	\N	\N
1b7c66e2-149c-476e-b10e-2c467877fc23	2025-09-15	DEBIT-DC 8678 BRUSTERS REAL ICE GLEN BURNIE MD	5.50	Uncategorized	\N	f	{}	1c0f96e936492b058452c9756cf052f7e54dc950b374b0b129852c8a17f9aae7	f	\N	\N
95542949-3e63-49b9-8e2b-c7f387f16e13	2025-09-15	Target	5.00	Uncategorized	\N	f	{}	45b693e02815ff58e67c727e65a79ceaa55232e8b84ff19ed0ab72b6de4b70c4	f	\N	\N
f73467b0-4398-44eb-ab88-b096b23f86c8	2025-09-16	Transfer from Zelle	-327.50	Uncategorized	\N	f	{}	c3d10795f4e9a84f55943e8fa442cba39953e303db4d6d923e242bb0f5a3a9da	f	\N	\N
d94582e6-b0b3-4ee0-a557-a4387b087534	2025-09-15	Tax Payment to IRS	388.00	Uncategorized	\N	f	{}	1296d2f4230d8c942f62989e03f96af0afabdda15f739a8c6243872e700402ca	f	\N	\N
419b76de-4345-4729-9957-a3c885e3d051	2025-09-15	Payment to The Guardian Life Insurance Company of America	164.80	Uncategorized	\N	f	{}	bdeef73b3471043d7b8e6fd27de21f6db8dbe24817a633aa92f8ea7512474c7e	f	\N	\N
eabea865-fc82-4fd8-8ac0-630aca23f91d	2025-09-15	Transfer To Savings -0387	2350.00	Uncategorized	\N	f	{}	5ce901d8500708d9ab900e3a0b58cb142631e2b9ab4bca864fa0d2d6029728b8	f	\N	\N
b39ea0b8-b2fc-4759-92ea-4e82c2159529	2025-09-15	Transfer To Checking -2298	1250.00	Uncategorized	\N	f	{}	59a3ed6f2b18c485ddaecc4bbcc9b029804761d56781b06566386c331ff98d93	f	\N	\N
ccc8034f-6db1-4b16-991c-abf5147f88fd	2025-09-15	Transfer To Checking -5873	100.00	Uncategorized	\N	f	{}	cb4ed94b390418cbbf21e1e42df750fb4698408c8a046a0ab507811181196961	f	\N	\N
8d5a7101-da18-4b9a-992f-477e40168b65	2025-09-13	DEBIT-DC 8678 SP OONI PIZZA OVEN OONI.COM DE	557.73	Uncategorized	\N	f	{}	108e3f8e58503edd00050aa2732aed36574cb1f50b8af8f0a731f3a6917b3ae8	f	\N	\N
c6682b73-0e7c-4d63-862f-0ebd59470aa2	2025-09-14	DEBIT-DC 8678 SP THE UNION CHURC XX4260 MD	225.00	Uncategorized	\N	f	{}	147ce579078fa8b909f1c68e84ae9b1a90548fb542f829c06f1a1028914c9388	f	\N	\N
63634e91-a4fe-4c41-a691-98ccd99a4627	2025-09-14	Politics And Prose	161.12	Uncategorized	\N	f	{}	531eb656170789b4c8eb9d57c9b5487a3dd9689cb7d70513ebacf865d99608ed	f	\N	\N
80fcba8b-64c8-4260-8c92-39e8f8e46dd1	2025-09-13	DEBIT-DC 8678 STONE HOUSE COLLEC ELLICOTT CITY MD	78.44	Uncategorized	\N	f	{}	ca8dd8eb426f9ceb2997f6b34f238158b27622c88c19091d1a30b98e047e2d39	f	\N	\N
35f7e23e-b30d-4d9e-ac76-4dd49a3f9429	2025-09-13	Apple	63.59	Uncategorized	\N	f	{}	78e8bd9cf974c5a8934142f1c84ece694c9c07cbf32af9e7759b5c2893b4eed7	f	\N	\N
d92b4442-016b-4c93-b5f1-fe000a4d1369	2025-09-12	DEBIT-DC 8678 TST*MERA KITCHEN C BALTIMORE MD	44.10	Uncategorized	\N	f	{}	0359818d7313ca8dfbcce8a2dae7a89a6a9eaf906af91e60ccbeb7734f047393	f	\N	\N
1a155811-20ca-480a-82ee-129b2466c8ee	2025-09-13	Inspire Nail Bar Olney	35.00	Uncategorized	\N	f	{}	a33a3d07e3dfed92f8907711f4e9b78625fb6c54b7c3f6507d1fca84ab16f8d2	f	\N	\N
b7716202-f328-4eca-bbcb-cfc22b1a1cbb	2025-09-13	Sam's Club	30.35	Uncategorized	\N	f	{}	ac822f64053fc6f282c9caae63c83ab7825a144ddee5ed0d8cdef74f5f4a7ee5	f	\N	\N
b9b64043-edce-44d5-84d9-fd5fef82589e	2025-09-13	DEBIT-DC 4581 LEDO PIZZA - MILLE XX3333 MD	27.53	Uncategorized	\N	f	{}	2cb7352270fd999a9dbc692c0a86248f98ac2fe3df02dfe75664fb5d74c7b244	f	\N	\N
e28aac69-d20c-442c-91a2-e07073c7b078	2025-09-13	DEBIT-DC 4581 LEDO PIZZA - MILLE XX3333 MD	21.45	Uncategorized	\N	f	{}	2e571e5a4cdc45f80be266d57e1b62cde565062e21b68c5f5ce4b04f2bce3e18	f	\N	\N
24616955-ee99-4f6d-9e2d-e6580fadf87a	2025-09-12	Homestead Gardens	20.00	Uncategorized	\N	f	{}	203156f87cdc0cd7d07b56cf975963e742b4d327e04825e372c823cb10252dfd	f	\N	\N
e4c6365f-fdb5-491b-9563-47ed3eb275f3	2025-09-13	DEBIT-DC 8678 READY SET STITCH ELLICOTT CITY MD	7.74	Uncategorized	\N	f	{}	20c64e304fe055814153762eb173e45843decb866a0c90cdab5c4b3c683b08f4	f	\N	\N
0d083cee-2270-4d7a-a1d0-a485fb7492aa	2025-09-13	Royal Farms	4.34	Uncategorized	\N	f	{}	79db6a9ac838421829fbfbfd43ca7af901067c3cec7e7e18dd08155e65bf6dd9	f	\N	\N
02ba4686-1a97-4468-b74c-56b45a81b2fe	2025-09-14	Target	1.00	Uncategorized	\N	f	{}	6c52856fb0c2259d2db6b890a561c8e9c97cd35b7f076c353aa2059d054a1391	f	\N	\N
4a82bda0-7de6-4dbe-aad2-f229e1961ee3	2025-09-15	Transfer from Venmo	-267.00	Uncategorized	\N	f	{}	5e4cad8c02a7eac01aa020a623db368608b492a69102e01791e9ae2fd95018cb	f	\N	\N
d1faf5d0-06d6-45b0-b1f1-dae43ef95aab	2025-09-12	Payment to Verizon	94.99	Uncategorized	\N	f	{}	dd393d583f4421fccfc563e6d7c9fd89f9db91680cf6e1ee333583346e407649	f	\N	\N
b7264a86-8d0e-4a07-bc99-eee32ec42e0b	2025-09-11	DEBIT-DC 8678 TST*ATWATERS - CAT CATONSVILLE MD	95.98	Uncategorized	\N	f	{}	9719f37406a565db923d47fd4e593a3994d673bd45922afc79c6e73ff6554cb6	f	\N	\N
8651d147-7f8e-46f6-8c8b-a93929148f3d	2025-09-12	Microsoft Deposit	-15355.28	Uncategorized	\N	f	{}	1bb210191ae0ee71d29d252b0a235d9cfe1c28d4ec3b8fbab05f91e9b0dae121	f	\N	\N
8db312de-d17a-43cc-b25b-f28bb5c0b72a	2025-09-12	Transfer from Zelle	-820.00	Uncategorized	\N	f	{}	55ecc3670add361a11268ed930bb393d3ba27657f4e409d02641742710ccbb4a	f	\N	\N
535b34d5-fcf1-4800-9634-928f4441246c	2025-09-10	Sam's Club	22.05	Uncategorized	\N	f	{}	3a53f38bd55754ded03c2a2dacb02eb17a68611940d8babc9b97b28694bb8300	f	\N	\N
891f437e-9128-45ef-b0fa-b4629ccfa826	2025-09-10	Sam's Club	5.67	Uncategorized	\N	f	{}	563ed0a8a8ca424cc78372009bcf36d26fe684d2539ef3c4e43edac894d911bf	f	\N	\N
d6862bf8-95fe-4046-9b83-b6a5ab89adac	2025-09-10	Sam's Club	4.00	Uncategorized	\N	f	{}	f811d9035853ea1e39d1479071e5416fc2b94b111b601ed9f72adb52506f2f35	f	\N	\N
67de47b2-ec57-47d4-8f2c-50ecadf57b23	2025-09-10	ALDI	3.30	Uncategorized	\N	f	{}	c31c3b20e039ae6f2169d39cbe4fb5e98ba794efd9f122f443db314c4833f502	f	\N	\N
d5d8954d-da2b-471f-839e-abe1bbf5a7e3	2025-09-11	Transfer From Savings -0387	-100.00	Uncategorized	\N	f	{}	03243623c5172975411cf9afee4c5873fd0b82ee03bc6768e6173cf9d5d30429	f	\N	\N
d681cd88-5d4c-4129-bb25-e4a3981c2bd2	2025-09-08	DEBIT-DC 8678 UMMC MIDTOWN - PAR BALTIMORE MD	3.00	Uncategorized	\N	f	{}	1ab75a44b6faa6af3449dad6e6bcf20059d8780da681fab7ec78e6b7be150d66	f	\N	\N
217e124c-065f-4f94-b400-7adb61041698	2025-09-08	Wegmans	59.60	Uncategorized	\N	f	{}	3362c2ac8ab63d4988466b5062b5f646d2083fb36db81af76761ff8c87fc18df	f	\N	\N
ca283370-751b-4cc0-91ac-88d1805c8bf3	2025-09-08	The Home Depot	10.35	Uncategorized	\N	f	{}	5b9b1d82f090c27d9f6cb5ea1464901c058c91a05bb18dfd6b7bc9a4dea493a6	f	\N	\N
44a4be41-b133-4f9f-aae8-d70e98891b02	2025-09-08	Giant Food	5.29	Uncategorized	\N	f	{}	5a8d97c0a4276182ebd3c6cb0749389df830638ceb36bb85f863d768015abc97	f	\N	\N
fa9da464-7422-4c8d-a743-7fa1a833d16a	2025-09-04	DEBIT-DC 8678 OTF GAMBRILLS XX7925 MD	159.00	Uncategorized	\N	f	{}	76a4d7fa91f7b32aa60b2e1eb12832ce79600afc2dbaf123a86ca71b3edf5c1b	f	\N	\N
9afa3d52-81fc-4ed7-9903-dffeec716345	2025-09-06	Old Navy	94.00	Uncategorized	\N	f	{}	0fdca9376ad7cf003e1c1d473649583b3bb78227c53b9b7a08e223eacf47b16e	f	\N	\N
dcb60309-7860-414d-9887-2daf4eeac3e2	2025-09-05	DEBIT-DC 4581 WWW.LUMINISHE* LUM LUMINISHEALTH MD	78.00	Uncategorized	\N	f	{}	1502f03cfc619da3c68bbc4c31749e8a3fbf5ce2d9075a0a344e68cda5eea260	f	\N	\N
76dfc511-f4eb-4f13-822d-ac2d5e21fce4	2025-09-06	Homestead Gardens	45.00	Uncategorized	\N	f	{}	6b83a411e599ca5706573d5596203f564a3478259a2a3fe13c1bd682d8f26c23	f	\N	\N
f377078e-de97-4cff-9446-0471c7c57373	2025-09-06	Michaels	41.01	Uncategorized	\N	f	{}	bc96371e810a81db06c65df2a26f8cedf9e495e6191837f3ea6be9bc2632c68c	f	\N	\N
f63aa1c0-825c-4baf-84ba-7cebad41a708	2025-09-07	Union Church	40.00	Uncategorized	\N	f	{}	7c1caf09870524b1c033b0fa61ea536d78db740df0890c39cfa1e50471e7d581	f	\N	\N
72a98f22-b3d3-4863-aa77-2c55125e5b2b	2025-09-05	Sam's Club	33.85	Uncategorized	\N	f	{}	21821ec7e1dc3823a57a80faaaae9c1b79218ad4303c6a34fa848cf7cee4a226	f	\N	\N
fcef3b01-c445-46ae-ad22-939eb7be015a	2025-09-08	Dash In	25.00	Uncategorized	\N	f	{}	7f9a8046771397d1f4f67ff2d66b676f0fbfc69949ee6d4d644282507f3ad073	f	\N	\N
d731f939-243d-4956-b03a-4563025b231c	2025-09-06	Chipotle Mexican Grill	22.42	Uncategorized	\N	f	{}	78423784e142fe9dbd8308973c82ae7c00cbd1db9d70123c7d9201fb69246cf0	f	\N	\N
ed2a7cf8-b4f7-487b-92ff-515649a111b1	2025-09-05	Target	13.62	Uncategorized	\N	f	{}	52769615cf384505b45bf6c74c57ea369dbe4f5254332fbc91ebd0302d75f4eb	f	\N	\N
6b78c304-375a-4be4-9053-c6c31abb675d	2025-09-05	China Wok	12.93	Uncategorized	\N	f	{}	c48c028c5843be2221f0ce28bc88137992b72896200888deb496e3a973d6c92d	f	\N	\N
be3cd893-b406-41f2-9345-39c1ac659ef2	2025-09-08	Transfer From Savings -0387	-76.04	Uncategorized	\N	f	{}	0cf1201df0032008936a8c90f97bffdc83894c0acee45a7f03ad8e539ace9e26	f	\N	\N
9faa7515-afd8-424e-8256-44fdf28a80d3	2025-09-04	Payment to AT&T	186.97	Uncategorized	\N	f	{}	017767ee8acbaba5574b65e61cb36f31196505d3f6d05cd3dfaf27329c34ae32	f	\N	\N
c3dbf716-ffe4-40e8-b40b-3c2942fba199	2025-09-04	Payment to Chase	107.31	Uncategorized	\N	f	{}	03a33e52a8ec7323d9fff1e7c39795d7209f0f51d082b7787bc905a0ccb94f43	f	\N	\N
78804434-1a5f-4c02-a954-47ad378602bc	2025-09-04	Lowe's	30.00	Uncategorized	\N	f	{}	fd35c6fcfc80af00b68611dc5706a557ff72041b877e99c272fb3cbda9a7e754	f	\N	\N
1a1577c3-0ec2-4904-bedb-f76119ca2eab	2025-09-03	Sam's Club	126.14	Uncategorized	\N	f	{}	06dd88427633f858ece75770e4cd9424ebadaef81934a4a5a427a8c8b5f0d21d	f	\N	\N
b8b14629-bb06-4fda-92c1-7b7a90b4beb7	2025-09-03	Wegmans	78.73	Uncategorized	\N	f	{}	3a6d57cf31abb87471654fc09704ca0bfeae07c3e81d5a20f6de04af395657b9	f	\N	\N
4669f6d1-a312-447d-b3fa-14b8652da4ad	2025-09-03	The Greene Turtle	35.66	Uncategorized	\N	f	{}	84c0933c67213c77f694699bd534a9452524397f22e5c4ac485a41dfedcd5872	f	\N	\N
360ab728-15bb-4254-b0cd-823d5e0be7d5	2025-09-03	Transfer to Apple Cash	20.00	Uncategorized	\N	f	{}	d00e748ebae50410800c5ee9fc57d056804db50c40494b694a8c2418e7145a7d	f	\N	\N
d42a1c41-4999-4e87-960a-20dd6f420b06	2025-09-03	DEBIT-DC 4581 LUCKY'S FOOD & ELKRIDGE US	15.00	Uncategorized	\N	f	{}	55906259194abc26d948f22ba9edbde9f7b7cbc8cec2a1608e426d5146a6f0eb	f	\N	\N
818a6243-8678-41ec-9d3a-8090b0e7eeaf	2025-09-03	FedEx	1.90	Uncategorized	\N	f	{}	0e20932b1419b5b9f1e7bddab438ed690494ad396ebd3a63731296f2b27a3292	f	\N	\N
8ed411f9-6592-4eca-8712-380ddfb3aab5	2025-09-04	Transfer From Savings -0387	-1000.00	Uncategorized	\N	f	{}	e9c885fefeb32e3df66b80231e0c9e11af036efdde84754f010a49188a29ca22	f	\N	\N
2de66ab9-a89c-4c01-8a62-a51a4be616b9	2025-09-03	- Jpmorgan Chase Chase Ach XX0002	2239.11	Uncategorized	\N	f	{}	5e8102e301e7c7a75dea96f9015890f92d3a922c49cf15b3391f54913d89e25d	f	\N	\N
371ac226-0aec-494d-b275-0bddd505fbc0	2025-09-03	Payment to Service Finance Company	500.00	Uncategorized	\N	f	{}	ed6697ca960369419eab850ba70a3c893b02793bd8e0d1de84e8d8b17c1f0732	f	\N	\N
4d979d63-9090-4260-ba55-236798c0a0df	2025-09-03	Transfer To Credit Card -7148	150.00	Uncategorized	\N	f	{}	f4337c091d7e4e9ad0348b162ead2a433f1e35abb34647f38e38e9e11513eac9	f	\N	\N
f7221ae0-ec8d-4be3-8261-c8e3749e00fb	2025-09-02	Target	148.39	Uncategorized	\N	f	{}	02d9949ec34c5569125046090d3a5374832cb2b7424eb419814fd849a7b2fa35	f	\N	\N
8763bb34-6902-49b3-8a98-ece6aebf4378	2025-09-01	Ace Hardware	118.41	Uncategorized	\N	f	{}	7fc1f8f6fc82a522261ea49aced6c5bb8ab18de2dd980158d37423064653fb85	f	\N	\N
30b6cefe-2587-403c-af61-ebca1e047e8d	2025-09-01	DEBIT-DC 4581 MORNINGSTAR STORAG XX1626 MD	91.00	Uncategorized	\N	f	{}	a8e328b93f5e234b6a10e397efe9d07eb79e0f88071cdcada5dc949d6071ec7b	f	\N	\N
9f500647-54f7-4571-8e8f-ca7f2474a1a7	2025-09-02	Giant Food	15.70	Uncategorized	\N	f	{}	111fcd2db063b7e53f4fad7da72d93edca4e5372dc1ca09a6518e34cccf5e4f7	f	\N	\N
13949017-6c18-46df-89f1-69a6eea9c0ac	2025-09-01	Sam's Market	6.17	Uncategorized	\N	f	{}	2b692b6f33a59bc5a7ee72222e9ce25498c18b2a2eacc65110667afc09b8c5de	f	\N	\N
a4b50184-e5d8-43ea-bc52-009c76e4e45e	2025-09-03	Transfer From Savings	-1924.50	Uncategorized	\N	f	{}	87028574a986f7b553cbfeccdc875cffd796fcc7668cdb34cd056aa252899183	f	\N	\N
88c3aecb-ac65-4870-b038-134ac45cf205	2025-09-02	Payment to Apple Card	900.00	Uncategorized	\N	f	{}	d609f9eb7718bcc749f20254bc61806e3133109e3e6d2a5911354196bffa01f4	f	\N	\N
d4f904c0-d316-458b-8b55-579e4e75f5ec	2025-09-02	Transfer To Checking -5873	100.00	Uncategorized	\N	f	{}	b2bde0bcd7e40ad628fc19015a58ad2fa4a16c101d1aaecf457d94676f510a80	f	\N	\N
f35042d4-ff46-45ef-ac38-284133e50e00	2025-08-30	Pottery Barn Kids	257.57	Uncategorized	\N	f	{}	ab1f792f3300b6c55f50985046cbe3828bd6908294979b54382b68c11ab7d33e	f	\N	\N
0d48b5ba-9872-4b63-8531-be2186f365dc	2025-08-31	Crate & Barrel	243.06	Uncategorized	\N	f	{}	2a9950bfc09bf32bbe9e034eb2868fdf842b8d67f8853a71f2c8d7ffa7689260	f	\N	\N
c6957776-9795-4191-939d-77a6da74b76a	2025-08-31	DEBIT-DC 8678 READY SET STITCH XX0742 MD	150.00	Uncategorized	\N	f	{}	ad37ce515410c90b49b7d1c4941857baf923c1bc043ea936e8b5e2e7123dadac	f	\N	\N
2bae7639-8eab-48cd-ba15-3e394d073cb2	2025-08-30	Ace Hardware	108.68	Uncategorized	\N	f	{}	917f86791c18c2194a1dcc2c5f130129aff0fc58f0cd1d36bd0dd8e94424608c	f	\N	\N
b890536c-5ce2-4f02-be9b-615f100faa91	2025-08-30	DEBIT-DC 8678 SQ *CANE COLLECTIV ELLICOTT CITY MD	53.00	Uncategorized	\N	f	{}	98b48f5530dd121ac07feb418aab5d756269eac1f4a534712c5b38850b06e89b	f	\N	\N
1b959acb-0278-4259-a176-193f1740738e	2025-08-28	DEBIT-DC 4581 LEDO PIZZA - MILLE XX3333 MD	52.98	Uncategorized	\N	f	{}	0479f6b1c36f5a038a8d797682d88ab9fd88f9a94f67d1423e8ffae9eaf3e7bc	f	\N	\N
a45608d1-2f64-4dc7-b00f-9abea6c5e100	2025-09-01	Peloton Cycle	46.64	Uncategorized	\N	f	{}	afc5d964c12b25077f6914e42458d544ab7d290baa164f47fc1d7552b095a13b	f	\N	\N
3de41128-ab33-41b9-8c3e-8f7adf18844d	2025-09-01	Sam's Club	44.50	Uncategorized	\N	f	{}	adeb089dd7a8934092b27bf797125144b76fed275d9f4995bc9b8305b75f7233	f	\N	\N
b17e1fbb-44ab-470a-b147-fb8d6a3573f5	2025-08-31	DEBIT-DC 8678 LEDO PIZZA - MILLE XX3333 MD	33.62	Uncategorized	\N	f	{}	a248db4d3d6d6ae57ddecf0527ccba210b867a6f043144be5a8855a28ae4937b	f	\N	\N
b60b676e-0545-4c6e-bf08-dc958dfdc2cb	2025-09-01	Wegmans	20.74	Uncategorized	\N	f	{}	42eb87e0cae9c26d494024340fc4e1c8864fed2a16a69d5129831fd39971c85b	f	\N	\N
5367db21-0a9c-4dde-8934-c9940c04cb2e	2025-08-29	Transfer to Apple Cash	15.00	Uncategorized	\N	f	{}	63ddb89b9364686e1bca1091817d3cb9b0742947523decd0f35d21c080308fb9	f	\N	\N
20cdb2d3-c083-48e6-9398-4d60567c5aed	2025-08-30	Chick-fil-A	9.89	Uncategorized	\N	f	{}	6633dba03d62c53b8f3ec812808a80b64549b590a614d14aaf209bc2d1715792	f	\N	\N
e4c595fe-0ad4-43d9-a8af-ddfaa9cbd05b	2025-08-29	Dividend	-0.55	Uncategorized	\N	f	{}	d63bde9b261c10c2d5cb399bb9a44a341fc0fe32f2f174170e36eb136edf3ff0	f	\N	\N
853b9d9b-2122-4b08-8337-cdf33a18862e	2025-08-29	Payment to Baltimore Gas and Electric Company	359.00	Uncategorized	\N	f	{}	283ac92b17e668ee7236c7b7b6ec5b349774903b17e910f80614bbcd1921b589	f	\N	\N
1fa394a1-2007-4a66-ab03-c5c71f2da2bc	2025-08-29	Transfer To Checking -2740	550.00	Uncategorized	\N	f	{}	e08ede7f22127aa84e0df7458b1cdce389f074d81c9766357b642a2909333e29	f	\N	\N
4c17a4fa-0adc-4d71-bd7d-e5a7c9db54b8	2025-08-28	Wegmans	94.34	Uncategorized	\N	f	{}	5d368909da7831d84b7253e7567482cecf5356cbc0af4f815e82a75f4b21ff1d	f	\N	\N
58d94da6-d264-4902-b856-852a4f8aec4d	2025-08-28	Target	52.53	Uncategorized	\N	f	{}	727fac31c5500ab5ba3627a8e0d47adf7cc59263974adf6e6324e45f4b3edfab	f	\N	\N
27078dc8-55b4-41f4-a0f5-7e0bceb6858d	2025-08-29	ATM Withdrawal	900.00	Uncategorized	\N	f	{}	20ff0e11ff82e28684378bd5c5caf3f5cb7eb2370cddab4ee3312adaa53abdb6	f	\N	\N
8433c1a0-4ee5-4e34-bb1b-2e7307d97e94	2025-08-28	Payment to Citizens Bank	88.12	Uncategorized	\N	f	{}	56c41cc3ef2710a6e2b527a1fcf06b4c6d9def8d1534deef9d0d3282c985e0b9	f	\N	\N
aad3d60f-ccb9-4a2c-9576-93980db8cda6	2025-08-27	Transfer to Apple Cash	248.09	Uncategorized	\N	f	{}	b18705f496dc139961d1f412c82da05ce6ff68671fd76376e607a15ccccffc99	f	\N	\N
b17b86e6-d724-4eed-8b7d-dde3f6ef4a9f	2025-08-27	Transfer to Apple Cash	44.06	Uncategorized	\N	f	{}	162e567409f0b367304d23182ceec7d11b61355e6db5381c8dbf683e2c5f0b29	f	\N	\N
6efe8c8a-a168-4b7f-8f57-885f00b0b706	2025-08-27	Parking Authority-baltimore	3.85	Uncategorized	\N	f	{}	6a1ce71009e06ae3fc9155310993c0a40141839231bfcfe1065738bf5c01f6a6	f	\N	\N
a6851841-22ee-4f25-a1b8-c166ebd24bea	2025-08-28	Microsoft Deposit	-4690.27	Uncategorized	\N	f	{}	66176fadfc79208b0c95d17e32ca6e7d69cfe6ea03a54420e1b6fc861db7bb5f	f	\N	\N
820b90e8-76b5-4e4d-9090-bad4f36f1a0b	2025-08-26	DEBIT-DC 8678 BALTIMORE CITY GOV XX-3000 MD	40.96	Uncategorized	\N	f	{}	ea84245e5fe69bd635f86b834426743641299ad6ea1319140d14e89932a1354a	f	\N	\N
935714a4-ac50-4703-9d16-0efa3800a614	2025-08-27	DEBIT-DC 4581 QUARTERFIELD ROA SEVERN MD US	31.65	Uncategorized	\N	f	{}	2f402f21747c2f9bcfa8b7d69dd796a25e82bf02540516d3ce272b2245b753d5	f	\N	\N
ad875541-d388-40d4-980e-316ae9e1aa30	2025-08-26	Transfer to Apple Cash	10.00	Uncategorized	\N	f	{}	2168c49d102a03c1255e78e9142d80b1bac03a0c703ae09037f4132f13be12a0	f	\N	\N
8aa4cb65-9591-43b3-aa08-fed348674fa2	2025-08-24	Homestead Gardens	149.39	Uncategorized	\N	f	{}	a0cb882fb540c628744db47dfa336bcf2b0ed7b046364178d3bec6ad42670768	f	\N	\N
9b850b77-61dc-4c6e-9dcb-de70c234b6ec	2025-08-25	Wegmans	61.89	Uncategorized	\N	f	{}	4059e2b0282b1514e1357976ab744e36c5ad02bb218d292d43a6807eaba3b525	f	\N	\N
6c6e4e3d-2fcd-4710-bcbf-7abbf4a1b950	2025-08-25	Michaels	56.90	Uncategorized	\N	f	{}	cba5bd280226f63b729d9ab408550b03de1e0f3e1854b206376e9caa429325c2	f	\N	\N
697e8915-888b-44a0-ad6b-93015e91a2f0	2025-08-25	DEBIT-DC 8678 SQ *ONEDO COFFEE R BALTIMORE MD	47.00	Uncategorized	\N	f	{}	153e9d6c9ec15a83ac62c56c2b55c1a54a5df35daf2dbdc79a22bbc14703de3e	f	\N	\N
048ca065-1d5d-46f9-9139-4eb283aaf3e5	2025-08-25	DEBIT-DC 8678 SQ *ONEDO COFFEE R BALTIMORE MD	8.89	Uncategorized	\N	f	{}	e8d9d14a66f2107728ef35e8b9feefe9f1512be8883603b5476d9a915599fbf0	f	\N	\N
b72c2926-3cc6-49bc-8bc2-359e99a3b66d	2025-08-25	Payment to Chase	20.00	Uncategorized	\N	f	{}	2191ae52ea6ff862af605ec175385b50b5ac27d6e123f2c4ddc0c6e14f54b747	f	\N	\N
533c1eb3-3676-4853-94a2-4c03057bce20	2025-08-25	Transfer To Checking -5873	100.00	Uncategorized	\N	f	{}	f61051cebdeda0e9cfafc90d1bf52ea6ec420b48f08cf81debcd037536cd7820	f	\N	\N
d196a945-483a-4a3c-8b7b-92d1229fe4e7	2025-08-23	Venmo Inc	120.00	Uncategorized	\N	f	{}	fac52518d363081e271b0dd997eb38f87ed7abf248d7674b796f7ba7df30f12a	f	\N	\N
586f519d-f1df-4739-823b-b2a84579fa2d	2025-08-24	DEBIT-DC 4581 KENT ISLAND CRAB C PASADENA MD	105.10	Uncategorized	\N	f	{}	78da9903cebb733d16cf854ea54cec24ceddeaf0b9f3bddfbe2e64d42a44eacc	f	\N	\N
7e01c0b3-b034-4fed-ad67-c4d4ba4bac36	2025-08-22	DEBIT-DC 4581 WWW.LUMINISHE* LUM LUMINISHEALTH MD	78.00	Uncategorized	\N	f	{}	2c81e54d722e029afe59877856788afbdb5ca3dd82a75e398f36a54fec920849	f	\N	\N
29a3c75c-db00-4ef4-b07d-ba84aaf3d85d	2025-08-22	DEBIT-DC 8678 BLACKWALL BARN AND XX5566 MD	70.00	Uncategorized	\N	f	{}	e380a6f14ac7ed3cad8b48d4edb12a7d48f3ed0e714ec6ff5772a5601e0db17a	f	\N	\N
a96a4fff-e20a-4acf-abb7-f47f7caee8d5	2025-08-24	Blue Moon Cafe	65.00	Uncategorized	\N	f	{}	859ed8bffead55d1d08bcc371e339941896c0174eae6270af10f65c4a6bfbbce	f	\N	\N
5973843a-d00c-4fec-bf04-d1329500ed22	2025-08-25	Anthropologie	38.16	Uncategorized	\N	f	{}	7b98248ee979af640720ab32eded2b088d895bf1d1215f05df9f9937e29b4889	f	\N	\N
2e1fca0e-c663-4301-aafe-412ea04da030	2025-08-22	Rise Up Coffee	24.99	Uncategorized	\N	f	{}	ce7a5cc24669485b9af1d5743f8e0d2c62595cf5db0906e3fe5b6fbbff7a25ec	f	\N	\N
24ee6f20-816a-4b0f-a497-f2e09dc090b7	2025-08-22	Netflix	8.47	Uncategorized	\N	f	{}	220f4882c4fe8c2c1d8df1bbb8ed3be6c13c8754369894f75ce0a010f427e213	f	\N	\N
2e9d95d4-2d50-496d-9012-9e938123e50e	2025-08-22	DEBIT-DC 8678 BRUSTERS REAL ICE GLEN BURNIE MD	6.50	Uncategorized	\N	f	{}	6005f0029f8f699d7c37a5a41f6672952d8f1cb673620c587bb8e185d6706492	f	\N	\N
59a60971-299c-4cc5-9c3b-b15d3db521f5	2025-08-24	Rise Up Coffee	6.09	Uncategorized	\N	f	{}	dc37367a7672053ebd0450f89e9a343a9b40a80f21f8d7552cfa38ce0d7b4893	f	\N	\N
fbcd1ba2-05f9-4e66-a8ce-ac1cca19dfa9	2025-08-25	Transfer From Checking -5873	-20.00	Uncategorized	\N	f	{}	59ee1ff7ea8708b00b5bcfa203b6347561b9c5ce589a3900ed0d738cea96a356	f	\N	\N
da9505bb-433c-41e0-a516-ad16881a4e0d	2025-08-22	Payment to Liberty Mutual	260.08	Uncategorized	\N	f	{}	0c78aa49987b049cdffb77c9e9f547b92f8ca9aefed2c766c9b68725180fe179	f	\N	\N
8e216544-2055-4112-b726-08d57499e7ef	2025-08-20	Sam's Club	166.91	Uncategorized	\N	f	{}	8cfa7c714e4201b3f832d08be789a2f3e7d6bbacf9e70cd7ff22901239ae50b6	f	\N	\N
2a528782-d132-4f58-97e9-d77ed4f1c159	2025-08-21	Rise Up Coffee	22.00	Uncategorized	\N	f	{}	c87c97be76956d609677e050a58ff8a158b90f0641fe46cb763fe1789e2c1e3e	f	\N	\N
60819e2d-41d2-44c2-8571-a4f137048ab2	2025-08-21	Target	20.13	Uncategorized	\N	f	{}	52315aeb76289b99abc9428294032eef5a0d69ce0d0a769118fdb1e287bf4852	f	\N	\N
a98b328a-879b-4d6b-966f-79cf915fe07b	2025-08-21	Target	11.64	Uncategorized	\N	f	{}	07c2b5d6d9226f146770e0b507e6e386103fd05001c93f305334a537d413417b	f	\N	\N
c4065068-04e0-413a-9f8f-3896f01f9b82	2025-08-22	Transfer From Savings -0387	-2337.42	Uncategorized	\N	f	{}	b238d2005a51e5c272ee730c9abf72f5e3844742dbdf402147715fe607e8755d	f	\N	\N
7de4822f-9ac3-4e3b-a631-9757d7f2d126	2025-08-21	ATM Rebate	-4.50	Uncategorized	\N	f	{}	101a573cf8cf6308e079215e122f50f866d09c6c8df18a280adf1d4d08cc4bce	f	\N	\N
e1afbdba-6b02-4b8a-b04f-1cbd835cfae3	2025-08-19	Tiki Garden	150.00	Uncategorized	\N	f	{}	edc26d059977f663db9254ea164a3bdb9b56cdcc243ce514380a623a78374cda	f	\N	\N
a4696163-1a4b-4451-bc10-86e754db813a	2025-08-20	DEBIT-DC 8678 TST*BLACK MARKET B EDGEWATER MD	49.00	Uncategorized	\N	f	{}	9fceae86ff69b22495b6528f208dda8617ab4aa26f2cf18ad01d98127a0d79f8	f	\N	\N
ffc7d0c4-f31c-4aa2-82e3-72b91fc4ae4f	2025-08-19	Wegmans	178.61	Uncategorized	\N	f	{}	bba32ec55361c1d076b5b47ecbbd93ade354d549fc0d966d60f10c5d5fe8b97c	f	\N	\N
8de12cf6-9553-4d43-8f66-9ba02d927602	2025-08-20	DEBIT-DC 4581 AIRGARAGE* PARKING AIRGARAGE.COM CA	7.46	Uncategorized	\N	f	{}	3a9bb0bca4d3f0b436b64f79b2d4779002af9d59b1bd8353870dc375b1c36f08	f	\N	\N
d7861b5d-cc3a-4ed5-97f6-c492426b1bc2	2025-08-19	Target	4.99	Uncategorized	\N	f	{}	f972c713bb23e3762997c63be1715d6e38d0b6c9afc5fae6d306f1126dd2dc3c	f	\N	\N
38e23e44-da6f-43da-b9c5-24fa4703b7ce	2025-08-19	Payment to US Department Of Education	500.00	Uncategorized	\N	f	{}	4db2b888d3987ec98520a7cdc0ac399bee79f8b516d2bdebbf6b855b5b9cecdb	f	\N	\N
640ddb7d-aa8a-4ee3-8b63-eaa95fdd7f8f	2025-08-18	Serenity Nails Spa	155.00	Uncategorized	\N	f	{}	f14fac3e7227c6ae8a8dc5451f7e1d95b3b39536a9029fd0413420142a599d3f	f	\N	\N
4ed4be38-db71-486f-862d-90cc74cbd77b	2025-08-17	DEBIT-DC 4581 TST*THE ICE CREAM REHOBOTH BEAC DE	16.18	Uncategorized	\N	f	{}	64075aa749be85f7ad7e9bb544e374d721a343625897f99f1eb3304a2590f77c	f	\N	\N
d5a53891-16e9-44c2-b68a-2b84bb610907	2025-08-17	DEBIT-DC 8678 THRASHERS FRENCH F REHOBOTH BCH DE	12.00	Uncategorized	\N	f	{}	2b0b903a9d4cb24008bf67ea46a7137837a0420f42510dcdda4494a033291123	f	\N	\N
36f7fce2-f03c-4114-93b2-d3dfbc8c2d73	2025-08-18	Apple	7.99	Uncategorized	\N	f	{}	8691e26aee77b2efb63e3d3285af010e8e59f0c1ceb453403867a798f3e0ba97	f	\N	\N
ba6795e2-5c0f-493b-8808-62897ca2faf5	2025-08-18	Toyota	900.00	Uncategorized	\N	f	{}	a439ef5f06917832675da1d068ab11ba6c1d2063edbbd403183428b261a616ae	f	\N	\N
a5fb6443-f4fd-41fe-b6c3-f36561d0d0a7	2025-08-18	Payment to New York Life	616.54	Uncategorized	\N	f	{}	da84ebbfe8a0f2f07ea27f64f789f2e60e8788e016885a855962a91b6dc04f29	f	\N	\N
c5814bce-a2c2-4ad9-85de-eb2e9b1bd656	2025-08-18	Payment to Discover Bank	391.00	Uncategorized	\N	f	{}	fb4e9f3e983be8ece3eaafa1df1d2985c446927a3095f62ed861ea5a08c8740a	f	\N	\N
adfb2f3e-0702-4861-874e-4578de1c06c1	2025-08-18	Payment to ECSI	100.88	Uncategorized	\N	f	{}	4d59ee28b9489adc7a51b085bdf8d5051f3a8116bbfd691afd7aa1de7dc0623e	f	\N	\N
bb6051b2-7d41-471e-bada-7c4e8d3f7520	2025-08-18	Payment to Chase	100.00	Uncategorized	\N	f	{}	e5ee9c7f6dff4695a0b9ffda98c1a8e2ba8b8e22a20268dc56ae250f23bad7e7	f	\N	\N
1db644fb-5133-4f1e-9938-55b83dd1c6e8	2025-08-17	Pottery Barn	354.80	Uncategorized	\N	f	{}	bc20d6ee8a5c1e435591042e85981996e50968e4b6323e73284078bc7aa47e5b	f	\N	\N
3b638330-5034-41ca-8828-00c277d7b647	2025-08-17	Grammarly	152.64	Uncategorized	\N	f	{}	23c0f284e47f7a641e7dcfbd3e120120930330d281c77e50a1de2b16f7990ebd	f	\N	\N
f48913bd-c773-4711-80af-206b2c770928	2025-08-16	DEBIT-DC 8678 SQ *ANTIQUE DEPOT ELLICOTT CITY MD	33.92	Uncategorized	\N	f	{}	7a8cf7a706a31e4ab9b4353a55562b651f1f019cb226ade9daaa7e0db07eeb5f	f	\N	\N
c38fa52e-76b2-4668-803e-773e1002ca99	2025-08-17	DEBIT-DC 4581 READY SET STITCH XX0742 MD	30.00	Uncategorized	\N	f	{}	52aa0eacc01dac3001c63925ea8adc89af1892116f8d17a48b914e44e6e0c6fa	f	\N	\N
3754edcd-0788-4fca-b2a7-7b09e2fc16c1	2025-08-17	Transfer to Apple Cash	25.00	Uncategorized	\N	f	{}	c6467bdde7a6fc2d6616baad554964b5498dac38393c3ee457316d4533fbbe89	f	\N	\N
451a9799-3876-40d3-ba7f-9734cb33435c	2025-08-17	Royal Farms	21.93	Uncategorized	\N	f	{}	c6f78c557d6cb048f6627cd804bdd180e63109cb83ae7e6736d0beca2bf5c58d	f	\N	\N
c5f3689b-d3a5-4619-bc4e-f53619c401a3	2025-08-17	Rise Up Coffee	20.14	Uncategorized	\N	f	{}	c2e5d207075ba4deb99ad762a2f68275834415a6612167e434292e2530b4a078	f	\N	\N
998d8eab-98bc-46a8-9f20-a446fbcc24a8	2025-08-17	DEBIT-DC 8678 CITY OF REHOBOTH B REHOBOTH BEAC DE	18.60	Uncategorized	\N	f	{}	0856fa46a7667fe710cdbdd406074ef0d6e706fad05218bbcbe4b1f6cb137b81	f	\N	\N
f5f4733a-fb61-4cd5-81ba-6862fa92de23	2025-08-17	DEBIT-DC 4581 CKE*STARKEY'S FUNN REHOBOTH BEAC DE	13.00	Uncategorized	\N	f	{}	e7d6ffaac8e2f5ad76b19331a418e826085a4446cafa2a20078be08c645d0ce0	f	\N	\N
7d88de86-7f1a-412f-93d2-fd0732f4c79a	2025-08-17	DEBIT-DC 8678 CITY OF REHOBOTH B PARKMOBILECOM DE	10.60	Uncategorized	\N	f	{}	d6c6b24e440973aa64756c7481f374d91027a88c30ab9530f135a68710e15703	f	\N	\N
05efa7a4-de7c-44a3-9396-eea68cb10968	2025-08-17	Royal Farms	8.47	Uncategorized	\N	f	{}	ed38fab5000faba9f8491b02ac66e3864ab7844247dad4cceac17292b2641b28	f	\N	\N
549609a7-d1fd-4978-ad1b-71f573c3c2a1	2025-08-17	DEBIT-DC 8678 CITY OF REHOBOTH B PARKMOBILECOM DE	2.60	Uncategorized	\N	f	{}	6b5b0f3f51729304d1b94fe9ebd2a1050fa479746a60fac95c14642d561a3c69	f	\N	\N
434aaa8c-9abe-477a-9627-c599833fae5f	2025-08-18	Transfer from Zelle	-50.00	Uncategorized	\N	f	{}	581ff79706b2610e3d9b90617cb44e827a0b0d8ff4150a01ce72fc1d76240db4	f	\N	\N
d4c6df92-788d-429d-ab81-ed7df0802cc2	2025-08-18	Transfer from Zelle	-40.00	Uncategorized	\N	f	{}	4cca7c86deca7157c2412c905ba6b1681fdfbcd21dadff480965407547b76469	f	\N	\N
98a884cb-7fa3-417c-b0ae-9db457fb7504	2025-08-15	Tax Payment to IRS	388.00	Uncategorized	\N	f	{}	956df404848a5cd86b899d554133a28a76cc82abac2da459052109be3b189430	f	\N	\N
6d09c6ba-1294-41db-be75-182d1b38e091	2025-08-15	Payment to The Guardian Life Insurance Company of America	164.80	Uncategorized	\N	f	{}	a0c7becae188535d482818a106a39be2dc29976b0368540bce87804f81f5f3e7	f	\N	\N
563b490c-c14b-4c35-8bee-7ad292037966	2025-08-15	Michaels	13.48	Uncategorized	\N	f	{}	c1063f9e64bc6768fe03c3a3db3916134750684108112f0dee18f151e7f852f5	f	\N	\N
a50d95da-d6f3-483e-bb97-18abf6b68d22	2025-08-14	Adjustment - Cr Unleashed Brands XX4778 TX	-130.00	Uncategorized	\N	f	{}	77182bb4baf64886ff84f2ba2bde94a395fbe739261a6c50c0304c93a78c9319	f	\N	\N
f3181665-d134-436a-ac3a-13dc821c6337	2025-08-14	Microsoft Deposit	-4690.29	Uncategorized	\N	f	{}	e401ea9e37077246ae8f21a63cec7a0d9f632bcd3e2f875ea642cb57dd42900a	f	\N	\N
a9f684db-e4bc-4e63-91e2-f4045ba636bc	2025-08-13	Payment to Volvo Car Financial Services	485.88	Uncategorized	\N	f	{}	f915bdae342e9b1be329c947502896031a7573227003da40d977fa64c7ca1270	f	\N	\N
6539df48-6756-438c-8cfd-a1e3179f7636	2025-08-12	Sam's Club	34.65	Uncategorized	\N	f	{}	bbf85bf300b399359fb248238ede7b335b2a2b2deb27dbf5968723f8ee7bdeb5	f	\N	\N
381deb61-5fd9-4c87-8be8-d31395e458d3	2025-08-12	Giant Food	20.21	Uncategorized	\N	f	{}	8ff7e66489795580e6bfc43942b969b7a7009c6b8bf6677df29336c02b1894b7	f	\N	\N
0a5aa64a-a745-49e1-95b7-2238d6dedb97	2025-08-12	Payment to Verizon	94.99	Uncategorized	\N	f	{}	1689e744afc9004db277e5e55c58cbb5a190e8f9cf5964b3a840bd361501495a	f	\N	\N
78f6385f-8bd0-49cc-bf85-9911d91f9121	2025-08-11	Wegmans	73.62	Uncategorized	\N	f	{}	d2251d80c380ba142db0d4a01901ecc441ce80d947c604b284a3a1386a497f84	f	\N	\N
7e4f084b-2d01-4dad-a4d7-566ebdd816bb	2025-08-11	Venmo Inc	60.00	Uncategorized	\N	f	{}	c3cf9faf6899a80d38232d00922139fb08ae9a7a0a10b12f8ba762ec2ac7ef5d	f	\N	\N
8a57a629-3778-4926-a516-c16842232610	2025-08-12	Transfer From Savings -0387	-500.00	Uncategorized	\N	f	{}	6389463cb427ff4dc7475fb7ca9a882ff7df0494c83b9535f23ba08ee344331b	f	\N	\N
d7196411-74fe-4624-bd54-3feca10627b2	2025-08-11	Lowe's	30.00	Uncategorized	\N	f	{}	20ace4146077234a4d71c0a972933946c191aaba3f2ef646d78ce48898902e2e	f	\N	\N
13bc9287-f436-4625-bb4f-b8bce6126372	2025-08-08	DEBIT-DC 4581 WWW.LUMINISHE* LUM LUMINISHEALTH MD	78.00	Uncategorized	\N	f	{}	81a8f33d557e731e2152485631e71532a20ad0751c1b3320782a02cf77de228c	f	\N	\N
dbc7013d-f27d-4601-841b-96d8552fbfac	2025-08-09	DEBIT-DC 8678 CASH APP*ROSALIND OAKLAND CA	65.00	Uncategorized	\N	f	{}	a24e74e0600881763f622a6cc3c625490b63b14523dcd81e327264d6132073a0	f	\N	\N
9eb974f3-e7de-47ff-9c03-e3bade00d61a	2025-08-09	Wegmans	15.00	Uncategorized	\N	f	{}	91d2c40cc99a09573af169dcde8ff3850bdffc6de2ec9ffe570c42be56494743	f	\N	\N
ec816d73-5989-4eb3-93d4-c6492b1fc1e6	2025-08-07	Harris Teeter	62.75	Uncategorized	\N	f	{}	f1d8000e9312da26324575f4e29ef3bf5d906e493eb2cc31f98ba314fd1134a5	f	\N	\N
40ff5406-349b-4717-b443-bd1f0a773a47	2025-08-06	Giant Food	27.10	Uncategorized	\N	f	{}	f75c4c1e8a2cef790306968a648ae3bee23c6cefc5b1f96ffb5957db0f63ab0d	f	\N	\N
d1b0c1b2-0c6e-4dc4-946b-fadb4e06151e	2025-08-04	DEBIT-DC 8678 OTF GAMBRILLS XX7925 MD	159.00	Uncategorized	\N	f	{}	c31a4411a7876b66fe0df0ddc9d0dac2b70a6d61155d8bad26986a65ebbe6a23	f	\N	\N
b75642ce-d106-41ae-8c92-b79faf13730b	2025-08-05	Venmo Inc	60.00	Uncategorized	\N	f	{}	140ebb76285280cf3a64a4a6c523ca6875756aa1bdf9ba54092e00f7c1fc3ec4	f	\N	\N
844c9201-b9aa-4222-9e09-b21588bba692	2025-08-05	Target	6.13	Uncategorized	\N	f	{}	8fed37d9838e5a2e6922e5bdc018b02c1eb9ea94aa76fd3e4b63515abf2e0845	f	\N	\N
3066fee5-2465-4566-8807-824d1a94a23b	2025-08-06	Cash Withdrawal	850.00	Uncategorized	\N	f	{}	c054d21fb886a5ac72ddb39342d61f0aa452ec9a999f6a48348e2e508b0d01c9	f	\N	\N
3b9b5d04-9ccb-4b3c-b9bb-cfe931f2d547	2025-08-06	Transfer From Savings -0387	-850.00	Uncategorized	\N	f	{}	23d2bdd2f335b175a6b32d9ee55c7a27fa95d72b9505ba9ed787877f56080525	f	\N	\N
4c43508d-686f-4281-a75c-2024e3a10989	2025-08-05	Payment to AT&T	186.97	Uncategorized	\N	f	{}	8fa8e4bbfbeff57c60c075c612c98a2b3e3d7daede6579f4403c18eb80075daa	f	\N	\N
a67e81c8-abad-4ccd-914e-1b85086862b0	2025-08-04	DEBIT-DC 8678 BREW CITY BRAND - MILWAUKEE WI	94.95	Uncategorized	\N	f	{}	39975ed5e14704e3691e2b3da1dd1003a8ef62f8a2ef649332fe4059768f38f0	f	\N	\N
d4bba8a0-bd29-4e2c-bae9-b9b1dbf440b3	2025-08-03	Tavern At The Park	17.60	Uncategorized	\N	f	{}	9441243a02fa9720cdc66ca73d0c52d00e81d737a9fb338ed6a8d68a609379e8	f	\N	\N
1a4ef525-34d9-4f09-92e2-646082356ac7	2025-08-04	DEBIT-DC 4581 SECURE PARKING USA WWW.SECUREPAR WI	12.35	Uncategorized	\N	f	{}	888ca468431100cb1461279c98a24383c0226de428d176e9e03b361dbd062d8c	f	\N	\N
68df291d-81be-4982-92d1-f7b3ae6a767e	2025-08-05	Giant Food	3.79	Uncategorized	\N	f	{}	96fa4338d434dcc410852c4739c98c58a6b3b329bce47607231ebe2a3f6ab680	f	\N	\N
3439830f-f279-4388-8f84-1af1a23b01b6	2025-08-04	ATM Withdrawal Plus Bmo Bank N.a. Milwaukee WI US	63.50	Uncategorized	\N	f	{}	490c1a346bd17e56067f70ac29e3098634796f263b28a0d70d2e9aa93c19fad4	f	\N	\N
03089a50-c4a4-455c-8cba-16f3de14e669	2025-08-04	ATM Fee - Withdrawal	1.00	Uncategorized	\N	f	{}	a97c41a44e187e03d9928920cadf222e9f88eaf26cd9e80e5a5d653d110b890b	f	\N	\N
03b5089e-8370-4ed4-b0ef-071dc7409b6d	2025-08-05	Transfer from Zelle	-170.00	Uncategorized	\N	f	{}	007e8cd9eaf60b51a91d27eec42b453d67cc036eb81b3d1ed85a8181c11b7b56	f	\N	\N
090665dc-9dd0-4b59-a81b-613bcbf6933f	2025-08-05	Dispute - Temp Credit	-130.00	Uncategorized	\N	f	{}	8803444e11fcb33f84f64115f796160cdd20a367ee1ea11e9865767fdc38e973	f	\N	\N
94d71fe1-72ad-4413-ae2c-3ff7ddf62ba6	2025-08-04	JPMorganChase	2239.11	Uncategorized	\N	f	{}	1818fe02bfa66dca3101e9ac96dc4cb35184a1bdb45b110d2d47310675e2b84a	f	\N	\N
c31691f7-a2e1-424c-8e13-5491e67d1e1a	2025-08-04	Payment to Service Finance Company	500.00	Uncategorized	\N	f	{}	c8d009cb7cac3f9b4c33431bae0d99625fd5806269708045e143eb149aacd34b	f	\N	\N
a213ea15-8927-4950-9df4-d3fb94807bce	2025-08-04	Transfer to Venmo	164.15	Uncategorized	\N	f	{}	c998cc0f746d3b90af3123b69430ce96299f563134db01b4bef01b01e299da05	f	\N	\N
4699d997-ac15-4fb0-8c1a-2b91c23e4b24	2025-08-01	Blick Art Materials	217.71	Uncategorized	\N	f	{}	36982585ff980eaf1fd540f5077283529cba7ec01ab5fc45dba381098a184a8d	f	\N	\N
1ebe213f-a255-49d3-b1cf-90ce7fb95584	2025-08-02	DEBIT-DC 4581 MORNINGSTAR STORAG XX1626 MD	91.00	Uncategorized	\N	f	{}	cb121e7c9c23196ac144630040c86210948e4e599d1e948ca285dc5fa56d0ffa	f	\N	\N
dc0d9266-af0e-48f1-82f7-6ca15e577599	2025-08-02	DEBIT-DC 8678 NEROLI* NEROLI SAL XX2888 WI	77.70	Uncategorized	\N	f	{}	efac24882d479988ee3fad9f99b2096bdfeb761aa2deb27ac4d64ec2017db52b	f	\N	\N
e3236552-ecee-4b44-befd-047954b2f942	2025-08-01	Soma	60.36	Uncategorized	\N	f	{}	b392224299acc79d9bc000153d121cd36652043d885e149865b7465936cafe10	f	\N	\N
3462ed62-f044-402c-90a3-c6ae60e0004c	2025-08-01	Peloton Cycle	46.64	Uncategorized	\N	f	{}	0eb6170451837d2ffde8898bd044079ebc7ffe9b0a26e5c8e580ff5f257f3291	f	\N	\N
6a00e7cd-e53f-47a2-95ea-18fb7b5d8629	2025-08-03	DEBIT-DC 4581 WISCONSIN STATE FA XX-3849 NC	40.00	Uncategorized	\N	f	{}	f8d0208871e7c3a996ef3ca95647f19b5a04c7bc56c08ecd56f1f86c4c14544d	f	\N	\N
00b052a5-d0d5-4c32-9aac-b8c663907c21	2025-08-01	Chick-fil-A	23.81	Uncategorized	\N	f	{}	f02e36c0ed381fb910f7ec3d409c11235f1ad22ce108613056b1410cb7b88e9b	f	\N	\N
9952386d-dad7-4950-a31c-22e8a5e73c22	2025-08-01	Hudson Group	13.75	Uncategorized	\N	f	{}	667b2e43ddad24af6c2f84f9b5f012d621e851c2282b9ad9a690c6a3f6f5206d	f	\N	\N
8d582003-0f8c-445f-a084-46bc6dd6e07a	2025-08-02	DEBIT-DC 8678 SQ *COLECTIVO MILWAUKEE WI	12.68	Uncategorized	\N	f	{}	903e5d7d213605855e978766f9672c856e2288109e40948e45846949b087b663	f	\N	\N
e00048f8-d3c6-4276-8977-d9cf4e0e1517	2025-08-03	DEBIT-DC 8678 SQ *WISCONSIN POTA WEST ALLIS WI	7.00	Uncategorized	\N	f	{}	927a8a9d7afa9f0fa15aad437ffc8ee0d2b3e38a77354ea13bfe3c14767af491	f	\N	\N
78d29100-17e0-4476-8003-a19f8dd21d3f	2025-08-03	ParkWhiz	5.30	Uncategorized	\N	f	{}	66ad2f5fbeb747b621fee96f6934f6325be9e6565ee95ec3288a8801d01dae67	f	\N	\N
0d51a3a8-95cb-4a3c-89e5-a37e6291f2dc	2025-08-02	DEBIT-DC 8678 SQ *FOLTZ FAMILY M MILWAUKEE WI	3.10	Uncategorized	\N	f	{}	65093856859a63160e1de65ca8fe2a89fa56602da4e61f1ade9ded1cbfce7fdf	f	\N	\N
88eae90d-8949-40a1-8046-a02de6ed2889	2025-08-03	DEBIT-DC 8678 SQ *DOUBLE K DAIRY WEST ALLIS WI	3.00	Uncategorized	\N	f	{}	69d64e4de48cd2d080eadf1a3326757e00e961f09d19e89113496fda80237e6d	f	\N	\N
99f6e17c-ff72-4289-868a-493cf408c95e	2025-08-01	Payment to Apple Card	545.02	Uncategorized	\N	f	{}	35e44841073d3d368d77d0d6627585dbf43de6ee3de05f58498f6114298d0511	f	\N	\N
5f55f703-251a-49e2-9d8b-48dc3fae314b	2025-08-01	Payment to Chase	150.00	Uncategorized	\N	f	{}	88bf3030b132474d08f0ef25e0601aa1e6be4dbb18038c1fead73831021bb937	f	\N	\N
8b264fdb-aa72-4978-8ad5-4c6c554c4bc7	2025-08-01	Transfer To Credit Card -8715	2481.00	Uncategorized	\N	f	{}	e0099b1d5615d91c0bf292121844e627b9e7502b7a082c5f4133d1de9338f938	f	\N	\N
3ee94b31-3d03-40d7-b060-4dd7901c17cf	2025-07-31	Diaspora Salon	399.86	Uncategorized	\N	f	{}	1357125168ba6b4f2a1a500330c671408f9cee150ec4c7747715ac0726d7f660	f	\N	\N
6c20e1da-4155-484a-b8a8-5a8d43129971	2025-07-31	Unleashed Brands	130.00	Uncategorized	\N	f	{}	04b7666afba83a346a750ff8860e9ac2c8ea20566459a2d445184c439300ec3d	f	\N	\N
07c96a8b-fecb-4d78-948e-38a7a2405b22	2025-08-01	Diaspora Salon	15.00	Uncategorized	\N	f	{}	d15337e9c9841fbeeb68333c5918458ea1904cec37bfd5df5b42d4edee8daf5c	f	\N	\N
deccb713-2522-4810-8dde-092ee6caa7f1	2025-07-31	Crate & Barrel	13.80	Uncategorized	\N	f	{}	ce3e817daf577bd445649fae3674a70ba932e81451b5d8dc6bb685b58324ea68	f	\N	\N
f6f36574-ef27-4adb-9b6e-fe7fd95eda1a	2025-07-31	Target	2.75	Uncategorized	\N	f	{}	21fcf461e6207e0faf493821e434e7eec1d5fc04cbdd8fa4509cafbfac785609	f	\N	\N
a71321b6-938b-40fa-952e-0033180f17cf	2025-07-31	Target	0.49	Uncategorized	\N	f	{}	d37c3a5466aa55383608d7e1ce063b3e43054a5406bd9606c59ee2ded104b0f5	f	\N	\N
f22a1170-5db3-434c-b5f4-a6e8a563b4b7	2025-07-31	Dividend	-0.31	Uncategorized	\N	f	{}	65c2663709b2504ac2623a46e9477ce183134c1c805042bde8a1a65ee533211c	f	\N	\N
44899aad-5f75-4420-b9b6-6cd8730a7e21	2025-07-31	Payment to Baltimore Gas and Electric Company	351.62	Uncategorized	\N	f	{}	675341d5b765f0e422bf6c69aac8a8e88a2ee5d8498aa5444215f35151b30585	f	\N	\N
ae47593b-ecb9-41d7-be74-4f9573765496	2025-07-31	Transfer To Savings -0387	2245.07	Uncategorized	\N	f	{}	42f0843dcaeec2e2890b3fa433496e8d4abfbc6b8a2accd76059d0f4a74c8930	f	\N	\N
4f1a7267-7ad7-4942-af28-ee95891695f2	2025-07-31	Transfer To Credit Card -7148	150.00	Uncategorized	\N	f	{}	c06d295e6b7bf407cd7021c2505fdd0577367e96565b70c39bab6a3e453645c8	f	\N	\N
411eff73-e752-4901-b154-92e63db16f25	2025-07-31	Transfer To Checking -5873	100.00	Uncategorized	\N	f	{}	5a1b2beafa4e693d10224e6d0ed0d74636525232f17ab15a17c433813e7cdad6	f	\N	\N
3d344848-b846-4b30-9b85-a2653ccb0808	2025-07-31	Venmo Inc	120.00	Uncategorized	\N	f	{}	e74b53c5f367d045460bfd589a758feda731b5dad1faba64d001dce1c021166c	f	\N	\N
05d8307b-a544-4738-bdc4-07dc591e751c	2025-07-30	Apple	-127.19	Uncategorized	\N	f	{}	bfb4b85eacf45fdec4ae60e71872008ee2edf2ffbc1e499e468b68e368e275ee	f	\N	\N
fbb113d8-cae4-4bb4-b40d-c4ffad915ebf	2025-07-29	Target	75.83	Uncategorized	\N	f	{}	2b27f076f9bd053a52d7b3765a0295c398ac72b89e688e2246213abd5847ade0	f	\N	\N
860470ef-7fb4-4a05-a629-7a3a0685aa0b	2025-07-29	Wegmans	35.79	Uncategorized	\N	f	{}	f0f5c0a7a37eb3f1b5f8baf7e4b3673f13e87e62e2bbee0a3f899741c46c5bc5	f	\N	\N
a4f5a441-42da-40ce-bf23-a84b1784042c	2025-07-28	Wegmans	30.69	Uncategorized	\N	f	{}	7d06cbaa34e1bc3d2b30f7b0662d68d8f6841d6e31368e51a7e92364e67fdf3b	f	\N	\N
11e4927c-2443-4e13-b608-08a007151b1e	2025-07-29	Target	10.48	Uncategorized	\N	f	{}	f08d0b886581ce44f5b0b33545d68265861a85413d8768f994a32464a9749a77	f	\N	\N
720bc67e-6b36-423d-8813-387f02ecc590	2025-07-30	Microsoft Deposit	-10977.33	Uncategorized	\N	f	{}	c249398dc01c6df24e65f294a560fee1c441ef050272317eada2f388bbd45884	f	\N	\N
e77cac80-87a2-404d-9b30-87ba9d10178e	2025-07-29	Payment to Citizens Bank	88.12	Uncategorized	\N	f	{}	3fe7a7f8620491007094c9df1f5075a0acb0c1edff8f6ee4a131d5bc17b52aa6	f	\N	\N
cb2a0545-c89a-4656-a5ee-cf347ceaa32d	2025-07-28	Apple	127.19	Uncategorized	\N	f	{}	7f825c99f518499109df46a95fdb24c65122215765065b4bee61d9d66ef80343	f	\N	\N
a86d4856-c8ce-4465-bf21-998dd972546d	2025-07-28	DEBIT-DC 8678 TST*PITANGO BAKERY BALTIMORE MD	40.81	Uncategorized	\N	f	{}	b2d91c6a6920d3f018b91872cb97f6f2f89364119ee3db1049a1d6c3497be172	f	\N	\N
3e47cad8-b025-4e3c-bcee-5a5e412ddfe8	2025-07-28	Rise Up Coffee	14.05	Uncategorized	\N	f	{}	f752e3641ff44bec374fc1d692931f12011bdcef268dae52e9e11701ed17ba28	f	\N	\N
1474c733-a8b1-4b1f-9889-a72a8616862c	2025-07-28	BALTIMORE COUNTY	7.00	Uncategorized	\N	f	{}	b73e75ebb9e33c6b868402a17b7df9d6e164b8f01a62ce1a55dc63f49c029c0b	f	\N	\N
2c057062-4805-41b2-a936-9f866de01423	2025-07-29	Transfer From Savings	-2.74	Uncategorized	\N	f	{}	0c07b50474830d8135d82716d4504b811b5f9679f3b709c66ef28d5f641d34a3	f	\N	\N
375ef1d8-24cd-4a17-be54-ab440af26115	2025-07-25	DEBIT-DC 4581 WWW.LUMINISHE* LUM LUMINISHEALTH MD	78.00	Uncategorized	\N	f	{}	d2f897a1482a01704315c0936655b54a8135d4e77dff3d68bf2c3fc5fceafcd5	f	\N	\N
aa74566c-2a12-473d-8649-2bc578a1ede4	2025-07-24	Target	37.09	Uncategorized	\N	f	{}	6fe11c7953afb909b20e00ff9a46dd5fda0d9bd7c6bc626600ce89561e990041	f	\N	\N
188a3523-a6da-4b4f-b532-2e510213b82a	2025-07-25	Target	28.56	Uncategorized	\N	f	{}	cd2d0586de9f5ab02c83fb70511beb589b84d859410765e38157d1b84311bf8b	f	\N	\N
4b723df9-f18b-4690-ab40-a59a5e88358f	2025-07-23	Giant Food	120.67	Uncategorized	\N	f	{}	f139f606d507d294a289f328a9175ac0b5aeb822de6f733dbfc13bd6ca505336	f	\N	\N
22000ace-b025-4e8c-a5b3-3058300b8b1b	2025-07-23	Wegmans	4.04	Uncategorized	\N	f	{}	23a3b99e7cc20366faa54016edf099e3092f2abf97d9a6a975728fbeb8c1433f	f	\N	\N
ae3a2f65-1b0d-4595-87c5-3497d14cb15b	2025-07-23	Payment to Liberty Mutual	260.08	Uncategorized	\N	f	{}	87071cb9f129e9424575287cb988d479d29b250b65cb478ded31984552412389	f	\N	\N
a6d5e411-d95e-40f7-88d4-78022bd39acf	2025-07-21	China Wok	52.31	Uncategorized	\N	f	{}	c769512a81fd0ce5e1d8a06de84748aa1adf32948d9e3e56c21a4234818616ac	f	\N	\N
91ac4973-e3f0-4cfc-a65c-ee869efa9cdf	2025-07-22	DEBIT-DC 8678 TST* GOOD NEIGHBOR BALTIMORE MD	28.25	Uncategorized	\N	f	{}	f070a89396bcc8bee36100955569a468e2e2473dad2ec1a00524383f7f9eafd8	f	\N	\N
81705f41-ff3f-4aa0-a8ea-4b6f3979ffc0	2025-07-22	Netflix	8.47	Uncategorized	\N	f	{}	8fe42d3646965027dc3268703e4a2bf9a4b6f1a1369fdaa72b656f4a246c3298	f	\N	\N
e58eb897-c3a5-40f1-b760-2ea893300eec	2025-07-22	Apple	-0.80	Uncategorized	\N	f	{}	f30894b15f4d4dd8f86d25f7e2dfe4e63b20b15bdcd816e8e28915f7daf80e67	f	\N	\N
d3370181-13e0-44a2-b35a-76d3825c57f0	2025-07-21	DEBIT-DC 8678 OTF GAMBRILLS XX7925 MD	15.00	Uncategorized	\N	f	{}	48e267a40245d77007b000a5c3fc084cc464c21d45cff9b6e1aa342cdb888fde	f	\N	\N
099a7a58-edef-4c21-aded-e6fe538e2ca6	2025-07-21	ATM Rebate	-5.75	Uncategorized	\N	f	{}	f9613b14767696eaa5aa571479bf3d0da861caf695e543bd0b3f4f2af5c5d3a0	f	\N	\N
0c961aa5-b194-4157-9023-5c7512704514	2025-07-20	Transfer to Zelle	110.00	Uncategorized	\N	f	{}	42dd0f397cdf48784f843c65cc6c742c42aabfce5694ce3060da8f0fd3003777	f	\N	\N
3d9ac071-ffd5-4b91-9c15-95a32ca51984	2025-07-20	DEBIT-DC 4581 SHRI SAI KRIPA THERANGOLIRES MD	45.53	Uncategorized	\N	f	{}	4b3a546f80cc4fc67d6d0d9cf455cde1316d3f4d9d82e77a5b08a1a48a14ef4a	f	\N	\N
3bb28505-94c0-4ce5-a4e3-a946e2d3f0cd	2025-07-18	Apple	7.99	Uncategorized	\N	f	{}	9cb2bac2b5ff320d9a0eadd5569b69679b92ea9e7a5b888d0b6f867c601f8167	f	\N	\N
35b6ef98-2404-40fc-9e8e-dfdf293902e8	2025-07-18	Parking Authority of Baltimore City	1.00	Uncategorized	\N	f	{}	228fb581a0fe0cc374832e3bd04798c36e126b6be4b3c4bf9b2a9d1d34bc36b1	f	\N	\N
4a5d5302-d523-44d5-8174-b135de6c0f91	2025-07-18	ATM Withdrawal at PNC New Market MD	103.75	Uncategorized	\N	f	{}	365bae6b4e50f520488cb92e3bf0fbc91afa67f103158b7cf2dac1f6525fd46d	f	\N	\N
9fea2cea-21b6-4f3a-9266-bd9b6b30dd59	2025-07-18	ATM Fee - Inquiry	1.00	Uncategorized	\N	f	{}	149758a1ad36b6878bf35febfb85ca4d0bcee507c4dca95303f6b2266031baea	f	\N	\N
4e27b9c2-21bf-4704-91f3-be2ffdbf4614	2025-07-18	ATM Fee - Withdrawal	1.00	Uncategorized	\N	f	{}	6f83f4d5c236b5a067e0471454dc4019c3675d03c6a5d1231102474e9b370da9	f	\N	\N
bb20fc9b-f06e-45f7-b1bb-e8248b31dae1	2025-07-17	Rise Up Coffee	18.29	Uncategorized	\N	f	{}	8aa462a0f572020eb68cc66f30fa7170ed0355bee9dd8238ac859d969673d90d	f	\N	\N
b1126250-6363-4f6e-9a6b-bc813e4e03c1	2025-07-17	Uber Bagels	13.41	Uncategorized	\N	f	{}	6fc028f4a90345eccbce0cfae8ab16b79aeccc00d09150f806925251845cfbb7	f	\N	\N
76eb5920-ced9-405b-8b3a-c6e4c73b9a2a	2025-07-18	Transfer from Zelle	-150.00	Uncategorized	\N	f	{}	094c6c49f5f2d8f88bd56b08469aae6196a68264180ae9a371ea82877e85a608	f	\N	\N
bea13e45-6480-4719-9240-737005451a58	2025-07-16	Target	15.00	Uncategorized	\N	f	{}	b7d8702999e2b751c4643cd9a747b555bdcda7b0007c307c0412e75aed8bc8c2	f	\N	\N
c3452958-ab81-459e-b35c-2518fa62b47d	2025-07-16	DEBIT-DC 8678 MARYANNS ICE CREAM ANNAPOLIS MD	7.42	Uncategorized	\N	f	{}	2bfe4f484b101cd203e5084154df1c6fac08839b2cc5f1f32dddb497b6f7c100	f	\N	\N
ec98bfea-9ecd-4573-ab23-49489e3bcd00	2025-07-16	Rise Up Coffee	7.15	Uncategorized	\N	f	{}	04643f6d0bda7b11d4e019d752dadf2b0add0645ccf144ed0795379408bd7a63	f	\N	\N
4a41f458-8e58-455b-817a-70f80fe56947	2025-07-16	DEBIT-DC 8678 SQ *CLARK'S ELIOAK ELLICOTT CITY MD	5.50	Uncategorized	\N	f	{}	ab7f13ba2760313935c41a769bbb86d0cf63915a0404e5565df1422180ed7d2b	f	\N	\N
62336c55-a55c-4544-ae60-c89db1aed107	2025-07-16	DEBIT-DC 8678 SQ *CLARK'S ELIOAK ELLICOTT CITY MD	5.00	Uncategorized	\N	f	{}	4bd9bad50ec0da60ffb03925ef8b89f22b1baf02b11aa2a9552bd7e7acf28726	f	\N	\N
33bb1419-e645-433b-8242-03a29a6d6e22	2025-07-17	ATM Withdrawal	100.00	Uncategorized	\N	f	{}	5d7bf6049ea454e270f3317fd33a769bfdd0b3e10ebcaf27271ca9a5316e0778	f	\N	\N
316845bf-c062-45d3-88d7-06d0ec2ab254	2025-07-16	Toyota	900.00	Uncategorized	\N	f	{}	175669caa68f93ff51529565ca748d2c10c44ad43942da49e4a4d6fd1c6c43ba	f	\N	\N
e3e40066-8bc7-426c-a35c-241f7f8f8792	2025-07-16	Payment to New York Life	616.54	Uncategorized	\N	f	{}	bd718023db7b69a68eb1810a66bb5868c1bc3e5db716ae08f8baf1e90b408252	f	\N	\N
ad0a8ddf-03a5-4a8a-9614-c20db4259cb1	2025-07-16	Payment to Chase	418.74	Uncategorized	\N	f	{}	84ee1962291549174bf4d7357702b8db6a444d652274272a43e2cbce6745f32c	f	\N	\N
380f06f1-789e-45b6-b6cc-4545a95cdc04	2025-07-16	Payment to Discover Bank	395.00	Uncategorized	\N	f	{}	d312fab17e1e1179560377632d037119698b68be7b3ee37d4617d58edc312640	f	\N	\N
d59b62f0-f9a6-457f-b458-b4a0a5476de0	2025-07-16	Payment to The Guardian Life Insurance Company of America	164.80	Uncategorized	\N	f	{}	050f3c8a94e836eabbfd4ef38332464a3ffdc043c0a7e526441a80bfb67d6f49	f	\N	\N
e88805bc-c7f7-4dc2-b5fc-039ddaa2accc	2025-07-16	Payment to ECSI	100.88	Uncategorized	\N	f	{}	d38f6bd5d44f31beb720d79ae9a122f4e703e00c2bf12c3167478d625e6c431f	f	\N	\N
19b85b8d-9032-4abb-9e31-b259bafa0d2b	2025-07-16	Transfer To Checking -5873	100.00	Uncategorized	\N	f	{}	7cd03133d6bb13fd4f0aaaf7cb65886d194ce74bdda0c64f16028036c404e579	f	\N	\N
c666d922-5aff-461b-a726-c432d19f12b0	2025-07-15	Target	77.75	Uncategorized	\N	f	{}	e7348784c210f77e1555a9b67264a8d5d6bc7d579da4b857732a53b1f07ac3fe	f	\N	\N
990d2c7f-da4b-44dd-a7bf-d66924c7bc0b	2025-07-16	Venmo Inc	60.00	Uncategorized	\N	f	{}	0c6bd2ef1d00d8634f6b99a1798e03d39664696ff1718f4c47ca1d6a6ccf7268	f	\N	\N
22105cd5-ed8f-4170-9f94-d232f47f26f9	2025-07-15	Target	38.76	Uncategorized	\N	f	{}	99c468337a45f31c6ed4a1ecb4da2014aec6582979cdfbab58be7c4ed2d36e6f	f	\N	\N
0d5ae5f7-c3c5-4d50-8ff3-80417239fcbb	2025-07-15	Giant Food	32.60	Uncategorized	\N	f	{}	073f30dfb1a8795ec047204c15fab3c5935458fbdd20925133cd35a598a87754	f	\N	\N
65c99156-7268-4da2-842d-4eee7633cb40	2025-07-15	Target	15.00	Uncategorized	\N	f	{}	e2ecd611e0652195d289c1c0bfbf95584a47889ec74d569f18bb4e7886e76a1b	f	\N	\N
501d19d7-b470-4c92-85a9-9c0c77242ea2	2025-07-14	DEBIT-DC 8678 UMMC MIDTOWN - PAR BALTIMORE MD	3.00	Uncategorized	\N	f	{}	83f688b3a3bbb34be26e666afa5b6727f267c1418d601830258105fbe3db3d97	f	\N	\N
529105eb-370f-4722-b9e4-f46ad67ab3dd	2025-07-15	Payment to Volvo Car Financial Services	485.88	Uncategorized	\N	f	{}	36150c2895ad9d417e743612b6c8037ccfc03aff2597374f0b25350532025d57	f	\N	\N
6d24c679-d03a-4e3e-89d7-e825600e5fba	2025-07-15	Tax Payment to IRS	388.00	Uncategorized	\N	f	{}	01dbf04f020a13c7c32ec77a33b061126d0be2b93a1da6766928778afc4e6881	f	\N	\N
447dac08-f433-43cd-9989-d1ef1e41fb2e	2025-07-15	Transfer To Credit Card -8715	50.00	Uncategorized	\N	f	{}	5eb0bbcfedc41f1c2a9c11bdae8f09e02157a7225b6bedb8cee25dd934163b21	f	\N	\N
f17364fd-d91c-4bc6-8e71-f14047635f7a	2025-07-14	Wegmans	110.49	Uncategorized	\N	f	{}	0efea174dd3515054681de2afdfa2958d6773622e34fb40d8340c1d083f6fab0	f	\N	\N
a03a7cb4-1728-49b1-901a-673e2a169ec8	2025-07-14	Payment to Verizon	94.99	Uncategorized	\N	f	{}	4e5d769e86fc6d6053a19e68e631b3de96c7d3494b0bc3a0dd4b55190bd6ad73	f	\N	\N
3010c0fa-4a55-4144-8bb4-3f6ac81b1951	2025-07-11	DEBIT-DC 4581 WWW.LUMINISHE* LUM LUMINISHEALTH MD	78.00	Uncategorized	\N	f	{}	3cef6dd0ae447e78d75c29314e0d41d104ab5ae1ce86bc8ec1f78df4f703635d	f	\N	\N
20cd9e7f-2cf6-445e-be2c-33906627f3f5	2025-07-13	DEBIT-DC 4581 SQ *CATONSVILLE FA CATONSVILLE MD	26.50	Uncategorized	\N	f	{}	0d92dd64bee0f5f740722bb99caaf1deadf33ea344634b3ee3a9af5bbb676d5f	f	\N	\N
98868037-4da7-4c5f-b119-b8e1b0256df9	2025-07-12	DEBIT-DC 4581 THOMPSON CREEK D STEVENSVILLE MD US	25.15	Uncategorized	\N	f	{}	5b09dae37f9f0204f30a009092c6c852976d1915df18e525560238dea2965c73	f	\N	\N
4d788477-1cf2-40ba-a989-7c82fb55ace1	2025-07-12	Common Ground	13.78	Uncategorized	\N	f	{}	179068ea714c10da15302caee46656f05f74313540b080b5e5eaddb87a265608	f	\N	\N
caba4a66-357b-4c9e-be79-8254a2a0e946	2025-07-12	Pizza Boli's	13.77	Uncategorized	\N	f	{}	2fbb74327e609dae640d771fdc223513586601dbbcfebaf713b447d4fb0ef912	f	\N	\N
47c50291-bc76-4fd1-879e-61828d59aead	2025-07-13	DEBIT-DC 4581 SQ *CHARLOTTETOWN BALTIMORE MD	12.48	Uncategorized	\N	f	{}	cba955135157707b2e946305b8c3b72fb99146af0fadd121f67b5fbd9b3f448e	f	\N	\N
6485e1d1-6d58-4a20-9bbe-1d5714c65541	2025-07-11	Wegmans	8.32	Uncategorized	\N	f	{}	d6bd21b2876194cd8e6253b579a95b5f196de4e5da7785b608dda1f1c4fcc4aa	f	\N	\N
1ff86dc4-b2aa-41a9-8348-a2090f05e98e	2025-07-13	DEBIT-DC 4581 SQ *VALENCIA?S MONTROSS VA	8.00	Uncategorized	\N	f	{}	39d8557f27db92aeb2585eef982e08e3a8730f5eedd1ff9fbf13ed5f963c9fda	f	\N	\N
da8ee5d1-b710-461f-aa4a-542dec9638ef	2025-07-13	DEBIT-DC 4581 SQ *THE BREADERY/D CATONSVILLE MD	7.00	Uncategorized	\N	f	{}	6d0be69a8b243f6d52bec1f0277fef8622a75595b8d012b1eceed93fc4c848d7	f	\N	\N
f38aca2e-a464-4f1c-936c-bab1b10332c8	2025-07-13	DEBIT-DC 4581 SQ *GRACE'S THAI K CATONSVILLE MD	6.36	Uncategorized	\N	f	{}	0fe9519e91d33ab840b345b07d62e5c8b68adafc28188ad7d3e4248d4ecc359c	f	\N	\N
c9a1e350-8969-40ce-ab26-66b0b75b7f43	2025-07-14	Microsoft Deposit	-4690.28	Uncategorized	\N	f	{}	9474cf2df7cad5f49e677797c90089d5400db7d6c4c0193e3331811dc9bee689	f	\N	\N
6695364d-76ce-4620-b3aa-c4b11f9559d7	2025-07-10	Rise Up Coffee	22.85	Uncategorized	\N	f	{}	10a334d0615473b123bf71bec56a50be44ec8d18ae01a4a5772c6421c194cb3f	f	\N	\N
d5c91d63-9630-4e77-94fc-d8371f195122	2025-07-11	Transfer From Savings -0387	-500.00	Uncategorized	\N	f	{}	7fe4dcab9af95a3adc2116835b8ad7a3c8d34e03c9307c1a44f4bda20b587b6d	f	\N	\N
d616e452-8f60-41c9-9929-9e4922817d14	2025-07-08	Auntie Anne's	6.11	Uncategorized	\N	f	{}	2ab7aa5f08b1daad5688c9dedc59234b2348ecfd9d78f752ec3fe912e56c4393	f	\N	\N
bdcdb0b1-1bc8-4d7a-a01b-a37aa27e1487	2025-07-09	Lowe's	30.00	Uncategorized	\N	f	{}	d0ec61dfc23edba53066eadfcc2ec6d2e0ce3d3f0898055af7c8eb2ed71a2c3f	f	\N	\N
50ab89a7-5bb9-415a-8113-264b4662b8c9	2025-07-09	Target	5.73	Uncategorized	\N	f	{}	91ec19909ba527b2023c1a79534b76be84adabb51d66fcf4a2b94b89722b3bad	f	\N	\N
53305717-31b5-442e-b35f-221647975516	2025-07-09	Adjustment - Cr Cash App*claudaya Oakland CA US	-153.20	Uncategorized	\N	f	{}	0af1e7b987e38523ca2958e77b73ada0a0b883f7522d4da6e64d840e1fa8b3e6	f	\N	\N
aabf79f5-1038-4067-a322-dd6acf55af0d	2025-07-07	DEBIT-DC 8678 OTF GAMBRILLS XX7925 MD	159.00	Uncategorized	\N	f	{}	36240ceb6a945f17572cb407e3cbdeb9e5988e72c20fd40b0647cf0a747fdb03	f	\N	\N
55b7b511-64cb-45f5-98f5-de7e65a78497	2025-07-06	Royal Farms	9.74	Uncategorized	\N	f	{}	e8b5755bf13f3608ccd71a0ca8f3a0ba31f88fd8b9e9960fcb00c1798f03d7d6	f	\N	\N
1cc6a5bd-8afc-4d09-a27c-1af231787768	2025-07-07	Payment to AT&T	187.05	Uncategorized	\N	f	{}	f381cd4137afff96d340d7d3751e215aaa064ff3ce6a2c39ea7dfb982ad959e1	f	\N	\N
3efbbada-5e99-49cf-a21f-bb712e6192ad	2025-07-06	Venmo Inc	60.00	Uncategorized	\N	f	{}	11acee85a6ad987381573dcef1db43c249e8127d2dc33fdc35bd3b9ee912f556	f	\N	\N
3c00a764-bc4b-4fa0-a828-e1d3ce758b40	2025-07-07	Apostrophe	48.30	Uncategorized	\N	f	{}	0266967976e1dcbe37fdc68679c7c2945ac4c788b8a6aafa2ce5ab7590348fbe	f	\N	\N
139fbb16-2395-4c71-a190-17e44484a7b9	2025-07-03	Target	41.70	Uncategorized	\N	f	{}	6377f54aeaed10501cfb45baeea6e9b14d99d3ae8dfcd03d88f4c67027af9436	f	\N	\N
6ab107b7-a087-4cef-9d8b-78bd4b1e63cf	2025-07-05	Giant Food	21.94	Uncategorized	\N	f	{}	8866b5aa317c27994e490ff312366df99c448eb8a74de2aa1387cba641941b0d	f	\N	\N
babaf5b8-781b-43a8-820e-1aae79ab8f0b	2025-07-03	DEBIT-DC 8678 OTF GAMBRILLS XX7925 MD	14.00	Uncategorized	\N	f	{}	ef4b18b98f2252a9494549454f3a15b1294aed9d506e7be88730bca8fb12f360	f	\N	\N
1be026c4-0957-463f-91bb-6e4f497b8165	2025-07-05	Cox Wine & Spirits	3.10	Uncategorized	\N	f	{}	36de49ea14e4ab7be7ed31d9eff88b54aeb8a490f385f7cff76c10727ee64873	f	\N	\N
13d46fac-b66f-4646-9707-6d08a0c5f828	2025-07-07	Transfer From Savings -0387	-350.00	Uncategorized	\N	f	{}	ab99269e35719c6c24e54e58d222d8ee0bc9984cf8c91c9c28c96fbf00de19e3	f	\N	\N
40f67109-22a4-4aea-a55a-e2ddd9c1fd18	2025-07-07	Transfer From Savings -0387	-150.00	Uncategorized	\N	f	{}	fae1077d52b8126e55fead0e0562422e5b0d3a92b64323ece85a04881cefc19f	f	\N	\N
6c6571ed-1493-437c-9abe-1b1e2fbd4283	2025-07-07	Transfer from Zelle	-150.00	Uncategorized	\N	f	{}	625ebfdd2224e09b401206ca2664fc29c3b53bc14ef22ac13dc9edac063d4963	f	\N	\N
b7eb541e-4d55-4ba7-8c79-9a2769baf4fe	2025-07-03	JPMorganChase	2239.11	Uncategorized	\N	f	{}	390a7745fec60e9aa8c71b0611fd70fe20b308b3c772d46943f81983f2182968	f	\N	\N
09c18a0b-19f9-4705-9ac7-2ea68c7c0dd3	2025-07-01	DEBIT-DC 4581 MORNINGSTAR STORAG XX1626 MD	91.00	Uncategorized	\N	f	{}	4ed77fe44b74d78db83007b11f3ee2ba67cb3451a555b71e8883c7c577e26aaa	f	\N	\N
c97ecc4e-935c-4872-a443-1b7cdbbbf9a8	2025-07-02	Target	79.86	Uncategorized	\N	f	{}	9c1e9977ea9ad707402a66fb08f8f00d79705405b53cbed0e005d8c1bc77374f	f	\N	\N
f9013670-b37c-48e1-8e78-75dc446fa4b6	2025-07-02	Walmart	27.58	Uncategorized	\N	f	{}	f40aaba0d8441d9895b0baca9ac606a6ef49c0c112d9fd02f6672975270e6993	f	\N	\N
37bded0f-8282-467d-8f77-e4521f4ed975	2025-07-02	DEBIT-DC 8678 SQ *FIRST FREE COF CHARLOTTESVIL VA	24.71	Uncategorized	\N	f	{}	a63b50bd7f1a1bf49b83ca67b7eb278974b06d72a773654a6270a91f2acfa27d	f	\N	\N
31b40add-ba46-4a4b-a8f4-00b02e729c46	2025-07-02	DEBIT-DC 8678 AIRGARAGE PARKING AIRGARAGE.COM CA	4.69	Uncategorized	\N	f	{}	30c4e2ae85fc6f0e9ae6318ba6ae3994d28462a7bfcf9d55407695300beb34a3	f	\N	\N
9fd1000c-078c-41c4-9bf0-e13e972b2497	2025-07-03	Transfer From Savings -0387	-1500.00	Uncategorized	\N	f	{}	810642429db670ebfb87d1efd5b68f37ed6125dd4a5ea8606665c201b122000d	f	\N	\N
7b191ca8-8a4b-4f2c-a80c-35af90068086	2025-07-02	Payment to Service Finance Company	500.00	Uncategorized	\N	f	{}	c0a58b73aee5f87e5ccb4b11eac1365c30a7b0f8cf2779cf4573bbfc2903d929	f	\N	\N
66be9135-50a9-4ee3-b210-6e3139f01e10	2025-07-01	Ulta Beauty	137.80	Uncategorized	\N	f	{}	e03ccc8627e017ccd202546718969f3a52d56b0e99052201d1e6a3ebe21819de	f	\N	\N
5e767410-7d47-415c-bb34-47c53ebdad06	2025-07-01	Peloton Cycle	46.64	Uncategorized	\N	f	{}	4eebe55c25dce2017c11458af4ab1aae8ae0dacf9d83748b559a5d3a3c24db42	f	\N	\N
106993ec-0985-43f0-9912-f334e58c43ed	2025-07-01	Giant Food	30.14	Uncategorized	\N	f	{}	ae064e0b59ca0fcfafd18dcb58a28cb31d0b4afbec248231f2e1046a1ecacdef	f	\N	\N
5b5f3911-13bc-497d-bef6-19d5386958f4	2025-07-01	DEBIT-DC 8678 GATEWAY ANTIQUE CE RUCKERSVILLE VA	25.27	Uncategorized	\N	f	{}	ba9edc5514ce6c588b49558f584c4fb52faee2af2607ea706e5f3cfa0f2db436	f	\N	\N
d21012df-899c-44c5-88a9-184d480981b9	2025-07-01	Walmart	24.68	Uncategorized	\N	f	{}	f29d41d7d4a2743485cb7adcf1bf86e12ea009e48266e6bad3bfae0c5077ffb5	f	\N	\N
6d06f760-cdea-414b-b3a0-2836245fe869	2025-06-30	Qdoba Mexican Grill	22.58	Uncategorized	\N	f	{}	b8de7e3307fa5492be8dc59220e70d6d7b040db1a4993ae379b1454ab09e52ca	f	\N	\N
670738b3-5996-40b7-92e6-9b76125cd7d5	2025-07-01	Target	17.35	Uncategorized	\N	f	{}	790cd09de5a7cecf8793b511deda898fcf856b4c2f54da3cf5b1d56a28a7f1f6	f	\N	\N
1f3f00a5-ad1f-4eb1-a75b-d760042ffb50	2025-07-01	Shell	16.05	Uncategorized	\N	f	{}	c04e161339ea6142b743d32dc1adccd1f7041c68ce467162c6fea5c651a39f9f	f	\N	\N
c1872764-2602-4d25-a30c-90b9f87dfba6	2025-06-30	McDonald's	9.52	Uncategorized	\N	f	{}	68d7e9631fe14e4f51d116086750833259dba8241a9f4eb911cee22858ab2ef4	f	\N	\N
e027ef1d-75c2-4fd2-83d3-d0ff172ea8ac	2025-07-01	Apple	2.49	Uncategorized	\N	f	{}	edaec8b50cf71d3e87578a75236b9be06e7f04a1cf0d3da110e426fdfef66bb8	f	\N	\N
4a7b95da-4b4f-4358-8b52-098d9d829065	2025-06-30	McDonald's	1.58	Uncategorized	\N	f	{}	d1c49f71a1f58538afda6a4b0c4b807cf76812d0deaf29e6b62d58f3aac66a62	f	\N	\N
c71e728a-dc9f-42fb-8127-26c5c3b856d7	2025-07-01	Payment to Apple Card	365.81	Uncategorized	\N	f	{}	ae2ef6ae9a7a23c948d8d890445972eb631504c2a19cb0b5d0ff50565ec06cad	f	\N	\N
65642c32-6723-4601-a8b2-9dc9e6fc02db	2025-07-01	Payment to Baltimore Gas and Electric Company	359.00	Uncategorized	\N	f	{}	e4a25d0dec748cadf708d22358c20b8ad25a17190853e35ec2e164d689923b70	f	\N	\N
3d528778-27ed-476a-8d24-84dec0946fa7	2025-06-30	Wegmans	167.69	Uncategorized	\N	f	{}	3dd6facfcb4309af35a3b711f6efeae2a02a49e3d4d1d0f7f4af6eacb3bd1caa	f	\N	\N
f0a41dcf-bee9-41ee-b865-9bba9c046b3d	2025-06-30	Bellaluxe Nails And Spa	137.75	Uncategorized	\N	f	{}	9dcda9e055d159e1f62c8171ee48dd092ae4114a4b7afc751578b0985cac6dac	f	\N	\N
6aec0db6-d144-4cb1-ab92-934b69204789	2025-06-30	Unleashed Brands	130.00	Uncategorized	\N	f	{}	0ff96bfc0035c458f6687759ef6b34e47abad2efbd6c27d3165d81e20fa748aa	f	\N	\N
31787418-6103-4590-acc7-2e1e9813d09c	2025-06-30	Ulta Beauty	69.96	Uncategorized	\N	f	{}	2110d01cc908272201cc112333bc7624f524f189b10dd7a620edaf803580986f	f	\N	\N
0783dd33-3911-4939-87cd-0667f44312cd	2025-06-30	Sam's Club	32.70	Uncategorized	\N	f	{}	8e7f02e936fa4383eb3454fb415e355ccd05bf17ed5a1dcdcbb8eab0aaf8fbb5	f	\N	\N
416e3c65-f617-4c6e-ae9e-6c279ecd5fc7	2025-06-29	DEBIT-DC 8678 TST*PG STADIUM BOWIE MD	26.00	Uncategorized	\N	f	{}	fbf9c56bdd3f955df76c84693271dadf434775918b4e87c1db8c35e8cd5256dc	f	\N	\N
0b3209ec-f340-4dd5-972e-1757269350c7	2025-06-29	DEBIT-DC 8678 TST*PG STADIUM BOWIE MD	18.28	Uncategorized	\N	f	{}	460a17da8a69cc0b600bf17c398b5a29c914deccc441916dc66a2d91cd677851	f	\N	\N
6d0c10b5-8290-4428-a0fc-3701e543c928	2025-06-30	DEBIT-DC 8678 TST* CHEESESTEAK & ELKRIDGE MD	15.88	Uncategorized	\N	f	{}	48eb1fefae3f69a62f071f4acec092c7a9d4bdd49844a1e6b90bf40ab519e967	f	\N	\N
7ee029f1-62a6-4a5f-9cc0-5582e4b3e0c7	2025-06-29	DEBIT-DC 8678 TST*PG STADIUM BOWIE MD	15.72	Uncategorized	\N	f	{}	6d1f083ff9a1e2faf0d60e123edc3610cd5acf33db103d996180cae61d9f8ad5	f	\N	\N
74ea0b81-5c96-4a4d-bd6b-7a1ad0f7b19c	2025-06-29	DEBIT-DC 4581 TST*PG STADIUM CON BOWIE MD	14.04	Uncategorized	\N	f	{}	256affdfcc34ef48f25ff442bb94a59a960a5a8e276231b0a239691fa2867303	f	\N	\N
c28353ee-523f-408a-ba4a-12613780d2fe	2025-06-29	DEBIT-DC 8678 TST*PG STADIUM CON BOWIE MD	13.25	Uncategorized	\N	f	{}	f246dca5a30b4d7a5f586b0f63db1accf1937d90945a17748ac854efd0a22f37	f	\N	\N
593bcf09-9b21-422a-be07-c36cc9233f33	2025-06-29	DEBIT-DC 4581 TST*PG STADIUM BOWIE MD	12.54	Uncategorized	\N	f	{}	6bdc955d760ab263e46d8ff7e77f19f35b78b8b159c8a7db58be349ad66c9a0f	f	\N	\N
8927f9f9-f37c-4c4a-8a9b-bcc2cf94921e	2025-06-29	DEBIT-DC 8678 TST*PG STADIUM BOWIE MD	4.96	Uncategorized	\N	f	{}	d37d45b64282e79ecf84a3f2156a06e67fe72f9d7adc6b4384647d03818122e7	f	\N	\N
6fabc945-db68-4701-96a8-ea1ba4e37a0d	2025-06-30	Dividend	-0.44	Uncategorized	\N	f	{}	fffc20c44451321bc6c126244ae61323d05b81ef293e7ab426aa3b5eaaef7e09	f	\N	\N
480ff9d8-8f8a-4837-ab0b-42a1f8f432e6	2025-06-30	Payment to Chase	100.93	Uncategorized	\N	f	{}	e29810b5e87a49c5cd490151c1e175127c541846be2888701ad2d95d201bda78	f	\N	\N
cbe35fe2-ce89-420d-a9b9-52c7afe0d06e	2025-06-30	Payment to Citizens Bank	88.12	Uncategorized	\N	f	{}	b13f975130be3017b9fa418266c1f077c5c9d4fab6b003316259c52284767613	f	\N	\N
2cf25b39-18ed-48a6-86cf-57b98eb8784d	2025-06-30	Transfer To Savings -0387	350.00	Uncategorized	\N	f	{}	1bbacd33a4e67de678f95d46dd853e95dea81780b249b72ac5f6fa1c686aebb2	f	\N	\N
eea8b42c-75cb-4b8c-ac04-bb888ad71fe7	2025-06-30	Transfer To Credit Card -7148	6.84	Uncategorized	\N	f	{}	512729417ecc644bdf319cda7a1f44b6f3a3c8efc8de59b2ededdf44dd285faa	f	\N	\N
fc519a2b-4680-47ff-9767-10c7d366cb8b	2025-06-28	DEBIT-DC 4581 WWW.LUMINISHE* LUM LUMINISHEALTH MD	78.00	Uncategorized	\N	f	{}	b8711d3116a6e7e489f67c42758e8572822cb0f27e9430ffdd0915de59f9623f	f	\N	\N
284d4357-5820-44a1-b459-e251e5b9aafa	2025-06-27	Wegmans	75.57	Uncategorized	\N	f	{}	9ca95f2319b8cf5746d33f2c22d9f6b67b430ed2eccbef24fe10b7a6beaca657	f	\N	\N
e25d634e-2b6d-44ec-a9da-b7d95e9aec91	2025-06-29	Transfer to Patrick	70.00	Uncategorized	\N	f	{}	1d5a0516a2f9ba988e55216c2eb3d5dc83f930919bc9a2dc16d3260b146a9eea	f	\N	\N
18355e1f-3544-473c-bc9e-ebaa95c020ac	2025-06-29	DEBIT-DC 8678 CHESAPEAKE BAYSOX BOWIE MD	69.96	Uncategorized	\N	f	{}	cfec0d90a1d2827d11da94adcd513806027e9683d4b57b69ef31e957e7441ef4	f	\N	\N
0e4e2c49-360a-4278-a878-612361b7bbf1	2025-06-29	Venmo Inc	50.00	Uncategorized	\N	f	{}	8f6352b0f9f68bb9145df507701e87ee692364430580792565ba82c110090e05	f	\N	\N
2418a502-1edf-4487-93d3-a94a1e9e070a	2025-06-26	Chick-fil-A	26.47	Uncategorized	\N	f	{}	28d493708fcc02b1f95bca39518422b848ced90fed552e283f6bb6dc92a2b0bb	f	\N	\N
a896fe7a-a3fd-4cf6-97ac-0118af407811	2025-06-27	Michaels	16.21	Uncategorized	\N	f	{}	c08dd5568d77fee93334df2581f922f918092edeadace5e4e88cd38071a6920a	f	\N	\N
b77aefe1-c307-4b64-ae40-7a9830842c63	2025-06-29	Target	1.59	Uncategorized	\N	f	{}	739ca66bb899d4ee05143982a797f82f08e0988cbb81bdea2548eef5b60bde57	f	\N	\N
abd50b8f-a1b4-4bf4-a953-7c050bd2313d	2025-06-30	ATM Withdrawal	850.00	Uncategorized	\N	f	{}	ad9989a53ad344f9142c5226452f7c9d9d85df4dceebb8037a61c5b52aec63a8	f	\N	\N
f8705687-04a8-4bc4-9112-1632b5577db5	2025-06-27	Adjustment - Cr Sp Celebrate Us Wadsworth OH	-41.36	Uncategorized	\N	f	{}	4c803b71a8d5fdb96941aaf77e83f669e12d200a2614bf10924f141eae9e6fd5	f	\N	\N
e731a6ae-8f2f-4fbc-bd8e-e99e039b52fc	2025-06-27	Michaels	9.64	Uncategorized	\N	f	{}	36b35a760084e5c0dfe2b38620717d6156814b6f277b26fabab916df3c4b3f5b	f	\N	\N
55884b3c-f06d-4b6d-a603-b8f490f518f7	2025-06-26	Wegmans	8.58	Uncategorized	\N	f	{}	5db44cdda1f4531f248ad00b550408a025c4f1e303ab55a310b3497735c416f3	f	\N	\N
6e7a6a86-b609-488a-a941-723ea23b8df0	2025-06-26	Target	5.99	Uncategorized	\N	f	{}	39bda45633bc305eab285a653d01aef76c22f343cdbe7f79587c105b251d7ef5	f	\N	\N
3a21a832-b6a3-4f39-972e-15906ab0c594	2025-06-26	Target	3.31	Uncategorized	\N	f	{}	f0eda1b8f5ec381b763bfa429bf22edb5d5dc9c5a164fec17052f954ededb62d	f	\N	\N
aad0677a-5113-4578-bc1f-ae2e11c7a7cf	2025-06-27	Microsoft Deposit	-4690.29	Uncategorized	\N	f	{}	e93a09c3cd348659642bd40568f55ec0de786b6e16fa93bf4045b40ca9db474b	f	\N	\N
3ea55827-c390-41f7-b205-e08b9bd1c357	2025-06-25	DEBIT-DC 8678 FGT*COUNTRY CALLIN XX-0315 TX	345.00	Uncategorized	\N	f	{}	3413d222713eed56ca4e2072ca3c3c8f9ccebcb2f21f0617bfb0538b2ce1002a	f	\N	\N
d18d7951-5b75-4a2e-8349-290498a12c3d	2025-06-24	Ledo Pizza	29.64	Uncategorized	\N	f	{}	17cf29299619751ee4e1c958c0ea62e7f95859a0fd6a822be121e49994818b14	f	\N	\N
2a9a4e95-3bc6-4460-aced-bc0637780866	2025-06-26	Transfer From Savings -0387	-350.00	Uncategorized	\N	f	{}	b8dc676a45642693320828cecadf460d44806292e029c0c3071586f9b8336a5a	f	\N	\N
f961bbd0-e956-4d34-b2d6-312a47d463e4	2025-06-24	DSW	105.96	Uncategorized	\N	f	{}	27650c225f6e5e09c6b6980825e01e29522ccc5cad7d3499c59fac9d5c84f5d5	f	\N	\N
45f51322-bca9-4f77-b1fe-b80b8d69a885	2025-06-24	Giant Food	10.23	Uncategorized	\N	f	{}	4ab19d4e53569f7b7388dbb6d8a4112614b8ff47ae96d71f5a4fd5cfff343583	f	\N	\N
6d7c0169-862c-4d6a-af7d-415665fad859	2025-06-24	Payment to Liberty Mutual	260.08	Uncategorized	\N	f	{}	e6001c51659b47e8b1fb37da49e60db6cfc38b10ba23fa6e45637b549c3ba176	f	\N	\N
7defffad-db9b-469a-99c0-b21603fdf997	2025-06-23	Wegmans	120.74	Uncategorized	\N	f	{}	8ee3b383e7858454ecdf906fadd96bbe0666a3d9aeb2951589e66e1b0d529e87	f	\N	\N
b01d5d8d-1347-4210-b110-d5d9ede9ba74	2025-06-23	Sam's Club	47.00	Uncategorized	\N	f	{}	751b01ba29e64753dcfe6321e3bc5641597646ff1af0006c3b71322bb8722ccb	f	\N	\N
b3c0d2e0-9a71-4148-ac87-e2ead292aa52	2025-06-24	Transfer From Savings -0387	-451.12	Uncategorized	\N	f	{}	ea56aeeef6b3e20bb2ef3807f1ba27f33af55e519a3c53f7e748e7eb215e88a2	f	\N	\N
a0818d39-9366-4bef-893d-f5bd22eda45e	2025-06-20	Tractor Supply Company	79.48	Uncategorized	\N	f	{}	216ab7cbca3cfa5abbc0e9e9c03a9e9d53f466ca183ce62a49398e87d2e5f8b2	f	\N	\N
f29a3ebe-62f3-4d1d-8e4a-d459d3ed861b	2025-06-22	DEBIT-DC 8678 SQ *BLUE'S BBQ TRU GAITHERSBURG MD	52.00	Uncategorized	\N	f	{}	ed0f0c285fdfd8062cee435de009fbe9bde66c13065ff03d7eddb769d447db4e	f	\N	\N
b9f6ced7-e9b0-40a2-9b21-f81282be7a92	2025-06-22	Sam's Club	37.90	Uncategorized	\N	f	{}	42bf504e625da8e112541b7014cc6e3ae240521de04d3f64ba00acb7c4270353	f	\N	\N
9b5eb46b-8c1d-4dcc-b9a2-732f165baee5	2025-06-22	DEBIT-DC 8678 TST*LITTLE BRICK C SHARPSBURG MD	24.00	Uncategorized	\N	f	{}	21aeeebf88b2aa6f7e526638d36fd0ae72166b4028b1150a965e7b5096d67953	f	\N	\N
d3b915ee-ea7d-4dfb-b9d8-cf9131dce298	2025-06-22	DEBIT-DC 8678 SQ *SPRINGFIELD MA THURMONT MD	22.54	Uncategorized	\N	f	{}	0e3f1606a39c508ba94d571b0b024c24ed622752d471d1483ad8a069058b57a1	f	\N	\N
f4c63110-cbf0-460e-b4fe-d25990f09fa9	2025-06-21	DEBIT-DC 4581 MARTIN'S FARM MARKET MYERSVILLE US	22.18	Uncategorized	\N	f	{}	e1e6cc5c99880b0effebce128f11c30bf333452ad0cf51d5beb3773114c8c508	f	\N	\N
22eca149-492e-410a-b0de-4e38039bee2f	2025-06-20	Royal Farms	17.20	Uncategorized	\N	f	{}	2c3bd16ba662b239f64d4088e91d2f88b4d98aa8b10e912bff64dd935ff851e7	f	\N	\N
e7169bf5-3242-4fae-aec9-6a3ca68c8c37	2025-06-21	Ecompanystore	15.90	Uncategorized	\N	f	{}	7861281aa531b5975b752ccfb295855f6c263bf8391c99b72402880b3c48a055	f	\N	\N
4a732fcd-61fe-40e6-a48e-b2e9583d5336	2025-06-21	McDonald's	10.79	Uncategorized	\N	f	{}	f59da920b93e1e350cd9115e30b1b9b04e34165e820401a82abb280a2a123227	f	\N	\N
05e67d5b-b23e-4b3c-a968-637cbaeae44e	2025-06-22	Netflix	8.47	Uncategorized	\N	f	{}	af4fc2745dab9fb3f5d4b939a72139602ceb3a14271a5eae6e321721cd6a3468	f	\N	\N
c6088104-ad68-421e-a18f-5cda0ed3af4e	2025-06-20	Giant Food	6.77	Uncategorized	\N	f	{}	ca3e5157480ad036bf44cf8bde37d789f15af9915bba3953310d1f59c64289e1	f	\N	\N
17e238e2-1103-4f83-a4f6-bd6dfd89ae13	2025-06-23	Transfer From Savings -0387	-491.50	Uncategorized	\N	f	{}	e9d89ebe3f47feb9be54b4d895e6a6d704cddf229a8da27aebf8fd5c1f545b4a	f	\N	\N
8aa4d697-1ec4-425a-b723-838e1287ed17	2025-06-20	ATM Rebate	-9.00	Uncategorized	\N	f	{}	dd49ec59c4114179bad8ee66cad0b2c8272847050f61ce94fd8fc2da0fd799db	f	\N	\N
ffa617ba-65d9-4233-858a-7c4e75e8ee8b	2025-06-18	Safeway	30.35	Uncategorized	\N	f	{}	9e57e9094ba2d21b2f1e292d350ef7c786cc8f9adfb45ac504c687c4e664d88c	f	\N	\N
01cef331-674e-4e7b-8a5b-eb313281975a	2025-06-18	Apple	7.99	Uncategorized	\N	f	{}	f12f2160122cfe4eed86fc1d93a15d11947a5c24eb4c1834a0f75a59e5c00974	f	\N	\N
da74de3a-829a-429d-bc48-4f593841815c	2025-06-16	FoodService	120.62	Uncategorized	\N	f	{}	976050f68e8f3978f8546aa8aa0070838063766d11ffdedbea1d1043da2ffb35	f	\N	\N
3790b9b9-913b-4ab7-a0fe-e26e6749f912	2025-06-16	FoodService	44.95	Uncategorized	\N	f	{}	f800140824f047d255879e3223da927710ed9cf9ad85f71697fb85f665400d56	f	\N	\N
bd807dff-6bf0-490e-a6e2-a181cb71e959	2025-06-17	Rutter's	43.77	Uncategorized	\N	f	{}	6746736851d16318ec9e14dcec9ee2d319fb1c2f8b5abc5af734974190b9e32e	f	\N	\N
20b5c0da-4038-44a4-8a66-86315a3be430	2025-06-16	DEBIT-DC 8678 HCW PHOTO HERSHEY PA	37.10	Uncategorized	\N	f	{}	dca659620b5e6fa347c6cf6b6c672798a7616efe6fbfa1fe633ff8b8b503f93c	f	\N	\N
8d08b180-e9ed-47d4-be43-dc680056161b	2025-06-16	Hersheypark	34.98	Uncategorized	\N	f	{}	b1e9fb20b90f18a8ef545ce444870cc7bbb62aefbb0b9c3b16f4b7486a9904b0	f	\N	\N
0c43bae6-7e48-4e1a-99ac-4faacb4bdc57	2025-06-16	Hersheypark	28.57	Uncategorized	\N	f	{}	b9a359a9b5a13def2be3c8cafec9c8d599a39551738c236d706223d0b6067ad4	f	\N	\N
b7dfaa43-b9ea-479d-b192-64238be12c34	2025-06-17	DEBIT-DC 8678 HERSHEY PARK FOODS HERSHEY PA	26.00	Uncategorized	\N	f	{}	c1498a6a1d31a7e8681b625a155a0e282bc3144f39cbadc6a339a9cab9574cf6	f	\N	\N
0fc4003b-7475-4fbe-8f12-6aa00ff97768	2025-06-16	DEBIT-DC 4581 HERSHEY PARK FOODS HERSHEY PA	23.83	Uncategorized	\N	f	{}	460f38ab56d63af5bd9b3672a4dea66150c60dc0513f9d1cd500429a36062fa2	f	\N	\N
f8b963a6-415b-46d5-a308-782d06c6b42c	2025-06-17	The Table	16.00	Uncategorized	\N	f	{}	ccc8c8a36db35b8bb637c306933e6a7bd0d1f36b95b37b76043723fd97ae84d6	f	\N	\N
dff569f2-98b0-4b7a-bcac-4a75f317a5b6	2025-06-16	DEBIT-DC 8678 HERSHEY PARK FOODS HERSHEY PA	16.00	Uncategorized	\N	f	{}	657dce7b04ddf71ae5c82d364fad5bbe2226fbfff80451637b15fda371ea5d52	f	\N	\N
6e648af6-ad5e-4e0e-a67a-0ffbd459e21c	2025-06-16	Hersheypark	13.77	Uncategorized	\N	f	{}	0a13bf9c0d8d7277a58384a54692ad5c15377eb95c0c53f33eee29bbde43f686	f	\N	\N
cae5c211-aa89-4157-af2a-16019fe7dc86	2025-06-17	Rutter's	11.74	Uncategorized	\N	f	{}	4d1a363507425c11d1bca61ed63d3f42a6d58e9b11f887274381f8c99248a273	f	\N	\N
525f1cc1-c918-4389-9352-81a6b72fa7f7	2025-06-16	FoodService	6.00	Uncategorized	\N	f	{}	aff07716735ca872b7d30df8af3090f9735f424ca77e2ab942b40cd4dd765d1d	f	\N	\N
d069682c-75ea-4556-9341-17a36df130fc	2025-06-17	Toyota	900.00	Uncategorized	\N	f	{}	da25d61c0b373a89abfc70910c730274aeacf1f9840ab203782f43e10af4cea4	f	\N	\N
7d008c17-1c05-45c1-a964-5655cc8733a9	2025-06-17	Payment to Service Finance Company	500.00	Uncategorized	\N	f	{}	c0a38aa95037f1ac09e33f64f2fe37472c4e2113922e39774c35635614d28ac2	f	\N	\N
0ba045b8-d4e0-455a-b9c0-2d24c1e1cfb8	2025-06-17	Payment to ECSI	100.88	Uncategorized	\N	f	{}	8a11ae511ecc98624ce65f8c25310e0d25fb8d3e9e02bc58309fa0daeebbbbc3	f	\N	\N
e14212b2-1482-4a9b-aabe-8b9caba0e84c	2025-06-16	DEBIT-DC 8678 TST*ATWATERS - CAT XX-4120 MD	23.89	Uncategorized	\N	f	{}	87796024087a15675c12ba92ba9d111df1a79b329d320ddac1be3a3879e44cb3	f	\N	\N
6cf45801-8b4b-41d8-a706-79f87dab3d73	2025-06-16	DEBIT-DC 8678 TST*ATWATERS - CAT CATONSVILLE MD	13.44	Uncategorized	\N	f	{}	a69123dfaa4b99aa975bcba8137e423acecb797062b5a723b64a7f7bdcc70f67	f	\N	\N
a562602a-d1c7-41fc-9e92-dda67729fd7a	2025-06-16	Payment to New York Life	616.54	Uncategorized	\N	f	{}	d117f45b3bd72d6a82fe40bf6c3b66b3c55b905a39a5eac16600b4fbb78855e8	f	\N	\N
53b209eb-faa2-4c7a-9f09-d7888e54ccd2	2025-06-16	Payment to Discover Bank	400.00	Uncategorized	\N	f	{}	319599dc74c59c42fe5a0507cd2eb8939c16807e2e332b4df8194155f426c6f5	f	\N	\N
8c18dc36-8350-492d-bffa-4282f3d3b538	2025-06-14	Target	236.26	Uncategorized	\N	f	{}	538ff93c549031554ba90500b5c8cc1644f0f0b7a555e8e4cbad156b49ff2faf	f	\N	\N
14accd54-318d-475e-8abc-fbb6770499b7	2025-06-13	DEBIT-DC 4581 STATE HIGHWAY ADMI XX3199 MD	84.00	Uncategorized	\N	f	{}	2d219e92ae227b10298d0ac0be5f6d6c1aeab998449cf69f39fb23082e9ac4be	f	\N	\N
59ac6e61-311e-44ad-94a9-9589c3977ff2	2025-06-15	MI PUEBLO	70.00	Uncategorized	\N	f	{}	9a03849d0e216b84bb32b9eb85803826377a0148fcfff8f1b3a36216af0aea0e	f	\N	\N
e08cca06-4d0e-406a-918e-3970581a5e7a	2025-06-15	Target	57.18	Uncategorized	\N	f	{}	453cf9ae2bbccbace6b100c01ea9ea056bd17a5903d11bb33f04949256957fa7	f	\N	\N
4e0992e3-3666-4a1f-9178-2a61c1bfad56	2025-06-14	Bliss Nail Spa	57.00	Uncategorized	\N	f	{}	d5c65e0252b2bf13050814ead64046086cd68d1ec3c4b20f30962b8f8e8867fe	f	\N	\N
cf7ec1cc-bb50-4b01-991b-362c5d9abe83	2025-06-15	DEBIT-DC 8678 TST* DAS BIERHALLE PARKVILLE MD	50.00	Uncategorized	\N	f	{}	f718a98fe5b9aa01770dc786355e8f112a091e0cea424d48a8cf6a9dc5b60626	f	\N	\N
beabb5f9-ba6d-4bac-bb59-b00d78363bb8	2025-06-13	Ledo Pizza	49.78	Uncategorized	\N	f	{}	3b3b4b5746f11d5c90dca0adedd9f63866d6986e0c37b57fee0aa7c98bc069b0	f	\N	\N
c781f76e-a5d3-46ad-9b26-c262251d2d76	2025-06-12	Ace Hardware	29.66	Uncategorized	\N	f	{}	98ce2a4ceaa7db2c7de42d58907f67a2712e6267ada2094da9dbfd88a2f156b1	f	\N	\N
b12fbfc4-5798-40f1-a67f-086673c15258	2025-06-13	DEBIT-DC 8678 HOWARD COUNTY RAND COLUMBIA MD	20.00	Uncategorized	\N	f	{}	6208f068eaf63e88635034a7cbad31ab2fec344fe71a303a54602747ef9cbaaf	f	\N	\N
3b684718-50fd-4948-aeb8-b183b23d4ad5	2025-06-14	DEBIT-DC 8678 HOWARD COUNTY RAND COLUMBIA MD	19.00	Uncategorized	\N	f	{}	88fdacc5bc0873aa8247d077f8571a0a233679f1136cb2d5fe1c22878a0158dc	f	\N	\N
a62e7974-b961-4a97-b973-8004d98edc9b	2025-06-12	DEBIT-DC 8678 2LEVY@ORIOLESPARK BALTIMORE MD	18.63	Uncategorized	\N	f	{}	d131ac5ea4d480eea0398a9e81ce82babbef7baf5a7c6362d6c339cfdd95986f	f	\N	\N
193bb5a9-9465-46d7-ab3b-80c7bdda3088	2025-06-14	7-Eleven	17.25	Uncategorized	\N	f	{}	0c37c6f8790eb402ce5779b7c88b2bc1ec9ec46391e7c9f7ac1de99954cc5415	f	\N	\N
155b1f37-e53f-40d4-899b-9b9666679165	2025-06-14	Starbucks	15.00	Uncategorized	\N	f	{}	f96222d85a31503ff115c4661d226c338943640a2e96ef3a6c371fdf94acbeb3	f	\N	\N
e16dc1b7-6a93-48eb-994c-9864f08dd6a5	2025-06-13	DEBIT-DC 8678 OTF GAMBRILLS XX7925 MD	14.00	Uncategorized	\N	f	{}	ec0c1201bac67f3e8d1b40eabfa99464c68a7e3fe790c24e2b027b63dbbcd73e	f	\N	\N
2a970eae-61de-4991-b29c-1b0bfc05559e	2025-06-14	LabCorp	6.34	Uncategorized	\N	f	{}	b02a4b1387dcaa7b8cd76a71cd90881430d2179d1823567f8414e30eba78a645	f	\N	\N
d782526b-7828-4a3f-b5fc-e40914613db5	2025-06-13	Dunkin' Donuts	6.04	Uncategorized	\N	f	{}	9e4ca3a94c9e5dcac0039be3b58abc0387e35a13b10477c98502ba0cc8ccc2b5	f	\N	\N
43359806-4dd6-431d-8e77-3b2d5ac5f2de	2025-06-13	DEBIT-DC 8678 HOWARD COUNTY RAND COLUMBIA MD	5.00	Uncategorized	\N	f	{}	eee7bf1fbb8b7ba760fad991889ce1a555e4336324a51aa60bc2a3845c1c198d	f	\N	\N
3eb44e2d-9a9e-4436-9916-d9cbd29399f4	2025-06-14	ATM Withdrawal at 16 Plus Millersville MD	123.50	Uncategorized	\N	f	{}	c2dc51dc33e284684615f847761657c539c7c2018f86e3083e5d6eceb8fcd2cc	f	\N	\N
c1596e40-bb31-46c9-a01d-861199460f1d	2025-06-14	ATM Fee - Withdrawal	1.00	Uncategorized	\N	f	{}	bf04caee6c6344777d1371ff0b92b1872c9ff7749260af6f67a890aedafcff44	f	\N	\N
6b8a8a4c-94c9-4823-b065-e44e2e9119d5	2025-06-13	Transfer To Credit Card -8715	500.00	Uncategorized	\N	f	{}	d320ef15e9f261d1c40cd430d2299b648320258063a7db8a19ec815b01588c82	f	\N	\N
9b1ea9ff-ed14-4013-94d8-933a55df2eb7	2025-06-12	DEBIT-DC 4581 HERSHEY OL ADMISN XX-8913 PA	122.78	Uncategorized	\N	f	{}	1d2ee4e08fabf34fc9d60347a6700031e530ca326973ab40e6c3b2796a3a8b37	f	\N	\N
7241ecd6-6018-41ea-ad1c-a37d07bec646	2025-06-12	DEBIT-DC 8678 EB *MARYLAND LAVEN XX7200 CA	85.56	Uncategorized	\N	f	{}	eff2e72e41f7e6aef70f1dc6e9ef7885a800385d71c24ede41b561b43612cada	f	\N	\N
972eb687-19cc-410c-8939-bebee9f5d5a9	2025-06-12	LAZ Parking	19.80	Uncategorized	\N	f	{}	72936a00b9737f3eb18a087de01282b25106d0d7bf048f31402bf9edda39a0bb	f	\N	\N
368b02cc-e56d-47d2-8a0d-23c867a41166	2025-06-11	Uber Bagels	9.22	Uncategorized	\N	f	{}	a6835cafff3f644a697e7f83110f71a3ae99b92b6868d77508f4994d4881207b	f	\N	\N
bca041ff-cefe-49b0-9e07-ec93de78031a	2025-06-13	Adjustment - Cr Eb *maryland Laven XX-7200 CA	-28.52	Uncategorized	\N	f	{}	3cddc9942a95bc7ab78f905ee1a33b86c00b397104e1c9ac9d820d86290413f3	f	\N	\N
63329e36-a67c-4612-b279-c193e57483d0	2025-06-12	Payment to Verizon	94.99	Uncategorized	\N	f	{}	b86e955290bde780bcdc9b6b30ecc3c48ec9384d161482ed1702c78346bb05d5	f	\N	\N
2f0bc967-fe4e-444c-9d89-4edb332cb5ee	2025-06-11	Sam's Club	47.35	Uncategorized	\N	f	{}	b3ce976dcd4f8d6cb2af5c4f1bb2fe640a12f16d35f204d9c54c82b81e95a27c	f	\N	\N
eaa56f4e-d663-4b8f-860d-2010a3d6f57e	2025-06-11	Giant Food	37.98	Uncategorized	\N	f	{}	e737ec7f9c84a49988b4ff8bd1eb60629042aeffe8c8d10089ccaeb4f8b9cda0	f	\N	\N
d9bed2a2-9abb-4d05-ae48-3a090fa361d4	2025-06-12	Microsoft Deposit	-4690.28	Uncategorized	\N	f	{}	a12ee152b34e009b693a3e36e8268c465f80a79d37cdaa715a9cc82ff6ca8493	f	\N	\N
45f6c7ee-d233-441e-81e5-281a37b9a340	2025-06-10	Wegmans	46.47	Uncategorized	\N	f	{}	cb843ead01d946af2db38474a1636316a7a04514379860762b7cc0ab1880e2de	f	\N	\N
046cbdce-fa7b-4f5c-93af-9681a96a5ef3	2025-06-10	Apple	10.59	Uncategorized	\N	f	{}	14234d8e178a76dee5316947ee1875e8f4e69cf36229cd67e680cb2062dfcd34	f	\N	\N
beebef0e-6aac-4c6a-acdb-59417ea741de	2025-06-09	Taco Bell	8.35	Uncategorized	\N	f	{}	be7846f18a8bb65236ebfd6583b341b50f192cfef9db00bcdf866c68e2d1fe95	f	\N	\N
ad347986-9607-4b1d-a108-558e9d0ae671	2025-06-07	Target	100.66	Uncategorized	\N	f	{}	ebb56c54cc9a5c75563619c907ed109601d92f1f5da4ac8d3c188111a65a374a	f	\N	\N
c335711f-33a9-4f4d-8323-2c5034a48b9b	2025-06-05	DEBIT-DC 8678 SQ *FACILITY CONCE BALTIMORE MD	50.00	Uncategorized	\N	f	{}	89f3396d6c7ff533968d4858ebfdb56e919c86508077e9671b0a5bac9b3d23d0	f	\N	\N
45ef0e69-4f36-4462-ae18-04c6f5a3d0fc	2025-06-06	Wegmans	30.13	Uncategorized	\N	f	{}	fdf86f312e4216594e27fbda7ae6ecd6d0bcf98ad53503172c393523a1df4af1	f	\N	\N
1a8a9f58-0d44-43a5-8f56-37bb95d9350b	2025-06-07	Pizza Boli's	25.16	Uncategorized	\N	f	{}	e29f1ace0c4731c17823c62d5594791ab69803c17ab9a2a4bec2607b7786022c	f	\N	\N
06ce293c-38e7-4acb-8f4e-205837035376	2025-06-07	Pizza Boli's	24.34	Uncategorized	\N	f	{}	378dbc977ec03e361d244edc4dd5ccc508039ef4466e48d3f2f0692807f6e7fd	f	\N	\N
fe10f2cb-7811-4346-83ed-89908a842585	2025-06-05	DEBIT-DC 8678 UMB BALTIMORE GRAN BALTIMORE MD	15.00	Uncategorized	\N	f	{}	d3edc7f4c57009508817db9dc0204a6cffb9d85ab7eebe702e8a8e435d11717f	f	\N	\N
2d4bba77-42da-40b0-93b6-49f9c27e0698	2025-06-05	Barnes & Noble	12.41	Uncategorized	\N	f	{}	43d47d4b8f7b6b72407c509acb3c9007ced8bf5c47f624037dc5a247d552c4f5	f	\N	\N
5ef913c6-4bd6-41c9-8a90-0a062c5408ac	2025-06-05	DEBIT-DC 8678 TST*MAMA TANAS FRE NOTTINGHAM MD	10.58	Uncategorized	\N	f	{}	c3aa657d761e7bbde1597f80d0fbbafd93bbf4419237edfbcfa47e52909665fa	f	\N	\N
a20fbb1c-b6b3-40fb-812b-c6aa704c2eb4	2025-06-08	Giant Food	9.97	Uncategorized	\N	f	{}	76377111a770d205e2a1348a8e2408829583311d7bef44e15e7117a4032ce039	f	\N	\N
8ccc652f-a55c-4d4a-9e2a-edb13c45ef0f	2025-06-05	DEBIT-DC 8678 SQ *FACILITY CONCE BALTIMORE MD	9.54	Uncategorized	\N	f	{}	8298bf687054c2ea3f2cc475c10d0a8c8af5b4822c332a22b173ec168a239f2b	f	\N	\N
7977b705-2b71-4854-8dc2-eb37de3c367d	2025-06-07	Royal Farms	7.31	Uncategorized	\N	f	{}	bc1f116d0c882d2805453c3ef17623329a9caaca0bc8786fa25a660290ee1b5e	f	\N	\N
57af27c4-f521-4d50-8afc-48a8674b84e9	2025-06-06	FedEx	0.75	Uncategorized	\N	f	{}	222e7abc728bd40fd4162406bcf19a99708b0717e827f4b0d5b47c3f93c77bc3	f	\N	\N
68a99e8d-002e-4c4f-9e8b-08a3c25e13e6	2025-06-07	Target	0.52	Uncategorized	\N	f	{}	30d3fdf133f49481cc93811145a991d947fa532e9b7352cfd4ca9a708daf5b1a	f	\N	\N
23c517d4-9c97-4e13-8fa2-f828f79dc268	2025-06-09	Transfer from Zelle	-100.00	Uncategorized	\N	f	{}	1e7052595e5c3038eeb4f17474556e480d341be06ea7dc24a5e0a95f4dee6416	f	\N	\N
bb3761f3-5701-48ea-9efd-77875cf3d241	2025-06-05	Old Navy	181.60	Uncategorized	\N	f	{}	48e665c34cb180ce9a46db0cb6c66c16a07a4ab6654e62ea61a8397d34a682c4	f	\N	\N
1b3b9ff4-aff1-4bd5-a3c0-1daf29fc025e	2025-06-04	DEBIT-DC 8678 OTF GAMBRILLS XX7925 MD	159.00	Uncategorized	\N	f	{}	fe9aa417048f98a37a51877dfe8d5ef4ed7c5af49ce796f523d981eabb7b6d6a	f	\N	\N
3fd9781c-009a-4955-8b29-994b30f35b82	2025-06-05	Chili's	72.59	Uncategorized	\N	f	{}	818ed7f341f8d85717cb23a27e6b931d17338970634faabf41326a58b4601c31	f	\N	\N
5c3ae634-e760-45ae-b1fc-4560cf7af862	2025-06-05	DEBIT-DC 4581 INDEPENDENT AUTO C PASADENA MD	72.00	Uncategorized	\N	f	{}	404b2a61a44f843ff2091022af074da0d212f627219790b72564c1e2b65e5a08	f	\N	\N
d246ca97-a1a5-4833-a7a3-79759e330d08	2025-06-05	Barnes & Noble	69.42	Uncategorized	\N	f	{}	3401290cad4c912767b9ee621a2ad2125ea44f8027cfa457d8c867caeb3ccd56	f	\N	\N
ed5e1bbd-d8a8-4615-be70-2515672d86c0	2025-06-05	Sherwin-Williams	38.14	Uncategorized	\N	f	{}	83c505d3df10297ada92a7440b7294ea4aa047a8e1e3e58f0bcd9cfa1c93d2ed	f	\N	\N
9645f889-e61a-4157-ae8f-75cd8e2999d9	2025-06-05	Barnes & Noble	26.49	Uncategorized	\N	f	{}	2673340b99b59adccbc873707651553c1d5643466e6de84d9354ca0caab543a1	f	\N	\N
e37197a5-33d6-4b68-9a65-05e31752820b	2025-06-06	Transfer From Savings -0387	-500.00	Uncategorized	\N	f	{}	915bc1f682cf7ece5f45a7a90a58db4c1a6374fbc4040a346a8d20b54cd35e48	f	\N	\N
d39ef6cc-d454-432e-97f3-300ac9aa9fc8	2025-06-05	Lowe's	259.86	Uncategorized	\N	f	{}	ddc24a89221cfc657f2c568a6e9a282672d18282c76c3040932b94a96f10802a	f	\N	\N
23dc5fa9-22da-42c2-8325-e5a85883f2fa	2025-06-05	Transfer to PayPal	15.89	Uncategorized	\N	f	{}	a5ea354230e9e794487c6141f6cea499dbfc95974a4960058c028241ed6be31f	f	\N	\N
c407d51a-3d55-420b-aa3f-430bbecc6b80	2025-06-04	Sam's Club	48.80	Uncategorized	\N	f	{}	e260a01d45717a315b4dec43f84d7cec0f61ed2165b1f9a04844c3f36dae0bc7	f	\N	\N
1f67b01f-7f5b-4c13-b3c7-a8ccd9dd383d	2025-06-04	DEBIT-DC 8678 CKE*TOASTIQUE COLU COLUMBIA MD	14.84	Uncategorized	\N	f	{}	27077fab4ed6233c48ea61d4dcf2820ca4dd27bc97946687aec24981625a40e8	f	\N	\N
aba4577d-2211-4955-967b-096dc4d6ce6a	2025-06-04	DEBIT-DC 8678 OTF GAMBRILLS XX7925 MD	14.00	Uncategorized	\N	f	{}	abc6baffaff8f281218e5d424315ea79f9480817c60e1f0a816e48dc3b8cb7d1	f	\N	\N
3b5ddfde-ff77-4162-8bc5-07a3807fb98d	2025-06-04	Rise Up Coffee	6.09	Uncategorized	\N	f	{}	0704aae8ddb53ff742541a05cc8c4e97f39cd8c4c05e569cb38b48c044f37c5b	f	\N	\N
6486ae9b-65e1-4af5-a81f-94e8ff7971f8	2025-06-04	Payment to Chase	2460.51	Uncategorized	\N	f	{}	98a498991127bc8a7f87d723189569b0ca3f00881589ef5b032a12a9b5369fc9	f	\N	\N
665f9ef0-ba29-47ef-a98c-1af914213378	2025-06-04	Payment to Chase	491.62	Uncategorized	\N	f	{}	e0cc491e2d74d68edebc8b46700e7c908e07961c59201123d7d8f1de5b12b802	f	\N	\N
f527f2b2-20e8-41d8-a3a5-788b06c5de69	2025-06-04	Payment to Volvo Car Financial Services	485.88	Uncategorized	\N	f	{}	683694b91c3e6cc287f62fb5b1c16a218b8141d12308d7176aa855d3902cc41d	f	\N	\N
ff9d1559-92a5-4a30-98b9-d3406df201bf	2025-06-04	Payment to AT&T	206.13	Uncategorized	\N	f	{}	6cba5d9fbd6e43993806c4ff4b20f5ac01cf6240b20c7c6de43e3481871ba14c	f	\N	\N
dc225a2a-3f28-44b9-83bd-afaee3fc800b	2025-06-03	DEBIT-DC 4581 ANNEARUNDELCO-UTIL XX-1144 MD	268.18	Uncategorized	\N	f	{}	2316b5b06de33b47af3d21c18e95cee946ad3a3009130ef866badc476d406b34	f	\N	\N
5eb448e5-e230-4f36-8352-58bd644a4ade	2025-06-03	Wegmans	138.76	Uncategorized	\N	f	{}	a60c28ff1345635cf8f1eade7afdbc2bf68269b3451c472525c91acb906c5692	f	\N	\N
a7619068-d6a5-4cb5-999f-cc0b8eba9024	2025-06-02	DEBIT-DC 4581 MORNINGSTAR STORAG XX1626 MD	91.00	Uncategorized	\N	f	{}	4c54504c2ded59789d18ba4264b36ea87f064af519f9721fe74c2f1f2389a610	f	\N	\N
ebef7052-965e-404d-9887-87d6521f55ef	2025-06-03	DEBIT-DC 4581 ELITE BOXING & FIT WWW.ELITESFN. MD	10.00	Uncategorized	\N	f	{}	84389420afa1092a6b2f54d39b384a72d7c9a7f12bb930a57b7451684b88c355	f	\N	\N
823459e7-8c3c-42d7-98cd-4e2841ac639a	2025-06-04	Transfer From Savings -0387	-3000.00	Uncategorized	\N	f	{}	db5b071e0d91ff5fc824d7f7e9b4a4335380c212a06adc6ddf90ea2cefcba0ac	f	\N	\N
703f1686-cceb-41d6-b16a-cd38263118aa	2025-06-03	Jpmorgan Chase Bank	2239.11	Uncategorized	\N	f	{}	985c90bb14357d17eb89e9e09a8cc955894382ebbb0d8a23052284857fd22a91	f	\N	\N
a6c5f721-0942-493b-8670-fc0c349c5771	2025-06-03	Transfer to Venmo	25.00	Uncategorized	\N	f	{}	90d3621b1244b7a96ffb7b1c3cb42746d27ef4d09c2ae691ffa5d49f27479d44	f	\N	\N
cd57c586-a94c-404c-8df7-83181c4cbbde	2025-06-03	Transfer To Savings -0387	2012.01	Uncategorized	\N	f	{}	7a23bd1a4ff85d6027434f9b78ccda27d6aaf2378eacf942515d955a16f20f83	f	\N	\N
45cc8b6b-c5f9-4249-9d8f-09985f70528d	2025-06-02	Ulta Beauty	216.24	Uncategorized	\N	f	{}	7d63c5201ed593a19ec99b49819d0b571baa7f288ee45a8e0de8fe1ffd80ee0d	f	\N	\N
e46ecd9b-b862-4f53-be99-584679b8c371	2025-06-03	DEBIT-DC 4581 SP CELEBRATE US CELEBRATEVITA OH	50.08	Uncategorized	\N	f	{}	b1559515601d59834f953fabb0efbda8fa2a37f32829c59bb3a4f75f11d9694e	f	\N	\N
027d1b9b-3858-41af-851c-ad1d7a5237a3	2025-06-01	Kilwin's	31.00	Uncategorized	\N	f	{}	bf9bd1e7fa77ab88635495c0559b60451408cd9548875408dfa7666f5a52f50c	f	\N	\N
a2c51d0f-fa62-4829-acce-b72bc98a611a	2025-06-02	DEBIT-DC 8678 OTF GAMBRILLS XX7925 MD	14.00	Uncategorized	\N	f	{}	3b59edd8acd98fb89006e75460f7712be47ce822f2d64b1f497bbad99f38913d	f	\N	\N
a72fe023-3f01-4ab0-9181-c4d55fda8d64	2025-06-03	Transfer From Savings -0387	-5000.00	Uncategorized	\N	f	{}	306b26608973a9c489a9a71422a109292265c7df6ecf4722387510203ca9589d	f	\N	\N
daacda4b-c59b-4429-9608-fd1772da4b05	2025-06-02	Payment to Apple Card	593.89	Uncategorized	\N	f	{}	7950607a1cdce3305a67d49bdac079e20b61fac3cf67cf617de8bd88bed4bad1	f	\N	\N
193ab9d6-c632-4293-b3f0-38ed1db3b36e	2025-06-02	Payment to Chase	150.00	Uncategorized	\N	f	{}	592bb8866ef39f693d0469d08d38b5fbbdf7ef127525df6cb3cecebc0354d279	f	\N	\N
983516eb-88db-483d-a6a6-decf90c94ac7	2025-05-31	DEBIT-DC 8678 SQ *TIME & AGAIN A PYLESVILLE MD	167.48	Uncategorized	\N	f	{}	cb1ccba468bd7980e598041e20c61667094a0b38988520191d6b6326b3e8ed72	f	\N	\N
6beee955-ed98-4b09-b679-72fea006e111	2025-06-01	DEBIT-DC 4581 ELITE BOXING & FIT WWW.ELITESFN. MD	155.00	Uncategorized	\N	f	{}	1ed5bdf8f610c9ce70c71fa021d8c27a564acfd49df3461cce52881846b5bf25	f	\N	\N
23f907c5-2c6b-4e72-8b3e-e881dca3a19d	2025-05-30	Unleashed Brands	130.00	Uncategorized	\N	f	{}	532da408418399eed323bc672a523830d388bfd3ec8dbfdb3feb3e1ce705028f	f	\N	\N
5859b3ff-4265-450f-b025-cf8587c00282	2025-05-30	DEBIT-DC 4581 TST* STARR - ST. A WASHINGTON DC	124.41	Uncategorized	\N	f	{}	90a21c88ec95e5af8a9ca7eb375c43f1113b058ca28b0a4cbfead2fbd49cbb4f	f	\N	\N
6f82d441-aae7-4feb-a6ef-441a312b114c	2025-05-30	Rangoli Restaurant	106.12	Uncategorized	\N	f	{}	590a1677ff5f72894a1f4e6028a6c35e289cef08dc6e7450cdfc577a8576e74e	f	\N	\N
5caac85f-c5bb-4854-a75a-d163b2eaf1a6	2025-06-01	DEBIT-DC 4581 CHESAPEAKE BAYSOXX4811 MD	83.72	Uncategorized	\N	f	{}	685f89ec4dc4c13264867dc2135ae36b003f3ace59a37dfe9b0201f466fc5052	f	\N	\N
551bff5e-99b8-4a27-8767-6ee0fc964440	2025-05-31	Target	68.76	Uncategorized	\N	f	{}	7a09412be545a39e33fa390ebbf6a773dda7b4898859cfe11b699fe5ce2b5461	f	\N	\N
10d3e2b0-2e1e-48a5-b54c-a99b65a0b481	2025-06-01	Peloton Cycle	46.64	Uncategorized	\N	f	{}	d7be3b9f0d202b37c2579451d914057a59e9bb5b6af7ee0048e7f9a568c183cf	f	\N	\N
2d1ded8c-70ba-4354-a786-d4af93970ebd	2025-06-01	Sam's Club	38.20	Uncategorized	\N	f	{}	c225a8c05782f87ea9074a23c43c286ef74539dbb39ac412547a01e64bae84a5	f	\N	\N
0a7feae7-ee73-4178-9347-53fd5f6eb9d2	2025-05-30	Target	25.76	Uncategorized	\N	f	{}	7aa5ae03aafd4ead0079ef9ea2ee78ecef1fda9e689443a86ddc93d9235206d4	f	\N	\N
5facc913-7b43-4f09-9753-7a1a9efb978b	2025-05-30	AMC Theatres	14.40	Uncategorized	\N	f	{}	8a3eef5b5ec1590928d5d4616189b1cfe0edea688b546e5076142b1c086f9723	f	\N	\N
a0ab9e31-4a88-4528-85ec-54982b90522d	2025-05-31	DEBIT-DC 8678 SQ *THE TEA TROLLE DELTA PA	13.90	Uncategorized	\N	f	{}	77828eff3f5bc31ecbf43b75bedf889a4735fcf2c4ddeb3fadd262c74f94b300	f	\N	\N
432d0bc6-a64d-44d7-bb60-996a4b93fec1	2025-06-01	Apple	2.49	Uncategorized	\N	f	{}	a3d2d99b772e3b51edb99207fa396db150b265355701b1dcd512e941e0103961	f	\N	\N
fa8cb79f-6d38-4783-95db-a074add66b5c	2025-06-02	Transfer From Savings -0387	-600.00	Uncategorized	\N	f	{}	27dc99316cd3c423dc14f2682094a9a6a9ef8d1c6f3dc08b10ea7bcbbd03ca53	f	\N	\N
f0ddf14c-ae16-41ad-bcba-5aa3a7d36388	2025-05-30	Dividend	-0.87	Uncategorized	\N	f	{}	b582d99696f64de1333a6a81b1cef79f320ae18b0d2cb898ceedff71a2675731	f	\N	\N
b77603b1-6fb1-455d-aee2-12dbdb3f9124	2025-05-30	Payment to Baltimore Gas and Electric Company	266.00	Uncategorized	\N	f	{}	c7a4dda327191c28da530ade98fcd7d1443b3b5d6850f1b26a03921fc3d5a887	f	\N	\N
5e6e5e74-3268-4939-8621-b76c0bbeb8d4	2025-05-30	Transfer To Savings -0387	1000.00	Uncategorized	\N	f	{}	c3cdbb1c956d4b8591bbe683bb5101c413c4ca89e14fa10449787ba930d32a68	f	\N	\N
97f45aed-9015-410c-a0a4-9b6b8d9639fa	2025-05-30	Transfer To Checking -2740	850.00	Uncategorized	\N	f	{}	286765da01601eb3e94ff9c4d3dc8b2c8115ee8875708a65eaf4b48501e633b6	f	\N	\N
3ff92521-e38e-4c98-b104-312e05c78fce	2025-05-30	Transfer To Credit Card -7148	575.00	Uncategorized	\N	f	{}	30784dd74b537df6d9f6386b466094fa988ccf6b2e61ab777d46f9e5b113f57c	f	\N	\N
f9f97587-82d6-438f-8954-772db024b545	2025-05-30	Transfer To Credit Card -7148	150.00	Uncategorized	\N	f	{}	d51e7233ebda304ac9b6fa3f46cf04b197a92886236440d41290128871a906b4	f	\N	\N
fd122876-8f0b-4f20-96aa-1a1135a30378	2025-05-29	Apple	38.15	Uncategorized	\N	f	{}	b6ed3b2ba6c07812ba0bad4cbd3cfbecd5007bd5fbd469add27ecb67af8ccbea	f	\N	\N
7f94f2dd-e5e7-48e7-8a32-8433df82cc55	2025-05-29	REI	18.43	Uncategorized	\N	f	{}	28dd2b81316943c38bb8814c5049500d9663bf3ec98d4123db8c56839bf7032b	f	\N	\N
8b79cd88-03d3-4123-9475-01fe146e61fb	2025-05-29	ATM Withdrawal at Chase Washington DC	203.50	Uncategorized	\N	f	{}	c10b763ef88d509a88da1ea167d4d2f4d01fc9182b0c7775e0d240ff345f4443	f	\N	\N
b8d56db7-aade-4697-b2ff-667ac8cde3ea	2025-05-29	ATM Fee - Withdrawal	1.00	Uncategorized	\N	f	{}	60186db54768c6cb75d623ac9b02cfed94489e345865ee91862fc7aaf1e5082f	f	\N	\N
4ca5f791-d508-416c-b83a-2358c4c20073	2025-05-30	Transfer From Savings -0387	-1000.00	Uncategorized	\N	f	{}	d50317aec7b8180cca23226df4c6c5a19656ae913559462051c605187e84e686	f	\N	\N
f076ec33-51ea-4635-89d1-217ce4131b14	2025-05-28	Sam's Club	32.20	Uncategorized	\N	f	{}	233ea931fb432e00f4349e072dd40e3d211f7d7f7d2f14747f82331ad33320e5	f	\N	\N
445e845d-83e2-49b0-9fa5-77fd27311a0d	2025-05-28	ALDI	10.05	Uncategorized	\N	f	{}	47be621deda7125afcfe95d6a7d7cb1a58a25efe4d14b45d7d069f9bd5a17d62	f	\N	\N
7ab6e1be-a031-4b5b-ad4c-692b3f408000	2025-05-29	Transfer From Savings -0387	-400.00	Uncategorized	\N	f	{}	8e18e5562719c2399acb6c8322c45130de9511d09cc36a066c2e00cf4d0d1177	f	\N	\N
db52ba73-1d71-45b2-acc6-7d6e28501cd1	2025-05-29	Microsoft Deposit	-4690.29	Uncategorized	\N	f	{}	9384d4807dfedae0f1e0b74378fa18d4eb91ee7bd5488513c19a671406d0338f	f	\N	\N
556f8044-be30-4a48-9a9c-011d7f9a8051	2025-05-28	Payment to Citizens Bank	88.12	Uncategorized	\N	f	{}	4db3810c489efc6ce373afe5e89db1ece5ee57833d21ba6837592e223a8e2942	f	\N	\N
bf22ce23-ec5b-49f5-abdb-c2e367fa9fac	2025-05-27	Peter Chang	16.00	Uncategorized	\N	f	{}	ad23a8ffc0efd9e7aba4c63bf7cdb4a9f0b46ed6dda77bfb3eefc2cf632f8726	f	\N	\N
ee67e3ce-eb4e-4ba3-b299-e0f429f255c7	2025-05-27	Target	1.05	Uncategorized	\N	f	{}	6e327dc9ae73e550a3910c8f30ee8d52662b3e6ba824526b0771e3594ee61fc2	f	\N	\N
f7f7c7f3-d60e-490f-86fb-6d0590000dfa	2025-05-28	Transfer From Savings -0387	-150.00	Uncategorized	\N	f	{}	165abcf8a8f724b9b01b27c650cee6b9a3129f1c7d9591752a57f45eef06f74e	f	\N	\N
7be6c946-b6b0-47f4-9332-6c6e28734016	2025-05-27	Transfer To Checking -2740	50.00	Uncategorized	\N	f	{}	494fe24507d40ce1d8a30c53d0a55e3cb5988d6f0a9f83eea570ab00bdd2d009	f	\N	\N
7d4b468b-fd87-458f-8982-5726c0e78af8	2025-05-27	DEBIT-DC 4581 COOPERSHAWK XX-5674 IL	44.99	Uncategorized	\N	f	{}	05c89f4ee048fcd81ff94df3de6b1082dbadf3f4488297edb5327c0be0f45265	f	\N	\N
c21a6780-2e98-48f3-bed1-084df968e284	2025-05-23	Royal Farms	42.40	Uncategorized	\N	f	{}	02406c4985a29c712214aed5c73dfb67a482f32ee1c4e819fd2b5092f6696707	f	\N	\N
80754047-44f0-45df-84c4-a79f16f911ef	2025-05-24	National Aquarium	39.95	Uncategorized	\N	f	{}	a88fc8364bfd682f3f1bc9f368d21fcaa30f9b0570c16ca0a1176cc8393ffe12	f	\N	\N
d8705749-d274-4dc9-ad13-b3505aeabf31	2025-05-24	DSW	37.08	Uncategorized	\N	f	{}	a9f08841b9db5b6ac602bb6faee99f0ebb8b319db90cff65a5aad798b5fbf815	f	\N	\N
d82f7cae-7e04-41be-8ac4-5e8990a043d4	2025-05-24	Thirdeye	26.49	Uncategorized	\N	f	{}	14c8619e8e3167f89f57c89441dfc269aa8ae26ff399d242f244fef492ef3c31	f	\N	\N
2cfb4479-aab3-4d8c-8a70-a7422842abf2	2025-05-24	Hobby Lobby	23.30	Uncategorized	\N	f	{}	13b4af9d20c9a5100299cc5d07f1d9b88d3bbf086c7082382c85c66758383ad2	f	\N	\N
b706b4d0-7696-476b-81bf-32bb5914f33d	2025-05-23	DEBIT-DC 8678 TST*MAMA TANAS FRE NOTTINGHAM MD	12.70	Uncategorized	\N	f	{}	e41d51fcfd8afb73d25cda75351351038d43f6a4beef3d99a0763f01046cbf70	f	\N	\N
a47ac080-9a9d-4eff-aa7a-aa5544208a54	2025-05-24	DEBIT-DC 8678 SSA - NATIONAL AQU BALTIMORE MD	12.17	Uncategorized	\N	f	{}	2713e59da1546ec7364a3e632ae8626eefcd64f9221a407ad26f9e01137134e7	f	\N	\N
ede16778-cb05-4685-919c-d47565440ea4	2025-05-24	LAZ Parking	12.00	Uncategorized	\N	f	{}	4b67465eac59d925c5f2016105f3cfd0660cbb1aa2f1eef91b88f685efaf2de6	f	\N	\N
2123d441-bc33-4a24-a0e4-10ca3801f12c	2025-05-25	Royal Farms	11.82	Uncategorized	\N	f	{}	33a12de81fc719c860b3cbf00409afc0ec25cf708e5d5a777c68ef2813308958	f	\N	\N
bb9a8d66-cc09-4b46-8bde-a0b1811374a2	2025-05-23	Chick-fil-A	10.89	Uncategorized	\N	f	{}	6303ce4f8130790d98cbe4c119cf39670d1534a5cda35b558903ed2142e9c226	f	\N	\N
b5aa2b1f-e5d1-4931-b84b-da392c96cdfb	2025-05-24	SpotHero	10.75	Uncategorized	\N	f	{}	35477e35c2f4a6202e2b7ca10ffefd40c91902608d7db5c15a7432534842341f	f	\N	\N
37694c04-c94e-4d46-ad5b-b44d1af043fb	2025-05-24	DEBIT-DC 8678 DUPONT COFFEE COLL WASHINGTON DC	8.47	Uncategorized	\N	f	{}	0b4396640de3a146340a136fa3ca3c5c091fedf0eaeedb8f5620d4fa01c19486	f	\N	\N
8350a423-da2b-413a-9890-946b45df932d	2025-05-24	DEBIT-DC 8678 SSA - NATIONAL AQU BALTIMORE MD	7.62	Uncategorized	\N	f	{}	12235e0334fab443c671cea46fd0c627e00c5e297eebc46e3fcb3be91384509d	f	\N	\N
3a8a51e2-3b40-488d-b9c0-481cfc9d79c9	2025-05-24	Dollar Tree	2.65	Uncategorized	\N	f	{}	73c019af4a95ae7c8bbded11cf3fe6dae8c8542f4db71b660e081f1dbf1fc4cd	f	\N	\N
d440f17f-107a-437c-b8b0-0000de49033f	2025-05-23	Wegmans	1.39	Uncategorized	\N	f	{}	a4fd1b1637110d368903594af29b54b185c81fa95ae8d69eff40edb9f3bd2d15	f	\N	\N
0567e2ea-a2e5-4d86-8102-c152fe97c0a7	2025-05-27	Transfer From Savings -3298	-50.00	Uncategorized	\N	f	{}	7db8eb80f5efba1b701b414074a61d095ba6de303906aa5b1fa9b58c3b058632	f	\N	\N
17c77acd-bc7c-4bab-a069-318b0d0d8d4c	2025-05-22	Wegmans	93.68	Uncategorized	\N	f	{}	bffea0f740719a21a7cb418aedec6069bd5c8e7486884f3a34fa90cf873011ec	f	\N	\N
1687c856-8732-4602-a5e1-28b51f29e7d3	2025-05-22	Netflix	8.47	Uncategorized	\N	f	{}	b2527a952c0bf9e7fb9fe5bafd5d30d774c4e78f0016f80e4c81151d6a2359c1	f	\N	\N
fe071490-aaae-4efe-8515-d9d15c87e32f	2025-05-21	DEBIT-DC 8678 UMMC MIDTOWN - PAR BALTIMORE MD	3.00	Uncategorized	\N	f	{}	6024109d1295ea9a721151f6c0b18a9c8933089ee78efee2a53c0845454cc6b7	f	\N	\N
99cde186-6f37-4771-9496-fc61bc8a70ef	2025-05-22	Payment to Liberty Mutual	260.08	Uncategorized	\N	f	{}	46c1c18ae92e7ae93b4bf2e48f34618eccb04f0eb79e11bb859be96e848be0b9	f	\N	\N
f008e5b1-520e-4249-beee-357189155764	2025-05-21	Wegmans	21.10	Uncategorized	\N	f	{}	ddd22ffb26664001e48608ab00826df37a6eb5bb22d45f467d5bf1f528aa3920	f	\N	\N
86f460e3-de89-4a65-a8c2-a21c90f1e6bf	2025-05-21	Zagg	18.46	Uncategorized	\N	f	{}	8e659a872cd4e6387a0d85ae6848f1feefa569f3a176ae1d3dba42dad6941a03	f	\N	\N
001c8124-70c3-4b4a-bb28-d312401cd0b0	2025-05-22	ATM Withdrawal	100.00	Uncategorized	\N	f	{}	9e58d9f39c79d397b2e417d927760ea11b57997569ba3ec1b7ab43ebab0eab82	f	\N	\N
3d5e2c44-8467-4181-a980-5332789dcc12	2025-05-22	Transfer From Savings -0387	-300.00	Uncategorized	\N	f	{}	144248a57d716cd784301fd990e55a5796a14d6e9f73017ca916a34a670f385d	f	\N	\N
be1dec5b-ca19-40fb-9495-f19130292b9d	2025-05-22	Transfer From Savings -0387	-252.49	Uncategorized	\N	f	{}	cd26844833e402d18b4a8bdb5f9d1943d6d317f44fb7404ee7d107263059d7e0	f	\N	\N
b66c316b-0287-47bf-8444-24c7edfa3377	2025-05-21	ATM Rebate	-5.00	Uncategorized	\N	f	{}	599e50ecac2428b3e531a943ff7075b72ccca5cb086745d82900b07058706e97	f	\N	\N
726fdc92-bd5d-4270-b702-cac3963f3cda	2025-05-19	REI	511.04	Uncategorized	\N	f	{}	7e1ed93a9aa7267ed6bb542d92b922a575fe4ea10018edebc130b675dc5d6b4f	f	\N	\N
8f7e17c3-1c4f-40f6-97a8-21e93efad01b	2025-05-20	REI	268.39	Uncategorized	\N	f	{}	394f327f0a733ed4398dbea50ba601d1bb6c04ed0a3c32c9599425a0772c9202	f	\N	\N
970266f7-94fd-4882-b337-1bf9169ef74d	2025-05-20	Sam's Club	50.81	Uncategorized	\N	f	{}	8ec4b410db4e4b958406c8cdf40e94a2fc20286d1ae3a3168ceed0d6070fe754	f	\N	\N
ac5279e0-dcab-45d8-ae85-21c31ccd503f	2025-05-19	REI	41.07	Uncategorized	\N	f	{}	4cd182b2215c6cfd21c7e54b13b9a733859faf55f38f14f501b86f3ee74a287b	f	\N	\N
e287410f-f998-48fe-bd76-1ae29ccbb709	2025-05-20	Wegmans	11.18	Uncategorized	\N	f	{}	a6ec7b36c797b673784eaa177c95ea70815b5eba3361fc2259ef3bee5fe209da	f	\N	\N
a9bb1228-35d8-4850-8073-d9cabd779e12	2025-05-19	Wegmans	95.32	Uncategorized	\N	f	{}	b39cc179c381c7b9a97507032e59760358619d9fb5e6b2664b08cef8bf917ef5	f	\N	\N
7784cded-13e0-4660-a81f-e62bd790d81f	2025-05-20	Transfer From Checking -2740	-400.00	Uncategorized	\N	f	{}	294ec2d7e864f33afb2f11dae573514778fdbbd250aa0de08320b572e241289c	f	\N	\N
56fd1cf5-d0ec-4192-84dc-150a8bf435fd	2025-05-19	Payment to Service Finance Company	500.00	Uncategorized	\N	f	{}	fac87187eb38a5fd15829b36042fef1351df7312eb6f08b1fbf6bfaa467dddc6	f	\N	\N
d8735057-d35c-45ce-8ed9-0ad80a6050e5	2025-05-17	DEBIT-DC 8678 TST*CONRADS CRABS NOTTINGHAM MD	130.00	Uncategorized	\N	f	{}	59ca3cec70ab06dc79e85724e14de58dd174c12c5ef97c62cb12fd93b7245396	f	\N	\N
757c6485-10c2-4ec8-834a-5f803ea51a62	2025-05-18	Costco	100.69	Uncategorized	\N	f	{}	5967b379adbea1137d7cb76801fa3bf76ecee4cf62495412ecb6508c19c14641	f	\N	\N
01cecc6e-895c-4a97-9944-fd80c6dd5545	2025-05-16	Transfer to Zelle	100.00	Uncategorized	\N	f	{}	220c2394c02c8f0d1ea8a294d4d74a83a5fb4cb2f99d9bd93627a879b6ebda51	f	\N	\N
258bab24-1dff-4389-86a0-d67a1ba0aace	2025-05-16	Amazon	63.55	Uncategorized	\N	f	{}	9ea6159a6b36739e57865aebecc3189c733b2a2336c557ff65297ba6c278d5ef	f	\N	\N
80c1c01f-f771-4f80-9628-e84e2d86c8a5	2025-05-17	DEBIT-DC 8678 TST*SCITTINOS ITAL CATONSVILLE MD	39.00	Uncategorized	\N	f	{}	e33c12162c4fde94f7b1aa8439f38346c9c55cf81d4a97bfc6bf8f36ceae2312	f	\N	\N
c5e471e3-7172-47c6-a832-296bf423e9c3	2025-05-17	DEBIT-DC 8678 BRUSTERS REAL ICE GLEN BURNIE MD	35.21	Uncategorized	\N	f	{}	81bb4f305515cf5bfa36cfec3c920eadfd7e4f3fd4a6228a0ccf2b2008b603eb	f	\N	\N
b0127542-c99e-413e-9e87-7570719985c3	2025-05-16	Amazon	27.55	Uncategorized	\N	f	{}	cf65edca74ed1047c788172e700887e1932307ff70e27b0b24e97bd699e55b28	f	\N	\N
e11309b5-3a33-422e-ba92-c63be0ddf83c	2025-05-16	DEBIT-DC 4581 SFAM-F&B UPPER MARLBOR MD	22.00	Uncategorized	\N	f	{}	e50b7002e5b335569b2de7371ee98c57198b8ec0a833ba502fdbfd84262856e0	f	\N	\N
bcae0857-2369-44de-9d1e-b70498572c3b	2025-05-18	DEBIT-DC 8678 TST*SCITTINOS ITAL XX-3569 MD	21.77	Uncategorized	\N	f	{}	1928eade177bc9e0e78388e3a0ff9eb1d162a37fae6704fb415d84c1756b8cf2	f	\N	\N
2cf7d566-18d1-43f1-8304-e86f8485d903	2025-05-17	Starbucks	20.00	Uncategorized	\N	f	{}	16386bfc9588a6a35a894dfec287839865868a494a754a3a495622f1bd8f40ac	f	\N	\N
8652d6f3-9bce-4a3e-b29f-1bd56657b642	2025-05-18	DEBIT-DC 4581 DAI KIM GLEN BURNIE MD	17.49	Uncategorized	\N	f	{}	bdffb4b327d1e7b4aa7183c923bcd23955e0c824b4e8e8cc051223fec5727c0b	f	\N	\N
0caafa7b-e2de-4468-b27e-4fcef65205ec	2025-05-16	DEBIT-DC 4581 SFAM-F&B UPPER MARLBOR MD	11.00	Uncategorized	\N	f	{}	53c3ef1ecd6325c5df59844a5f070eed1969e26074a4f522ae38bd447de1702e	f	\N	\N
2862d964-03de-46f6-bc2d-6f43169c2d81	2025-05-18	Apple	7.99	Uncategorized	\N	f	{}	2fcf1af0d309eb15e4e7448b80fa40d0b76a5c464c74836c8ff429f38743fbde	f	\N	\N
c92d57e5-0a0f-4c10-b33b-f00e6828c834	2025-05-17	DEBIT-DC 8678 SQ *DIABLO DOUGHNU NOTTINGHAM MD	6.10	Uncategorized	\N	f	{}	a9ba285e21ff8aed43654935830b4daedf1aecde3c04679879591eb5b5365336	f	\N	\N
34b235c3-ed0e-4071-b8ae-87698fb9832d	2025-05-18	Dunkin' Donuts	5.30	Uncategorized	\N	f	{}	9f9642ad228eb459d58efc404cbb4b676fa77beaeb89c8275b92acfbdfe9c869	f	\N	\N
c6a7c673-7b3e-476b-956a-69dc7d54d463	2025-05-16	Target	5.25	Uncategorized	\N	f	{}	aff39a740211063f8aa11311026291395d53a5a645f149088291c474354d8998	f	\N	\N
5d075d1b-0c28-4c94-a688-3f6f2ee74910	2025-05-19	Transfer From Savings -0387	-500.00	Uncategorized	\N	f	{}	d4b9b60b66a6d129b0b6514352ce3c931a308f0007a63e9e269b3e980ef429c7	f	\N	\N
2430f4d0-1162-41f3-ab07-673f43aff687	2025-05-19	Transfer From Savings	-71.07	Uncategorized	\N	f	{}	c778073bddb4fab695dc7d295656e5c10d9198467bd2559eff1a39b2b74693b9	f	\N	\N
2dfc062e-126c-45b9-8fa3-3e122cfc0c92	2025-05-16	Toyota	900.00	Uncategorized	\N	f	{}	c3f9b44f639a74b665560fe46af4b3e4eaa5a9b64539fd928040a3b990bacdb5	f	\N	\N
7848e25c-9ca5-45e2-885d-929c80dae107	2025-05-16	Payment to New York Life	616.54	Uncategorized	\N	f	{}	76c35889d30ecd7e9f67cae4477477a7b87ad9b9626283a7b6a6b9e9955e6cce	f	\N	\N
fd85ed77-d49b-4b2f-8d95-4bc899f86bbf	2025-05-16	Payment to Discover Bank	398.00	Uncategorized	\N	f	{}	bb4de345892bd75691934fad2af7774858a60e330ec5a75a434c279f2912b9fa	f	\N	\N
2f99ed3a-68b2-41b5-a953-2d192ecb9ba6	2025-05-16	Payment to Educational Computer Systems	100.88	Uncategorized	\N	f	{}	f7fcdb6442f77960ece69f643f8295c54a119867e1e05adaf28efb77658db313	f	\N	\N
b419c3d8-67df-428c-856a-3e8a5acb14e1	2025-05-16	Transfer To Savings -0387	1000.00	Uncategorized	\N	f	{}	758eef53bc828d24dd878e40a342b473c6b7a9ab3ad5767c7f91cc4bfeeda076	f	\N	\N
a7b04357-70d8-4869-b386-11b2a23f9a32	2025-05-15	DEBIT-DC 4581 KENT ISLAND CRAB C PASADENA MD	50.46	Uncategorized	\N	f	{}	c36511d12154077a246fa070ef4cb352b91b43027147315f06370b30b7f2e85a	f	\N	\N
4bd97660-80a1-4b52-8700-fff09abb086e	2025-05-15	Popeyes Louisiana Kitchen	45.94	Uncategorized	\N	f	{}	43198a168ca3d69d647fa37dbb97ebbcb565b0299a07829a766e27f17d3b3c2d	f	\N	\N
e07af85e-821f-4aad-929f-2b42185d2083	2025-05-15	Transfer To Credit Card -8715	500.00	Uncategorized	\N	f	{}	f98ff584b8a8d419cd9c91a5e081828d356c1af3eec1ee1a9d519bf8f934744c	f	\N	\N
f25f4d7c-fdef-4a4e-acc1-f56a25e5b26b	2025-05-14	DEBIT-DC 8678 OTF GAMBRILLS XX7925 MD	15.00	Uncategorized	\N	f	{}	29dbd69ace5bebb07dac9c38f6e839c67b899c32b86bb16ffb4e1621fea3d63a	f	\N	\N
4ede2c1e-e0e8-4eb2-9668-02b00c333860	2025-05-14	ALDI	11.95	Uncategorized	\N	f	{}	b7b48aa7ceeb05e1ec20708ae8ac7a44e39a4aa8fa288f8f09b206b42823ee45	f	\N	\N
451838a5-9f1c-40fd-85c9-c9bdeac03847	2025-05-14	Giant Food	11.75	Uncategorized	\N	f	{}	f5200400821caa8c8e65c13908f7933f432a6ccbb04499a8dcd46862aa361fcc	f	\N	\N
4c410289-82dd-4459-88b5-fe6bb0180462	2025-05-13	Wegmans	78.30	Uncategorized	\N	f	{}	9c69a89bee4a96f7f77f65a0153d048905785ace8f4888a2b00502cf5a15ea2d	f	\N	\N
7a82f9a8-1009-4349-8feb-ca410df8091f	2025-05-13	Target	25.44	Uncategorized	\N	f	{}	e98cd570b9a0970fbd6033529a566c65554d4650dbb0c51d0cd08c5a9a35e761	f	\N	\N
a0298560-31fc-4c7c-b9ee-fb0c22fa7f8a	2025-05-13	Wegmans	5.99	Uncategorized	\N	f	{}	6245208c45513a9ffd5e386648f806e545d471d00aee49b0ffad80bf1b96ba44	f	\N	\N
7f725f9c-be28-486a-ae36-41ac4b5b70bf	2025-05-14	Microsoft Deposit	-4690.28	Uncategorized	\N	f	{}	e7f7acf4e9b575ab360a6f4ba15557afd2aed73d435b4940630957f484d1c060	f	\N	\N
de0c850a-0208-43e0-a68e-3b10e1f46efb	2025-05-13	Payment to Verizon	94.99	Uncategorized	\N	f	{}	71604ac07243508ae12f7f8476ed289231898dbc2e77e3364504d2c38b51fb5d	f	\N	\N
f376ecea-5783-4274-b687-f6d36df3d8c2	2025-05-12	Giant Food	99.99	Uncategorized	\N	f	{}	b321f7409c453967ea2fb5bef60ca3127236ad36c0d6c2103c9eb9da3ef4dc2b	f	\N	\N
c80320d0-5c9f-46d5-b10a-6f71ec35fc0b	2025-05-12	Transfer to Venmo	3400.00	Uncategorized	\N	f	{}	d55144c661998e7a2ace733c7739c515ce0b5c56c1d72c7b185650f980c757fa	f	\N	\N
271d0e9d-2be9-4388-ad78-83fdca2a26ab	2025-05-12	Transfer To Savings -0387	120.54	Uncategorized	\N	f	{}	68707908a7e9703eeb808866b0406e1004522918c553ca56dd8fbe692bfa9ca0	f	\N	\N
88f56d49-ff7b-4e42-85a1-18d551022a6e	2025-05-10	DEBIT-DC 4581 RIDGE WINE & SPIRI HANOVER MD	154.08	Uncategorized	\N	f	{}	fecaeabbb35ee2d892b28685240907f7491c5e6fcc81236cde5baccf045a0640	f	\N	\N
f06ba5ea-be6f-493c-89d2-442c4fb42cb4	2025-05-11	The Tap Room	125.00	Uncategorized	\N	f	{}	07482e4fbcdf95cfaafaa6d45a9099e80f2d655fe73d198942bb1b13e938182a	f	\N	\N
f4015928-6783-4d2f-bf75-c16e7e4e245a	2025-05-10	DEBIT-DC 8678 SQ *THIRD EYE COMI ANNAPOLIS MD	123.23	Uncategorized	\N	f	{}	e852680e2a7aa29a6f55feef0b2cece512f4dff8b361ce62dea5b25b7c557849	f	\N	\N
89931039-488d-4449-b381-dbd984dae896	2025-05-09	DEBIT-DC 4581 SQ *OAK AND IRON B OWING MILLS MD	105.58	Uncategorized	\N	f	{}	38d5d6c46bacf77f51e1736a597fcdb7858f3f54da902e518e63f4486eb79971	f	\N	\N
afd98e27-dc27-43fc-8cff-c278b1f57555	2025-05-10	Wegmans	88.88	Uncategorized	\N	f	{}	222732a49b1a0db7eda0a83246cf06cdf88056ca3f2fa264fbe7d16a2ce71aae	f	\N	\N
4dab9b64-e583-4c27-8864-1d2e2856d500	2025-05-10	DEBIT-DC 8678 SQ *THIRD EYE COMI ANNAPOLIS MD	83.48	Uncategorized	\N	f	{}	cf9318494a0e28e42f0ac78f00675981c5a4d475e695959a02f87cb26595b6e1	f	\N	\N
e4edeb13-2343-402b-8f41-12dd1b3f0e8a	2025-05-10	Amazon	63.59	Uncategorized	\N	f	{}	6845b6999bccaaa07ee8971750f173665338a98c7b1c01f979d1d7732e4a0484	f	\N	\N
053bdb23-d480-45d0-b0f2-16de3b8a74d3	2025-05-09	Giant Food	44.77	Uncategorized	\N	f	{}	262a90de8fb2d6f0219f57a8ebce77ed2c9431bdd826a9c11b144b43eb2306f9	f	\N	\N
64684706-41fd-49db-a1a0-464d0d3b485c	2025-05-09	LAZ Parking	12.00	Uncategorized	\N	f	{}	cbea0328765bee3f109cda580bcf7f78c6894e9dcaeb7f9794daec1197b42549	f	\N	\N
3fe24856-ef77-4a27-b454-c6c6fdd2933a	2025-05-10	Michaels	8.21	Uncategorized	\N	f	{}	c22dd5922c9c1a09255ddbba0be920b5f4d7174df8b34e4e8bc08f0cba588a56	f	\N	\N
ca3bf90b-5bd2-469d-a5e6-51f906ff4c59	2025-05-12	Transfer From Savings -0387	-294.28	Uncategorized	\N	f	{}	b63c873fef612c961f118bf5e7dc07f0ae80131c28642310de8f12509f054559	f	\N	\N
af5f94cc-6a9a-42cd-ad79-6cd4ee50ef2a	2025-05-09	Lowe's	232.29	Uncategorized	\N	f	{}	cb8dce692bb3c01fe0dc93aff0202f46f9b5471e1fcca714a564b747e854bb6a	f	\N	\N
a36c5b43-f236-44a5-a24a-f3f9ec8c7dda	2025-05-09	Transfer from Zelle	-67.00	Uncategorized	\N	f	{}	2035e1b976bf5f547466a591dc87fd3b9ce45971870cbcf3b297fdcc7d2468ee	f	\N	\N
a98585db-224f-4248-9ac4-ab594d3f46b1	2025-05-05	Royal Farms	15.00	Uncategorized	\N	f	{}	625c9ba25aef8b940c7da1539a8719772e5ae17acf5e4dd603c715f0ad788c72	f	\N	\N
e6be420b-5ccc-452f-8680-1889b5471c9d	2025-05-06	Sam's Club	13.40	Uncategorized	\N	f	{}	d4920d2c2f3785f1e67846628790526166b62be3edd105b1780b15d888425884	f	\N	\N
ab1bbd3c-e72d-4a1b-b447-4375648c898d	2025-05-06	Payment to AT&T	216.73	Uncategorized	\N	f	{}	4ced03465a3b9e0a39ad8f27243c11d218f4b382fad3a5b587f3c83f4080a42f	f	\N	\N
855de158-335c-4213-90f6-6dbe83a05d52	2025-05-04	DEBIT-DC 8678 OTF GAMBRILLS XX7925 MD	199.00	Uncategorized	\N	f	{}	de2df952c9ae649c997ccf7ccf3e6826d4863317351ecdd3c3c5110917b1af4d	f	\N	\N
bbe21620-3e39-4972-a084-437ad847ebaf	2025-05-05	Wegmans	126.11	Uncategorized	\N	f	{}	3323ebfead4fd986d9f4afaa25a7b45acc483ef3fb145a47e6ef7063616ef752	f	\N	\N
a9f94dbd-a41d-44f7-b397-98edd32935f3	2025-05-04	DEBIT-DC 8678 TST*FRANCISCAN CEN BALTIMORE MD	16.94	Uncategorized	\N	f	{}	a018eae99b59c8a0c1a9b751840d5f34064ea2aa89cda6900620820b8c2c2582	f	\N	\N
ec711d8a-a417-4d2c-96ce-9165bbfcafbc	2025-05-05	Wegmans	11.44	Uncategorized	\N	f	{}	e4b2e8297e14686ba3adf2ec11c0e6e83d4033067cbfb2a91c2b32d44290743f	f	\N	\N
f2e041e9-bf0a-41b4-816b-41072c81ae61	2025-05-05	Jpmorgan Chase Bank	2239.11	Uncategorized	\N	f	{}	91a766b1822db1ab0b18dff5eaef5a9a0bbfdca880f633f3444519e8216d6454	f	\N	\N
65e41552-8353-4add-9e1c-8c39437b4acb	2025-05-05	Payment to Chase	250.00	Uncategorized	\N	f	{}	7cf78f28f990fe1edf3e4539dbba201329b93eca9a69698fc360da2893d39c7a	f	\N	\N
47efbf55-69ab-46cb-97c8-6960a35ff47d	2025-05-05	Payment to Chase	100.00	Uncategorized	\N	f	{}	bf09714512241c22a0209e6f29d440658b33b197793dee4a78f6626d0f492db7	f	\N	\N
ac902e1a-c9d0-4a16-8d07-96e6c7a51df9	2025-05-05	Transfer To Credit Card -7148	100.00	Uncategorized	\N	f	{}	e7a6cfd3555b79235658a935f68a74d5a16da9ad9abc372bd4d0f3bb648ea469	f	\N	\N
c7f5d1ec-3246-4ad1-80e7-854dce52a57d	2025-05-02	Airbnb	118.40	Uncategorized	\N	f	{}	3f9f7447829768b1a4a840e9b9d5c1146b7f5dc6c678b637a73d06ac1efb067a	f	\N	\N
c400cff0-74d9-4ca7-b479-18c69febb70d	2025-05-04	The Tap Room	75.00	Uncategorized	\N	f	{}	1d561d60e6e4b6ec195d848d1a72f1601c167a1f0fc5b42e5443ceea81b34262	f	\N	\N
8b113afc-b2a2-42fb-8f49-472630151c75	2025-05-01	DEBIT-DC 4581 MORNINGSTAR STORAG XX1626 MD	75.00	Uncategorized	\N	f	{}	0fe27cc8c856ceefbe2bbb5eb602fee1e037b7a2da1e12a322ae357d16301c8c	f	\N	\N
1d2806a4-e235-4c2b-9538-bcc271cebf85	2025-05-03	Sam's Club	31.64	Uncategorized	\N	f	{}	f3d17a4565adb766b0bd85e933409486fbc46deedab1e71d15489ad1a60945d4	f	\N	\N
37800e73-43e4-4d4a-8e50-e37d5cecdff3	2025-05-01	Hallmark	25.42	Uncategorized	\N	f	{}	6041a53e3dc8a5a2905a913c9b333049570d166238dac0f1c1eacb4733483029	f	\N	\N
f6e83ae1-6e75-48ef-a83a-c4103b0eebae	2025-05-01	DEBIT-DC 8678 SOUTHWES XX-9792 TX	20.91	Uncategorized	\N	f	{}	9df4da9947393c81a463fbaa3df29076206623aac0cc32bc5396a06bbe306e74	f	\N	\N
9d07f638-7627-4a42-bb90-d29facf8d002	2025-05-03	Sam's Club	19.04	Uncategorized	\N	f	{}	f9b142a09f00c65f5fbc7de8233920f4de71ea2e7ce6142a028e760aae3efd51	f	\N	\N
c5c994d1-3128-40f2-bbc5-73e0cb5bdc7b	2025-05-03	Parkmobile	8.45	Uncategorized	\N	f	{}	89b88570f1d577ef5303c3dd87a17afbbadc9a0ecaca88d88cb939425f7dd45e	f	\N	\N
e9d318ed-a7e9-4c77-b67d-d1190d8020a2	2025-05-04	Sunoco	4.51	Uncategorized	\N	f	{}	e5fddccb546efb3ed9f49d91a74b6d7813fbcccdb28b1750bf6ea2ce5b377bb2	f	\N	\N
1052327b-05aa-4a85-abac-b5a53f03c271	2025-05-04	ATM Withdrawal at Payment Alliance International Glen Burnie MD	203.00	Uncategorized	\N	f	{}	ede28d6522bdbb6b92ff5a1dbfc6681e8ffc26aaf97faf4ca72e9b2818baf3cc	f	\N	\N
a4ea8a99-1e3f-4d3d-acda-63031a66575d	2025-05-04	ATM Fee - Inquiry	1.00	Uncategorized	\N	f	{}	5a782b958aa6dea9b42773b027a8a9b00240932c2cfdbe686c1d2b6a776cf443	f	\N	\N
4bcaf5d8-d2d7-4002-bdab-c3eb97f59e77	2025-05-04	ATM Fee - Withdrawal	1.00	Uncategorized	\N	f	{}	3cbba1b32736a56c127bf136cb37228f7b0681833534e1dd593f08f557b06538	f	\N	\N
98b8c79d-e967-43d0-81e7-d8a2d09d884f	2025-05-02	Transfer to Venmo	98.00	Uncategorized	\N	f	{}	85249b4c390be441c6bb17e3d28dab58f2923d1c5e5b3035a77be1a0dbfa2db6	f	\N	\N
78e7cabd-5b4c-41e8-8fb5-69ecac4b0693	2025-05-01	Peloton Cycle	46.64	Uncategorized	\N	f	{}	2d94e23254930f9535272346c47fff0ec2e88eae060729eeb42a05fe28899ff0	f	\N	\N
8e409e77-af6e-4112-a184-26738c501ff3	2025-05-01	World Market	15.89	Uncategorized	\N	f	{}	5b4374b8d4c3b43d04dfce0aca4b372556cc04e36d4ae726572e0a78b20efd44	f	\N	\N
9523a4ee-b9c1-40c3-8544-b65448df0e62	2025-05-01	Apple	2.49	Uncategorized	\N	f	{}	f4f2601eb39fda7701494a47d811b1140581fcb84b0355d54b13682189fdea11	f	\N	\N
1b209146-18bf-477d-8134-95ec3d6b2df2	2025-05-01	Payment to Apple Card	932.69	Uncategorized	\N	f	{}	5b167c85b01e087afe536f0c394689c29d4f8e8f9f2285e00eaaecb7b29edfa6	f	\N	\N
afb6dc1a-5aec-48f3-8432-fadd47986d5d	2025-05-01	Payment to Volvo Car Financial Services	485.88	Uncategorized	\N	f	{}	ca4dd15c81a73da59e9fa8c1f728d8651604b97d2b6be603c8e9a697da271821	f	\N	\N
9cc73a42-ea52-4fed-bdd3-d0e59552f2a7	2025-05-01	Payment to Baltimore Gas and Electric Company	266.00	Uncategorized	\N	f	{}	20e7cd492e1811403d6c1a4e86e6ee23051b0fc8562c49653c582f3c02397bea	f	\N	\N
f0ab56f2-2cdb-4cb6-9bf8-35ae73adb014	2025-05-01	DEBIT-DC 4581 ELITE BOXING & FIT WWW.ELITESFN. MD	155.00	Uncategorized	\N	f	{}	106973178f8300eaa46dff892e4b0c7476513d44fb409c60569ade8bd9c19604	f	\N	\N
64ee6757-a891-4bfc-afdc-66949064b15a	2025-04-30	The Little Gym	130.00	Uncategorized	\N	f	{}	490360e8b466944d41ce3c869ef3a8012e2e6aeb1026f989665ae6c37a2fbd92	f	\N	\N
17f2e325-25f5-4f09-b500-94332bfc1d6e	2025-04-30	Wegmans	47.79	Uncategorized	\N	f	{}	0d69ca4d2cd9ce1abb5290ef12bebf77f9b18424d9a73bf0e292d0589230e655	f	\N	\N
1938f74a-e4b1-49e1-b4ce-abeeded98122	2025-04-30	Payment to Freedom Mortgage	25.00	Uncategorized	\N	f	{}	213c52646f028c0f17b025be0391f36225698ce18812928ee962ac5ec8d1f383	f	\N	\N
d3bd3cec-b5e5-4da9-82e7-bf69fdfda120	2025-04-30	McDonald's	6.76	Uncategorized	\N	f	{}	ac17bf25900d40cafe70f6969d3faa35308e8d78e6637eaaac95cefd9b13cf81	f	\N	\N
1d0f18a8-faeb-4237-adbf-cc206ae64625	2025-04-30	Dollar Tree	6.63	Uncategorized	\N	f	{}	fdefd357c55ef7ddd70c0be5bdbe0b11f5f824331640dbd815f127cd587280b2	f	\N	\N
4d8607d0-3a0d-499e-a34e-fd33f957da7d	2025-04-30	Dividend	-0.64	Uncategorized	\N	f	{}	7e6f019c4099127805cb00a296d61bf39f2dca59f32c2d6f85a155b2a76f91b1	f	\N	\N
c004741c-881f-4eb8-9f46-aec8383c9950	2025-04-30	Transfer From Savings -0387	-100.00	Uncategorized	\N	f	{}	1927b5786e8a98474510fed9684fafdc3f74a47a7b81929ca9de175c05a7cbc3	f	\N	\N
5863cf01-48df-4fc5-96ce-6b7dc98dde46	2025-04-29	Payment to Citizens Bank	88.12	Uncategorized	\N	f	{}	ea6e50ca9d07e3051b21d61c7a7e41367ba0eee1e6f3c9490a7123310e7c26a2	f	\N	\N
43c9d563-18e6-4c66-870f-b812d91903a1	2025-04-28	Zazzle	147.24	Uncategorized	\N	f	{}	b480959953dcc9551af25af7923dc5ca3bb43f9881bb3bc437e95d8afa7bda88	f	\N	\N
6bcff1f5-f0b3-4ae8-8e81-37eac7d684b5	2025-04-27	DEBIT-DC 4581 BOWLERO COLLEGE PA COLLEGE PARK MD	51.95	Uncategorized	\N	f	{}	46502a54afa6cfe6f611e31cc599204a4eb3e0d8b698227a3e679bc943e1aaf0	f	\N	\N
07f84db4-0ba1-4783-bdf5-2880eac24121	2025-04-28	Zazzle	12.67	Uncategorized	\N	f	{}	09854df497bbf6237d7b6fcaea1965aef45d3bbb66a063b1aebc925e2ba55373	f	\N	\N
432d10a2-9880-423c-8038-83a603f2f5e0	2025-04-27	Sardi's Pollo A La Brasa	6.04	Uncategorized	\N	f	{}	bbb77d4233198792a2ebae7574f1095a7281e03a95846e0f44c932704a3a6446	f	\N	\N
70de610c-4fe4-4639-ae93-d6d7439277b8	2025-04-29	Microsoft Deposit	-10977.33	Uncategorized	\N	f	{}	f84ec65403c246dab32339892d276f8ae4f73812a9977e48963b4f9c64258da6	f	\N	\N
f0b33f13-3356-4f2d-8ea8-1335b557319d	2025-04-28	Walmart	-22.99	Uncategorized	\N	f	{}	207aa6f254b7e1cc794a5083a47cc6c44675a05c7a776ef7f8b1c231dfa0653c	f	\N	\N
ba254a13-0329-491e-bd24-82fae81bfa06	2025-04-28	Transfer to Venmo	40.00	Uncategorized	\N	f	{}	4c9aa1f11c0b0501a5536d7d60f5647d429d48a95d249b88974c07797653c5ab	f	\N	\N
aac21c16-6d4f-44d8-895c-d0bdf3017528	2025-04-28	Transfer To Checking -5873	10.00	Uncategorized	\N	f	{}	78314467b5f839dfbca64e179fcce3392a331783207caf615811da67f30d1621	f	\N	\N
880283a7-757a-43b5-b334-23e821c4ceb2	2025-04-25	DEBIT-DC 4581 SEVERN - SEVERNA P SEVERNA PARK MD	500.00	Uncategorized	\N	f	{}	487f73ad719468c9ddbb613e5b87a8171f50dd641814ebc76d8f7a35300e69f2	f	\N	\N
28981b27-a739-4607-b325-e9d9f5df6f0c	2025-04-25	Choptank	145.00	Uncategorized	\N	f	{}	f77c6ab465b17f8a8a2839af50c9a8e83f263aefa6340f760846c028d74248f7	f	\N	\N
83c05b00-7e0b-4735-abce-20bdc30280ba	2025-04-26	DEBIT-DC 4581 SQ *GIANNI'S PIZZE SEVERN MD	38.53	Uncategorized	\N	f	{}	a11177c8b19a79108dbce110fad2c1f41f900584a5e84f2bfe7491845087f76d	f	\N	\N
4f96c91c-d426-4e15-bac0-5e30a56bee0f	2025-04-27	DEBIT-DC 8678 OTF GAMBRILLS XX7925 MD	25.00	Uncategorized	\N	f	{}	861f183773fc8c75063c5ea8c25985883655718e48c4a8014957fd2724c6f940	f	\N	\N
6d3257ed-b318-4b57-8595-af89e4a39aa7	2025-04-24	Kilwin's	24.00	Uncategorized	\N	f	{}	31e526bfd3936206042d7d74eb4d4ab060d289be84a6a473c3dab0c16f129be5	f	\N	\N
fdb835a4-76c4-4bda-920e-56b740ef7c78	2025-04-25	LAZ Parking	12.00	Uncategorized	\N	f	{}	99fab4c085c68130a52814fb7cf93ad701651abbda9c1020e730c2f0525209af	f	\N	\N
28bc4dd7-8928-4678-83ab-932978b3be77	2025-04-24	DEBIT-DC 8678 PMUSA XX3089 PREMI XX9036 GA	9.49	Uncategorized	\N	f	{}	41995fb2e2d972230dba4a3a9b14c807cfd8d327a4fc0626b7683ebf14e9fcd9	f	\N	\N
a990a75c-e873-4506-bf29-34744c0666f1	2025-04-27	Uber Bagels	9.22	Uncategorized	\N	f	{}	b424f44036e7538293e362dd8f30348821c8dc1ab4e162860e664604c38e20a5	f	\N	\N
24abc8e4-8577-42dd-bd88-bc8ce10ad69d	2025-04-25	DEBIT-DC 8678 SSA - NATIONAL AQU BALTIMORE MD	7.62	Uncategorized	\N	f	{}	c7fc572716fcc57f1726fb5b2604786600bad05ebe46ad4f563ebef2ad06e989	f	\N	\N
de0a04c2-7fb9-40b2-8023-cbb7949bb5cd	2025-04-25	DEBIT-DC 4581 SUPER 24 MARKET GLEN BURNIE MD	5.98	Uncategorized	\N	f	{}	ad9d3795aea62118d9d3b97f40952e6bf911aa30950d58f339cf2b65bd76e05a	f	\N	\N
8265494d-8cb5-4984-b812-47d95bdfb367	2025-04-28	Transfer From Savings	-39.75	Uncategorized	\N	f	{}	20c00a2049f791cbc539c02f6b03fec14f2fb469c423bbe325c74d8bdb175d92	f	\N	\N
f45e7b66-51a9-4141-92a8-ae50d0cc0edb	2025-04-24	Tractor Supply Company	117.64	Uncategorized	\N	f	{}	3583419525e751ee643a7814ab7a2b6d4a11f60b76a864fcaeeda1b8a81a129c	f	\N	\N
7461952c-1f73-41e6-9691-42cebd0b3a92	2025-04-24	DEBIT-DC 8678 SQ *VIGILANTE COFF HYATTSVILLE MD	45.00	Uncategorized	\N	f	{}	d8e14165f6a5ec3280ad8d3b40a74884b0727445dfc5c7627df57d9d5d044d01	f	\N	\N
37fe6201-e99b-40d6-9d33-ae41d22a4020	2025-04-24	DEBIT-DC 8678 MILLS FINE WINE AN ANNAPOLIS MD	40.30	Uncategorized	\N	f	{}	4cf98721feeabffce8bf6b71c3506713cddb6e8b40b216aae79de4922c97b00e	f	\N	\N
a89c36f4-fb5a-4757-b0c1-63af91c8bb95	2025-04-24	DEBIT-DC 8678 SQ *VIGILANTE COFF HYATTSVILLE MD	6.83	Uncategorized	\N	f	{}	6f71e8eddef387242a3f498f83263351a9a076443b2e46bb04a683f5e18e97b9	f	\N	\N
be7a9835-e4fc-40c7-9c93-7aed88d24028	2025-04-25	Transfer From Savings -0387	-650.00	Uncategorized	\N	f	{}	aa0172edcee3ca04865b9d1470d3d17829e4614462362be20fe1c28714c6ea80	f	\N	\N
ac184f47-8b99-4ab1-bd97-972cb6f10e72	2025-04-23	Payment to Liberty Mutual	260.08	Uncategorized	\N	f	{}	15ded84814b8862fec270c8b24803402379c6643a52676c89e02e21fe3675c62	f	\N	\N
f2929209-c09a-4e5e-9b03-af1aede7ed92	2025-04-22	DEBIT-DC 8678 TST*PITANGO BAKERY BALTIMORE MD	36.00	Uncategorized	\N	f	{}	905be76b0714f692ea5b77026467bb9273d00bd4daa434e16011806713df685f	f	\N	\N
727c445d-66d0-4dd9-a327-e94da9ff7a09	2025-04-22	Sam's Club	10.05	Uncategorized	\N	f	{}	6a76739c8b4bee11cec4c9552a9258411cdeeaa4a216fe06017ea3f584227f8d	f	\N	\N
4ca6e808-0f31-4dff-beb3-020ad91bafac	2025-04-22	Netflix	8.47	Uncategorized	\N	f	{}	f9802750a87bee7118ec24bf282920d001ab84b4b41bb36694ff6130be6b5fa1	f	\N	\N
14b44165-a9c8-43dd-8b28-0de074f9d61b	2025-04-20	DEBIT-DC 8678 KABUTO JAPANESE ST ESSEX MD	67.00	Uncategorized	\N	f	{}	ce332238fc603bae84d3a27f2cc81ec92eaab402b08d3523a60c8cb4d28e355d	f	\N	\N
61020059-c17f-478d-8953-fadad58a3de5	2025-04-22	DEBIT-DC 4581 COOPERSHAWK XX-5674 IL	44.99	Uncategorized	\N	f	{}	67f680ef2d75af904c60a37232b59168a76896679bd072bc37c37a01cf62b428	f	\N	\N
361da6d2-2c1f-42aa-bbb2-0d0c764545f1	2025-04-21	Walmart	22.99	Uncategorized	\N	f	{}	3e6c541d0c229e0f26d39cefb2ffa2bd4c074db3582aca9ca47fdd0f50e73f6c	f	\N	\N
769a640f-e710-4c98-83a2-78984b751e4b	2025-04-21	McDonald's	15.43	Uncategorized	\N	f	{}	084f05a5d95acc91e1d580652bf314081ce70d35ef08e68159ea9317334e9a82	f	\N	\N
77c3a5af-94c4-4d50-9567-593f1e14592e	2025-04-21	7-Eleven	15.00	Uncategorized	\N	f	{}	6178c243ec3768d0af248efb2e56929fc6d97e7d5e8737789476fc81423e3431	f	\N	\N
d33cce03-e3ca-4168-90e0-15021adb32e0	2025-04-21	Giant Food	2.89	Uncategorized	\N	f	{}	bc769f83f0c25569a8d78b45734b297d61c4d898670dc2eec54299778e3ef206	f	\N	\N
88bcdfbf-7804-4089-afdb-2890cb128a42	2025-04-21	ATM Rebate	-5.50	Uncategorized	\N	f	{}	1026bd923170bac593168fff3da2dbe7f602b9bf83f68e3a1f3bbf40e3d9f08f	f	\N	\N
8f54abfa-afda-4229-867c-552eca160769	2025-04-21	Comptroller Of Maryland	100.00	Uncategorized	\N	f	{}	f48d86d2aabad5dbb801858033d5820da267e5d131bdb77a2e6acd717a97a9a8	f	\N	\N
99a5f35f-109c-4bcd-899f-83966096ec45	2025-04-20	Union Church	600.00	Uncategorized	\N	f	{}	fdba94070a90aa1970ef7f828e5086d83abf675a33fa6597fe4b65f6abbbce93	f	\N	\N
6c3aa441-d1b3-4176-b3eb-c557e1551b53	2025-04-19	DEBIT-DC 8678 SQ *ROCKY RIDGE FO HYDES MD	159.00	Uncategorized	\N	f	{}	7cc2b352e86f07f1db056580278da6a40c673d8a0cb5d06f0acd09bf3801a357	f	\N	\N
5d59a8d1-7f74-4133-9949-bbf991e80ccd	2025-04-18	Once Upon A Child	133.53	Uncategorized	\N	f	{}	290bbc9adf1d9d7d99c4260373b46fb5b7261fa4c048160b651123e505ac6c87	f	\N	\N
11772334-cf5f-4764-823a-a40b9bd5cb05	2025-04-19	DEBIT-DC 8678 SQ *THREE LITTLES HYDES MD	51.94	Uncategorized	\N	f	{}	5f2ef91a0d93c266d4bd5d2c2f51b248719532823c4e39494819be4847467a46	f	\N	\N
2a7fbf32-488e-492d-a8c9-5772ee71a9d9	2025-04-19	Target	41.33	Uncategorized	\N	f	{}	8a374fc795b964a14cdb9f83fbd26faa5322f46f5d95b448725b7e58a5865cf5	f	\N	\N
d416d2d5-63c2-4f8f-9737-fb2024ed51ab	2025-04-19	Rise Up Coffee	31.53	Uncategorized	\N	f	{}	9341fec444284d73c432a556f7a5c6812f2591e8152d107f5f5a7be73a4c7c42	f	\N	\N
6dccf53a-5166-44fd-8924-d3039e5a867d	2025-04-18	Wegmans	27.77	Uncategorized	\N	f	{}	0e845e7028afb096b9f77efd7ae2597d07113e166af2e1caf1a0478b1631880a	f	\N	\N
210e013e-9c9d-42e4-b713-c48baf396b6d	2025-04-19	HomeGoods	24.36	Uncategorized	\N	f	{}	610cedb4c3fa211fd18da3a63de19af91dc46aa664fc5707114177979e571e78	f	\N	\N
4f23ccbd-c810-4e5c-b88c-7ce6d49e3140	2025-04-19	World Market	19.87	Uncategorized	\N	f	{}	16a27e4440623c0b801192ee1f8aa7dc4ea120f8f4cce735c2de63b52ece5fa2	f	\N	\N
426d76b0-6665-4d3e-99d7-eeb6484993e9	2025-04-19	Dollar Tree	16.46	Uncategorized	\N	f	{}	c5ff76047e9a6470ecd2fa39299d914022baca01945a1182d6f8b946c1a6e141	f	\N	\N
f748f038-8a8a-4080-9f19-31c432a02d6c	2025-04-19	DEBIT-DC 8678 SQ *JUST RON CHOCO HYDES MD	10.60	Uncategorized	\N	f	{}	ae03c56b36dd5c81eb20054ca908c7935f200688b7fd463fce4a8b55d1a09570	f	\N	\N
9da687d7-1cef-4561-aab0-9df52a2ae4bc	2025-04-19	DEBIT-DC 8678 BACCO PIZZERIA LLC ABINGDON MD	10.04	Uncategorized	\N	f	{}	29665a7bbfb1ed019a1aecc9d88107a0ae44940f5ffad265b2f03a38c14731df	f	\N	\N
8a6d46c2-f102-42af-9f18-fd10ae782920	2025-04-18	Uber Bagels	9.22	Uncategorized	\N	f	{}	fe9f74e5d58b56da3e7d691ce37d2d264f5524b992aab6272baed134bb2a3d2d	f	\N	\N
7fa7444e-c617-4708-894c-a600362d31e4	2025-04-18	Apple	7.99	Uncategorized	\N	f	{}	ac7e2b3ab3b9fba6c29729a12f3a8cc0d1a4ea4767b7b2469d684605a443d472	f	\N	\N
189af057-e984-4129-ad45-1b3c7df8e41c	2025-04-18	DEBIT-DC 4581 LUCKY'S FOOD & ELKRIDGE US	6.36	Uncategorized	\N	f	{}	ca6f5f33cf5d05d5602a2f788100d1d163cddf72317f314741e5b41acaddbfd0	f	\N	\N
c2c69bc4-532a-4691-89d7-5d02a9d3a6f3	2025-04-19	DEBIT-DC 8678 SQ *PRIGEL FAMILY HYDES MD	6.00	Uncategorized	\N	f	{}	3816db386edfb8512efaff64b3b6098c03d31d286864acd2806370fc0f2562b5	f	\N	\N
1bcd6fb3-8ee0-494f-aedf-ba04b407688c	2025-04-18	DEBIT-DC 8678 OTF GAMBRILLS XX7925 MD	3.45	Uncategorized	\N	f	{}	0c8c1667eb9524ef04cea77a858f6f43e72ea1116107be6bb7ec449d757ceaa9	f	\N	\N
ad8337d8-3888-4ca6-a8de-e2a618701689	2025-04-21	Transfer From Savings -0387	-1000.00	Uncategorized	\N	f	{}	2070c363228fed85b06e75e33518224276a3114c1e968db954e96e2481c7ccd8	f	\N	\N
b431f6bd-6350-45b0-8537-c83a3b2a862c	2025-04-18	Transfer to Venmo	50.00	Uncategorized	\N	f	{}	9168466aae252c189a81604635e653869aca58ea8557922dfa0dc69b522db62f	f	\N	\N
020076b1-75f5-4473-9ff5-d47bdc566aff	2025-04-17	Target	110.75	Uncategorized	\N	f	{}	0c8e0bdcfcb1e787581be2ea9a85be90c7cdbc9ece444cd7d46b2686893941f9	f	\N	\N
8df294cc-36c5-4c6d-8a8a-b6a455b0bcf1	2025-04-17	Giant Food	104.66	Uncategorized	\N	f	{}	a2688359d99fb1ee35a2fe6054274545fd3a9ad308b0ff2309fb44531289331a	f	\N	\N
228102b4-84cc-457c-be39-02e7d9baafc4	2025-04-17	DEBIT-DC 4581 TST* THE BREAKFAST SEVERNA PARK MD	70.00	Uncategorized	\N	f	{}	ac33b61152ec6c151bc8540849d85e4a9e0618b16996249517f21a010293cdbb	f	\N	\N
09f71535-b07c-4f92-9f4d-c31dd8e7e9af	2025-04-17	Target	56.34	Uncategorized	\N	f	{}	ee23258c8c466305b63b966cebdb53f9d70cf740b09887deb9c96ab3f1596dc6	f	\N	\N
3d1e57fb-653c-47b6-b861-f78ff6a5416f	2025-04-17	Target	21.19	Uncategorized	\N	f	{}	63cc5ac87c88f3945bac0d225f3af302522c861e28e8391d4628da06f4426db6	f	\N	\N
cb98d4be-d7b6-4707-be19-860fead95bdf	2025-04-16	Parkmobile	12.45	Uncategorized	\N	f	{}	3afd92c4bb61fd80b5ac8967471de8c47966e9c64e121e23ea48c61b28fed8c4	f	\N	\N
49a13397-34c9-437d-9a69-e9fb19f1e1cd	2025-04-17	Rise Up Coffee	7.95	Uncategorized	\N	f	{}	8774a24ba9c0860c36f1f1afe9d6d888e7402cb824a392c40270f657cd26a01f	f	\N	\N
8303e21a-5d33-4884-b3b9-1e0aaad2be06	2025-04-17	Target	5.29	Uncategorized	\N	f	{}	65efc255a019babb81bddeb4cd5c3d20d7823948411ada2b87e03ec159eaae59	f	\N	\N
bc985fca-c2db-4ef1-865f-865b32c61d57	2025-04-17	Payment to Chase	50.00	Uncategorized	\N	f	{}	0e99b8b2c77a72a3ec586071e2520b2f2d2cec4b492797f8ca7a496fe22507d9	f	\N	\N
ef18c833-3ac5-454f-b2e9-ce38b0a6ed8b	2025-04-17	Transfer To Checking -2740	91.40	Uncategorized	\N	f	{}	72b16c59420e85f6f23d1482c2546d68d010bfa45fe24a0bc1373b414b941c66	f	\N	\N
ffa6a112-b17e-4257-af4e-580e55330ba1	2025-04-16	DEBIT-DC 4581 TST*NEVER ON SUNDA XX-7191 MD	68.68	Uncategorized	\N	f	{}	7a6047c49765621c3dedc93d2940805a6538cd7e85f2d6a8ac72058a92bdb7a3	f	\N	\N
83200a91-577b-435d-bed9-9e47885e4b73	2025-04-16	DEBIT-DC 8678 OTF GAMBRILLS XX7925 MD	15.00	Uncategorized	\N	f	{}	a7d5a67ac773d7661f1d1447be36f092b6bcdbbc00be031701d4fb9edc9bbb68	f	\N	\N
3b37d872-71f1-4048-bcec-32351c0e58b5	2025-04-16	DEBIT-DC 8678 OTF GAMBRILLS XX7925 MD	14.00	Uncategorized	\N	f	{}	d0e79411656c55a911bcc68e698e245e762a0294655652b725d8ce561ae096bc	f	\N	\N
4a384a6c-7ce5-4c04-b48a-21f991fb5380	2025-04-15	Mmc Catering	12.00	Uncategorized	\N	f	{}	8fd8f7a88390549ca4daec47a826ee62561833238d715512ae6c2ed6fe0cee54	f	\N	\N
2a4db0b7-2b17-44b3-8eb9-94f738098b01	2025-04-15	Mmc Catering	8.27	Uncategorized	\N	f	{}	8e676b4de3054459532d227b3b83654aca7fc7675407f5c5195982d512e3a122	f	\N	\N
93fff5f1-1b44-46ea-bbbf-0d4729ddefd7	2025-04-15	Mmc Catering	5.29	Uncategorized	\N	f	{}	ffd78254adf8552209bd0c79a965245f35bcb782f71b01cd5815155669ac23d3	f	\N	\N
a9bce617-dde2-4b2f-a58b-2f4a66ebc1e8	2025-04-16	Toyota	900.00	Uncategorized	\N	f	{}	f3de07bcb732aac8a4b42c97e267d7d13e5ba02dfb328eb87f0dcbfc01eac9d8	f	\N	\N
adaeee7d-a1cf-40af-95bb-5bb4fc692473	2025-04-16	Payment to New York Life	616.54	Uncategorized	\N	f	{}	2b9d651e06489c202fee8dcd47fb43beaec723cf3bb147a2c1bfe464e402dfc8	f	\N	\N
2f685c23-d5ac-4992-a708-c4808d91d85d	2025-04-16	Payment to Discover Bank	406.00	Uncategorized	\N	f	{}	4c6c32da7661f6127f1817cc4a3a6ee0ffec75fa0238f8c6751f2df3934e32c7	f	\N	\N
79c42ddb-ec8a-4d07-a919-5cc122b32e3a	2025-04-16	Payment to Educational Computer Systems	100.88	Uncategorized	\N	f	{}	3e976aa0a35d2f48cb707fafc00333cdd40b10cf6a9b7e2291af6d7c74ff0855	f	\N	\N
e65232fc-4309-4e98-8339-2bf96dbd8f5f	2025-04-16	Tax Payment to IRS	100.00	Uncategorized	\N	f	{}	e1046a7c4cf786b747f5ff7d50ba17ce5eefff6518aca257cbfb3c026691c03c	f	\N	\N
6ba064ab-a92c-4152-a40e-c2c9f9c2d2ad	2025-04-16	Transfer To Savings -0387	3924.67	Uncategorized	\N	f	{}	0ad8625c6e1b2938e4624d3374edb43a7bb28102fa8aea291bfac241cbbecbc6	f	\N	\N
c0fe8eec-1788-448f-993b-b05d72fecac9	2025-04-16	American Eagle Outfitters	95.30	Uncategorized	\N	f	{}	218fed9e62c172c2e3bcbe40bf9473b81d5b04f264481649a6f6b81c044e3009	f	\N	\N
fdf960f8-a20d-4a26-9ee5-7522bcda226a	2025-04-15	DEBIT-DC 8678 SQ *CLARK'S ELIOAK ELLICOTT CITY MD	18.00	Uncategorized	\N	f	{}	dbaedc2837e59605c309ebfc595efb0fc5d4bbc602866aa73647febcc1467d96	f	\N	\N
c08fc1c9-265a-4dfe-8fa4-e12d9e587133	2025-04-15	DEBIT-DC 4581 MERCY MEDICAL CENT XX1788 MD	11.00	Uncategorized	\N	f	{}	d6905524a51c1bae3aebfac7e298b3c404a3bd2f25e3865bb6de89a29121eff5	f	\N	\N
5109eaa5-8e21-4d1f-b111-4386c824d830	2025-04-14	Parking Authority-baltimore	1.00	Uncategorized	\N	f	{}	ab6122bf075f6fb9fde4ae47faf766efef6c148a36201809789635f1740fd682	f	\N	\N
1d82ab18-fc7d-40e3-8ad7-6502cf8884af	2025-04-16	Transfer From Savings -0387	-1000.00	Uncategorized	\N	f	{}	a648523952ed7c75b61b0d501102d1872ac16a90170109d92b38ff025b44c3f6	f	\N	\N
3b2960f1-2cc8-40f2-82df-d89eb11339ce	2025-04-15	Transfer To Credit Card -8715	500.00	Uncategorized	\N	f	{}	d779ef31d14acf6e2c50e21b034964efefcbb63bb89bcc04cca9b43baf3a19d8	f	\N	\N
d3b5b2d0-f9a4-4b72-aa99-dd404d2f13a9	2025-04-14	Janie and Jack	99.78	Uncategorized	\N	f	{}	be7f4fe3da7d494b539809efb1fab99d0d74656d556fc7160d41ae20e5de04c8	f	\N	\N
8b0d8a0a-e450-4127-b80b-1132c51791ef	2025-04-14	Van Dyke & Bacon Shoes	74.19	Uncategorized	\N	f	{}	0ea5d08a6576c8d856dfd95e1045ecb2d0d4f6743bcae94585a8b7e396c71262	f	\N	\N
8cf6f3bb-1101-4297-9047-93b10e49cc6b	2025-04-13	Polished Nails	56.50	Uncategorized	\N	f	{}	21a995e48d3e4c6708e9c1d0f197e0f971b60f5a2d8ca11418ccade2863e1d8a	f	\N	\N
0c39158d-9eb5-43d6-95b5-912e0b9d11b1	2025-04-14	DEBIT-DC 8678 ICP*GOLDFISH SWIM XX7065 MD	13.77	Uncategorized	\N	f	{}	6c9fb1a204dbd1d5cacbf193a6090ed65153910a7970bc77a11e3affcce1ab00	f	\N	\N
1ae28974-7c68-4252-89e1-29c74cb454fb	2025-04-14	DEBIT-DC 8678 BELVEDERE GAS A BALTIMORE US	5.71	Uncategorized	\N	f	{}	9c350299c9fe0d21bfbeaba24dd5717195454eef303a326c2a88a3ea89b40257	f	\N	\N
42078138-b08e-4971-97b9-27f398783545	2025-04-14	Payment to Verizon	94.99	Uncategorized	\N	f	{}	8aa52ef029132f0ab62276d36eed59a2d105dd3cba4b9d0163f1906fb0f2689f	f	\N	\N
9fbd4bbb-4f1c-43d7-b051-26a7ddcefc30	2025-04-14	Transfer to Venmo	61.00	Uncategorized	\N	f	{}	700d8e16733e4ced8c232cbdc6dd0ade4f74a9e0f61cbf0aeb5249fd6e90f16f	f	\N	\N
fc6e5ab6-d929-4276-b500-44cf2b5f7f68	2025-04-14	Transfer to Venmo	33.00	Uncategorized	\N	f	{}	358b65b339802d2d02b9c933a215dcd5cc5f7182763c83488a5db09ea635fb64	f	\N	\N
117eb263-0fd7-4a64-b578-237c96dcfe53	2025-04-14	Transfer to Venmo	25.00	Uncategorized	\N	f	{}	f8c7020fe4709dc2a786d9b0ad97e022424102287b7b371e0818785941d42414	f	\N	\N
0a0abb2d-d013-490a-922c-21330e8e0ac9	2025-04-12	Sam's Club	121.72	Uncategorized	\N	f	{}	41174458ad12f3a53a385f7f6628325e1dd6e8e9444469b0ac3b1ccb700467dc	f	\N	\N
f7cc13bf-094b-4960-a101-8ea7cc3f2d41	2025-04-11	DEBIT-DC 8678 TST* THE BREAKFAST SEVERNA PARK MD	55.00	Uncategorized	\N	f	{}	45cf3f351f86117c7d4ea588d8ac164ea408d7e38bd35e45171eb33f9663d7da	f	\N	\N
1b174d3a-1bd8-4961-907f-6f0cc1b1db60	2025-04-11	Ledo Pizza	29.64	Uncategorized	\N	f	{}	7cd31ab2d08f4670354025bb87834fb73b39071f55a2d8eb9c68a33ac389c1c5	f	\N	\N
64d5c125-2294-4f78-91aa-f78784cc9b2d	2025-04-11	Rise Up Coffee	15.31	Uncategorized	\N	f	{}	cc168defac426385608298a6a016866914cca3248a0656b4b3c9502fbc61e8f8	f	\N	\N
8bdf0485-568c-40dc-acd1-560ab6c3c436	2025-04-11	DEBIT-DC 8678 TST*BLACK MARKET B EDGEWATER MD	13.86	Uncategorized	\N	f	{}	559f237c4665096ea6ae35c17cbba2ad20b7257144c4943a7b38cafbdcd1f230	f	\N	\N
03bc5b41-3200-4de7-bb39-aab2123754c3	2025-04-12	Giant Food	10.99	Uncategorized	\N	f	{}	1cd22d551caa8b107fb83024df662a4ee8a263931d20c855da5f2a12cb29de00	f	\N	\N
ddad7d2d-409b-4a75-9658-30a6229943ca	2025-04-13	DEBIT-DC 8678 SQ *ONEDO COFFEE R BALTIMORE MD	7.78	Uncategorized	\N	f	{}	9269de12e45e11ceee968637c10853fa92912157680d51e77c1acccb88022048	f	\N	\N
7f403dc5-7902-4ac0-b084-34b405996d1d	2025-04-14	Microsoft Deposit	-4690.29	Uncategorized	\N	f	{}	223532087c4b66a60ab1fa1af3cf4a7f551d41c7024f5163e1318bfdeeabd002	f	\N	\N
02c0b33f-fff4-45df-a1e5-9bfa785af4ea	2025-04-10	DEBIT-DC 8678 SP GOODBUY GEAR GOODBUYGEAR.C CO	203.51	Uncategorized	\N	f	{}	b7d293274b0ca14ba440c4e4e8eacf35f9baea3e67570eaf07497645323e9d31	f	\N	\N
cf85cb66-2ecb-46af-aab5-bc5aac4dd0d0	2025-04-09	Sam's Club	121.14	Uncategorized	\N	f	{}	b506037f8e91c92622fdea5687ce3c7317008e7914b34f1efb899eaccc0b1fc0	f	\N	\N
9f433eba-517a-49f5-ac4e-cfe64e52117b	2025-04-10	Deposit Henry M Jackson Payroll	-3281.32	Uncategorized	\N	f	{}	2251f6f01e9af07787ea22d59e5dbad3c642f3e08865d7d9421ce2e9323df1b0	f	\N	\N
2c90cff5-f057-46bb-b14e-d7c252ab935a	2025-04-09	Transfer to Venmo	40.00	Uncategorized	\N	f	{}	01ab394e41457d5630954f086d2557251d7f5c3bed7b0211a7d6a46abbe85ecc	f	\N	\N
b2ba50eb-094c-4243-bbf6-1cb5f19a6a46	2025-04-08	Costco	195.14	Uncategorized	\N	f	{}	fbcb0429e9ff08b8579242866a431e52887fe22bf60a715fb98aae9dd3a836d8	f	\N	\N
2a471163-4e87-4a8c-83f7-a3f62b5f1b0b	2025-04-08	Costco Gas Stations	32.20	Uncategorized	\N	f	{}	f2e8c267aa65e23f6d756ee2a61bdefeef9babe757e3f0cca23e88f014901742	f	\N	\N
1ac9946e-c8a1-4ee6-9d9f-cc86d539f9d5	2025-04-08	DEBIT-DC 4581 FRANKS DEN GLEN BURNIE MD	17.43	Uncategorized	\N	f	{}	57af7a9b452772cac497ac44f4587283f21d527d8c99fee100b7205113db1248	f	\N	\N
8d94a775-791e-48d5-b020-faae3e533bee	2025-04-09	Giant Food	13.54	Uncategorized	\N	f	{}	a403c42aaf7a7e6fc0366243afd39e579e71cf82100ed96a78824b57c7eb82d8	f	\N	\N
bf130cb5-cc27-404d-82f0-8896d0fa7048	2025-04-08	Giant Food	11.29	Uncategorized	\N	f	{}	a040632ef179470724edd7cee4d9ac2c334da54568448ef0239363db5f4388d9	f	\N	\N
d7c1ee7c-5898-4d26-8b6a-0087e53da192	2025-04-08	Payment to US Department Of Education	616.87	Uncategorized	\N	f	{}	98fcdab159bc06a012687fa0cc8a222d94956f2c04153415f891cd0270c2321d	f	\N	\N
bbe0dd73-51c8-4418-8952-ab25ca46e8ca	2025-04-04	DEBIT-DC 8678 OTF GAMBRILLS XX7925 MD	199.00	Uncategorized	\N	f	{}	3ec9715781ea64aed901af40b583769b6474c059a362ce9e02618111858ec3af	f	\N	\N
eb872d76-3dd0-4252-a6fd-5cc75813ad1c	2025-04-06	Giant Food	53.61	Uncategorized	\N	f	{}	68f08420e316878c9c0438707d2a0e0e88a90739e4e7fb7e15779f97a4cf107c	f	\N	\N
33be6da2-bed0-4735-a41d-c8927c1e8507	2025-04-05	DEBIT-DC 8678 TST* CROOKED RUN F WASHINGTON DC	27.00	Uncategorized	\N	f	{}	10dc05f03b122598faa7c8ff19b3c5a3003a37c4d2a07d0337417b753ade97aa	f	\N	\N
f007d9be-4377-4e79-b446-7dbdc9cac19a	2025-04-06	Northway Liquors	17.53	Uncategorized	\N	f	{}	0a908ee31aeb757f734e5f14b5e0144bae6fda369f93dbfae651dc663c3a2270	f	\N	\N
7420bd06-31b1-4ced-b789-2d605a61febb	2025-04-04	DEBIT-DC 8678 POTOMAC RIVER RUNN WASHINGTON DC	12.30	Uncategorized	\N	f	{}	b41d867a893ba2273862eadc9c4c8b1719f2bdceb8d5188c962f26a70ea6caab	f	\N	\N
17a622b9-1144-432e-aeb0-cb79cfe07eb1	2025-04-05	Smartrip	12.00	Uncategorized	\N	f	{}	6dd6a9ca514d99eabb47cb9acb89bf61a179f9b827b3b0f2684506c55f31f3ad	f	\N	\N
ed19d988-7564-414b-b935-7c16423cc8b5	2025-04-06	Giant Food	10.28	Uncategorized	\N	f	{}	18c4ba7eb1184913f8f26e09a64f094d7c2d995495e5438fda625bed253b9e33	f	\N	\N
4640d7d3-39f3-440c-a07b-477bc843b0db	2025-04-04	DEBIT-DC 8678 Medical C Medical Cent Rockville US	7.00	Uncategorized	\N	f	{}	43fc5fbc5d2588d5c44a9c91b2edfae833486028a49a4af6d99111593f304b84	f	\N	\N
89098343-5056-4a42-b1ac-16fb6dbf3343	2025-04-05	Smartrip	4.00	Uncategorized	\N	f	{}	3f125702ac71dd942e089476d941af9e71d8df2f21d8c9f75b546b0e5226a053	f	\N	\N
7740ca0e-5613-4d69-a0b3-258d6e7eff14	2025-04-06	ATM Withdrawal Plus MmXX1013 Millersville MD US	103.50	Uncategorized	\N	f	{}	608a80c63bfbf6d676be49c8d6a1b208e43bd9cc145b3ca9ab6086967877cd2e	f	\N	\N
e5d859a0-dd0b-4c21-8a52-f3c3dd1e5688	2025-04-06	ATM Fee - Inquiry	1.00	Uncategorized	\N	f	{}	6297a5f43fee874868919b27dd140190c708ea17266985967a3960bac46d1e92	f	\N	\N
89e302b8-55fd-4e90-8be3-6836456d0888	2025-04-06	ATM Fee - Withdrawal	1.00	Uncategorized	\N	f	{}	c3e355f3a76db3c71b68c7b25b3c5a8f843028f5e10ac882acfdc4b952c15a16	f	\N	\N
e80be82a-6fc3-4cca-9f7a-1ad32cf7c414	2025-04-07	Transfer From Savings -0387	-700.00	Uncategorized	\N	f	{}	8f37a55d19532b1c10e58989d77f36050062b967234257fb25db1874449be220	f	\N	\N
9572a08c-9bf6-42b1-9646-35695a6cbcb2	2025-04-04	Transfer To Checking -5873	200.00	Uncategorized	\N	f	{}	1785df216975090db2b90b0a380ae1878ad2fb6f1b748d338781f2890f6382fc	f	\N	\N
8fd573ba-5064-410d-80db-7b8636e7301c	2025-04-03	Payment to AT&T	216.73	Uncategorized	\N	f	{}	5c15de1a6329a4311cbf6f2a3cf7426695ec7ee57fa700a4be56043907a40921	f	\N	\N
538174ec-8d53-4164-9d63-0195c4a5f38a	2025-04-04	DEBIT-DC 8678 CONVERSEUS XX2667 MA	52.96	Uncategorized	\N	f	{}	0191ce55719144ed2eb7c0c9c4b0e1404aeb9e24d5df3a5d4ed9ba3d5f170220	f	\N	\N
e268636f-8565-4074-a651-23a3434b5ff6	2025-04-03	DEBIT-DC 8678 OTF GAMBRILLS XX7925 MD	14.00	Uncategorized	\N	f	{}	fdcdd60c3c849498c1f5eaabacdbbc1c510ae396b83f948fd55b9308dc265fdd	f	\N	\N
10faf680-7fe8-48ce-94aa-b8483d14d3c0	2025-04-04	Transfer From Savings -0387	-500.00	Uncategorized	\N	f	{}	83703f0da56f9fa3d5998be645a5a9fafb15097f9a4f9d837a156d881dcf23bb	f	\N	\N
e69775f8-5e72-4d54-9417-d68b82b980e8	2025-04-04	Transfer From Checking -5873	-400.00	Uncategorized	\N	f	{}	515331b8bcc5255dbc4e871995f408040b5d45ef7c13458a396992dad2a32e97	f	\N	\N
58ec8e5f-bd39-4348-aec9-b9a8d226b36f	2025-04-04	Reimbursements from Wex Health	-406.82	Uncategorized	\N	f	{}	696708e7150f2e3d25970b4af0fde677eae24db609abad192e6301f40f69d90f	f	\N	\N
71867ec1-16fe-4155-84a0-5c6ea996d41e	2025-04-03	Jpmorgan Chase Bank	2239.11	Uncategorized	\N	f	{}	1e2b72ca4d8b8b8e705828d6feae4d5314a16bba0f866db8c8d5532a57a8b873	f	\N	\N
aa9dad80-4dd1-4500-9d32-f2c273c1cf7e	2025-04-01	DEBIT-DC 4581 MORNINGSTAR STORAG XX1626 MD	111.00	Uncategorized	\N	f	{}	0db2ae31829290375bebf5739a7d6febee3761153d14d3576620476cd7dfece4	f	\N	\N
9d42bdc4-bfeb-4923-bfae-b09bd560aaf0	2025-04-02	Giant Food	16.27	Uncategorized	\N	f	{}	d261b02cba5caf97d9fb01fe7d8762fb3784d6ab2c39118410755f18500ac69d	f	\N	\N
4f5d7854-4b95-4b7e-ac00-c31e8710aefc	2025-04-03	Transfer From Checking -2298	-202.50	Uncategorized	\N	f	{}	c21de4171c95a8175470df6582e14c6a987e3e95a7f917cec6a453d886cd62b0	f	\N	\N
b35ac714-b80d-464d-b976-f87fc5149b37	2025-04-01	Costco	130.00	Uncategorized	\N	f	{}	44878cdd41cd1c6a04402251fc9d7064fef8d9251c802d7780bb5b2e4cdfb5c6	f	\N	\N
c3c20363-7a29-4ded-a821-3edbfc4515b1	2025-04-01	Peloton Cycle	46.64	Uncategorized	\N	f	{}	adc8771a67c5323f63b35897968235c84e9721b228000077b606f763165137b4	f	\N	\N
585d682a-ddfd-4114-b12f-5b668ed84152	2025-04-01	Giant Food	46.36	Uncategorized	\N	f	{}	49433d04251a841b0537e81a2f49668eb9ad1a66b0ee9d5fb28704a3e031c6e7	f	\N	\N
050b5178-aa97-4f1f-9ea7-bd4bcab9cb31	2025-03-31	Pizza Boli's	35.23	Uncategorized	\N	f	{}	8809439434ef0c5bba36501e52decb98e8fb88491ff3e1426d808e76efd28b94	f	\N	\N
f653e28d-fd75-4080-a5b6-b8f2b90cecdd	2025-04-01	DEBIT-DC 8678 TST*ROGGENART - CO COLUMBIA MD	22.00	Uncategorized	\N	f	{}	3255f6611df160b184f7bf0c0080a0ff93b77461e21cda8033c68c9f7b68b200	f	\N	\N
97ee5bd1-b78b-4ab6-b575-f9672d52fd22	2025-04-01	Apple	2.49	Uncategorized	\N	f	{}	ff2eb368fabdb7fe27b521c986921039c2c76dfbb0b1c809693b1b9492deeac7	f	\N	\N
dff1bd99-4c99-4c88-97f5-4355121f0d18	2025-04-01	Transfer to Venmo	3220.00	Uncategorized	\N	f	{}	38eadc03dc832acaf2ba6d641e7a1340c20c652fec32f49602b928519b9fd1b0	f	\N	\N
d6648279-3b02-4443-bf73-f0d289af75b8	2025-04-01	Payment to Baltimore Gas and Electric Company	266.00	Uncategorized	\N	f	{}	f0fd67763ca4782315653a159cb22e90292fe1bb7feaf8ff91d7d31d9325d42a	f	\N	\N
966fa0f4-252e-45ac-8654-1132a5465d57	2025-04-01	DEBIT-DC 4581 ELITE BOXING & FIT WWW.ELITESFN. MD	155.00	Uncategorized	\N	f	{}	1f1552d9aa0906390fd5c9246b77bb81a92f0b8e7b9ca8799fe26b41afd70a9b	f	\N	\N
e7aa0c7d-d122-4722-acbe-941019d7a5ab	2025-03-31	Costco	148.31	Uncategorized	\N	f	{}	74cf645406f37b3bcb3a07c26539345f3db740219f27441e03430d0ea912c794	f	\N	\N
252761fe-da76-4cb6-bbad-17f645a80d13	2025-03-31	Costco Gas Stations	27.79	Uncategorized	\N	f	{}	619625fc61f94d50f709c04fc43286a3b7c84e102ed8e31a261b5a914a2a0809	f	\N	\N
f56bbc07-55c7-4aac-9432-681df9cc1d36	2025-03-31	7-Eleven	18.31	Uncategorized	\N	f	{}	927f1eb627f1b1c89178fddb33c121c0e70b779f671c443140633ee5e59fb94b	f	\N	\N
c643e8bb-b16c-4371-ac69-79d90d338bc3	2025-03-30	Parkmobile	14.45	Uncategorized	\N	f	{}	b3110e8f52f21571a7a5e63894999122285b3d64926249af3dac87e6b293b24c	f	\N	\N
cd02aefc-1f2e-494f-a53b-e4cd06db40c3	2025-03-31	Costco	1.59	Uncategorized	\N	f	{}	5490f01c0647251194abd9a05e74cbe812959d2d916738de8324ff561a1ee831	f	\N	\N
d7a50c2f-a0bf-4267-9e97-7ecb8b93603e	2025-03-31	Interest Income	-0.94	Uncategorized	\N	f	{}	3c924b98ad1f77eefe01576a6f089929a313357deb41fa9a3335850feaad3eb7	f	\N	\N
c4ee76d9-6018-47c6-97c8-a3a7f667014a	2025-03-31	Payment to Volvo Car Financial Services	485.88	Uncategorized	\N	f	{}	01f5898ee0f3d56d608b2f75fb2e1aec4e26be7cfcf1c336df9b77f4cd91f673	f	\N	\N
a505e63c-171c-4367-9bd6-cd4e5851bf1e	2025-03-31	Payment to Chase	19.62	Uncategorized	\N	f	{}	bdda30dcae4c76eb6f4025206bdca248acd6a0ecf18ec79ab8ea78f0454fb07b	f	\N	\N
ce8cd655-b7a3-4fba-b3fc-70eb0841e0ee	2025-03-31	Transfer To Savings -0387	2000.00	Uncategorized	\N	f	{}	9ada372193df1baefce2db4561094daa5e9d7a6cdc6dd15e866fbe9aee6289b2	f	\N	\N
3a4fdfb7-ab5e-4c92-a0be-a357d7c8f536	2025-03-31	Transfer To Checking -5873	250.00	Uncategorized	\N	f	{}	57da0cb7a2b22c52f1b0f16ef3dc376df993ac3dfa10d1e63d7be36b57b03fe4	f	\N	\N
2b4642fd-241f-4741-bbee-38bf3c231372	2025-03-31	Transfer To Credit Card -7148	72.00	Uncategorized	\N	f	{}	1240742f783b4965e6ee4fbe858c5dded40191fe9f26bbbafc82ccd5bb8372ac	f	\N	\N
caf1a578-67ac-4cd9-8947-d0ca72ec88d0	2025-03-30	Moby Dick	60.00	Uncategorized	\N	f	{}	97e28623479e2d8e073d5f642bb8e6f1bfa718497f9f921a8805017942604ad1	f	\N	\N
1751098d-c07f-4024-bdeb-50086df56949	2025-03-28	Giant Food	53.98	Uncategorized	\N	f	{}	083485ebe4e90644f66f0d62d33fa8c49f0455b74b3b189625334d97db47dc93	f	\N	\N
94b72a81-6142-43eb-a12d-4d535bf2568c	2025-03-28	Sam's Club	32.85	Uncategorized	\N	f	{}	58b418476a21c4352007c77f10b6be02f5ab1fbfce9670905f326cd2cc59c7ad	f	\N	\N
5718e296-4b4d-48e1-979f-cf80c5f017db	2025-03-29	Pizza Boli's	27.55	Uncategorized	\N	f	{}	d6fa0dd91689885c295fefddc5aadabb54678a4360a0c6b2aae532f63a059a35	f	\N	\N
0ef1af27-1d09-4bf4-b9b9-b2fc8dbb9cb5	2025-03-30	Dunkin' Donuts	21.35	Uncategorized	\N	f	{}	20ca8a9558e4c24ec47f8c6bb1952e7b44e6f8733c5628460789fe9300c9df45	f	\N	\N
a96f4431-3fda-4d60-926f-889d64fcda49	2025-03-30	McDonald's	15.35	Uncategorized	\N	f	{}	55b3c48463f5be2d5dc28477fb16a13e34c997d76133c530614e6716c7fd5890	f	\N	\N
39c7edb1-1090-4e88-92a3-355f5dbd0a24	2025-03-28	Dunkin' Donuts	10.97	Uncategorized	\N	f	{}	dbcf53ff0d098723ce3a53bf7cb22216b879dbaf8b96ecd3299ea72e9e3995aa	f	\N	\N
ec347c84-3a30-4f89-9197-67793f21079e	2025-03-29	Walmart	10.57	Uncategorized	\N	f	{}	5f128797f82bce6613fe6917ae1da72c2a9bebd52222a6acde3be081bd4958f8	f	\N	\N
af0e7842-756c-4714-a4c7-91f9b96eb8f7	2025-03-28	Dunkin' Donuts	8.99	Uncategorized	\N	f	{}	696d15d8d32e61d6d86176b5c427d7065370c57e6a24e2c343e637ed08092c2e	f	\N	\N
7e1dc4c7-edb4-4f3e-9c4f-a23ab3064db6	2025-03-29	AutoZone	5.82	Uncategorized	\N	f	{}	ad5659c8da8600c9b2b79aad883cc21b90d3d9e14f1358650da18d2e66670f90	f	\N	\N
4e55d831-1695-4e0c-92b4-6a74fc5227b1	2025-03-30	DEBIT-DC 4581 CTLP*INREACH N BETHESDA MD	3.35	Uncategorized	\N	f	{}	e58931cd5081ccca2005fd59e007f2f48d461ce68c79667dea40b1694e8bb392	f	\N	\N
8873bdda-5754-4b53-8cdc-c7f7662de797	2025-03-30	DEBIT-DC 4581 CTLP*INREACH N BETHESDA MD	2.80	Uncategorized	\N	f	{}	0efb5927c36b5cd4e417a9084d39b84a867070ca4ba87f7775d256867112c87d	f	\N	\N
58b5c1d8-f31f-406e-b6bf-ade307e75967	2025-03-30	DEBIT-DC 4581 CTLP*INREACH N BETHESDA MD	2.55	Uncategorized	\N	f	{}	ffc7b58b3e30dec30c0914b67ae069188ea545fc2f50a22cbdf55f6e1989eeca	f	\N	\N
7a0f71f1-72bb-49ef-97d3-63a5b89309fd	2025-03-31	ACH Debit - Claudaya Hood Be	850.00	Uncategorized	\N	f	{}	9db9ab0e9b950c5fbe87b8838092d6bafe513c14ad27c17fb02500adbab1af18	f	\N	\N
0fd7098f-3aa9-4852-bbfd-4449f8cefd7b	2025-03-31	Transfer From Savings -0387	-3300.00	Uncategorized	\N	f	{}	9a4273de77686e8ee5c0942e5400dde81d5bab86e63736fd853ce127caad156e	f	\N	\N
446c45c0-f1f2-4fd2-9d53-dbdf71417ca0	2025-03-31	Transfer From Savings -0387	-1500.00	Uncategorized	\N	f	{}	604f38e6083c36892633421de3c030d4ef503cf27b5cfa77b8b298b9aeda273b	f	\N	\N
8162be6e-57cb-4aaa-9efb-0908ff5e751c	2025-03-28	Payment to Citizens Bank	88.12	Uncategorized	\N	f	{}	1b1dc56419c894af24b953a2281dfba5ef369262120e1a91e06c763e142a072a	f	\N	\N
a636213e-25d2-47d0-a34d-c7867f40d5b7	2025-03-28	Transfer to Venmo	15.00	Uncategorized	\N	f	{}	59192f82550e5cea132550c6f34d532fd8a5f3fea950c78d8ac82c7972913ff5	f	\N	\N
60ff30c0-3bf7-43e2-993f-1fe93f57aa4b	2025-03-28	Transfer to Venmo	5.00	Uncategorized	\N	f	{}	15102566025758f43c4f5a81d28530345e5dd6edb1592e74914d5c117f3012cd	f	\N	\N
10d5dabc-683f-4cc1-9022-41829e9c0b9d	2025-03-28	Transfer To Checking -2298	500.00	Uncategorized	\N	f	{}	ffdc81e91521479d60619fd0d12f61eceac8b443ae9bf261077bbe21a665ff06	f	\N	\N
be34c9cc-38bd-455c-bedf-176b75cb369e	2025-03-27	DEBIT-DC 8678 OTF GAMBRILLS XX7925 MD	14.00	Uncategorized	\N	f	{}	e9896a593b0f369ff24885688e229d03844fa79adac0c9b3869eb6097243c38c	f	\N	\N
4bb342df-20f9-4019-aa08-d8de3e6f7d28	2025-03-28	Microsoft Deposit	-4690.28	Uncategorized	\N	f	{}	5277e99b971c995922cb12d838a89a5d3af1e415cb5bdd6511fd1834271813fe	f	\N	\N
6c787347-6439-486f-bd90-6a1e526a8451	2025-03-26	Charm City Run	56.87	Uncategorized	\N	f	{}	63ef6b9e054e6525ce5a3ebfb527d2d38abe2d869be39d8e438e18076f803fb1	f	\N	\N
f633b340-ddeb-4723-b82c-85c3237637e7	2025-03-26	BP Global	10.20	Uncategorized	\N	f	{}	8147218987ba406f85a89476a83b3c7f9458c70bb163d1a1eb1f95b3ceb6dbee	f	\N	\N
0a74ce5d-27b4-46a2-b975-88d6482e7bf5	2025-03-27	Deposit Henry M Jackson Payroll	-1819.58	Uncategorized	\N	f	{}	32cbca0fc840f66adb43372d08816bbb9df327b05764312b24ae9b33cb02fafe	f	\N	\N
60f53268-9412-4a1e-a40b-5cf208d7571b	2025-03-23	DEBIT-DC 4581 TST*1928 BEACON HI BOSTON MA	260.00	Uncategorized	\N	f	{}	cf0e4f9fe2092cc5e0fd48e43e3bdaa16ea5cfd6dd7b6276d49500a95d59b493	f	\N	\N
02c00980-3b46-434f-80c3-1faa91ba6fd1	2025-03-23	JP Licks	55.00	Uncategorized	\N	f	{}	2cc6f3b30a60defa3c9b388e01a33f9230a2dd342ef06dd4fd278e9496862891	f	\N	\N
f5e94f0e-63f5-495a-9df8-906e8d89d77d	2025-03-24	Shoppers Food & Pharmacy	50.61	Uncategorized	\N	f	{}	9cc0e71d2140cdc28a9cf111df69bd824d14fbdbaa7655e55e86f72d90b85a27	f	\N	\N
fba7daa6-8bfa-48b1-ac30-739e7d02f405	2025-03-25	DEBIT-DC 4581 COOPERSHAWK XX-5674 IL	44.99	Uncategorized	\N	f	{}	c5ed6bf5346f9e7e875c21545fc6c34edf331606d1bdb6c01fe4be3ea0a8d8db	f	\N	\N
3bb4e342-8b55-4615-99e9-5817da80cd60	2025-03-24	BWI Airport Parking	22.00	Uncategorized	\N	f	{}	c48f699c6598ef9d5737452d5b79cd6f26d530566523c7b6a4ce2f9d42a6aaa8	f	\N	\N
94766e94-2cc7-4992-bd3d-7830fb522c75	2025-03-24	Giant Food	13.26	Uncategorized	\N	f	{}	5c0648a9642e833cdc28402b21c80c63e8349bb72d0fad1bbb53d8ee5e31a2e3	f	\N	\N
9d3c4e4e-c123-4c1a-a43c-e1f03e331603	2025-03-24	Goodwill	10.60	Uncategorized	\N	f	{}	97583fc9d489fcc5b27ef6c934e07f5607caf908a5ab747b34c141416aa96cea	f	\N	\N
d4f532c9-4886-4e99-b6b3-ab4a1bb2c289	2025-03-24	Giant Food	8.17	Uncategorized	\N	f	{}	84d21279cfaa84e91305d3edcfc29ff23a7d8af979c6f0d099d52bd87270d32d	f	\N	\N
6f79755e-8a67-4260-add8-e4c1fe8f22e2	2025-03-24	Payment to Liberty Mutual	260.08	Uncategorized	\N	f	{}	3e2d78a76a880305d3086c1f42e0f9b5212940913f2175f66b25a44596d87b09	f	\N	\N
fc52b965-4489-42b9-aac0-271e88db4fa3	2025-03-24	Transfer to Venmo	45.00	Uncategorized	\N	f	{}	b7bacfb7ae3fc454480e6f388fd5fe77669757499a4358f4b30c1af0d0eb1b3e	f	\N	\N
55889fa8-9c54-40ec-ad0c-9aa1fdd00b8f	2025-03-24	Transfer to Venmo	30.00	Uncategorized	\N	f	{}	b5ffbed422a6ba0973d2e622ba372d7ca2b005bd86328bd841b751fbc4186a4c	f	\N	\N
ab33401e-8ecb-4528-ae7e-86f2e0d4c170	2025-03-22	DEBIT-DC 8678 Beacon Hill Books And Boston MA US	180.00	Uncategorized	\N	f	{}	37f6f53a72a2e2aa8415be632de0c00cbdc58e56817197855ab0f1ba3126d48f	f	\N	\N
d0b97200-3778-4e25-866d-fa7c2daeb49f	2025-03-23	Antico Forno	116.86	Uncategorized	\N	f	{}	502aadcc78f9252d5ee0df1c1a2fb74742fb65dea7d728ccab72e0b7f3fedff9	f	\N	\N
7f097be2-3c3d-44b6-b2be-66fc6597bd95	2025-03-22	DEBIT-DC 8678 SQ *MUSIC RESEARCH BOSTON MA	71.19	Uncategorized	\N	f	{}	15ca64296e281e5ab6575067d75ce1c512a3b309e0be400f1d79a728f2446d64	f	\N	\N
66904d5e-da20-4225-a0f3-1ad7daf4020b	2025-03-23	DEBIT-DC 4581 SQ *GRACENOTE COFF BOSTON MA	65.72	Uncategorized	\N	f	{}	3098b0c9c791b9c70e29e4385006783c398cd257c20a900856ab4f5a6fb146f4	f	\N	\N
828cd3ba-0ccb-483c-aeaf-70b2d6f9cf18	2025-03-22	The Paramount, Boston	65.27	Uncategorized	\N	f	{}	ddc1bf93773d4a20cb5e652f987fbc9c177b751c653336ab7a06aeb86b00c735	f	\N	\N
c9b72059-49a8-4b44-96cc-e27ce6d6c03c	2025-03-24	Uber	47.58	Uncategorized	\N	f	{}	30de6eb1d839ebb339124592a9f35d676f96a1fe7364d1fbffae90076bd815a6	f	\N	\N
b29b0678-4e0b-4075-afa6-6bfe60c110d2	2025-03-23	DEBIT-DC 4581 SQ *KNIGHT MOVES C BROOKLINE MA	45.05	Uncategorized	\N	f	{}	74f13b62aba31a9f15619f543d8099234d2c34bcbfa680ccb134ac192133e1e8	f	\N	\N
31b2c66e-f084-4e29-981e-460a758c9fb7	2025-03-22	DEBIT-DC 4581 SQ *WNDR BOSTON BOSTON MA	39.12	Uncategorized	\N	f	{}	4a4c5b14f4944e18f5c9c711d12ceda1627f1d7bd5aef09e249b0ed0825df7ab	f	\N	\N
6da7a2f6-e195-46da-97ed-ee7bc3567268	2025-03-22	DEBIT-DC 8678 LS GUS & RUBY LETT XX1801 MA	33.79	Uncategorized	\N	f	{}	1f414a99e3e8d63dbe51b9a7f45752d5401efc2392e718d54ca66b0ed2e1896e	f	\N	\N
c1eee1be-ee78-44ac-bbd1-3516e7ab022b	2025-03-22	Lyft	21.61	Uncategorized	\N	f	{}	1cc0fe35db93891c7f3b7efb128a620959a2fc758c41c7eb7c3199235e6509c0	f	\N	\N
bb5a7e1b-ca0e-4256-98a7-24d42abb0892	2025-03-23	CVS Pharmacy	20.73	Uncategorized	\N	f	{}	5dd3ca67c19bf4f8489e036341afda9c7fa7bd63fb8b93fa093bc0e757288353	f	\N	\N
5b2e3eaa-4efa-4609-a62c-cfebb983204e	2025-03-22	Shake Shack	19.81	Uncategorized	\N	f	{}	448ffa3d54fe44bc1b7f538e4328b1dcce0589ad7d5855b35e578731ab9000c2	f	\N	\N
7bf7fc95-1c3d-4625-9f90-c7abdcc7dc85	2025-03-22	DEBIT-DC 4581 SQ *MUSIC RESEARCH BOSTON MA	15.94	Uncategorized	\N	f	{}	fc13c9bc0667fc75a321ff5efead798375ded99747553891d370aa0f7f2adebd	f	\N	\N
19c9a0b7-6634-4db6-bc42-7a7f9d9a0270	2025-03-22	DEBIT-DC 8678 TST*BEACON HILL BO BOSTON MA	12.84	Uncategorized	\N	f	{}	61611b50b4a44f92f9b3ccc3ddf38e7074533e7afef074a51f545b8ac67e2397	f	\N	\N
c8ff0336-5c30-4798-9c0d-f8722aa4fcf9	2025-03-22	Netflix	8.47	Uncategorized	\N	f	{}	126fd7ed9129b7134aecbf2eda2ae541cb58ec35b368a11e8d47392570a1f198	f	\N	\N
c78aab9f-bb63-4ce4-972e-8ac13acf1879	2025-03-22	Apple	5.29	Uncategorized	\N	f	{}	a0692e1a42c7798388cb76777a600d81a2ca15e7fbbae18d89bd7b19ccaa63fa	f	\N	\N
d380d1f2-50d9-4e7f-9b10-8943ea7983e7	2025-03-23	MBTA	4.80	Uncategorized	\N	f	{}	1f4bb5ca9a403291d96d7ff7fe33e035672a95002ee65c8d3aacd3df47b428dd	f	\N	\N
318f0184-9939-4c52-8fee-ab458735f915	2025-03-23	Hudson Group	3.71	Uncategorized	\N	f	{}	d419bc1efb30793a278c5de5c73d6dec98a6c5bfd35e1ef871a4c04a65628775	f	\N	\N
f8817ecb-3f3a-47e6-af7a-998236171aea	2025-03-23	Dunkin' Donuts	2.25	Uncategorized	\N	f	{}	0d48d9129e10553d7726b087b737b0b217d1ef164aba1b13d3af875d7a18e25f	f	\N	\N
fe2241cc-d89b-4886-8b61-518822d618d1	2025-03-21	ATM Rebate	-5.00	Uncategorized	\N	f	{}	fd0a8a19e8c8dbad187565a8e9354b436a7d15db1116ea6139a379aac25a9a76	f	\N	\N
02229669-347f-4fdd-b209-0951462341c3	2025-03-20	Target	100.04	Uncategorized	\N	f	{}	7a0ecef4942e2f330b82e386ebb1b655cf2284324db897a84ee1b8f4340d9814	f	\N	\N
833f82e1-ab8c-48b6-bcd4-46e1b77fbacc	2025-03-20	Burger King	5.91	Uncategorized	\N	f	{}	04e9ac2e7edf42b2d1840fed8af331964243983ce294d15d74975cfc0f67533e	f	\N	\N
e69c8d8f-d423-4d4d-9b54-8a5cd2885fc9	2025-03-19	Giant Food	149.01	Uncategorized	\N	f	{}	040a30f529d61d33294c71907bd5dd63767fd3642f287f94df1500b58de0b121	f	\N	\N
48032f0e-caed-43f5-9d2b-6c96410d529a	2025-03-19	Transfer To Savings -0387	3600.00	Uncategorized	\N	f	{}	3a8c886d7c840edf790c5c95cba614c36d0af12466c6897d983b56572d4bfeba	f	\N	\N
4651ed96-117c-4a92-adf2-751b1b495e4e	2025-03-19	Transfer To Checking -2298	600.00	Uncategorized	\N	f	{}	0751f6afefdce8b6b3dd1649830bc70645565c655a0b19a4b2ce7999fcc0e888	f	\N	\N
761e840f-620f-4e1a-ae2a-b58c8e205c8a	2025-03-19	Transfer To Checking -2740	200.00	Uncategorized	\N	f	{}	e44a92fa39b968af5d1b773189d07f339e02c220a22cda4252047fac94986c2b	f	\N	\N
55c9b328-ac0f-42f9-a5a6-8aab9f3dcac7	2025-03-18	DEBIT-DC 4581 ANNEARUNDELCO-UTIL XX-1144 MD	255.35	Uncategorized	\N	f	{}	1b674e42746d8319d6ea924297e105dfe17f97528d6f8580e43f53e03a12660d	f	\N	\N
343cabc1-a7a9-4973-ac9f-0bb323874892	2025-03-18	Apple	7.99	Uncategorized	\N	f	{}	33e5432161fafa6f3ebb5147dc5d88bd13ea8e87f4ccf80f3776b44f5bd3d3c1	f	\N	\N
2b907289-c368-4ed6-8b8f-0e9504a4adc6	2025-03-18	Toyota	900.00	Uncategorized	\N	f	{}	dfb6e14b5819920a0155a25fa553942947145a8878e39bd1acc0efe44b32e275	f	\N	\N
d34152a0-2b86-4a7f-b302-a0ccffd3d157	2025-03-18	Payment to Educational Computer Systems	100.88	Uncategorized	\N	f	{}	33f3991b6dac2422a1cc683e783470f754e2e4eb00bbcd6bbb4457bacac24e06	f	\N	\N
4f032fad-704c-42e2-ae8f-d261e707325d	2025-03-18	Payment to Chase	50.00	Uncategorized	\N	f	{}	a1ff3ed085024b88cd9dea42fc3ec8ebc12da6faaf7e690ec052ac691c3f0242	f	\N	\N
65c31c45-8f29-43b8-bd75-5393fd7a1649	2025-03-18	Payment to Capital One	43.67	Uncategorized	\N	f	{}	be4d08303e8b9288ccff523fcd86e5e9e2b3e497dff7e9abdd9aa92fd6867980	f	\N	\N
397785e6-08b9-414a-b667-5a654182e656	2025-03-18	Transfer to PayPal	17.62	Uncategorized	\N	f	{}	3cac92b3cfb275448fcc495351d15431ab4220366a1a2cc5a5f1701d9d09fba0	f	\N	\N
34978ca6-f197-481b-9bd6-5f3df89fd8e8	2025-03-18	Transfer To Checking -5873	150.00	Uncategorized	\N	f	{}	26f6417258c734cb91eb25c72b6647c2efea69de0b2318cf63f5e2ef45126c89	f	\N	\N
524f0310-4089-4027-8d25-500d6777c510	2025-03-17	Sam's Club	17.14	Uncategorized	\N	f	{}	4cd89afdbaa6f62a0ab82c77dd39d2393324417e8a1839de10386a075ea4ed82	f	\N	\N
97c9cac8-2835-4322-bb2a-4d8fea5e0123	2025-03-17	ALDI	8.82	Uncategorized	\N	f	{}	22c10fc1e87c640adabea332708e9b4f629f71d219222f0377b938ffdb1a9ec2	f	\N	\N
1a96d8d1-6b5f-4950-977f-1fe5c0b437ab	2025-03-17	Target	5.48	Uncategorized	\N	f	{}	a1f357f64afec1466cd7a20695ee7e012ebb93ec1472ab06f2bf6f2dea818d1e	f	\N	\N
5e87c9b3-0867-4d89-b8fd-5d51f1bee993	2025-03-18	Reimbursements from Fidelity Investments	-5000.00	Uncategorized	\N	f	{}	05b02c8c44abdaa7c87d8421f21383977363007e289302191048cc1b52046f99	f	\N	\N
6be2e2c2-af52-417f-a141-4a07b7868d09	2025-03-17	Payment to New York Life	616.54	Uncategorized	\N	f	{}	91d04e29863765468110a43a32a88d71db0d63d3666bbd4c04dc55c8862dff11	f	\N	\N
7d5c9b18-03c9-491b-adb8-16223e668b9a	2025-03-17	Payment to Discover Bank	412.00	Uncategorized	\N	f	{}	c72ebd1f3305fcd9be85e5e590feea232f2e675ac8f8c23f513e804eb157349e	f	\N	\N
9fdeaabb-f852-4598-9771-e6a6079a0c56	2025-03-17	Transfer To Checking -2298	1000.00	Uncategorized	\N	f	{}	a6a997224acb08d595584fdf07d7f53ee59ac57a2de5fa8093e3d3c8a88ca90e	f	\N	\N
7eb7f870-50c7-45d8-9f0d-476793f0dabe	2025-03-15	DEBIT-DC 8678 SQ *HOMETOWN GO RICHMOND VA	344.50	Uncategorized	\N	f	{}	b1f01159bb792a283c86f867f35ae4384af7aab916ec6e8e3b678f1badff95c0	f	\N	\N
1f152e09-865d-473f-b881-fc46eb188d90	2025-03-15	Kanpai	201.63	Uncategorized	\N	f	{}	d5e65592f0f0bc594e7f49dec74739c093ba9b04991636993033f79f89f86f7a	f	\N	\N
208931fb-046f-4792-a1b7-c30e6a5be55f	2025-03-14	DEBIT-DC 8678 BISHOPS CUTS AND C XX8226 DC	200.00	Uncategorized	\N	f	{}	fbec972a61dbe20ba732642c2c0d2d3baa35352833c66fa9c69f3802ff72c1aa	f	\N	\N
af41fe76-ef2a-47f3-84ce-11de379f931c	2025-03-15	Transfer to Zelle	100.00	Uncategorized	\N	f	{}	abacf500f61aff3180f1ada69bd282fb72f48b849c460137cd0149f6fb30affe	f	\N	\N
1413bb9b-ba90-4d9c-b068-1ef227f52bfc	2025-03-15	DEBIT-DC 4581 SQ *THE BLACK BELT RICHMOND VA	49.50	Uncategorized	\N	f	{}	7c661c54c45a18313f5da90010bd34b9f33d07b7751d8fd31f14ed93e97ad078	f	\N	\N
b7b8aa22-60d6-4f8f-b06d-990bfc4b318d	2025-03-15	DEBIT-DC 4581 SQ *HOMETOWN GO RICHMOND VA	27.56	Uncategorized	\N	f	{}	629051b83dfb443edb141e4403c03166c5eaff421761333b80e30d83b5f9ac88	f	\N	\N
c4c6ca23-db96-4134-8c1e-2a8a26cf9dce	2025-03-15	Sam's Club	25.15	Uncategorized	\N	f	{}	b0707838a84387531b1147550e39ca666607a3e51d0e7d9c39d3aa50647f1d83	f	\N	\N
33008e1a-cfcc-4d76-94fa-e6916dcccad6	2025-02-26	Dunkin' Donuts	11.64	Uncategorized	\N	f	{}	2566ac592e025312262225991c91f95f76b4c9dd62a3fdba474bcf4ec23098fc	f	\N	\N
f06ed8b1-f0e6-411c-a5ea-c8739f641abe	2025-03-15	DEBIT-DC 4581 IN *WHEATLAND FARM ARVONIA VA	24.22	Uncategorized	\N	f	{}	b31d6f4a4cf23016d69d6eb491cbc68fae89e5d7a5bea19f5b72f9226cd40734	f	\N	\N
80c13ed0-023c-4f05-a77d-52ab9c94173f	2025-03-14	Five Guys	23.18	Uncategorized	\N	f	{}	b0887df30dbeb1fe974b0ea6d4dd2d98cd562ad253b44e76390b7dbb1562fb6d	f	\N	\N
406004b0-660b-4f2d-8008-bd4cf2bc8999	2025-03-15	Choco-la	22.00	Uncategorized	\N	f	{}	3fb9d06ea4e25d57069bb7e9aea7d8b651c3fe4f30601693c5dd84752915bf39	f	\N	\N
3f3c31bc-9920-40c8-b23e-94e15ffead6b	2025-03-16	McDonald's	14.79	Uncategorized	\N	f	{}	2200ccd63d27a9beca87e1423d223e08cd2e92885a61dacc12aaac1ae108dbb1	f	\N	\N
3c7cdd35-2737-4435-9b85-b9e042f195ae	2025-03-15	DEBIT-DC 4581 2LEVYATRICHMOND RICHMOND VA	14.30	Uncategorized	\N	f	{}	9a36b7e3482120be5a6ab6addbc45c4939bdab5359201066b3103f94858d023f	f	\N	\N
f8f46fc4-3974-4d21-8a8c-5ad5f9222134	2025-03-15	DEBIT-DC 4581 2LEVYATRICHMOND RICHMOND VA	13.78	Uncategorized	\N	f	{}	a3f65382ed0aa88a099ac4a71674f82b98a3d20116e2a9da6ca1250b1c2d0fb5	f	\N	\N
292290c9-4092-4286-a682-6ac8eae5bf7a	2025-03-15	DEBIT-DC 4581 TST*THE BIG SCOOP RICHMOND VA	11.73	Uncategorized	\N	f	{}	5f056fb4f2862edece54bdee5fa29031fc80c3eb5ae05baa2fdff1717dd450ba	f	\N	\N
4cc81373-e27d-40b3-ad1e-95fe077836d3	2025-03-14	Safeway	10.58	Uncategorized	\N	f	{}	cf6e7bfe1fc90b241b16721aa5518167edc32a9861ae27bbb60cb595093108ad	f	\N	\N
55d7b9c1-0bf0-48e3-92a8-c569eb933d73	2025-03-16	Bojangles' Famous Chicken 'n Biscuits	9.67	Uncategorized	\N	f	{}	edb58474f41e06133dfe70dbfb6d55ec80f4bc20cc604c0e916a3abe0de565fc	f	\N	\N
564d3472-700a-4b2b-8fa0-598483eeef05	2025-03-15	Dunkin' Donuts	8.99	Uncategorized	\N	f	{}	0f7d715fb799cc04225cdbfef67b8afcce6f0ecc7ff90ac71bd61a6469b24ec0	f	\N	\N
548b91ff-0e36-4c48-a74c-c69c25498539	2025-03-16	Dunkin' Donuts	8.04	Uncategorized	\N	f	{}	9668aa692134517e36727b806ac3b558cd407681347f5f301cdc296b936fd0e4	f	\N	\N
271179d5-6d7a-4d2b-b599-6dfcecb75138	2025-03-14	Transfer To Credit Card -8715	500.00	Uncategorized	\N	f	{}	62613d30515f3f84ee83101c71d197190a5a6915602260528f8e17db4195e21c	f	\N	\N
cbf7cffa-7588-4696-b276-d104c622d815	2025-03-13	Transfer to Zelle	42.00	Uncategorized	\N	f	{}	871ee0257d60d13b1fef8e3c567d04d9f4efe5676dc3e84bcb3057515dcd3d17	f	\N	\N
8f6dbab8-679e-47f2-b4a1-c94e9b485b96	2025-03-13	Sam's Club	34.99	Uncategorized	\N	f	{}	2250a032814b5c97ca774b0303f874003c1e3382707f0505e9f8b4ebf2e0237b	f	\N	\N
1e488dbb-aaa6-4ff6-92b9-5f58e23542b4	2025-03-13	Ace Hardware	16.95	Uncategorized	\N	f	{}	97e1c25053b6daf24c2720ee0823404636d279f9d2e357021910e7a852a0516f	f	\N	\N
c9a9e4a2-13db-4250-9008-59f7e3a4cbfa	2025-03-12	DSW	78.41	Uncategorized	\N	f	{}	73402b8bccda55ebf5471dfdb68f407a1151f61172719fb0ae2329206f9f35d5	f	\N	\N
6e024e7c-6eec-4e4f-aee4-ce9d6adeaffd	2025-03-12	Choptank	64.08	Uncategorized	\N	f	{}	bd206f4c6326b60c33fa1cedf4033790bdaac3627a3e67713854788dc7ae0382	f	\N	\N
e452dbbf-ee2b-4a06-b7c1-0335305fb327	2025-03-10	DEBIT-DC 4581 PAYPAL *ALIPAYUSIN XX7733 CA	12.55	Uncategorized	\N	f	{}	1af03617bacd6e6ee9092811e28871fa3b25fd8cec996870bc5aad8553928a7a	f	\N	\N
8203e979-4e0a-4649-abf2-7471078cc369	2025-03-13	Microsoft Deposit	-4690.28	Uncategorized	\N	f	{}	a6d0179417af96ffa6438acb22d2302d76cc25461f184f85420d6e4676726079	f	\N	\N
f1c11afd-3de7-41fb-9732-b47a539a6d3c	2025-03-13	Deposit Henry M Jackson Payroll	-1797.41	Uncategorized	\N	f	{}	d5e0bf289ce3a8aa2bc0785d1f6c17ec9e9eeb6a3c790b8856264f19929f1c01	f	\N	\N
00c42759-d19f-4b04-a57e-0a1c2ce74454	2025-03-12	Payment to Verizon	94.99	Uncategorized	\N	f	{}	fef2d43e50bc97dbc25a97d023f1a234fe15bbf9cc309ed074de5ecc4a915ebc	f	\N	\N
397de026-5a1f-4078-a1f9-643e27f40401	2025-03-11	Honeysuckle	612.63	Uncategorized	\N	f	{}	bd5ae361b056234353754050e1e990a129e80080176d50ee0454a0bfb5595928	f	\N	\N
e151b541-4d21-46cc-9bc8-79b2b7fc949f	2025-03-11	Rise Up Coffee	7.36	Uncategorized	\N	f	{}	4cb8d079189e29e656539736a5d56a87fb0d4264c5ab99cc67b6e323cf6db2b1	f	\N	\N
f76a3cff-d059-4043-811e-ef78381e8af1	2025-03-10	DEBIT-DC 8678 SP CELEBRATE US CELEBRATEVITA OH	106.28	Uncategorized	\N	f	{}	7b1cddafbad3460ac99494a0ff7bdb13b3084f733e0d7fd7cc227c07fc64f8d8	f	\N	\N
d63c2fe5-b9f4-4544-9b60-69274e2f5c1e	2025-03-10	Cooper's Hawk Winery & Restaurants	86.89	Uncategorized	\N	f	{}	51beb596dbc9885a214c245ecc5be7d5aa9559abead5b401ad0e7086b4ce48ce	f	\N	\N
95b8d693-0766-4ec8-a418-0edad3a9755c	2025-03-11	DEBIT-DC 4581 COOPERS HAWK WINE DOWNERS GROVE IL	32.69	Uncategorized	\N	f	{}	e5ffd465eced204aef0577c9e8bd7cb029dca1edc7f5c609b081c8c5001f5002	f	\N	\N
15554d85-57ea-4f20-8d31-2a6651f7cbd4	2025-03-07	Carter's	256.49	Uncategorized	\N	f	{}	3ed3bf638435061237b33837fa2f8d1d3a3e478a06e4928bdbb4d6e9d16b8563	f	\N	\N
1fb33294-cb74-42da-8270-dd84006ad32e	2025-03-06	Polished Nails	141.50	Uncategorized	\N	f	{}	6b096fdac8a1a5e8ccfdfb92b15413ee211f6345b0a58ee6f638cd35208a7905	f	\N	\N
5d610fd4-9037-4424-8282-691da6709cb2	2025-03-08	BP Global	35.05	Uncategorized	\N	f	{}	71d746d1b94e62c7655efd5ca78433f5481e8530cdebfb3055d0b727a57c7c17	f	\N	\N
90e1e18c-81ce-4647-ab5e-c1e158351901	2025-03-07	Cold Stone Creamery	17.27	Uncategorized	\N	f	{}	dbdc23b581dc073311c889cd82e4315d86d0e6a249c3d4f1bc3d28769fdf2944	f	\N	\N
9c16cf93-8933-4ecd-bd40-9d46372988b9	2025-03-08	Micro Center	16.52	Uncategorized	\N	f	{}	7acb63c1ef90ae2fb27d300e4a8c8fe0959595e64c7b45d64e74e45ef97cc771	f	\N	\N
a2848a3a-71be-43c1-9374-8cc76ca638cc	2025-03-10	Harris Teeter	14.51	Uncategorized	\N	f	{}	37d1835d85fd9bb64e35305d6759dc69cfc4e5fba3d34c482154a69b9d7f072d	f	\N	\N
def1323d-5689-4613-9561-c4c9d87c0fae	2025-03-09	Popeyes Louisiana Kitchen	14.30	Uncategorized	\N	f	{}	35ea05f0c270c819db6d6c4a62c15579abd43e439b85e19a71837590e3ecc8ce	f	\N	\N
1d34d29e-aeae-4266-a72e-d003926ca6cd	2025-03-08	Taco Bell	12.25	Uncategorized	\N	f	{}	d8093e4a4f3f04fc758d0ea99d8e4b9e8b00a5a151c74258b67f61c7d69591a5	f	\N	\N
50152d19-0eed-46b2-9c0c-fcd18d65b412	2025-03-07	Apple	5.29	Uncategorized	\N	f	{}	4a0af814835ea153235f17adcb4152ba9ade6647376976173a43d67f8b02951d	f	\N	\N
cf2acec9-46d2-497a-aafb-0881e7a4de60	2025-03-09	Dunkin' Donuts	3.38	Uncategorized	\N	f	{}	5a3fbe724ffd7ab7d5d237665ff27ac7b139fb6e6d1282f61ec41fd169a058f2	f	\N	\N
b2933db3-94f8-4857-87a1-4d3172326719	2025-03-10	Transfer From Savings -0387	-1000.00	Uncategorized	\N	f	{}	b2058066f4e559c8c58dc85c14e70fe42c64192261722dc6765011c6fbf7e697	f	\N	\N
76025781-f361-478a-b144-526d744294ea	2025-03-07	Transfer To Savings -0387	2500.00	Uncategorized	\N	f	{}	625c83d3f9adc5c61e6abc2bd30fd3ee3f426fa9947d3d70504554032a9f1967	f	\N	\N
be5f5b64-a859-4ce5-a9c0-d17dfdccf38d	2025-03-07	Lovevery	127.20	Uncategorized	\N	f	{}	d130d6715bb27689d623f7791cab03bacc751c086bb07a3c3df5b6f292a2d50a	f	\N	\N
687e3427-aa25-47f1-8599-ac934728cbbd	2025-03-05	Pizza Boli's	39.19	Uncategorized	\N	f	{}	72af1d7c4cfa167329015758af0feafe3c4b100559990f1f5d6e5780951f7397	f	\N	\N
5a262ffe-ec43-4a61-89e5-b2e291f512b0	2025-03-06	Cold Stone Creamery	10.59	Uncategorized	\N	f	{}	ee31040f295db57c7365ccae23219ca7b2596ecac5e29680f09171681e7b7461	f	\N	\N
6ba93109-cb18-4c25-b215-2fb27e1a1501	2025-03-07	Transfer From Savings -0387	-1000.00	Uncategorized	\N	f	{}	1e0840f2d1f7a97309275be45c38e4644da0a0626171dc3541ca23184609b84c	f	\N	\N
ed515f9e-9588-44ba-b760-7547bfbc1ee7	2025-03-06	Transfer To Checking -2740	274.83	Uncategorized	\N	f	{}	38bbef7dedeaf7af917c9c9d28f7fb34b39736b2a0b9fddbaa36d45a397b6dca	f	\N	\N
b173fb35-6bf0-4265-a208-cebb32e507b5	2025-03-05	DEBIT-DC 8678 MICHAEL AND SON SE ALEXANDRIA VA	2380.88	Uncategorized	\N	f	{}	0935143319d3051c643dabf97a499c3314a4114409828610aced69048dd33e47	f	\N	\N
81fa73ca-a5f9-4247-85ea-42cf32cc4cd1	2025-03-04	DEBIT-DC 8678 OTF GAMBRILLS XX7925 MD	199.00	Uncategorized	\N	f	{}	97f28ba3d85e65bb6dba8d30a5445fa04f85735d46d7a067ce707d0ac433f43c	f	\N	\N
27d02efc-5175-4578-9009-6645f4fd4e42	2025-03-05	Amazon Prime Video	-8.47	Uncategorized	\N	f	{}	7f2a4c0f4c2d0d0bf519cf02799a9a20f9b3166c4918380ff6e33e27ee839cc8	f	\N	\N
841c42d0-9231-470c-93e9-196999a7817f	2025-03-05	Amazon Prime Video	-6.35	Uncategorized	\N	f	{}	078667d4b774a22dddad35293f9b9f36bd4e18d6ec3a3d7548c932205fa6e8ec	f	\N	\N
40cbd785-fb5f-491c-8bec-373e4d89c682	2025-03-05	Payment to Volvo Car Financial Services	485.88	Uncategorized	\N	f	{}	a71fdbdce985a0ab84865cfead00e0a12f6753889bda3aa0c0bd7a4c6fb48482	f	\N	\N
ced83af4-51a4-478a-be71-62db03ac12fd	2025-03-04	Payment to AT&T	216.73	Uncategorized	\N	f	{}	a0f7e582568c8287d64e50f56ad9132993a4d61cb6c8f615cdab2ed130dcc1e1	f	\N	\N
3ac93d92-61e0-4a65-a357-cccf781cc329	2025-03-04	Dunkin' Donuts	8.46	Uncategorized	\N	f	{}	6b029f22bcc2240677379bf4a3a7655dd2747ca0db8997dc2f989aa9baf72855	f	\N	\N
48d97bad-cb7b-4b51-afdb-c3313655c994	2025-03-05	Transfer From Savings -0387	-4000.00	Uncategorized	\N	f	{}	574ce8cef1883e421d7ca40a4778d74845317559737e1e59dae80ba7dfc7d554	f	\N	\N
35bffc22-77ff-438e-b410-c7a2e4d2349a	2025-03-02	DEBIT-DC 8678 DOK KHAO THAI EATE COLUMBIA MD	123.14	Uncategorized	\N	f	{}	605ca432af8593b7bb4c8e099e2a26a9c531d904460ec73a2b9eb75441dcd2f6	f	\N	\N
1152f316-6be3-49d4-8acf-552e35aa3db4	2025-03-03	DEBIT-DC 4581 SP CELEBRATE US CELEBRATEVITA OH	50.08	Uncategorized	\N	f	{}	418d5449775fb8d043826355166b440f132992d348e6d641327b118bdaf74d9e	f	\N	\N
f7ced929-3767-4e8f-8073-90e773942aa6	2025-03-02	Amazon Prime Video	8.47	Uncategorized	\N	f	{}	30c9d1843ca1b6461e59ecf06f967d3e41d987b5ada426efb9129fcbdcdaf3a8	f	\N	\N
33ed1d84-09a2-40f1-bdb5-ea491e75ba06	2025-03-03	DEBIT-DC 4581 CKE*TOASTIQUE COLU COLUMBIA MD	7.95	Uncategorized	\N	f	{}	9dcd39664cc90177ad6814e0cc5db79599c6b36f6c26f297daafe2702df29ad9	f	\N	\N
21fc43c3-c304-403c-be45-c474dcee7597	2025-03-04	Transfer From Checking -5873	-550.00	Uncategorized	\N	f	{}	91a6c183b3d14d1e5d84b470aab8f0b49f5d95a04156ef9d37476a19704312d2	f	\N	\N
20f8c5de-131b-4e9a-a12e-7aa5ace30d05	2025-03-03	Jpmorgan Chase Bank	2239.11	Uncategorized	\N	f	{}	9f8d0ea8687b7fa068378c13380a26cfc1ca31c8463e086f24f91b923464ad77	f	\N	\N
ce461091-e095-4bd6-8021-438d3648ed39	2025-03-03	Payment to Baltimore Gas and Electric Company	266.00	Uncategorized	\N	f	{}	6ddfaa675843202e009af034ad9817ee1d61340e0d9deaeb81201dbb5f729c04	f	\N	\N
47c6fb04-a635-43db-a112-e5afb7156865	2025-03-03	Payment to Chase	46.26	Uncategorized	\N	f	{}	dc5e4bc86a2f7d8d792eca6a177e36bb2ad741cea60f0f087d8d0a07b3331f5a	f	\N	\N
f1337472-fa62-46c8-807c-d33b71a1c8d9	2025-03-03	Transfer To Checking -2298	1000.00	Uncategorized	\N	f	{}	4714643f2ec80a2a3c5846593964ba7f92609c2be7eafa2326c8346866f40bf0	f	\N	\N
9fbfc4bd-e51e-4ce0-8483-40cc487ddbb1	2025-03-03	Transfer To Credit Card -7148	72.00	Uncategorized	\N	f	{}	6349ff7e3e189a584f3909fd5d2862e44f4038e4a0bc003175d5495ea826fa95	f	\N	\N
cd823cd4-4933-4f55-b370-0d57327c813f	2025-02-28	DEBIT-DC 8678 MICHAEL AND SON SE ALEXANDRIA VA	434.27	Uncategorized	\N	f	{}	0351c93fcf17af6e177a7b6ac0da522990c75c7add0acf010b9037a674e79ceb	f	\N	\N
940a1c13-ca65-4d1d-ae49-dc6725e5cc07	2025-03-02	DEBIT-DC 4581 GERESBECKS FOOD GLEN BURNIE US	225.22	Uncategorized	\N	f	{}	81823533f303ac7033dd0173b2ad8171b29cd7b2f5f7fbb8a12ae43ca7faba26	f	\N	\N
71d13a6d-941a-42e5-b5ae-db6267dcd13e	2025-02-28	Elite Sfn	155.00	Uncategorized	\N	f	{}	6c089e0cc40680457492f6b70c9f191021d89cbccb9978c444e1e87d2fe45cb4	f	\N	\N
d3cf9d14-cd35-4701-b998-bdf1f9dadc45	2025-03-02	Target	146.57	Uncategorized	\N	f	{}	98bf61c3822f9599cae457a607d7ba348e52face30e86b95e7644f815b9aa442	f	\N	\N
8b827636-d583-450a-9447-08681cd157ac	2025-03-02	Target	137.67	Uncategorized	\N	f	{}	b3e10ede6f0b18d685db3e79b915de998fbf531f571e2aa6316e8a76ed121291	f	\N	\N
a1beb373-7011-4fb0-8780-db71106b7bb0	2025-03-02	Target	137.62	Uncategorized	\N	f	{}	c09766ecf152f77a452ed1127c0680be5f5c9cd5e1635b1f083c5af8d6d31a7e	f	\N	\N
db407776-5555-41fe-9813-15940ee62350	2025-03-02	Target	112.52	Uncategorized	\N	f	{}	80d855f152f58f46afdaaa14ac4f6ce6a9eda66597769436e052b49f645cb7f9	f	\N	\N
fed7f134-7a37-4fbe-9580-7e7693954bc5	2025-03-01	Payment to Morningstar	111.00	Uncategorized	\N	f	{}	d0d77f60973bb9f00ab5622c8ca62a0003bce26d7060177269650bacd6ae6499	f	\N	\N
85364a59-97c4-4856-aa0e-3f57c314dee2	2025-03-02	Transfer to Apple Cash	75.00	Uncategorized	\N	f	{}	37fde7d760bc3212e78776109eb2a7f40f6fe43d7b88f8d2c4517535115e8802	f	\N	\N
60c54b71-7b19-4f61-a773-e07e43135df9	2025-02-28	Amazon	53.98	Uncategorized	\N	f	{}	7aafcf90c0834c7337c430f71d714c92899ed820774aa8afca63303b4053f728	f	\N	\N
3bec44d4-9167-4580-bc14-e76b4129ab41	2025-03-01	Peloton Cycle	46.64	Uncategorized	\N	f	{}	fbaaf560e0d1cd1a563b1d595dd32d3d58fe119c1c57d99565eaba789b019e93	f	\N	\N
555ca884-2a45-4665-96cc-863be7694afb	2025-03-02	Sam's Club	42.50	Uncategorized	\N	f	{}	1bd6a0b68174654ef0c5fc24a7b0698d8050ec8f78d21dd09866717dd2a956aa	f	\N	\N
919588ba-527a-4a4c-a1d0-1544184a5f1b	2025-03-01	Cox Wine & Spirits	36.49	Uncategorized	\N	f	{}	0c72f0cfc14f6102e0eff393d187dddd6bcfe647ea1ab2382ff8e6f0fdcd249a	f	\N	\N
d134a60e-145b-4ebd-bcff-818c640af83f	2025-03-01	Jersey Mike's Subs	24.95	Uncategorized	\N	f	{}	38e1901097e982f179a3129578a63307ff4d958ceaa719f3c9e1b5d240eedaeb	f	\N	\N
b9c915d1-86b0-4d94-9384-fcd0a3d6fbd8	2025-03-01	DEBIT-DC 8678 WWW.TOASTI* TOASTI WWW.TOASTIQUE MD	24.91	Uncategorized	\N	f	{}	4bd6e505d97ffee042d9c4beaae699286dfe1c2331d36147faf6177fcb2fc7a5	f	\N	\N
e9ad4492-e548-4e7e-8d22-6001370db3d6	2025-02-28	Rise Up Coffee	15.24	Uncategorized	\N	f	{}	6b9caf492bb3601d00537a50296bf29ad33b120dff3678ec9ed2e38586157b00	f	\N	\N
8efc6a5f-5ba1-43a7-9924-e784d7d91229	2025-03-01	Elite Sfn	10.00	Uncategorized	\N	f	{}	78fbbc00499dda25da12492a051d70dc87cefcdfbb75be02a9c1c6b52dbcde20	f	\N	\N
53c485b3-4bfc-451c-9f15-5bcb9f69d481	2025-03-02	McDonald's	6.45	Uncategorized	\N	f	{}	d7e6eb0220b8a9fd4696580966d4eb78d0cd89514723448e58b60f62264b5a6c	f	\N	\N
37d9ded7-b69f-47b8-ac07-8f7d58a020eb	2025-03-02	Amazon Prime Video	6.35	Uncategorized	\N	f	{}	3a8685964482c8fb7f6411029322e82fede58fa99686f34efafcd96dd0a4e45c	f	\N	\N
c1809b49-f6c6-4f4e-bf06-3906b462524b	2025-03-01	Dunkin' Donuts	3.81	Uncategorized	\N	f	{}	67850273eb0f946acfd70a2959e399c56bc5fddc630fe443bacc0e506abbc4f0	f	\N	\N
2fae267b-e1a2-4ff8-a47a-52bcd8bb2a0d	2025-03-01	Apple	2.49	Uncategorized	\N	f	{}	1bac88770ae803c123c2f5f391446aa2944944a3c8d586cbf3ae436734d20eaf	f	\N	\N
b8e610bf-e85e-4b94-915f-7b52847337fc	2025-03-01	ATM Withdrawal at Bank of America Baltimore MD	104.00	Uncategorized	\N	f	{}	e03d9f392f7dda74e9990f7e149225ac8b0864de2c356e897d67c1e8f8c032f6	f	\N	\N
189de285-7e63-4ddd-a469-7550592ea90f	2025-03-01	ATM Fee - Withdrawal	1.00	Uncategorized	\N	f	{}	7bb226735c05003136ca84c23bc5e519ccd5a33f68d1c05fceb74b07c062d665	f	\N	\N
aaecb389-f33a-4ace-8f56-2a843f2f9d71	2025-03-01	Transfer from Zelle	-75.00	Uncategorized	\N	f	{}	c66a6be83ea0bd98edf82651c0176f23c983268e6ff4aceee17b1b1caaed4f21	f	\N	\N
59a96e7a-63ed-4a2c-9901-47b7220af739	2025-02-28	Interest Income	-1.16	Uncategorized	\N	f	{}	05ad064204c017868b008d4dab8fb7da606306c97c5a3371495ed385d923d2df	f	\N	\N
529019ee-c8d9-49e5-8e49-b3adbc582e15	2025-02-28	Payment to Citizens Bank	88.12	Uncategorized	\N	f	{}	7fe4810dce9dc1415c982cd590f47652f91694c9c16f2c743d15c3e814d0b476	f	\N	\N
45225cbc-0b05-43f5-9375-fc02561daa22	2025-02-26	DEBIT-DC 8678 TST*THE CRAZY MASO ELLICOTT CITY MD	41.76	Uncategorized	\N	f	{}	556dd924a81f3e0d272dabd4b69ce004d05bc8917872af7bd0df8592df61285e	f	\N	\N
e745094a-9f92-437c-98e5-3c733597d4d5	2025-02-27	Target	18.01	Uncategorized	\N	f	{}	9a83628d33bc6121256fc7853add7356dfa3dae8cf2e2bbfdaf6f7c4003e88a7	f	\N	\N
2525fe6b-d816-4398-a2bd-d744641dc10e	2025-02-26	Taco Bell	8.89	Uncategorized	\N	f	{}	06fdc5eb65f60de1f6121b1b41eaa8f70263741fc00f7a63a04d7b0927adab78	f	\N	\N
4c7e7c3d-12a2-498a-aa10-b712ef7040dd	2025-02-26	Dave & Buster's	4.23	Uncategorized	\N	f	{}	a3be9dcc6ce8b39b23f9fab8ea85f02501b4539840debc1d860ba49b4f9e0180	f	\N	\N
cb207a75-1b5d-42b8-bf0b-78fb385d7854	2025-02-27	Transfer to Venmo	45.00	Uncategorized	\N	f	{}	5e68465ac6dcbb53a15af72e3996d6be1f07e6a0fce4b44338acb87cd9b8fd63	f	\N	\N
d4df624e-7997-4162-abfd-39c40a87e1e4	2025-02-26	DEBIT-DC 8678 STRIPE PAY GREAT MISSEND	341.00	Uncategorized	\N	f	{}	5b2783fdaec660d37133298168a1b8d1a8f50a33de96c8424ddc2513d193ffb7	f	\N	\N
9b8190ad-0f03-4aad-b113-3409b9ba162f	2025-02-26	Shell	45.40	Uncategorized	\N	f	{}	4fe67ee76040e65c982618ca9ff2a9fda8ce4b9850d56b89b7024c27ed7bafd7	f	\N	\N
cb0915ef-1e7a-4a21-9f82-02b98a300fe9	2025-02-26	Intl Transaction Fee Visa Stripe Pay Great Missend GB	3.41	Uncategorized	\N	f	{}	61959503790bbdaf5569d849138ee0b5cefcd530ca936238b8eca178ea171cf9	f	\N	\N
2d411645-b3ff-49fc-adff-41e543baffd7	2025-02-27	Microsoft Deposit	-4690.29	Uncategorized	\N	f	{}	d709765cded2b4bc5672e21bb4dc69ba523cc7f44d2ca1843e090ec3f13bf922	f	\N	\N
b886c3f1-ae06-4620-b73c-4b70dd53df1c	2025-02-27	Deposit Henry M Jackson Payroll	-1819.59	Uncategorized	\N	f	{}	1e30da5f05354b9fd5fb505bbd90e6ce34d737629dfa0cb079fb7ed1bf9fc8bb	f	\N	\N
09721274-d28d-4d81-9fb6-d3208635532d	2025-02-25	Chipotle Mexican Grill	22.21	Uncategorized	\N	f	{}	f9faac818f925bd3a9145882c884bade88705d7bb98ccdeeadcf12bafadee0de	f	\N	\N
f259e9c6-1b57-4cb5-9a9a-7adf2f495a02	2025-02-26	Transfer From Savings -0387	-500.00	Uncategorized	\N	f	{}	94f98ea68f5aa0c1d77661f5a54f1b6f6773789e20774645ba3a1870b7784221	f	\N	\N
009c6e77-c9fd-4833-8590-a389a316d512	2025-02-23	DEBIT-DC 8678 REJUVINATIONS PASADENA MD	135.00	Uncategorized	\N	f	{}	02b428d29e1ecf4dc24a6200ec51be7e6721a3fd363207e8133992433721defa	f	\N	\N
7156440d-9a40-4033-b526-1fd3a9ee46c9	2025-02-25	Amazon	95.39	Uncategorized	\N	f	{}	1067d25836f8b1499f6e44ad20fabd22f1e3d2fd15d7710f9a21f85720eaff38	f	\N	\N
42a8c2ee-8b4c-429b-93b5-4406bb181ba9	2025-02-25	DEBIT-DC 4581 COOPERSHAWK XX-5674 IL	44.99	Uncategorized	\N	f	{}	1ee943ae86fe37b120e48ecd4fabc5efdab9c78ea261d3a9fd1a8585da6e24fb	f	\N	\N
aa831f73-97a6-4cfd-bd28-2513ee9e1f46	2025-02-24	Adjustment - Cr Amazon Reta* H43z0 Seattle WA	-8.43	Uncategorized	\N	f	{}	dfb49905e5e80a6fb6f07ad0351f4a67f15c3bc26b3ebb66dd9be465e8d2af27	f	\N	\N
199137d9-3af4-41b2-8958-d609c5364bc2	2025-02-24	Lowe's	858.09	Uncategorized	\N	f	{}	1f755c6f985715f6966ce3ec2ba3f238698c3a932d25e0ac5a62eac7116293f8	f	\N	\N
826ca855-a935-4cd2-87c6-98bbf327bf1c	2025-02-24	Payment to Liberty Mutual	260.08	Uncategorized	\N	f	{}	43ec68213e0d0cd4c0993c5aa59ecd4e5d2633f38d4ec932e8e812bb6a5b00d9	f	\N	\N
a1a37a4f-7ca2-4b77-a0c5-16467b448db8	2025-02-24	Transfer to Venmo	75.00	Uncategorized	\N	f	{}	48d42dc46d1d74287e3d9688d7758cc98b4094a52341e8b9a288bfc9240dd115	f	\N	\N
0595e4a4-7566-461c-b509-176832a46268	2025-02-22	Target	414.82	Uncategorized	\N	f	{}	7e28d4a4050c16cae655e1a748892c76195906473d561cc4c3955ba5192f5d77	f	\N	\N
47fd976c-2e9c-408c-bf08-e5bdfce0110a	2025-02-23	Petco	355.75	Uncategorized	\N	f	{}	8d138bea124f631b0ced178a30b945de7bde04965999caf1b489a8c92f1f86f2	f	\N	\N
4ca3ee40-5606-4fb9-8e18-7bdab19bf6a1	2025-02-23	Harris Teeter	143.91	Uncategorized	\N	f	{}	35b8dc69c097f2022325a50431a90e714a776c28da9066da56376431a4ac0f52	f	\N	\N
9a125d46-9bc1-47cd-9481-33e72097ede5	2025-02-23	Union Church	100.00	Uncategorized	\N	f	{}	213a7fbbb05ecf79998c7458f30c9f9ba8edee47dcbea36a23c974fa477e4e4f	f	\N	\N
55c5223f-48eb-41ab-9860-bb6aec168fd2	2025-02-21	Rise Up Coffee	84.00	Uncategorized	\N	f	{}	2d0a93c49ea324cb5e5fe80c9d70d1a0a6851cb539b38189b72def05ff42dfc3	f	\N	\N
465de119-5619-4e56-bba6-11fd09cae688	2025-02-22	Texas Roadhouse	76.27	Uncategorized	\N	f	{}	08cd6351667bb4f5d09f9bcd2c4aae1a21f16428c7383e700cecbf31a04c4af9	f	\N	\N
4eef708b-a2a1-42ef-a3d5-e59232491d06	2025-02-22	DEBIT-DC 8678 CKE*TOASTIQUE ANNA ANNAPOLIS MD	54.00	Uncategorized	\N	f	{}	1198b0e337c2b933944aa9b54d63b195fdbdd599a59a2283351ff3da16920c7e	f	\N	\N
78abf2b0-4011-45a8-9765-f6a98c3f8940	2025-02-24	Amazon	31.79	Uncategorized	\N	f	{}	4719be22745df2cd9e3c3077795baa40de2847847ef4a99f551b4a6a829691eb	f	\N	\N
e9118606-d153-4247-b212-9eac08de3c6a	2025-02-20	Pizza Boli's	18.00	Uncategorized	\N	f	{}	61a5afec8588427b584200e0763cc5a5bcbe0c3e86b7ffb3ab0ac8881c7a8a65	f	\N	\N
9374484d-e91e-4722-8388-7d20689980fc	2025-02-21	Amazon	16.86	Uncategorized	\N	f	{}	59b67a955f7256815f04e94f9523410cde61aa4e48432121781e53a22cbc0e4f	f	\N	\N
9ff66089-4f9d-4c23-aaee-517bf284ef9b	2025-02-22	Bowlero	12.71	Uncategorized	\N	f	{}	1e6c3e6006925e6014241f10dd55a3ef2196aa1a053821e15995e489a2cef39c	f	\N	\N
83d65c81-1fd9-4322-9bdb-34cf8d669288	2025-02-22	Netflix	8.47	Uncategorized	\N	f	{}	fadaa2cbd4d22008d4f399259c9499a2c552cbc4a21192b0dabbc5149ea2b7ed	f	\N	\N
f5c26cf5-51f9-4dd5-860b-5022ecf5a3c9	2025-02-21	DEBIT-DC 4581 PATREON* MEMBERSHI INTERNET CA	5.18	Uncategorized	\N	f	{}	14b27d12a73e1c30a1351ae28252d84fde27cbddbf4999e792385aa3c881b2e5	f	\N	\N
30bb6753-f11e-440f-9ae1-d31bf7bab812	2025-02-22	Bowlero	3.17	Uncategorized	\N	f	{}	82181b6043a716e2af818c051b4ca1e879f6a0d54c54069466cfebf2b1d3dc94	f	\N	\N
7db89053-4ca1-435e-be84-8a037fbf9875	2025-02-22	Target	-96.00	Uncategorized	\N	f	{}	f09eea8cdc64a762320c1d19fe3f6ba216aa5bc8f3e9ec0a2bd054fdd3d30ebb	f	\N	\N
d675ead1-1013-4d7e-8ea6-a412feb2182c	2025-02-21	ATM Rebate	-5.00	Uncategorized	\N	f	{}	f6d6e025e16653a772acbedda3c0571a7053385dd892d448f80d7dbde0769daf	f	\N	\N
4911bea8-a40f-43eb-aff3-ef87a004a798	2025-02-20	DEBIT-DC 8678 OTF GAMBRILLS XX7925 MD	14.00	Uncategorized	\N	f	{}	1c281497637459d5907011ae9bc212017f548b51c6a05e6a7594f4feb1bdd4a3	f	\N	\N
afb7b9c9-3d41-4190-ac22-f846b6f14280	2025-02-20	Target	2.11	Uncategorized	\N	f	{}	9bbea11569b6b9751bfdab55c8da361894502c8d88da492881974e0e1b898c58	f	\N	\N
387f7cdc-b962-4ec8-a232-2613264181d0	2025-02-19	Toyota	900.00	Uncategorized	\N	f	{}	ef2f6b786957196da8efee5f235c81751cbc82f20e53faa36a4aa78041f33cbb	f	\N	\N
7e32b5ca-c236-480f-aff7-614133ccd400	2025-02-17	Safeway	86.80	Uncategorized	\N	f	{}	02bfcdb9e094ed242cece51b013fc1f4163c07efc936a4d4f4efd2c483add4fa	f	\N	\N
734d0f48-0ef3-4140-b489-0fd91898396a	2025-02-18	Giant Food	49.75	Uncategorized	\N	f	{}	8ab589051df7f7bd25e0f2ef04ac4e64ac3183c7ea82c78ed2a3ea213eca03ce	f	\N	\N
fc8430bc-c561-424c-b48c-5a9f1d52182c	2025-02-18	Sam's Club	30.70	Uncategorized	\N	f	{}	a79fabe4efcdf656ae6d7b91dd1130f1b7b03c8ebcf785dd0f564ce2f2715e60	f	\N	\N
6525abf5-ee68-49d4-8b03-d94ed68fa8e2	2025-02-18	Popeyes Louisiana Kitchen	13.96	Uncategorized	\N	f	{}	3fc8eaa199433b7006f556584a8bce4eebafd60f49f7a26ef3788fe2b24a0a92	f	\N	\N
22252473-641e-4a5d-b654-278defda1c06	2025-02-18	Apple	7.99	Uncategorized	\N	f	{}	fe4dfd64fb6a4ca30b3a4e4d3ec568b6f788702b3e43e26fdacf03cbe07f5202	f	\N	\N
f230b4a9-ebf6-4c29-935d-ff52e4de41c3	2025-02-18	Payment to New York Life	616.54	Uncategorized	\N	f	{}	aac960956ac8017a6a04fdfd63b95f72b0fdafb55394468c618b5a66f06e4e14	f	\N	\N
facada70-ea90-4e18-81da-cbb10603f2b3	2025-02-18	Payment to Discover Bank	419.00	Uncategorized	\N	f	{}	56155fa0f22a8cb6b4cb8f89dfdae32e6c84a8c000d1ff437cf578ef9347af73	f	\N	\N
ee3fb6d1-3380-4332-a8be-90ea68fb060e	2025-02-18	Payment to Educational Computer Systems	100.88	Uncategorized	\N	f	{}	ae7c34078434afc82c320e4716ef116aada245d9df013e2a0ee37a88d2686464	f	\N	\N
eeca1f81-add8-4118-8bc1-a36cb1f04412	2025-02-18	Transfer to Venmo	15.00	Uncategorized	\N	f	{}	e81039186b62c863e94e10b7f567d933f1054dbee01a6a0e87707fe369a60797	f	\N	\N
b6a0452c-30a4-470c-b159-263c544ed00f	2025-02-18	Transfer To Checking -2298	985.00	Uncategorized	\N	f	{}	fb71dde8e4a2fc586756230a3e7a6ddca711891d617ec91291764e2fd808b595	f	\N	\N
80b25158-738b-447c-b94e-6e8bf04f82f0	2025-02-15	DEBIT-DC 8678 TST* KEYSTONE KORN XX-6726 MD	190.62	Uncategorized	\N	f	{}	b3554bc4ccc4268d28f14f9b9e91b281081128038cbaf6c607bc87bbfa3bc62e	f	\N	\N
c49c1926-247e-4ba6-a9e7-d498f4adc01f	2025-02-14	Target	121.89	Uncategorized	\N	f	{}	44be2be195fb2e9d9ae284e24b57fd65584f23c4aa950e0bd8af1f8693cb6f0e	f	\N	\N
928eb2c2-1406-40f1-b255-b46b8d1bcd86	2025-02-14	DEBIT-DC 4581 SQ *OAK AND IRON B OWING MILLS MD	105.58	Uncategorized	\N	f	{}	ad85c9e0b57919989639f780738648ca9ee0d817b9159775d99e7b11171b0394	f	\N	\N
135f2500-9b01-4b39-b585-e2990c8f3120	2025-02-14	DEBIT-DC 4581 INDEPENDENT AUTO C PASADENA MD	72.00	Uncategorized	\N	f	{}	f0c0124ee6df0f6f6b2035a7f8556221b46ec6d52800b5a363573456c6addcf3	f	\N	\N
0e90978b-8819-4c3b-9f53-b326689a92fe	2025-02-14	Transfer to Apple Cash	50.00	Uncategorized	\N	f	{}	13638d70ceb17f15ad2806aa8d84048ab96a6a39de918fc1a6f9a72d8fa728c7	f	\N	\N
c0b125fd-3820-418b-a190-df66b3acf7be	2025-02-15	DEBIT-DC 8678 SQ *OLD MILL CAFE ELLICOTT CITY MD	22.88	Uncategorized	\N	f	{}	479cfb5ca99dd2694d60a9299644e3cc98a49e657813c953df95bfd2fbe2966f	f	\N	\N
c1754366-a622-464f-8e14-23f0aed37a06	2025-02-15	DEBIT-DC 8678 TST*THE SOCIAL SEV SEVERNA PARK MD	20.00	Uncategorized	\N	f	{}	4b5ba835ac1afc74041b432fb0eca4c9d5e95e4daa2f1c544fe586425a577e5b	f	\N	\N
deeaa6ff-aaae-4da9-aa5b-1b54f0cb332b	2025-02-17	Giant Food	13.98	Uncategorized	\N	f	{}	0fe1889af6565488daec0a158d808063d80be429305405d58b7c6b1240c5b5a0	f	\N	\N
99199424-9cbe-48c6-83c6-7b29c8708b64	2025-02-15	Pizza Boli's	13.77	Uncategorized	\N	f	{}	0e62b8d14b9026e690116c6844ebeca0e694c90781e6c1f5f95479f3bf903e7e	f	\N	\N
5d604775-977b-442d-9f54-e85fd7277072	2025-02-16	Safeway	13.03	Uncategorized	\N	f	{}	af04316f0e129ca0b1000a809c0411e2fe3ec532b6d4a37f284c71ac6e8bda19	f	\N	\N
5fd43181-571c-4a25-936d-58e20bf1af83	2025-02-14	DEBIT-DC 4581 PABC CAROLINE TRAN BALTIMORE MD	9.00	Uncategorized	\N	f	{}	b09f4ac21334bad5bfa0d09d66ca66cee736faa748514332454c5524f9cb42f0	f	\N	\N
1443c165-8a3f-4327-b5cf-a71d10640e37	2025-02-14	Rise Up Coffee	8.95	Uncategorized	\N	f	{}	122bead9d2efbf5408e738e5912bbb1c1240f8c4929f1fe2cbccce469f35ca46	f	\N	\N
a190dfc0-ff46-4570-8ab7-0866d610f2d9	2025-02-14	Apple	-21.19	Uncategorized	\N	f	{}	9d4c63dab74776cb1cc146629b47c3dd0d2423cc0e61bdaa327a91c9ad344df5	f	\N	\N
78c497cb-d6d4-4286-a476-f0fb2d5fe681	2025-02-14	Transfer To Credit Card -8715	500.00	Uncategorized	\N	f	{}	e2e98bd30488c027b768193cad0e554e5a26e98d0cedb3c2008f85e0fb29685b	f	\N	\N
f8496b90-35e6-40e8-88ae-310e609ab041	2025-02-13	PetSmart	84.78	Uncategorized	\N	f	{}	41a7cc338826a00f0ed25c00d4041f267abacc34e0fc9f91b89a9d49097fd926	f	\N	\N
6941093c-d99e-4173-bc34-271e6aaeb3e2	2025-02-12	Ace Hardware	48.74	Uncategorized	\N	f	{}	9458f87b15114595d912599c878aeef25076f13ce404010e38208fb1ff4b7da5	f	\N	\N
653f1b79-fe04-4b6c-b698-a6db8a3ee45e	2025-02-14	Weis Markets	28.96	Uncategorized	\N	f	{}	a10d6a4ac4f34134be1e61f558fb0e728dbc1d1200d380884c2f64bbadd3795d	f	\N	\N
e53f1c8b-ca5d-4385-a958-133e3f59b177	2025-02-12	Apple	21.19	Uncategorized	\N	f	{}	97223160803bbe0f4ecb57ce7acaaf1c2adcb7511679323038d04abddc299e6d	f	\N	\N
de7f818f-492e-4b9c-a097-f62e3b052abe	2025-02-13	Microsoft Deposit	-4699.34	Uncategorized	\N	f	{}	80ceccaaca9adbbb001ae05ba844486aa20cf97fede9bbf796e06c62030ad135	f	\N	\N
48f30d78-6c54-40f7-be56-bf218b4b8dd7	2025-02-13	Deposit Henry M Jackson Payroll	-1797.40	Uncategorized	\N	f	{}	aab0fe7723528c506cb06692b6847893b2260a608378fe6531c08ac63a39ba26	f	\N	\N
2792b649-567f-42cd-af33-05a7610abf08	2025-02-13	Best Egg Deposit	-7.90	Uncategorized	\N	f	{}	17f35bdff61c44ee0b17d50b9d90aeac8ef3ec2ae6c7d70913dc8bbfb4538f04	f	\N	\N
43fccabe-7cd7-4ee8-87e5-f17a56640f13	2025-02-12	Payment to US Department Of Education	500.00	Uncategorized	\N	f	{}	da9a91e912d6563dbed34ae8545de943928ea659424ca151b77687ca8d20b831	f	\N	\N
2f7bcd24-012f-44b6-b612-eda7f4c22ad2	2025-02-12	Payment to Verizon	89.99	Uncategorized	\N	f	{}	77768d08685507a121f2e9948e993ac540cf778d663ecb8a0e7f826b1924caab	f	\N	\N
aa7cbd5b-ec41-4114-8fa0-4e0ba9da4ab5	2025-02-11	Harris Teeter	122.13	Uncategorized	\N	f	{}	a625f4e6ca6b6f7fa54022be4d757ade39f4cb4f018be8e9fe6b81bf6850cae7	f	\N	\N
bbbbf216-99c4-43b6-a316-39c14473af22	2025-02-11	Sam's Club	36.20	Uncategorized	\N	f	{}	a6a9d8430f8e5778e80978c0282e6bc0a97f47411b869a65570511255331651a	f	\N	\N
488598f2-a2fd-47bf-9f59-f37d3b7b59f0	2025-02-10	Sam's Club	29.05	Uncategorized	\N	f	{}	b80323e67a4999c34c22b584d42f2565faeb6a568fc5cd4baa72cdcb9397b5d6	f	\N	\N
d45652b0-9cd1-42a8-9f20-ad2818e497fb	2025-02-10	Giant Food	16.73	Uncategorized	\N	f	{}	59ef01ebeb63cad24603890512bc4f4405ee6a6dbce840850ff4e099d5d9c55e	f	\N	\N
fef03e90-4ab0-4793-beec-790293eda2f3	2025-02-10	DEBIT-DC 8678 OTF GAMBRILLS XX7925 MD	14.00	Uncategorized	\N	f	{}	e15dcfd839115526f625fc443edfc113950c76101d660dd7804c7e5a0ce64091	f	\N	\N
34c9b952-7261-4e02-b36d-30a864e1c919	2025-02-10	Lowe's	30.00	Uncategorized	\N	f	{}	611ce7832cede8b15d0bbd766dde4e50fdae1671ff90417bd664c218a1c02c70	f	\N	\N
19aab1ff-be34-4c38-9b13-f242d7a1d218	2025-02-08	Cooper's Hawk Winery & Restaurants	150.00	Uncategorized	\N	f	{}	ad4bb87d20e9e584dc2b838a6bec21f94ca622f21cdd6b442531bec6d1a9e997	f	\N	\N
d00ed5c6-08d3-4f5c-aa44-5115fd6c1035	2025-02-08	DEBIT-DC 4581 COOPERS HAWK WINE DOWNERS GROVE IL	44.99	Uncategorized	\N	f	{}	5ec93de8acecf6846f6c3b4998b6c4a2bc15fd66b815ad6a202be8d2750bf4c8	f	\N	\N
5f195dca-e9e0-448f-b5b9-f5a523934945	2025-02-10	Giant Food	24.41	Uncategorized	\N	f	{}	f7b8d4bc81de68667e1c5a379b19257d6e7ac87fbb06fe43335dc910c4db3070	f	\N	\N
44fe1c30-dc1d-4a6a-bae6-2e236192d2a6	2025-02-09	MI PUEBLO	10.87	Uncategorized	\N	f	{}	9571337cf810488508418ffd516191764a54aed0b7b7b289092fabad7d7ad010	f	\N	\N
84d80365-761c-46ec-b04f-1f34bd038c1a	2025-02-05	Chevys Fresh Mex Restaurants	220.00	Uncategorized	\N	f	{}	95a2d9da47080700e4026b286ec2654b97b0fff276a0e464060db28201d5459e	f	\N	\N
01af4e59-683e-4eb8-bbf4-b24eee74bba8	2025-02-04	DEBIT-DC 8678 OTF GAMBRILLS XX7925 MD	199.00	Uncategorized	\N	f	{}	ac53959ddc5a13f1860c4b1c3c95a5d44693441ddfc799f0192a42e6acd6006f	f	\N	\N
6ed1f9f6-d5c1-4e9c-b7c0-8ba90e3ac6bc	2025-02-06	Transfer to Zelle	100.00	Uncategorized	\N	f	{}	d2960c716ebf26c0dad0f09c5ee1c4153a767345897bebab1cf2a4243446d875	f	\N	\N
15359c46-85e0-4c2c-a44f-429dd500d786	2025-02-05	ATM Withdrawal at Bank of America District Heights MD	304.00	Uncategorized	\N	f	{}	a1e561944cbe4c8062e1c0642fc8e6311808a4030eb5b96cec4c0f1c647d1bc6	f	\N	\N
29240d74-77f7-4e0f-8a80-e9aa13f9fac9	2025-02-05	ATM Fee - Withdrawal	1.00	Uncategorized	\N	f	{}	7bfad2ce3c3cd7734e4e0e019ca16eced7fff51e9310327e0cfea7508a6956e4	f	\N	\N
f5dc762a-4dbd-40cd-a99f-99e3d663e7ec	2025-02-05	Transfer To Credit Card -7148	750.00	Uncategorized	\N	f	{}	d8fe8245ebd1f5232a3febc1859b84d26b80e0b4fc30c5b07d3d1da760a272fb	f	\N	\N
da1f4a82-ca70-45d6-b3c0-5fc626797ce4	2025-02-04	REI	64.66	Uncategorized	\N	f	{}	daf2e0b89d601e1d7e9762db8b69ab886935afb8aae3c063edfb2a029935cad1	f	\N	\N
5144a238-e796-4896-8e92-b3642b7208db	2025-02-04	Sam's Club	56.54	Uncategorized	\N	f	{}	16045f17b0e3aa71af6f30e3f1bd299afca7b550b97ad08bee1c86f86c856867	f	\N	\N
03a7f38c-340a-4ea5-8f0a-82f53e8c263e	2025-02-05	Transfer From Checking -5873	-350.00	Uncategorized	\N	f	{}	f21c7bdda30ec2a0f8991394cbffda6e0af406dfecb4337a51855c7b373cb4be	f	\N	\N
16ad0dea-5a6e-43c9-9c6e-8e7a3d8410a9	2025-02-03	Payment to AT&T	216.06	Uncategorized	\N	f	{}	4abdc0cf8c08a88e8ae2dea2a8c34059162ec88a444db2ede2b887dca6c342ac	f	\N	\N
db207b58-4c39-4d86-b6dc-e1ed1b85e0e7	2025-02-03	Jpmorgan Chase Bank	2239.11	Uncategorized	\N	f	{}	e2ba2a7ccc7b47a6957d70142a8b3bd8fd3d6ce3fedddfd0535cf22b79951256	f	\N	\N
77ef6f58-87c2-442c-8a81-5b982de7ab08	2025-02-03	Payment to Apple Card	1456.27	Uncategorized	\N	f	{}	21b1a9396b31d357f2b99970bfa53856981b2a65066ae28ae39384e81264b8c9	f	\N	\N
90b144f9-0790-427e-a3c0-6b42a1b60fac	2025-02-03	Payment to Volvo Car Financial Services	485.88	Uncategorized	\N	f	{}	c0a8f6a2566c2616cb3fe3c91bea0e1ffe6b782b3ca4013c420ccacd078050e8	f	\N	\N
0b5ddee9-cb9b-4ce8-815e-6797d4a15225	2025-01-31	DEBIT-DC 8678 SP PICCALIO PICCALIO.COM CA	257.58	Uncategorized	\N	f	{}	244ae422d4649fdd402772982d6c3c91bb55f67f09731307d4a962e2ab993ab6	f	\N	\N
d943275a-92df-48cd-ad7d-a359b2191d08	2025-02-02	Wegmans	202.34	Uncategorized	\N	f	{}	0d40d14e919f7491415531c889fac3ad01130789daddcaac40998ec95d589dc8	f	\N	\N
1b52ea50-a812-4bef-9dc4-f36c28e5c19b	2025-01-31	Elite Sfn	155.00	Uncategorized	\N	f	{}	ccdd1168bc3b2021c64ab25f2e436877d9e8520a8035ce29882c102896faaadb	f	\N	\N
caa41693-1041-4bc5-b9a7-14d5c67f4601	2025-02-01	DEBIT-DC 4581 MORNINGSTAR STORAG XX1626 MD	86.00	Uncategorized	\N	f	{}	ba3f01f8ae07865b4aed4267fefb5bafcc00b24b483be959b7499d6bdc889642	f	\N	\N
20e5d17a-c6d6-4341-b08a-1df3e85c0c94	2025-02-01	Peloton Cycle	46.64	Uncategorized	\N	f	{}	62870170d0a24ff20b1ac3c238f033b53f72e4b0c23254c0717bc95a6e1f1b16	f	\N	\N
7032d616-e7cc-42d1-97b5-d110ca173c12	2025-01-31	DEBIT-DC 8678 SP PICCALIO PICCALIO.COM CA	32.62	Uncategorized	\N	f	{}	b1046613269b3a47ad74c4cc476d4ffe2ab234af908a1a0817357e62c22ff101	f	\N	\N
8860f8cc-b74f-4bd8-9c55-29b2b631da87	2025-02-01	Transfer to Zelle	10.00	Uncategorized	\N	f	{}	4ac9085e8aaf4a9e6838ec3012ff2695af4999617fb3c799de9980ffa2d32fb0	f	\N	\N
8cd3f45b-0491-43c0-93d5-bccabea5d52b	2025-02-01	Hanna Andersson	9.21	Uncategorized	\N	f	{}	59c4e260bc9d19d84ea49c58c7e377a8b7bd132fde993828c0c4f3e2d437e17d	f	\N	\N
31a56963-9c5e-4689-8ac0-a88e78fb064d	2025-02-01	Apple	2.49	Uncategorized	\N	f	{}	ad8566a825e102a9fe2f78a29b583e629ebc138a9df99f8e9884587b7d6caa08	f	\N	\N
f1bbf98c-8c1c-4924-b0ae-c0e0ef923c16	2025-02-03	Amazon Prime Video	2.11	Uncategorized	\N	f	{}	802d33ef243afac3a53f06b0ff969d8937c98bb27b399b0e8dd8f9dbd4cadbbf	f	\N	\N
fe8cb4d2-9e5d-4866-b9f2-ebca0b4a3adf	2025-02-02	Amazon Prime Video	2.11	Uncategorized	\N	f	{}	375d50477d50e66251d6af9b108ca18bd4a2cc76c31af02de7e425abc05f98ba	f	\N	\N
75b2c91f-e881-4d4b-95c7-38c1592105d2	2025-01-31	Interest Income	-0.63	Uncategorized	\N	f	{}	103069a280f0976f03774bb55836d6d121a0e6ace4506d8468cc0b547f5736b5	f	\N	\N
a23f9647-9a10-4341-b6c8-272e0883643b	2025-01-31	Payment to Baltimore Gas and Electric Company	266.00	Uncategorized	\N	f	{}	77a01303edf6caec381e5d6404a16bd976d11a0be73c7a6bc3d63b40892c76e5	f	\N	\N
53a74bf3-5a00-4462-9b9b-57ddf0aad244	2025-01-31	Transfer To Savings -0387	1000.00	Uncategorized	\N	f	{}	cc655fa6689078e2afe73f9e466954ac7ee0065bc4783a322b64398700c1cd2e	f	\N	\N
45cf158d-1b20-48d2-b88f-613118437e8a	2025-01-31	Transfer To Checking -2298	1000.00	Uncategorized	\N	f	{}	babadae99fadd83d2565efcb494601a9b0d3724a9fb2479b2c3b63095c723dd4	f	\N	\N
43fa0dec-d5e6-4691-a2e1-edc674135f3d	2025-01-31	Transfer To Checking -2740	900.00	Uncategorized	\N	f	{}	0ee6192c7ace45e474e52c018f25936721a703e55053282f238621cd1d6f93a9	f	\N	\N
648c49f3-c210-479e-8809-03b2b018b14d	2025-01-31	Transfer To Checking -5873	810.00	Uncategorized	\N	f	{}	64fbf3842c57a5385d32b7cca9511682715cbe0c4a28f886548f6196902e0860	f	\N	\N
5d8f6e41-dcf8-4d94-8c53-a6e8638bfc07	2025-01-29	Sam's Club	11.95	Uncategorized	\N	f	{}	8a891b21af70e7d939f9b006e1f8b8ff581cef5e309d44d03e3be68b518affe8	f	\N	\N
b20696cf-a721-41af-9196-84cb9544e00c	2025-01-30	Microsoft Deposit	-11001.68	Uncategorized	\N	f	{}	204481cece0438163ee718d1f30bd6d59451311cc07e3a26f1e14fd3446c0628	f	\N	\N
f556207b-9dc8-4ec9-b6a7-d556af3a623f	2025-01-30	Deposit Henry M Jackson Payroll	-1819.43	Uncategorized	\N	f	{}	af7e9bcb1fc409bdd472515c9b6475afd3d4590e1e3cbacb7b098241b59bb00b	f	\N	\N
fbb83072-aab8-4e2c-91c3-2bf2d13d4cf9	2025-01-30	Transfer from Venmo	-300.00	Uncategorized	\N	f	{}	d8f7bb41132c4a82518302be6a17cb117e924ceea92c94cabbf7274702e59c4b	f	\N	\N
f40c4b38-6275-43a0-8bd2-eca41f3ba112	2025-01-28	Payment to Citizens Bank	88.12	Uncategorized	\N	f	{}	0048eb0a8eefb41dd8cded1dde26c4ec67665f080b0d9006e2a35904e64829f0	f	\N	\N
a2794cd0-6882-4307-a122-43204c8e0b24	2025-01-27	Target	3.96	Uncategorized	\N	f	{}	bc831b1941df42dbbce60781955866b320dfba9f5043dce59c812d3bf6f1488a	f	\N	\N
df9a0597-2cf0-4add-8b88-bffa68457e89	2025-01-23	Sam's Club	64.76	Uncategorized	\N	f	{}	36829f64758fd8ff966b602cc4573e963a00d85b7bed996e5d09398fd09f67d1	f	\N	\N
b33a9026-2890-4b60-be72-c1f80421f4d5	2025-01-25	China Wok	17.44	Uncategorized	\N	f	{}	9df7bc0c8a40d89879564e53cf2f5fe51f6d1a6c5c3587b3eea416bb41cf26b8	f	\N	\N
36aa45d5-d319-4fec-a7d2-b51866dc60d3	2025-01-25	Dash In	10.30	Uncategorized	\N	f	{}	113136bccf945d2df84641d84f5a30f26f29a01d5700b1c7d88812f79fd6dd45	f	\N	\N
ca505e9a-7c06-493e-8918-fb554818c02c	2025-01-24	Sam's Market	3.99	Uncategorized	\N	f	{}	a9cd2198787b9088404648950ece3216349a8124e9eca43aaaf290569e30fe30	f	\N	\N
f116e293-104c-46f5-a83e-d70f42fb5d06	2025-01-25	Dash In	2.13	Uncategorized	\N	f	{}	f75e0a92ec248817885bbb74bb688c57d78eb46746cb8bd89ed0453caf9119ef	f	\N	\N
f117fcea-977f-4909-bd54-ffaa2d18d11d	2025-01-27	Transfer from Venmo	-30.00	Uncategorized	\N	f	{}	89fb0a6d17369adfe0df2d4efd6a6c5da11086df37aa8be4d46834b0ccfef58b	f	\N	\N
3983ce6d-9e7d-4943-ba06-bb2096bc0e11	2025-01-23	Apple	6.35	Uncategorized	\N	f	{}	ea06ebcd4469dd5d2827ef099011f7a36749d1d7772513d538982de33d1958f4	f	\N	\N
fc2bc0ce-d951-4409-8809-c79d9a74204d	2025-01-24	Transfer From Savings -0387	-100.00	Uncategorized	\N	f	{}	4a90bfc15e891d1040deb367b7d7301c376d82e267143330bb8fee35cad809ef	f	\N	\N
d75ff361-a9d7-4209-9230-8d6657414f12	2025-01-24	Transfer From Savings -3298	-29.75	Uncategorized	\N	f	{}	283428409ebd46a01a5354bf1301bb7bcdc11bf072ab1c69fb2e608a01550ab6	f	\N	\N
6e0421b2-1fb1-4295-85e9-051e8e2bb00d	2025-01-23	Payment to Best Egg	537.47	Uncategorized	\N	f	{}	d9000b7133141e96ddc7eafb744aa953e864190d793c971391bcb6811531da74	f	\N	\N
f09a9a55-1317-4876-ab5d-c402988a8278	2025-01-23	Transfer From Savings	-213.56	Uncategorized	\N	f	{}	2622a277a3fd9507d54783b5432764bd7860833cc76a2f078addc3b0d4c44382	f	\N	\N
bfeea751-9766-4c0c-9d5d-8d78bc779e33	2025-01-22	Payment to Liberty Mutual	292.34	Uncategorized	\N	f	{}	2c58b0371e2c7625925b98dc83bb56c089dba5e3a0dcd2eb5ba187e104ea4f2b	f	\N	\N
a592d333-8a9f-4b86-9cd4-2184b6bf35e5	2025-01-22	Netflix	7.41	Uncategorized	\N	f	{}	b636bbc7d86720e501f4a7dd4cec6b7a3133abd9e0ea1542a56c1b426b81f813	f	\N	\N
03d75676-e1b1-425c-88f5-730ec1f0d72d	2025-01-21	ATM Rebate	-4.75	Uncategorized	\N	f	{}	832fd67f919f98f3fc7b422a73a51200aff9c2b4dfac261750914221bc43f699	f	\N	\N
d0e94aa7-9654-495b-ab27-f51616e235cc	2025-01-21	Payment to Capital One	89.00	Uncategorized	\N	f	{}	19f3e81658b53eca770d7680647d676d8ce1690671431066f62c2420aa3649ac	f	\N	\N
f40890ce-2b85-4d3e-a3f2-21746c5614eb	2025-01-21	Transfer To Checking -2298	850.00	Uncategorized	\N	f	{}	414b30cbe05a76f19d2a9d0dc4471e243263f3a5795a84c7b5ead63306ca059f	f	\N	\N
9511ed09-3dfa-4e39-8aa2-60f34a431de6	2025-01-19	Wegmans	253.26	Uncategorized	\N	f	{}	254f5ddaa89e3b89cbb383eb7825423993394ac9ee84ab2de46b5457e66fe50c	f	\N	\N
811046ed-8d25-4c9f-96bb-c03c5e5d715a	2025-01-17	Instantseats.com	148.92	Uncategorized	\N	f	{}	521400ee1cd13fbaca635877dba0144b2fb036016429d2d90edebce02ae95a94	f	\N	\N
52181dcd-9f6f-4cce-b2f0-31f4524a0b82	2025-01-19	Target	137.79	Uncategorized	\N	f	{}	ee95556fef5737168f568bd36db5f7914f3c85f86281fe973490d2d33f01b08f	f	\N	\N
5dade117-4ccd-4273-a3f0-cf6c824fff1e	2025-01-17	Texas Roadhouse	130.00	Uncategorized	\N	f	{}	90730b4f2a744d721a5d718d63652477d57413b63d7f7e6d73808cac8f87611e	f	\N	\N
9c2b2aa0-9a25-4853-9235-73c56e790f92	2025-01-18	DEBIT-DC 8678 JAILBREAK BREWING LAUREL MD	125.00	Uncategorized	\N	f	{}	f4837c3c37e112407c5c7cdf88ed04e54339ba529bdf3c9daffe3916909a5ba2	f	\N	\N
4270f972-5341-4520-8731-ac617260b414	2025-01-18	DEBIT-DC 8678 BMA GIFT SHOP BALTIMORE MD	90.08	Uncategorized	\N	f	{}	5f5620ee37fc2c5fdd884c63ef85212b76e36c3403d2a45d2a9b76263508b6a2	f	\N	\N
bdb1ffa6-337e-42b5-9c3a-85f826e70f3c	2025-01-21	Allure Nails & Spa	76.00	Uncategorized	\N	f	{}	ce394e26ecb47075db1b1b420d14c573dcc8a46d7607861f4f31d6a0151d4bfa	f	\N	\N
2fd388ef-98c1-4549-9967-b667f7245035	2025-01-18	Sam's Club	45.15	Uncategorized	\N	f	{}	e6891273a057aad776b62be14d086973099a9246fed2e42715e3d5a53885ed7c	f	\N	\N
5e9c7021-cbf4-4aa9-9188-7b35bd5b259f	2025-01-20	Target	43.45	Uncategorized	\N	f	{}	72f017cd106b06cb77bd0a43d8e651ef3a630b2caca73ba6264f1c86f17d0342	f	\N	\N
a8042a6e-db79-409e-a2ad-97bf622699bf	2025-01-20	Giant Food	32.90	Uncategorized	\N	f	{}	1999c81002227aa139c41b0598eca3c4996b443dcf143b9cd08360b73950a0b8	f	\N	\N
a64fac7e-b1b0-47c7-81c1-7ec006796834	2025-01-18	Starbucks	25.00	Uncategorized	\N	f	{}	5d56d036f4ef85dbea6b861cc5da988a3617ff4c16049a50d4b16e067064046a	f	\N	\N
9305978d-0015-412e-872d-7a59bc8d49e2	2025-01-17	Etsy	21.29	Uncategorized	\N	f	{}	eefb99dba5774411b94ed64b57db0f9cef41c5a33c4aabdf334a8db8ff212ed2	f	\N	\N
2aaa370d-38b7-4524-82d2-761ca0494849	2025-01-19	Qdoba Mexican Grill	16.64	Uncategorized	\N	f	{}	748cbeb99e44178e007a4eaeba2813f494c555c1e895f3f92fdcf2550941e5b7	f	\N	\N
006ad6f3-5640-4f8d-9b3c-2ac5c4efbb79	2025-01-18	DEBIT-DC 8678 BMA PARKING SYSTEM BALTIMORE MD	12.00	Uncategorized	\N	f	{}	06b9c3de32af7e8e5aa6cf544927ac82043b968702915838fe4e1bb731a063b0	f	\N	\N
328570b9-c92e-4bf0-a28a-795ab056ece9	2025-01-20	Target	11.66	Uncategorized	\N	f	{}	6ab11d1c33548de4be8a22a052495082bec69973d74dc870d2da38e3b832d7de	f	\N	\N
a96ffd81-fb1f-48f7-b391-09e51bb3ff1e	2025-01-18	Apple	7.99	Uncategorized	\N	f	{}	711aa2c40d56b1717fde74562d18e7dc1f51efea11cf5a2b6d9c88e9a9f0f3df	f	\N	\N
6556bee1-f1b5-45d5-bf8a-6654cf8543dc	2025-01-17	Rise Up Coffee	7.42	Uncategorized	\N	f	{}	7421c7e0999c518e5e36b2c4ac5849c70bd8f2e091d1fca83ab3f8916c8077bd	f	\N	\N
7b1e96c8-f8ca-4d53-88b3-63307bc31aba	2025-01-19	Lululemon Athletica	2.12	Uncategorized	\N	f	{}	b58e571c23430e511f3bb9860e44d253c71fb84eaf180c8b2f440f810c4e3565	f	\N	\N
253ea02d-6dc4-4d08-86d7-63b2ebb32367	2025-01-16	Ulta Beauty	94.34	Uncategorized	\N	f	{}	78b0444b85ed9a50d10acf98dda30b25ccea9aa4cd3617d8a515b87cb9cb1504	f	\N	\N
e771acfa-3501-45fd-8fab-6ea375b5ff04	2025-01-16	Ulta Beauty	73.84	Uncategorized	\N	f	{}	76a58ed94d3cee42322876ee28416a865dec3d0e7dcd4c4a8327e2302c81b5b4	f	\N	\N
15146ece-58ba-4211-b120-a67aebf24c1c	2025-01-16	China Wok	34.93	Uncategorized	\N	f	{}	02467b596031d378e5bc7b795d6a123993cea9563b60f6d4e5a7c5571a1f961e	f	\N	\N
ed9e33cb-d025-408a-96de-e453555f7230	2025-01-15	Lima's Chicken	20.04	Uncategorized	\N	f	{}	b24e8cfa5eca1ae7f13819c5f15d7b2d9099b7eea1cd6301fbfc5b59234aec2c	f	\N	\N
1ba74821-cbba-46da-ac6d-57c6946cd95c	2025-01-15	Chick-fil-A	18.54	Uncategorized	\N	f	{}	f16b124110a7593544f7c363169be6d827c79f3da8e04ab6f38cf0e3e13198a9	f	\N	\N
7bdc4f1e-882f-491d-8dee-65d9d5cdea64	2025-01-17	Sunoco	10.05	Uncategorized	\N	f	{}	7e2b0f8283d42abe888fff4ae5771566ec168f5691b527fff48fd007317bf1be	f	\N	\N
ec758927-b305-4fd3-9d94-7368720a83dc	2025-01-16	Rise Up Coffee	8.95	Uncategorized	\N	f	{}	cd3022afda90469fb0a4fa0a01f05cb52d2da06f9224dd33b95cad0339c9ae36	f	\N	\N
dcc6c26d-0587-4622-a27a-e0e732bbb348	2025-01-15	Starbucks	1.31	Uncategorized	\N	f	{}	751d40a68b854ae3cb9a41bc2fe8e75fabffbbaf2c421fd212abdb74666b6337	f	\N	\N
93130f71-7430-4b83-ac1d-484bb8d9c8fc	2025-01-16	Toyota	900.00	Uncategorized	\N	f	{}	762a7b36883fddfed6388c8e4eb8afe9c2063d9684ad41e6132dd81bfd48aac1	f	\N	\N
615eb5dd-14ee-458e-9fff-e9021134ba43	2025-01-16	Payment to New York Life	616.54	Uncategorized	\N	f	{}	374b458a6d7ad18302d23c1513e3cf6d1d289e07b454e83a326834df2491e29c	f	\N	\N
f17c4b92-c396-46bd-92ff-75b892095644	2025-01-16	Payment to Discover Bank	424.00	Uncategorized	\N	f	{}	77b1ab4b4edfb66c722b12f6b8e84a8c8926923021a33ff95cef49b55ac2d462	f	\N	\N
53134454-3a4f-4350-8b89-4624483a0100	2025-01-16	Payment to Educational Computer Systems	100.88	Uncategorized	\N	f	{}	de7ceefc96da87734e7cd85c02765788fae6d9ddd6f6db9ec70fdf9ffe9e69eb	f	\N	\N
1dcf2e72-fc5b-42b4-af64-3e1fc3654a4e	2025-01-16	Payment to Chase	50.00	Uncategorized	\N	f	{}	0d86b4af89d29f54685d7a294097bfe28f77c5d3605a3c4ae7643ea13d904f58	f	\N	\N
05efc468-e617-4724-b526-6d2e3203aa2d	2025-01-15	Starbucks	20.00	Uncategorized	\N	f	{}	60b6d2403799d840ac6c75dfdf9ef57004fc24fffc7cb69284e9f230f16de345	f	\N	\N
68f8376b-6a26-435e-9626-d97121dd160f	2025-01-14	Chick-fil-A	13.31	Uncategorized	\N	f	{}	9affc012f6bb8442cb94ed4a3bdcba32b9146c62a330dc3e41947b1609092dc5	f	\N	\N
3057cfb0-f832-4c8b-9b7c-33b83dce0a24	2025-01-16	Deposit Henry M Jackson Payroll	-1819.41	Uncategorized	\N	f	{}	acbcd3ae0fbcb38f32f7c8b29b6d39d18f54c9700eb80b67e2e61247838e2ce4	f	\N	\N
2bbd91e7-b830-49ee-9604-922ec7202189	2025-01-15	Transfer To Credit Card -8715	500.00	Uncategorized	\N	f	{}	34fb871aa796b8655376b41f2f9837f643ae449013f9dc8e6d46ff4723118d1b	f	\N	\N
1287408a-8310-4101-a0cf-06a73a546a87	2025-01-15	Reimbursements from Wex Health	-202.36	Uncategorized	\N	f	{}	77139573d2fe237c8903a33ba9b9f8fd62d855bda7091c3d24b9d74da5cff087	f	\N	\N
70fd1fbe-9049-4a73-8ed1-77d0ffbc00f9	2025-01-14	Payment to Best Egg	1338.03	Uncategorized	\N	f	{}	98c875cb900b6a88e82abb2670821cc24bcb4f067217fff178f5810e3f708b45	f	\N	\N
94f580d4-7af4-493f-ae62-4344f0446a61	2025-01-14	Payment to Verizon	89.99	Uncategorized	\N	f	{}	4cc9c5fc6ff0fe50b6020e0b6d23175205b1920991f42e5d7be48aa7f5278a33	f	\N	\N
62bcfa20-3f66-4c9d-9339-9d0e651c1b16	2025-01-14	Giant Food	18.98	Uncategorized	\N	f	{}	ea46331c8742144b8a2aaf5209a9ab0c70542f5e51a026cc74309a8146d74dfc	f	\N	\N
128d895d-0c25-4572-b95e-aca8e8bc4eeb	2025-01-13	Amazon	13.76	Uncategorized	\N	f	{}	29e6983ab209112974e2b20b4c5ad9d089c46c44a6f689b1fe1a4061e24b19a5	f	\N	\N
b04b77fe-94d2-4c9a-a513-651b72e6efdd	2025-01-14	Microsoft Deposit	-4699.34	Uncategorized	\N	f	{}	aa018529c644388846e4f7b64f38f2769b9ca0434afab213f52bb21309f700fa	f	\N	\N
4957848b-ed22-4bd1-91ce-434fa2531ee9	2025-01-11	Ledo Pizza	69.91	Uncategorized	\N	f	{}	9af4f91ce2ce372ad533c527c826db69888aecdcd47c4a94136e5827d2f19da1	f	\N	\N
5ea7577a-2e89-40aa-92df-307d90ddbf38	2025-01-10	Target	50.17	Uncategorized	\N	f	{}	1edbfc99ece7baf2edbbd71cbe069ea5bd38975180a1e871db4e5d9a673f635e	f	\N	\N
30b1d4e4-ff92-4572-8675-2f2f1475092a	2025-01-10	Sam's Club	45.65	Uncategorized	\N	f	{}	bcb992f05a9bdd6ea16cf4790b6c62b8187bee28c669ef316681425abe470ae2	f	\N	\N
29f960d2-3199-45ef-8d09-de7d4d1dfcb6	2025-01-11	Amazon	42.35	Uncategorized	\N	f	{}	bad94c3f5af8f60fb984fb4b902916fc23c49d56abda2529a795fcc353a78fa5	f	\N	\N
054588c1-9f03-4b69-8852-4cae69342632	2025-01-12	Giant Food	39.32	Uncategorized	\N	f	{}	47698530f9e0619c9deb81a2f016d4749519944b987ad1ba8a788cd54feac9a4	f	\N	\N
d310f853-dc36-41cd-85de-25b2df203155	2025-01-10	DEBIT-DC 8678 TST*BLACK MARKET B EDGEWATER MD	35.51	Uncategorized	\N	f	{}	658646eba436841000ed09462c6d232f4721f1cd862b443df54edde03bbb37ef	f	\N	\N
0fb68a50-b9e8-4a28-9c19-4d6917633566	2025-01-11	A&a Wine & Spirits	32.69	Uncategorized	\N	f	{}	3c1f1bb81dc7fa8169b3a4a3e41f6c9fcacd5f2bb1a04d618c57884e9c622b7a	f	\N	\N
3f19af2a-ea11-4052-850a-802e89e896b4	2025-01-11	Amazon	15.89	Uncategorized	\N	f	{}	29fb2a6f0abb72acd2e5cf6d26f134ba1f9e857f13fd80ca014e0229466c4253	f	\N	\N
cd196f03-1aed-4375-8750-e73e379b6208	2025-01-13	Target	11.12	Uncategorized	\N	f	{}	acf04f8e9f5a923eb2c4911296ddfdc9cfc25e1326120ecf1fb315757660927e	f	\N	\N
e80131a5-e496-49b5-ad9d-10519291f277	2025-01-10	DEBIT-DC 8678 TST* NICO'S BAGELS GAMBRILLS MD	7.26	Uncategorized	\N	f	{}	3a9af4dfcb697a3047cbf890c3f88db6d281d08534077619c3e60a1adbc40e2a	f	\N	\N
6da3dd3f-c4a5-4c2a-9552-ee65f05e4efe	2025-01-13	Mobile Deposit	-53.00	Uncategorized	\N	f	{}	853aaa69b726f4140936b4bb2cbe01952dae2ef0f1ea8957b690c14a5bf1f629	f	\N	\N
8ddcd49f-a413-4057-8deb-7561857aad43	2025-01-09	Payment to Volvo Car Financial Services	485.88	Uncategorized	\N	f	{}	7b2031e8b4e8c407f42f9b1e868b114fc78831d07c3a2b1c8e992cf5acfc11f0	f	\N	\N
bd4f4f5b-5c26-44b6-9611-b48e6bf0ca26	2025-01-08	China Wok	48.39	Uncategorized	\N	f	{}	d101902ee8fc917eda2462a63705eda9c5a797ba0e4db7c27b00c5ced53e3416	f	\N	\N
bbf27817-a545-4ee9-b96b-62ac0c442c52	2025-01-08	DEBIT-DC 8678 OTF GAMBRILLS XX7925 MD	35.00	Uncategorized	\N	f	{}	6b006681eec0311297f0d89e4ce5e6384a76419fd6d220cd4e0464f7577452ec	f	\N	\N
956a8ef9-2814-42cf-98ba-3d9433dc9b1e	2025-01-09	Transfer from Venmo	-300.00	Uncategorized	\N	f	{}	3678a206bae546af218ceb6980f52ef29725c433a2830692b399273a19da399a	f	\N	\N
87609176-e1a5-469f-a35a-0ff54ac4bfdc	2025-01-07	Target	15.00	Uncategorized	\N	f	{}	071b626dfd275798a783ba5c50e7fe9fc0b8c4451731b8808bba7754b7a77984	f	\N	\N
02183205-d919-4867-8746-7045e421431f	2025-01-08	Transfer From Savings -0387	-752.40	Uncategorized	\N	f	{}	770a7ad3dd92f3d4bdcc2df14789093de6911aadd2c02e3ad110bf3289c78a9c	f	\N	\N
7a882956-4e3a-417e-be00-ddcc350f21dc	2025-01-06	Jpmorgan Chase Bank	2107.66	Uncategorized	\N	f	{}	20bccc74b43a7a8639764dcefe04a727d2e4a725f48cc8afda95977a7365957c	f	\N	\N
3fe7ec29-ba56-468c-8f73-8baf877c0861	2025-01-06	Transfer To Checking -2298	825.00	Uncategorized	\N	f	{}	dc291390cb5c0476fa924ab37cfd3f71c115d594e41271cd7bb6121d8bffa15f	f	\N	\N
f4b007bd-ef78-463f-aa6b-c349cf146486	2025-01-04	Payment to AT&T	301.70	Uncategorized	\N	f	{}	cd1ad068937b95eeeae2e4ce5ddfe4a1d3052c1288a93fc2d8e23242ac490c7c	f	\N	\N
92fee749-be15-4c59-9501-1927cb240705	2025-01-04	DEBIT-DC 8678 OTF GAMBRILLS XX7925 MD	199.00	Uncategorized	\N	f	{}	ae075b72442d4183b21306b8f862c423b38c00246e161d0b195a4024856676f5	f	\N	\N
8a36d911-2349-4103-949c-9426279fc5ca	2025-01-05	Target	129.03	Uncategorized	\N	f	{}	35c62334605aa63df1a945b34b4d5f56deac8ffb0b2e41d6b7cdfd455fe8f812	f	\N	\N
bc337e26-0852-4d2f-ad66-d355b02d0967	2025-01-04	Total Wine & More	111.68	Uncategorized	\N	f	{}	6424b895e15251934bb68c962bd97516d8c1d203a28fa116dd88b1e4c6e4f941	f	\N	\N
04ba5cb3-7454-42a0-824f-58e92461d455	2025-01-03	Target	106.66	Uncategorized	\N	f	{}	b06bb8136990d6a912a1f664e49e8ce808f94b900a78f69a0d3bb8fd0fd6e976	f	\N	\N
dc9d5556-0c33-4209-a41c-1c96ef16bc29	2025-01-04	Amazon	45.57	Uncategorized	\N	f	{}	d44a783d712110d3837a4595f2b0a1a9a82795c3f5536353b997b6ae55b9969e	f	\N	\N
e580142d-86b2-4701-a032-133ffdee3a3c	2025-01-04	Amazon	36.66	Uncategorized	\N	f	{}	f975b46f93cd15baf474da4e5c49e23af0adb185b95a8deb38149660efda61b0	f	\N	\N
0220aa52-05b5-4f49-a6c1-a9fb2acef521	2025-01-05	LA Fitness	35.99	Uncategorized	\N	f	{}	e25c35006417fa492f2e14d75c77134141b3285778f15328885b3500e85a08ee	f	\N	\N
db58fc67-0f09-42b1-a838-08d04d6af83c	2025-01-05	Sam's Club	35.45	Uncategorized	\N	f	{}	1d77f8a3927d0aaa832e9c5acbd2c3f3e9d8a6cc1388e05e06ade4bd6b254784	f	\N	\N
29a58cd6-c036-4808-aee2-63085941ada4	2025-01-04	DEBIT-DC 8678 24-HOUR SPEEDWASH LANHAM MD	30.50	Uncategorized	\N	f	{}	d51ceb58b0577c12a273caa1f576b71037e3b532da2d08ee1fa6cd816a47e30e	f	\N	\N
8355b19d-d9c7-4942-9e00-6d675808bac6	2025-01-03	DEBIT-DC 8678 OTF GAMBRILLS XX7925 MD	14.00	Uncategorized	\N	f	{}	1b8ee06f1ede2317f80c6a98e9d817f09e77b206b1ae89a936c5163aa31f633b	f	\N	\N
ac903ea6-835e-461a-b49c-7d18fde393d8	2025-01-04	DEBIT-DC 8678 24-HOUR SPEEDWASH LANHAM MD	12.00	Uncategorized	\N	f	{}	f724b9d70879ed598c9f5d106246f844b1b6dbf4c9396910bd1b5d9c8a911c22	f	\N	\N
d095db83-fc43-41a8-b44d-d2e3d426585e	2025-01-04	DEBIT-DC 8678 24-HOUR SPEEDWASH LANHAM MD	10.00	Uncategorized	\N	f	{}	d45cedf181735c12ed9436559b7a68c4dd97e96f00e6a08a97a9a68f7d083d3c	f	\N	\N
30315698-1dbd-4f9d-ac28-af33cea6c94e	2025-01-04	ATM Withdrawal Plus PXX7740 Lanham MD US	102.75	Uncategorized	\N	f	{}	301494729ab27383ab47cf4294230f6d8b093e416f74b38a43ce324a2d0d2f22	f	\N	\N
2b37d208-b3bf-4003-981b-76382ac2c092	2025-01-04	ATM Fee - Inquiry	1.00	Uncategorized	\N	f	{}	3bdddd8363a44e08d97b9f3681ca2c1a031245d52a8c028172338b78e2d86679	f	\N	\N
a8bfedd7-a780-4d02-89fc-639670d7d8e1	2025-01-04	ATM Fee - Withdrawal	1.00	Uncategorized	\N	f	{}	49cf035f9be5f9b99dd4f5a638067f110d38e5b3df877c127ba4ba2806389a08	f	\N	\N
7b279a03-f7c2-494f-b4b3-86584686aa21	2025-01-06	Transfer from Zelle	-600.00	Uncategorized	\N	f	{}	1640a5ab4ffabd8c5e07221ebdd4fe3b6b5a52a313e75d4cc9d9f6eafde149f6	f	\N	\N
3eb04c23-84c9-4efc-8203-ed3bc5534996	2024-12-31	Elite Sfn	155.00	Uncategorized	\N	f	{}	c39189610a3959f8aad8a8a15c2778a9c7a9faa6cbffd129adbe293b6b4855b1	f	\N	\N
ac7c7290-6e79-4ece-984a-78acff6f9a50	2025-01-01	Payment to Morningstar	86.00	Uncategorized	\N	f	{}	7173a0d05caae02240f11c8f6109c5a8489a1b1895aca9fd15c954f5f7c7ca81	f	\N	\N
7071b57b-3d41-48cb-a4a4-c91e177fc593	2024-12-31	Ledo Pizza	47.38	Uncategorized	\N	f	{}	89b7ee746e23c68208abd9b35389124aba4a4d99e3a26c8be4eed25b5bcfb373	f	\N	\N
eb3f53dc-c693-4284-9589-594351c99f04	2025-01-03	Cinemark Theatres	32.28	Uncategorized	\N	f	{}	14b169ecac158ed8ac42643bb6c93a9371d0bddc277b5c86a7b7761986b75140	f	\N	\N
52ecf935-fda6-4cdf-8339-7ac64405111c	2025-01-02	Apple	2.49	Uncategorized	\N	f	{}	44ae87a066c068d0c3948ba1b67982ece59f5178469c877d4854677f5214230f	f	\N	\N
821db3ca-7672-45d8-bdec-916d7c2708e4	2025-01-02	Amazon Prime Video	2.11	Uncategorized	\N	f	{}	856a28c722b5e1cbc48ab94d1a4e00c23f9f5504945ee19533cfaa8c63ca30fb	f	\N	\N
19c7a5ec-ae34-4dde-92e0-7b40a969db3f	2025-01-02	Payment to US Department Of Education	500.00	Uncategorized	\N	f	{}	1ed81315f45e6ad14e6a17caba483830fc71f0b8070afe14102542c2577a49a2	f	\N	\N
f9a31c95-fb6c-4541-ab59-338d8e746ae5	2025-01-02	Payment to Apple Card	350.00	Uncategorized	\N	f	{}	30f192a9ab720bcbdfcb5864bc054cb7fc345018d0c025ee1f62ab3c39d14ae8	f	\N	\N
e05ab65f-35cb-4455-ba0e-a655e30cb6fb	2025-01-02	Payment to Chase	125.00	Uncategorized	\N	f	{}	6e19ca118e4df7dcfc8fceba8ea268333228a6cb7e470d6ca7053e00e8da50cc	f	\N	\N
4951776a-7fb5-46a4-b40f-a928965bd666	2025-01-02	Transfer To Credit Card -7148	550.00	Uncategorized	\N	f	{}	d7e8ac507899af0f99f901a4a41ea235e99c3b2e94fb9afd42466c3e1a989f09	f	\N	\N
4d25d16d-c8b5-4502-9784-333259487bd4	2025-01-01	Wegmans	284.50	Uncategorized	\N	f	{}	36ef90d45ff2c54523502ff485f44e2eeac04630a7a32aacb06a5c439dff1bbe	f	\N	\N
c0409ff7-f826-4488-b220-a74c78b16c3b	2024-12-31	DEBIT-DC 8678 ARUNDEL LIQUOR PASADENA MD	52.92	Uncategorized	\N	f	{}	9105ea8751718c76601b28c156b603bbe3c18032ffaece6a8f977ad36e5098ca	f	\N	\N
db54bcdd-1915-4223-b5f8-22816d3a3f49	2025-01-01	Peloton Cycles	46.64	Uncategorized	\N	f	{}	5be38aadd2644c05e04dcf7bc74ac21b78ff7c2f2f924f3bb8c4963faa1cf4dc	f	\N	\N
9b03831e-34e8-4ea4-9995-6c9aee922e5f	2025-01-01	Uber Bagels	17.87	Uncategorized	\N	f	{}	7b723503b5aa8b9f3088bee7eca072665d9bac8c0da3c8888ec04dbc67ba1e21	f	\N	\N
98b93c51-1446-47a1-863d-11f1e0ac7a7e	2024-12-31	Rise Up Coffee	10.07	Uncategorized	\N	f	{}	5ce6cfbb87fc22764b9b74d08229f0a292eb40ab47ecaf6c2a544c0a1dc979bb	f	\N	\N
51e032db-7260-40f6-b269-d73e38ff39cc	2025-01-02	Deposit Henry M Jackson Payroll	-1797.23	Uncategorized	\N	f	{}	db646451e6d8a727607eeb20a9336a722d3fdb83987d7433c47c92ac50fe0c7f	f	\N	\N
2f3e940c-f3f2-4faf-9448-6ab071f5d633	2024-12-31	Interest Income	-0.54	Uncategorized	\N	f	{}	c67622a68299936269129209ed6dba0fb55e89df992ebf1b85dde304906fcd45	f	\N	\N
4e801559-1322-46ab-9c06-282f7eff730c	2024-12-31	Payment to Baltimore Gas and Electric Company	266.00	Uncategorized	\N	f	{}	58da9a6fb4aadc1829a6abcd7f0d1ee2e455c7761af84f6571cebc5dee8d4f51	f	\N	\N
9655f541-6c38-426d-82f2-d6af0666c887	2024-12-31	Transfer To Checking -2298	1070.00	Uncategorized	\N	f	{}	8085212619508b76e19c98c9b0f7b8f2e68b4d9dc79a702fa37a9b60fba533f9	f	\N	\N
945beeb1-27ba-4568-8500-9aec485857b4	2024-12-30	Premium Parking	16.65	Uncategorized	\N	f	{}	cefa98e48d654be163e0f9ef7096e8073493092cbbda07e01737185daed4e93a	f	\N	\N
77dd53ac-3bef-4a95-9587-f8256b1f8e9f	2024-12-30	Payment to Best Egg	537.47	Uncategorized	\N	f	{}	4a604621f9e361dfd2d72f0cd56351f455c3033ea113b31d3428f84382a129b4	f	\N	\N
ff5cab7f-f630-457b-af60-4b31c15afd34	2024-12-30	Payment to Citizens Bank	88.12	Uncategorized	\N	f	{}	860b35efed587e96f7507d7412b4d2149936870de4963bbe4f87b500b1507c2f	f	\N	\N
4ffc539e-1ab0-401c-8769-c5033558c19f	2024-12-28	Amazon	116.59	Uncategorized	\N	f	{}	d998f77ab7d5865a905547d3d2b670c38388cbb94e7e65062c667161cea9250c	f	\N	\N
c6920c5e-2717-4bee-a25f-b67a9711d4c9	2024-12-26	Naval Bagels	13.70	Uncategorized	\N	f	{}	8a020b0cf93be2b2d28ddd3661219201210db0557df2e63b24f9a617413678aa	f	\N	\N
822bf1ed-0f9f-418a-8350-3a3a4be75c34	2024-12-30	Transfer From Checking -2298	-100.00	Uncategorized	\N	f	{}	a5071a0809d601a5f7c7990a4ed05be2d621556126f5dbae54a9b13f1da80bdf	f	\N	\N
c630c818-917d-4c1c-b38b-a0ca1444978b	2024-12-30	Microsoft Deposit	-5169.05	Uncategorized	\N	f	{}	405bc6e686216a4fc23f13e0f227e8a6d8b70ef91983d6135f91d76b97159b1b	f	\N	\N
d2165e1e-e7f6-4e3f-a207-242c4cdc5e2f	2024-12-30	Reimbursements from Wex Health	-400.00	Uncategorized	\N	f	{}	fc5bd94a9f947581f5ac0624b98ae741fd2b27f49118cc9f67d942da36b6a368	f	\N	\N
a313c012-6e83-4b12-9009-32831a44459b	2024-12-28	Transfer from Zelle	-500.00	Uncategorized	\N	f	{}	51d2af980d3b073b9e050794118e81af84f1cd842b74054a94adc54faeb4658e	f	\N	\N
44ab5db0-ee99-4ab9-9a99-85ec67713b5f	2024-12-26	Advance Auto Parts	35.26	Uncategorized	\N	f	{}	34a51d9de250e405c31ab1fd4f5ec51f48fe8ffe342e50793e73d84add85aa3c	f	\N	\N
2dfad416-13c7-47a0-b1ee-dfe803e84bb6	2024-12-27	Transfer From Checking -2298	-100.00	Uncategorized	\N	f	{}	7f0bee2572cdba2133b674fcc5a23203ccfc8ff1cd48da959ba2b90adb2510ac	f	\N	\N
f6993588-e942-4f8b-9123-bf09ad18489d	2024-12-25	DEBIT-DC 8678 CASH APP*CLAUDAYA OAKLAND CA	200.00	Uncategorized	\N	f	{}	616d5b6a84258fd2bfbfe1a268157d62a1a8218c36679c1c3ccd39d2c7c44f43	f	\N	\N
83278ac1-b731-4e47-852d-8a1d84beded4	2024-12-24	Sam's Club	104.17	Uncategorized	\N	f	{}	3dd53fbce075d94b3485838289a33a97435e7e22d4315489df0524a6b5cb5420	f	\N	\N
808d77fc-8571-45ca-be8d-872a86c72e05	2024-12-25	Giant Food	69.94	Uncategorized	\N	f	{}	a6d4f1bcc0c5f3c137445db7b3b2e7390d4048084bf3902c7ef97f578f132be9	f	\N	\N
4ea801f8-9009-4ae8-a86b-eb19dad8f997	2024-12-25	Wawa	38.65	Uncategorized	\N	f	{}	ce65bd7fb4542b18347972c7a90a4ede339c498d463367a8c4b131a2e0548220	f	\N	\N
a11c6724-4b05-41b1-9d17-d64d6bfe5fbd	2024-12-24	Five Below	34.08	Uncategorized	\N	f	{}	6a1215c645182c649dcb90ad36ef9b0d4569ebd6319be67118e468523cddb39f	f	\N	\N
d573ef22-3fe0-47e9-91a8-1822de11a6ef	2024-12-24	Wegmans	31.08	Uncategorized	\N	f	{}	1332341557b90f46a07c6b5976b4b0125a327d9f213f49a7548bedd3768eb8b6	f	\N	\N
122fe6b7-c863-46e5-9459-4697d9e9b056	2024-12-24	Giant Food	23.54	Uncategorized	\N	f	{}	f30bc0ba91f8b0dba867bd1a4642a171649c6c042882137fb39cae9b7830e74c	f	\N	\N
d4ab7b61-9810-4353-b1ab-b1ab2f7c43b3	2024-12-24	Giant Food	21.46	Uncategorized	\N	f	{}	3afbf7b0f153f23e184fc0f147f965159a16295cf05a624f0af305607610b41f	f	\N	\N
ab25d421-53d2-4f38-9987-ec048b3fdec2	2024-12-23	Little Italy	10.00	Uncategorized	\N	f	{}	86494ab552c93e0a3e69fd65209bb6dfc679cdbb0ebefa05d2d5b60d65df24db	f	\N	\N
4219bb83-7f20-46c9-bbbd-c1c17cf6bf8b	2024-12-24	DEBIT-DC 4581 SUPER 24 MARKET GLEN BURNIE MD US	5.98	Uncategorized	\N	f	{}	6f664f5a9b4c883b2f6b7477f1654a178b9eb9b63dbc44c7689e4f23ac622486	f	\N	\N
aed40171-6baa-4bc9-9fe6-27594d498ed5	2024-12-26	Returned Item Fee Check# XX0001	29.00	Uncategorized	\N	f	{}	cda002a43473e85f5b0a676e731284a850de587f0ba07cdac3b20731e78b216e	f	\N	\N
e2e7e1b3-210d-4d10-a885-d7f9a3a9b2b2	2024-12-25	Transfer from Zelle	-500.00	Uncategorized	\N	f	{}	acc37d58be1db9e157d115aa9f720a81e9bba23e0d27e36f80eff9bcbd72043a	f	\N	\N
f5a44da3-a859-4ace-8a2c-204bd76220e3	2024-12-24	Payment to Liberty Mutual	292.34	Uncategorized	\N	f	{}	96ed54eac1334cd93d71d6749f620b618a36321c74730deb0b24181ccfff532b	f	\N	\N
cf61474c-1a6f-4bdb-9650-5d20338c2580	2024-12-23	Tagliata	68.90	Uncategorized	\N	f	{}	74a96df883048bc1bc3d5564d5338c1747b554ee8306511b1c1b94814d4dabc0	f	\N	\N
3d65cc06-7d45-43fb-8f49-23a78f6e206e	2024-12-23	Amazon	48.74	Uncategorized	\N	f	{}	1d0adedf212d3841b3a89bfaa65a4bcc4a9c644fb8ab83f81bea883bc9d5b8da	f	\N	\N
5969814f-ec5d-46b8-9de7-9a1884138089	2024-12-23	Apple	6.35	Uncategorized	\N	f	{}	2282efe7dcc5e5fc4901e15ba760ab2c07eb8d95b56cc5fb6d8fe08ea539d56c	f	\N	\N
88395490-7c7d-409c-ba55-e24e989ac898	2024-12-24	Target	-96.67	Uncategorized	\N	f	{}	8a15b9575dd3697c9670b9774db08f4bf788a34563adcee7cee41461f4c580b3	f	\N	\N
efbd7fab-535c-4a7b-8f8f-42ad6dfa1934	2024-12-23	Transfer To Checking -2298	800.00	Uncategorized	\N	f	{}	1b3c83dddb571a52881c0969dfb5f2106503cd0ff09908b6597c008452581502	f	\N	\N
6f1d72eb-fb81-42b9-bb62-c9e1a643ff40	2024-12-23	REI	222.55	Uncategorized	\N	f	{}	9839ad15751eb93b1928ac8f04ab94c5e10511f8093f371808dc345d1d54d7b8	f	\N	\N
60b03373-8a3c-4102-8ac7-d0f7de7992a1	2024-12-20	DEBIT-DC 4581 ANNEARUNDELCO-UTIL XX-1144 MD	216.83	Uncategorized	\N	f	{}	9d7632021a3297a1270deefb0dda1655b3872434f614a9ff225dce30418bb90b	f	\N	\N
d7968edb-d701-4125-ac60-1105a89e3286	2024-12-23	Target	158.39	Uncategorized	\N	f	{}	6d10647e84e479a5d3b4d923332623440439b4c663d83fba401541ee64487a29	f	\N	\N
c8d77019-7ef5-4a30-b97d-0d1d5b07ce16	2024-12-21	DEBIT-DC 8678 CREDIT UNION CHERR RACEROSTER.CO MA	117.17	Uncategorized	\N	f	{}	026c6f35e347d54a76cb7ba9d369474fadb2d88999ed8ee11e51bf221203e3e6	f	\N	\N
e055c13a-df15-47b8-850b-2c8e751386d9	2024-12-21	Clove And Cardamom	87.77	Uncategorized	\N	f	{}	6d21a694e0226e74547db0e4529b5d3c1ab4e6ca75495b12b3c42ffc08e8ecb4	f	\N	\N
d09650a4-2f0a-499b-b0de-a99cb56f405a	2024-12-21	Giant Food	82.13	Uncategorized	\N	f	{}	095baf8e88c87db11035914c52817c818f5b0157385d0dee12e25adcd9b86750	f	\N	\N
4913f591-661c-400e-a12f-5807ade47106	2024-12-20	The Greene Turtle	77.28	Uncategorized	\N	f	{}	527e55b928fa93d05b7016110d4e38c405e02c53939050496f3b9b86f20172e9	f	\N	\N
5f36b7f7-0078-4b2f-9c08-841a93bc4b60	2024-12-21	DEBIT-DC 8678 TST* GRILLMARX STE COLUMBIA MD	57.42	Uncategorized	\N	f	{}	fbbaea272a3841b86e63368400545975b00f86740e929f08f4f222eab3d0216a	f	\N	\N
573de458-4d8d-478e-9cb9-d46d891ce868	2024-12-22	Allure Nails & Spa	54.50	Uncategorized	\N	f	{}	187d06ac0d4f0832fc7c40c21406367d4d94faee55ac54f562b0bcbb8315492b	f	\N	\N
029ed251-a273-499c-8420-57da9bd9de26	2024-12-21	Sam's Club	45.05	Uncategorized	\N	f	{}	a1d457857e5e425189356a99aaf7330c04b38edb177d63fdc5612b845f09ef1d	f	\N	\N
316d57e1-5dca-4206-8f77-1b3849f5c785	2024-12-20	Amazon	42.95	Uncategorized	\N	f	{}	fed8c7eb278d5a3091592055b2089b990dc2276e673e5fff768fe5e2853dc4cf	f	\N	\N
0188e777-4b52-4b72-acc5-5d63fe7dd00f	2024-12-21	Sam's Club	35.05	Uncategorized	\N	f	{}	4af7a59bc4b72a62ba978cd6c0909f128023fa3fe9c0c9528707e8430a4a18ce	f	\N	\N
787e028a-6891-480c-8c9b-a59f3b7e7911	2024-12-21	Cinemark Theatres	30.18	Uncategorized	\N	f	{}	33693e83db7bf4deb20539edac0bfa5852110469315e631c5e1338a55c31028e	f	\N	\N
9b4e5f25-d243-4bbf-991a-3fdab8d6fbc0	2024-12-21	Cinemark USA, Inc.	24.35	Uncategorized	\N	f	{}	eee30bf98a2eb092619ce39d9cd3434305a0b963d2084863fb881422463b7bd9	f	\N	\N
56b6bd76-a8fc-447c-9280-0330a202f009	2024-12-20	Starbucks	20.00	Uncategorized	\N	f	{}	4f5c5b6527995d596d6f8f08135368ffae4d21d666351e2b747a3b8d4a29eec4	f	\N	\N
89292665-ec76-47d4-adf5-63b39650d850	2024-12-21	Elite Sfn	10.00	Uncategorized	\N	f	{}	da21427aa014c4a2a4133e14e2a23d8ea187094117939e456c825eaa6522705a	f	\N	\N
0eeffc3b-7a60-40b0-890d-c5cc7c11d4d1	2024-12-20	Burger King	8.66	Uncategorized	\N	f	{}	e535fd48f350c57b4ee56faa839a37db3eb6a8c3c0b07b0295def93c7c074d44	f	\N	\N
a39f3463-659d-46f3-92b1-ccd0a80b1563	2024-12-22	Netflix	7.41	Uncategorized	\N	f	{}	ffbeca4b12d4d5caa862b7069325373d43991d5196ff863e168225c9af8b438b	f	\N	\N
2ddc7bd0-fba7-4afc-a364-c5d73aac679a	2024-12-23	Transfer from Venmo	-219.00	Uncategorized	\N	f	{}	44c595c3bb234c79616a871c98219ef52f718bcb331af0565d0a2eaf6d70ef89	f	\N	\N
061fdbf7-512a-4b2e-8faa-5cf3426a91ab	2024-12-21	Transfer from Zelle	-200.00	Uncategorized	\N	f	{}	b666ceedc77a38cc32cf0647663ce9224fe57bce6bdded294a255fa3499dc568	f	\N	\N
a0e277a7-d295-4db4-9764-ab94bb2ec85f	2024-12-20	ATM Rebate	-6.00	Uncategorized	\N	f	{}	2356bb821d96eb6f28bdfb6352472754ef6076266dc90fa489837bb5109243c5	f	\N	\N
24cb9526-ca9f-4559-a054-f50e13d44667	2024-12-19	Amazon	127.19	Uncategorized	\N	f	{}	0f7cd26f9ea27cb06fa7763aabe9b066637dfd21067fdbdce0169911f01f21be	f	\N	\N
fb3f6dde-be8a-4b12-bf79-c99a1a0237e9	2024-12-19	LA Fitness	49.00	Uncategorized	\N	f	{}	10028febbedd68ca0e7ccd8179981f824b0b1e5f7ca0519b76ffa26be7119d61	f	\N	\N
8b5c8d23-a98d-4e4b-9e88-9dceeeafb629	2024-12-18	Amazon	34.79	Uncategorized	\N	f	{}	c3b747ed17d5a9e84b4ec875184721e8d27829184eafb3f4e5c0068fb3d141e0	f	\N	\N
bef320a1-030f-4d6d-96fd-1aa0d057b8f5	2024-12-19	Amazon	28.64	Uncategorized	\N	f	{}	c18f632847a82f4672ccd23b5acc2e8e90d07c15d6be0955d42e9ac308532fed	f	\N	\N
0e0ee655-28cb-4acf-bc6b-a82e67964cc1	2024-12-18	Apple	7.99	Uncategorized	\N	f	{}	24e76ae0f9ab305aa46434b3444036c076190f9ab18733edfb161d8d45362499	f	\N	\N
4a4d7eeb-6a80-4033-8dd8-c2e91f89973d	2024-12-19	Deposit Henry M Jackson Payroll	-1751.25	Uncategorized	\N	f	{}	278f67a7f9171e99fd473e09ca7e14a194a0b6de9b6b93b4e13537fd4900f6af	f	\N	\N
2c8ca443-111a-4c55-b228-7a3be4999103	2024-12-17	DEBIT-DC 4581 BDA*SHOPORANGETHEO XX-6693 WA	72.90	Uncategorized	\N	f	{}	2b2f3dfae614cc981ea199d3d05ffd3b3ea6728d36b1f3cbe44f6cf8af065563	f	\N	\N
80da7db2-5faf-4fab-b0de-8d6c05de8a02	2024-12-18	Amazon	66.93	Uncategorized	\N	f	{}	9b6d04446cb9a1c148290686710b7c285d2797b27740ff970f73189973da1b1f	f	\N	\N
04cbc779-4f7c-4d67-a0a9-5418d2dec732	2024-12-17	Amazon	63.59	Uncategorized	\N	f	{}	72f26988f471470a7c64f0c623f454fff98bf40723bf7ee9e1c0b8f1a36ca732	f	\N	\N
9302c0e7-db07-4ea8-b9a4-d7c71aece87f	2024-12-17	DEBIT-DC 4581 OTF GAMBRILLS XX7925 MD	14.00	Uncategorized	\N	f	{}	4937185db9f89bdd9e3c34b497e478edb93ca8e440234acb12319fe3213ac910	f	\N	\N
2c53e63c-3d81-44fa-b81b-2f622aaf2115	2024-12-17	7-Eleven	6.08	Uncategorized	\N	f	{}	bf2edad908ce113c5aa0cdcc53418b3424832178edeab20e08dfc351abbf81e0	f	\N	\N
18bfe13b-1665-464e-bea1-d5dcaa9d7ad6	2024-12-17	Toyota	900.00	Uncategorized	\N	f	{}	c4b79117183f10ffc267a7d53966a1d1ae4ca230d1810eee79cf1151d654aa27	f	\N	\N
fcc91874-2b2b-42d3-839e-39b200286681	2024-12-17	Payment to Capital One	125.00	Uncategorized	\N	f	{}	6f4ebe0c34c24ab4df782c5e336c3cbf203899233a8db5c66cd4bbbc4f771d5f	f	\N	\N
6a8ee8be-6941-4413-b1c1-2b6c4e1f1741	2024-12-17	Payment to Educational Computer Systems	100.88	Uncategorized	\N	f	{}	f0666b7cdf6177b558286b8e9c8e9c1c50e8df4175b326d8ddc227cbd9e76e77	f	\N	\N
d4e48a6d-447b-47be-9bd1-04520fd53157	2024-12-17	Transfer to Zelle	200.00	Uncategorized	\N	f	{}	f2dc0236905e547e9d639b5d3e88856acb4ad9ff29dd0657f516e3090908eeea	f	\N	\N
5cebfac9-8eb2-4e8d-826e-ab221a0d5fa4	2024-12-15	Naval Bagels	8.72	Uncategorized	\N	f	{}	ac60766fb0a4caf2fb47a9a1578259990fdc0ca2cc7911137ced8e18e5005f3b	f	\N	\N
20a66703-951e-4302-8d0f-4bba8da42ded	2024-12-16	Payment to Best Egg	1338.03	Uncategorized	\N	f	{}	cfdd3cdc4e81bd13c9430fcdb0c12e03513a0fe0f2f155de13908d68a57b63bf	f	\N	\N
e2d89a60-d3c2-40ef-8052-f55d5119091c	2024-12-16	Payment to New York Life	616.54	Uncategorized	\N	f	{}	d972e0f11c4977d21395c986bf23106100c27b632dd909ce6447923de68a27ae	f	\N	\N
67399d4f-165d-4a85-992a-5df4b2140373	2024-12-16	Payment to Discover Bank	430.00	Uncategorized	\N	f	{}	3810e6347e3aa4a54cf3c8685f8fab720b40911ea2be4a9771b03c51f6a01dec	f	\N	\N
ca51d65f-64d3-4f73-8208-9cb7a7060725	2024-12-16	Payment to Chase	250.00	Uncategorized	\N	f	{}	425d1183e5888e447149138decdba8db521b084a708315ea7e6985b0d1a0da01	f	\N	\N
96888c3b-6ff7-4840-9b73-a3a1e4880a31	2024-12-13	DEBIT-DC 4581 SQ *OAK AND IRON B OWING MILLS MD	105.58	Uncategorized	\N	f	{}	24b96ba668d77fccbb876824ce5a61dcbddd7bb4c9bbca7c67c3e25860437223	f	\N	\N
08290663-dff7-4720-bcd0-ac64842ef952	2024-12-14	First Watch	83.86	Uncategorized	\N	f	{}	8a4c893daadd19ec585bec6ffb9a7311ab273001100a91194ac14217f8e86026	f	\N	\N
70bf6f5d-bdbb-42fa-8a19-14cd3cb2b338	2024-12-13	DEBIT-DC 8678 EDIBLE.COM HTTPSWWW.EDIB GA	67.83	Uncategorized	\N	f	{}	c9dd234e5f4fc8129fa6e4905e1d6b14e3db763700bac46ed8621f70a2196347	f	\N	\N
5a6e8f5f-2dee-4b4c-bbc9-d54399a17028	2024-12-15	Sam's Club	33.26	Uncategorized	\N	f	{}	6ac60d881b4e34c068650c4b074e7d80ef6287c577776a5a596970ff354f4860	f	\N	\N
a5ae217d-1123-44c5-9490-4ed702586c46	2024-12-14	DEBIT-DC 4581 DAI KIM GLEN BURNIE MD	29.63	Uncategorized	\N	f	{}	70ba00acc494b215d1d7c215c05aea96a5404ef979ddfb45e45094eb93c46d9c	f	\N	\N
8a1876fc-d6cb-4672-ab31-d1a824c70f49	2024-12-13	Chipotle Mexican Grill	28.78	Uncategorized	\N	f	{}	a48f0d998138c8b1b3a38486258fab3cedc279c6e6da2c795b61155769858016	f	\N	\N
1b20a163-606a-46e9-8dc0-2d9b35ea22dd	2024-12-13	Market Basket	25.00	Uncategorized	\N	f	{}	99fb2f8acf8ac701b95801cd5b67597afb65c154880212d43c7d0e9930c9153d	f	\N	\N
7befe13b-a0da-4803-a3c2-47337a109fb0	2024-12-14	Rise Up Coffee	11.66	Uncategorized	\N	f	{}	e455b2f331e23541df3cd314a1f868726e8c786772dc5579e4f94943be4c16a4	f	\N	\N
1e2e7a7d-f288-4a34-88e9-e51c0a7a3e29	2024-12-14	Target	11.45	Uncategorized	\N	f	{}	afe252d575dcc929bba1e3a389ca70a873b954604f727cd42c4a3acecda090a1	f	\N	\N
cd66fd5d-3f53-466c-98c1-fb70eb3e6f02	2024-12-14	Auntie Anne's	7.94	Uncategorized	\N	f	{}	9882ca3699efee7a33d5cfc9713f6257cbcb3b0b8f92621eb4b1dfceb0f64be6	f	\N	\N
cf6060c2-bd12-4282-98f2-177d1f62cf15	2024-12-15	Walmart	4.86	Uncategorized	\N	f	{}	c47d867e1479f0e36fb28fd69f1f61974fc6c04b44e7c6d7e48fd9388dad07b4	f	\N	\N
389f7540-86be-4c00-995d-11f3a2187ccc	2024-12-14	Dunkin' Donuts	2.25	Uncategorized	\N	f	{}	66bdea372aea5ca6e5a43decea95f7edb6fea43af41280f7c3e6e5f2a07cd7c9	f	\N	\N
a493f9e6-4c60-4dd7-8926-3ddf24729af2	2024-12-15	Transfer from Zelle	-390.00	Uncategorized	\N	f	{}	5004b1cb64c211d5915af6881e08ea04deb8280c095acd1c31c3e515ccde3973	f	\N	\N
0fb07f0e-566c-4b0a-9817-8cf80140673b	2024-12-13	Transfer To Credit Card -9005	500.00	Uncategorized	\N	f	{}	d6ffe8c5aa58c1134d5a1cb9f4226d0749d62670d57515a464470005507d9ab8	f	\N	\N
65c31ae9-7fc2-4ff9-95ff-c22ca4b4f11d	2024-12-12	Giant Food	30.24	Uncategorized	\N	f	{}	5232cff99507b4b18c4918be8b6bbbe2ae9148a1a2bc68ba8072387c9d3dd04e	f	\N	\N
9bdccc51-8e82-4171-be82-5909767b4367	2024-12-12	Payment to Verizon	89.99	Uncategorized	\N	f	{}	e49c626660c6adb72a9c7503ddc9cd79ec41306305d6df71a195f0a73a5c08d7	f	\N	\N
0755b647-0172-44a9-ac50-70bf4c9256ef	2024-12-11	Amazon	36.45	Uncategorized	\N	f	{}	52c3e5d53bba3b8c728b939ea23e0cc327f7db6025b4f7389f6914656219e07a	f	\N	\N
27a52847-82fb-4075-acce-f78ce2dfa5a0	2024-12-11	Amazon	21.61	Uncategorized	\N	f	{}	9c95cd518c61182962f0b3efdd4f0a88c1e97586998b02dcd7555ae8426ecbb6	f	\N	\N
c89c2e77-0c82-4c64-a16b-22d416a28fb7	2024-12-11	Naval Bagels	9.31	Uncategorized	\N	f	{}	77d30b703c1799a1a72274b47cd90d37b36b3ff0bee7558163045760b4ebf8dd	f	\N	\N
f4880443-f0db-43f1-9350-8c301400ad07	2024-12-12	Microsoft Deposit	-5169.09	Uncategorized	\N	f	{}	5348f5e49fbfb0002cbd6ff6659f13d7e4ccd12533b60eafc5b7f6f46bf36717	f	\N	\N
af4a62c1-7666-4d8c-a04c-e46597670c79	2024-12-10	DEBIT-DC 4581 BDA*SHOPORANGETHEO XX-6693 WA	126.13	Uncategorized	\N	f	{}	55732d17bc865771c4a3c1ce29bb9587ea92b6c586a27c8f43fbb90a3b865989	f	\N	\N
36d6f94f-59fe-4c7e-98e5-7ae38e2b654a	2024-12-10	Sam's Club	33.70	Uncategorized	\N	f	{}	4a82a22410c1e4c75dfa14cb09fe6dda0e35843f77ad68256acc6434148fcdb1	f	\N	\N
53faadfa-4d2f-487e-b29c-5cb8404fa2ac	2024-12-10	Rise Up Coffee	7.69	Uncategorized	\N	f	{}	6a427e16b0f20a8b32506dd1d28b72111fe7011b7b749e89f80755dc91d81df1	f	\N	\N
78361aa5-6812-465d-b270-dbe7ab3b1786	2024-12-08	Harris Teeter	126.06	Uncategorized	\N	f	{}	e77a57754d2b742aedde6304113dcaf8ee74ea9587485ac3d684560c100753af	f	\N	\N
e6164aba-d0f3-4463-b542-0e4d794f7e7c	2024-12-09	Target	38.47	Uncategorized	\N	f	{}	989a9a1bf8374c7a76f9f017cc18e204fb357a13867868a703e7054c2029a9e5	f	\N	\N
000ff6ab-ce24-49c6-b494-d27bfcad42ed	2024-12-09	Papa John's Pizza	21.72	Uncategorized	\N	f	{}	c17e7527e46b5a7206a231f62bc1a8481a2a93f99eea9d19c1a758351e1aee85	f	\N	\N
fe672cab-7743-4216-9651-e4e352f41fbe	2024-12-09	Target	0.86	Uncategorized	\N	f	{}	54c588ff25ee5bc78a7282ba66746885a6fa088ef89d4bc9f797401b8373965d	f	\N	\N
6a771c87-46dd-4a80-a0d8-79b31dcb7484	2024-12-09	Lowe's	12.08	Uncategorized	\N	f	{}	1171c0c1744630df85cb0d4dd1ceccaeb983ff5660d6d50b434ba975a73cd250	f	\N	\N
1f10e0bf-cb56-411e-b49b-a839f1ec049f	2024-12-09	Transfer To Checking -2298	800.00	Uncategorized	\N	f	{}	dc5e734e612768c8666df1cf3c5fb725a55804f982e2a958d35869e9814fd495	f	\N	\N
bcc64c51-bde6-43d9-9adb-65b9047e1202	2024-12-09	Transfer To Checking -5873	100.00	Uncategorized	\N	f	{}	0a08a022356bf8c7d9e34122e14cba7f1b76db6af20a4a4977052697c3b21429	f	\N	\N
1a61cd5d-e9c5-44e5-a592-6756eb53d43c	2024-12-07	Lovevery	127.20	Uncategorized	\N	f	{}	9961bd5e7328781374e927b3ae3b4eeb4ab002d9e68543e1f1d86553319c0803	f	\N	\N
c3b5d438-4cb3-403e-b411-c4b35673cbd9	2024-12-06	Rangoli Restaurant	112.30	Uncategorized	\N	f	{}	724ea2f3e8f9570bfe4847c7103b29ddf025dfcb9b857f5b44a524dae97b5521	f	\N	\N
3635fcd5-27a0-4b6d-8343-69251b3a6f28	2024-12-06	Giant Food	20.46	Uncategorized	\N	f	{}	23c860bb2ad69f88f1f0f1d69a336cef64930f07c8a6b51022e4e397e71d2be3	f	\N	\N
cafb7480-13fb-4346-9d71-b4868675c1e5	2024-12-07	Starbucks	20.00	Uncategorized	\N	f	{}	c49c29c717b6448b908fa2ce0d1c66187b3bde03eaecb5cd8b555de53fd18778	f	\N	\N
46279873-91d6-41eb-9cd6-909bbd27511f	2024-12-07	DEBIT-DC 8678 TST* NICO'S BAGELS GAMBRILLS MD	12.57	Uncategorized	\N	f	{}	0381fec3532732f2b7212527f83fe6a5cb3d111b812f5fd6908f7a48ebcac7c2	f	\N	\N
818ec52b-fff1-4122-a652-6e1c28a4a70f	2024-12-06	Starbucks	10.00	Uncategorized	\N	f	{}	eb34b087cdc34505a2221c2207927b3fb1146cf46e0a1442097903cfd2e208fb	f	\N	\N
99d5d2fa-7197-4ef3-8991-2c903d8adc79	2024-12-07	DEBIT-DC 8678 NORTHWEST HOSPITAL RANDALLSTOWN MD	8.69	Uncategorized	\N	f	{}	4beb65f0244e45100cb7897e7b7ecf614c05d66e6c0521d9190ecb5b325a2f77	f	\N	\N
5eabe62d-c201-4163-b613-b41130fac9dc	2024-12-06	DEBIT-DC 4581 OTF GAMBRILLS XX7925 MD	3.25	Uncategorized	\N	f	{}	428575c61a79f70a9915b98b0b96ca8e905979dc6cb8561bf07595f8381fd838	f	\N	\N
67825f64-5e3a-49ba-9be5-ed89ede6ac21	2024-12-09	Transfer from Venmo	-213.00	Uncategorized	\N	f	{}	7475da9f53725919732d80e5855937cbc67dd973b3c2b539de0c166415502209	f	\N	\N
967d05ca-78fb-4980-9d9d-6a0d199d5036	2024-12-04	DEBIT-DC 4581 OTF GAMBRILLS XX7925 MD	199.00	Uncategorized	\N	f	{}	2e921f3ca75dcb36121cce534be1c19eed235047b2f82258f32a3944d616e589	f	\N	\N
8af9f069-6cae-44db-9409-1347485cfe01	2024-12-05	LA Fitness	35.99	Uncategorized	\N	f	{}	7879caeba909914972b72f5e782ff49e5b760898a150fc88e2cf2dab1c178ec2	f	\N	\N
e87cb322-bb1e-439b-92a0-4a3ae7bd5006	2024-12-03	DEBIT-DC 8678 UNIV OF MD SCH OF XX5565 MD	150.00	Uncategorized	\N	f	{}	b0fbe5fabc11e94811db0447177214579551a5e1177a45c8cd69b2835b4448b8	f	\N	\N
c076d8fa-e744-4b4d-8726-9c74b5c86dbf	2024-12-05	Deposit Henry M Jackson Payroll	-1751.26	Uncategorized	\N	f	{}	d9560ed979921366a06301c002cb4e8fcab554faf15c4439e9acd10ac4771e7f	f	\N	\N
478af5e2-5c3e-4c01-bece-bfe678aaa9ce	2024-12-02	DEBIT-DC 4581 PAYNE CHRISTMAS TR ELKRIDGE MD	210.73	Uncategorized	\N	f	{}	1560c9e4144bedeb4fe330c631afd12c063ffe3dca4e20424c3f23e60b10b6d8	f	\N	\N
9ddd160b-dcb9-485a-85d3-dc9b24124cb6	2024-12-03	Payment to AT&T	202.90	Uncategorized	\N	f	{}	765e089712641b231fcd91fc29442d8e7242f9a524c278271fda14fc8ff991f0	f	\N	\N
94b24293-5f9a-4b1e-932b-2b49bbf8fccf	2024-12-02	DEBIT-DC 4581 MORNINGSTAR STORAG XX1626 MD	86.00	Uncategorized	\N	f	{}	ed87d343e0dbc9f870f315606e1c0673d371594c0b8a07c2b1ce7f69161a0e7e	f	\N	\N
4e162291-4cb1-462e-b3da-2e51037d3aec	2024-12-03	Apple	2.49	Uncategorized	\N	f	{}	9f68095a29acd54f9e2289109d7672ed0b20f076b49b0851e63b83e1fe5c3b37	f	\N	\N
5f047926-6913-4cfc-a08b-afdac1c66b5e	2024-12-04	Transfer From Savings -0387	-250.00	Uncategorized	\N	f	{}	d22a4d4c0afec3283224f4da577f0f2a67548bff6c8153553ba6d851b0a6bbc6	f	\N	\N
e3ac86da-6c84-416c-8961-8093bd06f0c9	2024-12-03	Jpmorgan Chase Bank	2107.66	Uncategorized	\N	f	{}	5f0a56f5efbdf5c29e53f7c4f75803c12d097962f8b0fd42fe8e21ceb8676c90	f	\N	\N
3ae75272-2792-48b0-8f69-7269e81a174e	2024-12-03	Payment to Baltimore Gas and Electric Company	266.00	Uncategorized	\N	f	{}	ffc534540a4fcb6a2f6d0a71495ab5ce47183da7e03e9a4cc9743e3592b3c9cf	f	\N	\N
f4aaa06e-06b7-40b8-a50c-641b07eae79f	2024-12-03	Target	116.12	Uncategorized	\N	f	{}	a24ae26ae062703b6815ee8e3730ccde1fb9a819a4bab0d743617960f126fdf3	f	\N	\N
c2eb9c83-9213-4977-a658-5efad3f63929	2024-12-02	DEBIT-DC 4581 TST* GRILLMARX STE COLUMBIA MD	100.97	Uncategorized	\N	f	{}	ee3e975ddfcc4328a1883540022fb63fdc513110a02c5b72af53aba549ac8847	f	\N	\N
a4cddfe0-e8a4-41dc-99d6-dff4c34d5e28	2024-12-02	Soma	47.49	Uncategorized	\N	f	{}	fa3aff4dceea463670906e4422c9c17d6fcfadefdaa887c0b121f4db69e44502	f	\N	\N
6ed8ece7-b6af-4cef-a64e-a7736c1043a0	2024-12-02	Sam's Club	35.21	Uncategorized	\N	f	{}	8086a1ff30c2fec9a3e97a5d275b61bb46c7a0f7ee1076c93e0061de38db3f51	f	\N	\N
b8960345-58d7-47df-838d-f0cba5172f38	2024-12-02	DEBIT-DC 4581 OTF GAMBRILLS XX7925 MD	15.00	Uncategorized	\N	f	{}	aac33f486f1c39f7060188083ea500ce797b6f3484655d04676532764999f145	f	\N	\N
1b858638-c5f6-416b-9ee7-987f5596f74a	2024-12-01	Soma	-30.74	Uncategorized	\N	f	{}	31e4efd80352d434757cdc481f19ed9b0d66cc027c8e890b7b7543fdb36c5e6b	f	\N	\N
75e7c606-97af-4a53-8289-e6927fe02e58	2024-12-02	Payment to Apple Card	259.16	Uncategorized	\N	f	{}	a6bf441a4d3a117c10c0dc4299ec5d79f81a319d9fe11a9fa43963cf7b75bbb0	f	\N	\N
a908fd33-1810-4099-8398-76792cd5f144	2024-12-02	Payment to Chase	125.00	Uncategorized	\N	f	{}	666e13c9f9940827a7f21feb1ffa6dcbb603d54daec9a8a6f420f5d27de6355c	f	\N	\N
162a7332-ee4c-4561-a8ae-040ebb18c10a	2024-12-02	Transfer To Credit Card -7148	550.00	Uncategorized	\N	f	{}	2180f9a797de796bd5b2ef1d7e06b0992d210158db984ac7c1b0bfaf009b4d8a	f	\N	\N
7af67aac-3065-40d4-9391-3f079e8b9461	2024-12-02	Transfer To Checking -5873	120.00	Uncategorized	\N	f	{}	5fca1c03292ccd53b555083d714b5422727f5fe0181d895567abb306bbc9e7e3	f	\N	\N
ffce161d-cb96-4982-9418-de8dc8c162ac	2024-12-02	Transfer To Credit Card -7148	100.00	Uncategorized	\N	f	{}	f52eb80f670d6cae2f4619f7f24561d208f91c44e144bf92b59396e7c2da2796	f	\N	\N
7a41ba5c-eb02-444a-b867-6e89631a91e4	2024-11-30	Elite Sfn	155.00	Uncategorized	\N	f	{}	f3300e3834d5599e037d61f86ab2061e42f1c45bdc13ea4a0897cbacd9883a50	f	\N	\N
f3537665-42ab-42ca-a86b-bc196d1469f2	2024-12-02	Allure Nails & Spa	154.50	Uncategorized	\N	f	{}	d3cafb4156efd906bd9d46ebd03287ed061add6139cb8cbbf8c54e1af58a9ffa	f	\N	\N
77a81363-48db-4df1-8e5d-da8077db222f	2024-11-29	Target	142.03	Uncategorized	\N	f	{}	1808a07e6b6dc1b8986dd557dac3e3ac527e1a08a0fb09c84e6e2921b59c7680	f	\N	\N
45805da8-748d-4d70-9147-d4e5eacd7c7c	2024-11-29	Trattoria Caffe Italia	79.57	Uncategorized	\N	f	{}	842d564b953d0d4f24a9e0cfa0eaa61be4bab00ff188c0e705e15fc96d41cf7d	f	\N	\N
42e79998-da31-4197-b46d-45165411c9c9	2024-11-29	DEBIT-DC 4581 INFINITEA BANGALORE	52.59	Uncategorized	\N	f	{}	7ff47ff6709384cb40f8e42a857027dbffc659acb6eda8b54f2d42b4e1a17760	f	\N	\N
f753eb64-b974-47ef-ba4a-bb33422f8ad6	2024-11-30	DEBIT-DC 8678 MONTEGO BAY SUP OCEAN CITY US	48.91	Uncategorized	\N	f	{}	9d9578c8f9e9ebac5d495a68c96292aa4bf22bc9ffe7dc52c6b96bfde6b10307	f	\N	\N
bae292ef-3c39-47e9-9ab7-b185d2b44c8b	2024-12-01	Peloton Cycles	46.64	Uncategorized	\N	f	{}	a3467f12c8e791238c598d22868128791eb94d013ec18a62fde9d77d8f40dd15	f	\N	\N
b322c86d-bb9b-42f1-872e-f283c248aec5	2024-11-29	DEBIT-DC 8678 OCMD TRAMS OCEAN CITY MD	30.00	Uncategorized	\N	f	{}	bf065b99895948c630fdc2fe826cc698db3bbbdc46f972b6c3d1afeef47d0451	f	\N	\N
7ad7831b-1062-41b0-9949-16a326a42e06	2024-11-29	Sam's Club	21.70	Uncategorized	\N	f	{}	61066292b00df13ba02fbd5fd76a8004285f5b39b5a5cb96463a471070ef84ec	f	\N	\N
f5dec1e7-9134-479f-a708-faaa07338716	2024-11-29	McDonald's	16.61	Uncategorized	\N	f	{}	590509da7bac8a3606a12f06b880d7023306073ee8c044a6959005a9f5a6b1e6	f	\N	\N
1392da6e-ee4f-40f4-97a8-f8fc799cd8ae	2024-11-30	Starbucks	15.00	Uncategorized	\N	f	{}	42bda13905256c7a45867e8c05628f4e14cd13c8dfa130b28c5d10ef3b014fb7	f	\N	\N
e43f4a31-b722-4519-95a1-bf4b757052cc	2024-11-29	DEBIT-DC 8678 CANDY KITCHEN - 93 OCEAN CITY MD	14.25	Uncategorized	\N	f	{}	a64da7659a1d2f2b1ac71175a1ad930df6c13394a5a01b9bed46b62ae2af7875	f	\N	\N
9b78c63b-f7c2-43f5-bbc7-4913fdaa91bc	2024-12-01	Soma	4.78	Uncategorized	\N	f	{}	3d4320fdfd2aae4295e320112098d553e9dc0e615f1c94e2bfecb366b9a736ad	f	\N	\N
4ebe2b59-6a50-4763-91b3-1e64fad6d50b	2024-11-29	DEBIT-DC 4581 PHICOM*TRAVEL RETA BANGALORE	2.40	Uncategorized	\N	f	{}	93078ece925e304efe963a927c15c3ae9fa81e6e4e7ff77cd5dda8648d94f50b	f	\N	\N
f2fe016e-8d3f-4591-a4d6-35e802a2bcfc	2024-11-29	Intl Transaction Fee Visa Infinitea Bangalore IN	0.53	Uncategorized	\N	f	{}	7a1729e5e011d282d07d6164cead44a0d717b1322726d56d3f3f4a71ca0375cd	f	\N	\N
26c5771b-b229-430b-ac28-5abab90cee46	2024-11-29	McDonald's Service Charges/Fees	0.17	Uncategorized	\N	f	{}	41fbdd72b0979fa70419b5912e6a4fd862982fc263387f4c86baea83c2798533	f	\N	\N
412d139e-af5b-42ed-be14-2f03ce249134	2024-11-29	Intl Transaction Fee Visa Phicom*travel Reta Bangalore IN	0.02	Uncategorized	\N	f	{}	c0a54aa038617417502e502c8e9d0f0fba9b9a4d11e5fccad36edc3fd6f697e5	f	\N	\N
5d199d68-051d-4b90-b07b-f9b8f26ef676	2024-11-29	Adjustment - Cr Southwes XX-9792 TX	-11.20	Uncategorized	\N	f	{}	cbd315fa6fe61b21aeac21a350662e3d1453ed7055bf66818ee30305a088590a	f	\N	\N
e2a80706-4d75-4a26-8cb9-6a8caf5c0204	2024-11-29	Interest Income	-1.61	Uncategorized	\N	f	{}	f1b3826b40bd052ba148f7ea1a1b1f0b943d016328b3fa931894ac3b16c70e3f	f	\N	\N
0e6f3bb8-1fe8-408c-a46a-43493a4288f3	2024-11-29	Payment to Citizens Bank	88.12	Uncategorized	\N	f	{}	676be6cad662e96ff88b990ed5c78d67481c35bf6860039c56a2fa17bfd2b162	f	\N	\N
10798b9c-fcaa-489d-9b4f-47db7fee3f0f	2024-11-28	J.Crew	188.68	Uncategorized	\N	f	{}	8d75aafda3476ae64ad07d2eb1f23e31fdd510e29d9089daae84545b6d10a002	f	\N	\N
5c8d5a2a-8865-4bb2-9e74-c9eaa189c36e	2024-11-29	DEBIT-DC 8678 CHARMCITYRUN.COM CHARMCITYRUN. MD	139.92	Uncategorized	\N	f	{}	ca49007101f24f0781a9e16e8536110880c5336adb75d9a5225a507246b63b2e	f	\N	\N
291ce153-f3e7-46d9-ab97-5ebb0dfeef22	2024-11-27	Harris Teeter	110.43	Uncategorized	\N	f	{}	5c0b762ab0a1af81b311302eb4b37a2101914762c78394739baed26fd9c1469c	f	\N	\N
b3c26fd2-5ee7-4f4a-ac88-9d259076b882	2024-11-28	DEBIT-DC 4581 SUBKO COFEE PVT LT BANGALORE	103.55	Uncategorized	\N	f	{}	658395585d6578a4034b333f612cdb920d122b04a93e4612aa3048f27bbc4e52	f	\N	\N
70e565b6-1004-4f6a-ae65-9689a0e4aba2	2024-11-26	DEBIT-DC 8678 THE FARMHOUSE OF G XX7544 MD	80.00	Uncategorized	\N	f	{}	9fdb20c71279122e3e0844000b8735d6b1b7e0a622789dd58a2613ffa712a215	f	\N	\N
0f4708b6-40d7-4111-b7fd-76f11a814298	2024-11-26	Harris Teeter	73.39	Uncategorized	\N	f	{}	68402593b8ab3c52e4adbbab4f439f7de1b4228183fa3d96ef94e4e60dcf7322	f	\N	\N
f49cb7c1-f5e1-47b3-99c4-a3fe601ab253	2024-11-28	Harris Teeter	70.55	Uncategorized	\N	f	{}	67b9151a3c82da965b70b3bc1c90adc4d50aab3f2751c27e01c6e19ef0d1884c	f	\N	\N
2b64fa8b-5d5a-47ce-ba08-79a2b6dd794b	2024-11-27	Floyd's	50.00	Uncategorized	\N	f	{}	4dc7e24e8e8f19eda35fc069355eca6588786d3f7440d02e2ac90f3ec09402ec	f	\N	\N
7c4bc76f-1672-4332-a737-631310d8b4f5	2024-11-27	DEBIT-DC 8678 TST*THE OLIVE TREE GLEN BURNIE MD	43.38	Uncategorized	\N	f	{}	59d548826370a53c73dcc49c69e27caaf73ba85e332401342c58cf556390d28e	f	\N	\N
3009e314-f617-4758-ac4b-8b420f671c8c	2024-11-28	Giant Food	41.17	Uncategorized	\N	f	{}	e14629a3058a76f81b04b7d8dd1e030fff16830f1abdfaa00d053655e2b69a73	f	\N	\N
9a7e5f9f-ad81-4b7b-a580-8e19b6b1654b	2024-11-28	Rise Up Coffee	16.46	Uncategorized	\N	f	{}	01b4a75177aba05b0abf6d87b174c7178d0180004b2e83f23427df1622a4ad3e	f	\N	\N
ebad845b-aef5-4fbb-ae96-324920e2ba16	2024-11-28	Dunkin' Donuts	8.28	Uncategorized	\N	f	{}	947cce04cc734c72ecfb88a6892a973c02c523c0f830d249bc5f7f80e9742643	f	\N	\N
5845728e-b702-4fd9-9cc2-3dfee3ffc473	2024-11-28	Rise Up Coffee	6.30	Uncategorized	\N	f	{}	005fae5ff6fbf8c724ae29d31ba7b63e3282c50dda9bf5e5be147f542e2413b2	f	\N	\N
fb2c09b7-d81f-4a53-aa41-3c4c7138c10d	2024-11-28	Intl Transaction Fee Visa Subko Cofee Pvt Lt Bangalore IN	1.04	Uncategorized	\N	f	{}	fc73c7c3b58efee9cfc89e15205a38ca8aa91b814cf9c3459158979b76e0fb78	f	\N	\N
0bd96e8d-c41a-4bcc-bad6-f0ff5d38b57b	2024-11-25	DEBIT-DC 8678 TST*BEST WINGS N P GLEN BURNIE MD	46.60	Uncategorized	\N	f	{}	a52d40a07ede0ac8ae857aeb8b4933ca21f6b340c915602e0b9188898b6f8084	f	\N	\N
5c18be2e-844a-4592-b30a-f356aed6eae7	2024-11-26	Sam's Club	36.36	Uncategorized	\N	f	{}	4cc027ad29004611f933dc294c8eb4a7f3770096b012b69528526860dc669f2d	f	\N	\N
a27b08f8-5da9-4fc0-84f5-ffd968d778cd	2024-11-27	Microsoft Deposit	-5169.10	Uncategorized	\N	f	{}	1528880aa1a5134983e0bf08dfefc6fed0878950111477ef7609c250eda3f866	f	\N	\N
c8bb0e4b-0137-4aad-b96a-f6f9b23e708b	2024-11-25	Target	56.19	Uncategorized	\N	f	{}	91d8e647ae2ff05df17db783070d43c820a8338ed6186b923e7fb5ddbe2926af	f	\N	\N
bd3857af-6744-4fb5-b5db-49c1aa159238	2024-11-26	ATM Withdrawal Plus XX0001 Bangalore IN	118.74	Uncategorized	\N	f	{}	46217d5add1d8201475a2e285ad4fa3912d2b97b8fbb0988515c3d7f0d56d9cf	f	\N	\N
7c04670e-510f-44b9-8b14-e1d0373855bc	2024-11-25	Intl Transaction Fee Plus XX0001 Bangalore IN	1.19	Uncategorized	\N	f	{}	e5e53e53c64ecb07dbd5662165b7cb5ab9c40c76ceb38628c8ef4fd1824ed876	f	\N	\N
65118b60-5215-446d-911f-03abca52505b	2024-11-26	ATM Fee - Withdrawal	1.00	Uncategorized	\N	f	{}	f84fcd710324164376b568715393d45dcb7fe4e87cea19f72d084361942bbed9	f	\N	\N
380a12d7-3bbf-4d32-9555-96c600adf770	2024-11-25	Adjustment - Cr Airbnb * Hm45jwwee XX5959 CA	-179.80	Uncategorized	\N	f	{}	f2c098bd7817b9633db092f30ad85083f27568796e6dc5eabdf8c34c26524ac9	f	\N	\N
1da98e3b-c539-4dc5-9065-bbe2cafcd3c5	2024-11-25	Payment to Best Egg	537.47	Uncategorized	\N	f	{}	8c2a5461b7282050e0dd0147c8c83eb04297fd72a7805a8480732e7ea5c0eda8	f	\N	\N
4690da9a-003c-4259-843e-69cd7ae50052	2024-11-25	Transfer To Checking -2740	50.00	Uncategorized	\N	f	{}	df03e146f287ac1f23f663bbf81f59f8ec7f25a8ba8e11b82f308f11577ab6d9	f	\N	\N
d2b435da-7b07-4120-9650-b2ba1671aebc	2024-11-24	Soma	118.18	Uncategorized	\N	f	{}	765d264908ec1408cbc5116f398f4c429a94c376539fda169589a65b755580e1	f	\N	\N
a4d1e7ac-d761-45a3-9d14-6572c5dffb10	2024-11-22	Giant Food	71.10	Uncategorized	\N	f	{}	435d065d3c1f88117f08ae8309f0924e0d8f3be5442b8fc1f1bbcbff484c1ed7	f	\N	\N
8b2b0881-10da-4fd0-a98a-b85ec36dbf8a	2024-11-23	Amazon	64.33	Uncategorized	\N	f	{}	3f94378c28b8bd3d54b13bd3428d2983d11eb88035d17e2c28bd320fa9bc15bc	f	\N	\N
e0003fda-3b80-480c-8371-2f44459c7f18	2024-11-24	Roy's Car Wash	46.00	Uncategorized	\N	f	{}	756972a30e4a740c5689f376712d166aa736b8697623e28856a4011da4b623d6	f	\N	\N
4371d26a-938f-4ac5-a029-d4b725a4c03a	2024-11-24	Sam's Club	42.15	Uncategorized	\N	f	{}	d871ce1dde8f697d9915b69f4fd56916897330b5c0667bac4f6b9fd80c1f6e13	f	\N	\N
baf9fd5d-2c42-45ed-82b5-34a7eae74a41	2024-11-22	Food Plus	7.58	Uncategorized	\N	f	{}	a0a3da4ee1514738ccba169968502e7a199429926e57fe9569b757b45ae0edd0	f	\N	\N
6f75d399-0736-415b-ac92-827acd2ea37f	2024-11-22	Netflix	7.41	Uncategorized	\N	f	{}	2ace464af5401856e89d6c8efa0fd71ed35eebe7a9dc8a3b6557b1eb30f84ccf	f	\N	\N
a86fb892-8261-47f5-a713-448c8b9ee7a4	2024-11-22	DEBIT-DC 4581 JACKSON TRADING CO DUBAI	0.82	Uncategorized	\N	f	{}	be7a47887487e85f91158f817ec9c2713a8ab1274fb128acca8983776ae40ecc	f	\N	\N
63a007a5-9104-4e37-a117-024b27215510	2024-11-23	ATM Withdrawal Plus XX0001 Bangalore IN	118.52	Uncategorized	\N	f	{}	25c19d44fa105562c3f7289326a1ec80107bbb781ab01da1ab168aaaa53f7354	f	\N	\N
b11ee1f2-d6d1-477d-b856-1109fc94e764	2024-11-23	Intl Transaction Fee Plus XX0001 Bangalore IN	1.19	Uncategorized	\N	f	{}	267009d51f6f298b30a68b784ab553804129b21b1dbf5aa7bfa44b6adaed8c98	f	\N	\N
b6dc73fa-6967-4b1c-9236-6774ad3c10b4	2024-11-22	Intl Transaction Fee Plus XX0001 Bangalore IN	1.19	Uncategorized	\N	f	{}	ada1c576f07f396a5345cadf12c1a41a08eeccc267d4468bed893d33336d219d	f	\N	\N
ce4bb056-a00a-48c6-9c14-668d9343f3f0	2024-11-23	ATM Fee - Withdrawal	1.00	Uncategorized	\N	f	{}	ff91c68e9bae06e8afeda8c92f94580bda2ee763814f8aae3209589562739322	f	\N	\N
432b6eca-963a-494c-80cc-cf487e3d41d1	2024-11-22	Food Plus Service Charges/Fees	0.08	Uncategorized	\N	f	{}	5f8064e39025dfc9e9665f4ea5b6c478b5ba4a1dc0017d827de3db1443588d65	f	\N	\N
22fc3777-c204-4d94-94b3-ba91090c5424	2024-11-22	Intl Transaction Fee Visa Jackson Trading Co Dubai AE	0.01	Uncategorized	\N	f	{}	9f4c122d8ef3cb4a87edf3afb23d63d040c818c81bec074864f1c35dc8ae3f5e	f	\N	\N
8819596e-c459-451a-93b3-93cdbcf78002	2024-11-22	Payment to Liberty Mutual	202.86	Uncategorized	\N	f	{}	99a84902e4b7b555173c3d0d2e886f454b4fb25bb7d8b24f3fc3335dbae1348c	f	\N	\N
5e75c09d-6144-4f0f-8b65-8279008e1763	2024-11-22	Transfer To Checking -2298	850.00	Uncategorized	\N	f	{}	c59f044b3097413c3fd40cdc0b52650243dc9df791140811b2382a5b5b175e5a	f	\N	\N
3addfa59-6ea9-4fce-a128-91829ac0bfba	2024-11-22	Transfer To Checking -2740	150.00	Uncategorized	\N	f	{}	104cb4c414f47d0b6179dcbac45e1f81e6660b278f8ea0c9b252cafba33ae46d	f	\N	\N
4e290608-ce9a-43fd-9016-1773bf40f08f	2024-11-20	DEBIT-DC 8678 MVA ESERVICES XX7299 MD	211.50	Uncategorized	\N	f	{}	ef77ea6d7802715548e9a39edef7dfd01c4af14d1514dccc7b145f6a773ce59e	f	\N	\N
795afd77-5317-49b7-97ea-c2b3791f933b	2024-11-20	DEBIT-DC 4581 TST*FOUNDERS TAVER PASADENA MD	118.00	Uncategorized	\N	f	{}	4804e70a14b42b1a5d62208860356d92ecff0fd2f263495f23b68f887435eeb7	f	\N	\N
325ffb29-7ae8-4b75-8d20-0f7e08cb12ea	2024-11-21	Texas Roadhouse	108.47	Uncategorized	\N	f	{}	e088337767af59cd4745276ff85d8cbc72f86d404c27a1a7c331e2d0d372c7f6	f	\N	\N
be0b2485-37aa-4daa-ae08-b4db0bb317fd	2024-11-21	Transfer to Apple Cash	50.00	Uncategorized	\N	f	{}	371f92b892fa633aecbcec4ba260f39313fd75e4b4a98d11699c863dd00fb66a	f	\N	\N
0ad4fd5e-12eb-469c-b0e8-b125c3942576	2024-11-21	DEBIT-DC 4581 OTF GAMBRILLS XX7925 MD	14.00	Uncategorized	\N	f	{}	30231e2dc26b0cb54e9207e53e9927e50b6e97a897b5d36c3613af0436aeaa56	f	\N	\N
c16e03e7-1b00-4513-a1a3-f6732560cefe	2024-11-21	McDonald's	10.04	Uncategorized	\N	f	{}	a50389a631a52a195ac3652d3ba17c5b7ec17dfa415a7860da55fa24a7179116	f	\N	\N
95df70aa-baf3-44b7-b25b-8aad777cb3ec	2024-11-21	Rise Up Coffee	6.57	Uncategorized	\N	f	{}	213a0136c35e6cbfdba6b4a5fa74f84cf1c645412039aba5c5fc91a6d5de3528	f	\N	\N
cdf106ce-b9d7-4377-b56b-9646bee74e26	2024-11-21	ATM Rebate	-1.49	Uncategorized	\N	f	{}	9a9b4d0617e0cc527e5cb5ba90711ecaf3c7fc5c53ffb47b462ba82344b27980	f	\N	\N
9c3e5945-9099-4edd-ae2d-69acd0f80276	2024-11-21	Payment to Educational Computer Systems	100.88	Uncategorized	\N	f	{}	03f3ccb5b53de03534149649694844e29f0e68e2708a4f191bab733e8ae77d86	f	\N	\N
897cadd7-be6e-4a93-8c0a-7348a350e04a	2024-11-20	Giant Food	93.56	Uncategorized	\N	f	{}	e07991e4e0f963e2a48b2c155565cfe3ebdff06251fd1b57bb2bc2d55e22444b	f	\N	\N
18cc1e06-821f-4b94-abe7-a0e1d4cd24ea	2024-11-19	Ledo Pizza	54.56	Uncategorized	\N	f	{}	a4791405a680f4ff2f1148fb402c90379a49e2167b3e6142d3a58bd0c080f981	f	\N	\N
b98f0766-b725-4a77-8302-1cac0b637570	2024-11-20	Thirdeye	52.99	Uncategorized	\N	f	{}	c523d0c16ed8115f15747ad72fff06b8e43855eb883e782f446fd6ce5b8a5ca3	f	\N	\N
7089e509-bcd7-46bb-b896-ed89c99d7d5d	2024-11-19	Lima's Chicken	1.06	Uncategorized	\N	f	{}	1522fe153d3bf31ada752b503d0d371283cbcbcf08bd081ba462669c4d303e34	f	\N	\N
ee1651d4-52a9-4582-838c-f5115402f44b	2024-11-21	ACH Debit - Claudaya Hood Be	350.00	Uncategorized	\N	f	{}	06f1258164d5f5c7cafdb8d709f06aef79a1631aaeb0fbf488eb3b675e950617	f	\N	\N
108b6ffd-523e-44f7-a878-cfd7dfeadd15	2024-11-21	Deposit Henry M Jackson Payroll	-1751.25	Uncategorized	\N	f	{}	5f4929facd723aca9956bd32063c480d4b80a3ec9ada5030b6e9e5e7939b1f1c	f	\N	\N
96951580-7c81-4fdc-b64d-73ae9f06f48d	2024-11-20	Payment to Capital One	4862.03	Uncategorized	\N	f	{}	1016f38fd3e3927f95541791219a1f274ff820aa64020b7f0bd33c31fa79478b	f	\N	\N
98bffde1-7641-4f14-8cbe-e8586baa761a	2024-11-17	DEBIT-DC 8678 TST*THE COTTON EXC SAVANNAH GA	173.00	Uncategorized	\N	f	{}	0e1cb0f7a1148520451f4b846a86b390514b6650f43a05f63ffcfd1c6b37eb09	f	\N	\N
e66d76f3-a9f8-48a3-a08c-ff887a1d7ff2	2024-11-18	Target	39.62	Uncategorized	\N	f	{}	2274fb7dd499f416b9160075a37285daf64391758a026d5850fac9b2654cb50f	f	\N	\N
fc353a4f-d8eb-46a8-be9e-6ea535d9571a	2024-11-17	DEBIT-DC 8678 A COASTAL CHRISTMA SAVANNAH GA	36.36	Uncategorized	\N	f	{}	456bfb136f78101f2a0326b98eb5c10ad63cb0edc205b25fddeadf8b6adda985	f	\N	\N
9cb0048e-7513-45a0-8713-75653f7c4c3c	2024-11-17	DEBIT-DC 8678 PY *BYRD COOKIE CO SAVANNAH GA	30.87	Uncategorized	\N	f	{}	03e00f1d1e90df13fea4fffc0fffb982d63001a6ebab1fc37a69ff92b767d221	f	\N	\N
8542bcd5-e91d-4277-a636-156319eb044c	2024-11-18	DEBIT-DC 4581 LOVE'S #0412 OUTSI DUNN NC	29.41	Uncategorized	\N	f	{}	94c637039d475aa37467f429bb206a06bd68aa2de238cc49bbbc4ce398c224ba	f	\N	\N
4b1d811e-d909-4d0e-93fa-2aeed404fedf	2024-11-18	Royal Farms	15.05	Uncategorized	\N	f	{}	bae3d69a237b9633cf766e7541c6ba455ccc2b2537e7bb1a96a00f3041bf1e65	f	\N	\N
435aa9fc-f1c6-4825-8428-2f46c0df10c6	2024-11-18	Apple	7.99	Uncategorized	\N	f	{}	19741c766b4dc289249687d5f57a8db8985fa4d5218275c7093c53278dd121d8	f	\N	\N
d6a93337-1522-4ba3-a70c-4587ee488298	2024-11-18	Love's	5.35	Uncategorized	\N	f	{}	9978f0cce57479e1ea44c238ab678a7547f1a9adeedcffc23017dda52289e04a	f	\N	\N
1645af39-3d1c-49c5-870b-c5fd13bc51d7	2024-11-19	Transfer From Savings -0387	-6500.00	Uncategorized	\N	f	{}	239fe8919eeeba32759de635911e6c3bc5242dafb607f1bce358d6da2dd3a8e8	f	\N	\N
bf154bd3-6319-497e-b225-bc7c44486464	2024-11-18	Payment to Capital One	3500.00	Uncategorized	\N	f	{}	78010d19feea6387e5fb8c6bbd3e12613abb3a05c41cbf95ed3b196129f71c99	f	\N	\N
8c869e94-3e43-4ce2-9620-1331806f2b8d	2024-11-18	Toyota	900.00	Uncategorized	\N	f	{}	2841aa7cb92359b001dfe41ac99ce25984e11836aaf2ffe5e3073bb90ee15cec	f	\N	\N
2e25445a-628c-4beb-8886-cc934dd91c7b	2024-11-18	Payment to New York Life	616.54	Uncategorized	\N	f	{}	2f8c36cc2414faa2ed12c56f5bfaa1fc89a25a50bc17ff0bae56ab4140a4ce7f	f	\N	\N
c5da01c9-1ad4-4fa8-9483-db9044992f26	2024-11-18	Payment to Capital One	171.00	Uncategorized	\N	f	{}	39463219cd908e573583e4a311b771ab2faa91541501519ae8d60b4f04295500	f	\N	\N
ffbde3b9-bb7b-40df-95ea-4524e8522924	2024-11-15	DEBIT-DC 8678 VOLVO CARS ANNAPOL ANNAPOLIS MD	188.84	Uncategorized	\N	f	{}	18603e0e3e2a7831193cd9e3a733504b5a7ef89ad77d81f1673e7ff77ef39478	f	\N	\N
38538bf9-9034-4443-902d-0ce983569cbc	2024-11-15	Giant Food	103.52	Uncategorized	\N	f	{}	08877530478210570567e8a59b37473519aab7811bafa6deeadb777cb25cb418	f	\N	\N
a7179ebf-c903-4367-82bf-9aea10be7de7	2024-11-17	DEBIT-DC 8678 SQ *PERC SAVANNAH GA	81.00	Uncategorized	\N	f	{}	c7814cad2a7c55c0c928c16b63ebb14c1e61fbba2a1581ccc3814e2993b14c36	f	\N	\N
fb230422-f925-40e0-abe5-2887b71fb3d1	2024-11-15	Target	65.54	Uncategorized	\N	f	{}	819aee40e94dfcd4d5bba6a571aebe4f30b35b7899887267320d317926c87de9	f	\N	\N
2b444aee-d6c2-4dbe-83fc-6a7c5595cf80	2024-11-15	Shell	21.75	Uncategorized	\N	f	{}	ec000945a0fec307b4bd26f8df2a4b0d00c1809f5144079b7fa318fde23b6349	f	\N	\N
088b9339-13d2-4ced-8ccd-86d842aaf423	2024-11-16	Starbucks	15.00	Uncategorized	\N	f	{}	717934e2e4cd74c2ef72bb42c348a86a488244089da7b95cf94efbce79185cb0	f	\N	\N
0332a18c-e845-493d-8c3b-ac3b4e19e392	2024-11-15	Transfer To Credit Card -9005	500.00	Uncategorized	\N	f	{}	125234e1fa87058a4cea39693553ae5f01debb385f5ffc620877638cd25c9208	f	\N	\N
26766994-82e5-47c8-85ba-770c19ae6312	2024-11-14	Sam's Club	33.33	Uncategorized	\N	f	{}	e7a146ed513bb8a59198b0174b719a54b65d5e16a326b95de5609b6cf3b15835	f	\N	\N
2fa1190e-45f2-4407-af16-f15b689a7ce2	2024-11-14	Payment to Best Egg	1338.03	Uncategorized	\N	f	{}	97ffc5426606d20897999797dc1a0ece677e31f380d08df9966bf61ed4925f01	f	\N	\N
7bf031b9-b0ba-43c8-939e-c9d86e260667	2024-11-14	Amazon	103.88	Uncategorized	\N	f	{}	1707be3bf1a0dc313d0df317704713643dd90d88d5da7eba2c471acfd04e6129	f	\N	\N
9dc12878-0521-4874-830e-7109116239b4	2024-11-13	DEBIT-DC 8678 TST*ROGGENART - SA SAVAGE MD	41.69	Uncategorized	\N	f	{}	dec66dfd4cee59883b24b9d1702735f61deb85685595c5fb640b85da3695e265	f	\N	\N
5e05e23f-fa43-4bf9-bfb3-7667f4786036	2024-11-13	Amazon Kindle	12.71	Uncategorized	\N	f	{}	bdecd3380fd6952648c67b10fbca26601a6bc2d4570f72f8fc9f72d57058f9e2	f	\N	\N
91cd8898-c69d-450c-ba8f-37020949fc7a	2024-11-14	Amazon	10.59	Uncategorized	\N	f	{}	add301daabe5b6b2b9b949a1dafe80814bad2ac743fa1a6975481bb07d746ed9	f	\N	\N
c163a5a6-e841-4132-abd4-155b49318def	2024-11-14	Microsoft Deposit	-5169.10	Uncategorized	\N	f	{}	695f08295b10d38b4185c20a66d37cbad701ef2b34949d0eead67fe51ecb1d41	f	\N	\N
d004bef3-73fd-4597-a891-2f7b9554ac23	2024-11-13	Amazon Marketplace	-31.79	Uncategorized	\N	f	{}	d3b7e0196dc1b17b99047b3e87dac8983cf4839b159c1de92ff21147083f71dd	f	\N	\N
5e35cf17-1f8a-47bb-aeec-471153fe9a5f	2024-11-13	Amazon	59.37	Uncategorized	\N	f	{}	22475c98147a9c9564d34926234dba2ffbb0550e1a191f0637629562d7b9b696	f	\N	\N
cfaf0837-1e2e-49f2-8e7d-8c3554641031	2024-11-11	Naval Bagels	15.25	Uncategorized	\N	f	{}	03400ba0ae8de6d9cba24ef7aae0bd80ba900ab2a511aaba1e88b7c3c82f5aea	f	\N	\N
4dabbbb6-81de-487d-a1ff-e2864f32b1c3	2024-11-10	DEBIT-DC 4581 UMB PLAZA GARAGE BALTIMORE MD	8.00	Uncategorized	\N	f	{}	0d32a530cea60d70ce71dfbdf9c26a6857a465d1d266f4d60090a3f94370a4be	f	\N	\N
938643a9-1032-49df-a862-691311923b4f	2024-11-13	Reimbursements from Wex Health	-500.00	Uncategorized	\N	f	{}	6b870e1ca41cf2bb5f9db6f1bbd6b98a7963efae4e6fade8db889cbc879cf35b	f	\N	\N
32f800c4-79e0-4fec-91a0-f3b92f69ee24	2024-11-12	Payment to Verizon	89.99	Uncategorized	\N	f	{}	64240f70f6611c52bed1df5049b0187ec1349a611d7cbafc95dafddbf1dbdc8f	f	\N	\N
cf8df3fc-2ade-4e95-a978-91471b532910	2024-11-12	Wex Health	69.63	Uncategorized	\N	f	{}	94a24cb58a28f4d794a217068e4f1f1047cca17b8a7f50ccfdd687f981ae9778	f	\N	\N
5d1b50ca-c7ca-49f3-b62c-99f2b0264b9c	2024-11-12	Lowe's	30.00	Uncategorized	\N	f	{}	afd7b7a4612ef4547116fb8d7c8ff2678502b36941ae300f343c477584629872	f	\N	\N
7672827f-4d61-4d57-8433-d95230f36108	2024-11-11	DEBIT-DC 8678 VOLVO CARS ANNAPOL ANNAPOLIS MD	3000.00	Uncategorized	\N	f	{}	7ebbb284b85784d4a99942099015d171174a619d6b544e5a7fe8edfeb8cb1f0c	f	\N	\N
5c383ea8-7777-4f47-b0a4-6374cc4eb0bc	2024-11-08	The Tire Rack	887.92	Uncategorized	\N	f	{}	9357dd876fd3c0055379c1fc0834a5751c1d8d492a3b1ddf08a284bad83fba51	f	\N	\N
c8beb45c-09fe-40af-83b7-fba67d6e4f65	2024-11-10	Sam's Club	210.64	Uncategorized	\N	f	{}	07c0913f7420385be07edd99fb23630e0f89984839e6068475bcd2feaf8fcf05	f	\N	\N
206804ce-9950-47a2-9002-edf1598423ac	2024-11-08	DEBIT-DC 4581 MORNINGSTAR STORAG XX1626 MD	117.36	Uncategorized	\N	f	{}	32530aef8dfe0d4d037218319b4f35542783a73a8fe7c96c00a61b2ce51f2af6	f	\N	\N
69f7904d-044b-4bef-a206-231fae117725	2024-11-09	Giant Food	73.57	Uncategorized	\N	f	{}	14abcae0096c0037f5f0b0c8641b916f9027a308729cf071845442d925a36716	f	\N	\N
ab3bc067-48ca-4e6c-8acc-199a301ffbbb	2024-11-09	Giant Food	56.95	Uncategorized	\N	f	{}	18f73e9dbc668f03cc0c60ae66871435a2901fd6153dbc9e1741c2d6f07bab25	f	\N	\N
524a36d0-cc43-4705-8d1c-38baf1aae064	2024-11-11	Amazon	30.50	Uncategorized	\N	f	{}	c8c7fdf631b9eb92ccff2376bc552e495de9ae95e85cd1a85aecb844f1fd17e3	f	\N	\N
a006f528-4b89-42b6-8b19-215c5c830b3d	2024-11-08	Amazon	29.99	Uncategorized	\N	f	{}	0d02a7e93eee563853ab5808cf5b45a1283e4447e9cbb5f73b62a447826ce3e1	f	\N	\N
26ee2485-61d1-4cc6-9245-a7ff80510835	2024-11-09	DEBIT-DC 8678 SQ *ST. MICHAEL - BALTIMORE MD	20.00	Uncategorized	\N	f	{}	f189d3426d28a7627cc05770dcc20a13ba277341566bc2970a402d5c2be6dc1d	f	\N	\N
48efc412-4e96-4ea6-8b6c-7fa6cbd5b1f9	2024-11-08	Rise Up Coffee	19.19	Uncategorized	\N	f	{}	6f16a3471a88afb00cd78ef253a4866209c84e68c35cbe2d484c29d5cea2d956	f	\N	\N
a082e00f-11ed-4aa1-8aac-7e7446125638	2024-11-08	Rise Up Coffee	12.99	Uncategorized	\N	f	{}	72056ea28a057d204af7fb2205bbea81617e47543da8a674fbff180e25882330	f	\N	\N
9f2b3c93-41f6-4bd1-9fdf-6f0952d022c5	2024-11-09	DEBIT-DC 8678 SQ *ST. MICHAEL - BALTIMORE MD	10.00	Uncategorized	\N	f	{}	18712cecf6a179836ca0fc6dc1edf81915d350c1bacd84e2651d88c89496e3ed	f	\N	\N
22fd731f-b6fb-4f74-b43d-4a39c02bf5bc	2024-11-08	Chick-fil-A	6.24	Uncategorized	\N	f	{}	b87565a8da4a300e2739fbf59cbfc6470d86b65a7d700e2ba9de7a37456b30f6	f	\N	\N
50b96cf7-85c5-4a4b-b611-f7d098ccf3dc	2024-11-09	Giant Food	4.49	Uncategorized	\N	f	{}	e094953b61dfe06309ab87b68a61e5e349aaf9fc3e6c8ff7650bd6203930b3bc	f	\N	\N
393c8501-c52b-4a6b-8093-564811392859	2024-11-12	Transfer From Savings -0387	-1000.00	Uncategorized	\N	f	{}	3c03627f92269da9d330754882c8832b912435a605d3cf4f6ea4d85b00f619cb	f	\N	\N
70564d00-9df0-4833-9797-7dcd3b2d6844	2024-11-12	Transfer From Savings -3298	-600.00	Uncategorized	\N	f	{}	225fdd326bd2427ce37b84469edd23dd097a62ac19c7f8e6ee51e2e90bcfae6c	f	\N	\N
08525d63-68c7-4e85-b9df-6b6b08041e58	2024-11-08	Transfer To Checking -2298	900.00	Uncategorized	\N	f	{}	d1f25aa4381e85140fb206334d43bf491cdd0da8be192c27da2611ef44b0ba7e	f	\N	\N
5543f95a-af3d-4e1d-a506-0bd53ef797f2	2024-11-07	Amazon	38.14	Uncategorized	\N	f	{}	4a70410889a46192537a5015b8529834f6ac7f29187952059fd3a88a17e6a52d	f	\N	\N
7bbf20e4-2fd4-45db-8ebb-32af54ff41d5	2024-11-07	Giant Food	34.01	Uncategorized	\N	f	{}	83d6b9f6bc23f8dd814436581263297769e5b0d7a06c7d4d98eb41f23e672ca5	f	\N	\N
b6f7589b-dbfc-473a-9a45-ee123f679ce2	2024-11-06	Jersey Mike's Subs	17.95	Uncategorized	\N	f	{}	94b6e0e846f7efc629baf40888be86b01fb7360a91dbfdb2e9c3ac6187cdce07	f	\N	\N
bc5fc762-43b8-4408-a5e9-78d2b1f2f421	2024-11-07	Rise Up Coffee	12.72	Uncategorized	\N	f	{}	392c952c4cc7ea23913d32fbe97a24246b35bca53632be4216e7135ea621a9ad	f	\N	\N
4ed93d07-aa43-4950-8ae0-a7253b0dcdf0	2024-11-07	Rise Up Coffee	12.19	Uncategorized	\N	f	{}	9906b4ea139049e87c6ae68fe11f292c2644bea6bb626390eb67dc4b70e6d7ea	f	\N	\N
e02fd1fd-ec0d-4a74-8f9d-2909c9232433	2024-11-07	Rise Up Coffee	8.69	Uncategorized	\N	f	{}	329c061e5864341d7dfa97d2e5803c16ef622e5cf82a3a62089d5274790d62f8	f	\N	\N
777ff11c-7c27-4440-bd6d-921dae38cbe1	2024-11-07	Payment to Chase	11827.23	Uncategorized	\N	f	{}	05348f55fe8691757092d59fff1eb9eb4392de43b1a075c2f303bc8be2ee60ac	f	\N	\N
a166af7d-0d9a-438e-a07c-b0156f0d4718	2024-11-06	DEBIT-DC 8678 KOZY BEANS COFFEE CROFTON MD	13.41	Uncategorized	\N	f	{}	c370bfbef2a3f435373b587322e243f9e0e3e5d96351970b5f723a4f13f52d6a	f	\N	\N
900eb29f-4e58-401b-9e6f-aed1a596e670	2024-11-06	Elite Sfn	2.00	Uncategorized	\N	f	{}	87a011b6fdf571f80b7e79e6b5ab39cc51ec4e66cef7cd50a199be7043375688	f	\N	\N
9bc38219-6488-42bb-b0db-ce724735d2f8	2024-11-07	Deposit Henry M Jackson Payroll	-1751.27	Uncategorized	\N	f	{}	e7f0ddb2b1495b632376b94903795e1cf3f9914a71d6d446c36f34d84f493fa7	f	\N	\N
43b74d1b-8b4c-40e5-93f7-9441fff1e855	2024-11-04	DEBIT-DC 4581 OTF GAMBRILLS XX7925 MD	199.00	Uncategorized	\N	f	{}	3fbc8e88069a2c4115221072ba4bab03c46da915f97f7a61307d2fb47310df63	f	\N	\N
2174fc4c-da06-444f-96db-b881de853062	2024-11-06	The Grill	61.39	Uncategorized	\N	f	{}	a56edcb8119d52ff0f4ec0469304f57fd915898fc4f535f7132ac47d2507df44	f	\N	\N
5684466b-0392-47fa-9d22-87b1121669fb	2024-11-05	LA Fitness	35.99	Uncategorized	\N	f	{}	f08a5e3be6f0581f011bc1d9d0e03eb9d6922d1aed660c49b0efc2c49725de8e	f	\N	\N
c86e3c00-9c7f-4468-b6eb-b0234a1df567	2024-11-05	Sam's Club	28.10	Uncategorized	\N	f	{}	c0574b897e3c46977d5390a28a73093e8e791637a5ccd75263d2286ba08454cf	f	\N	\N
c415e0c7-66b6-4741-bfd9-e74868de0ba6	2024-11-04	DEBIT-DC 8678 TST*THE OLIVE TREE GLEN BURNIE MD	20.09	Uncategorized	\N	f	{}	530eba015c644ac4037a774f4357f4557b728d4e4c204291893dd3acb137cb0a	f	\N	\N
6bfc0310-1822-440f-a3e5-943786168986	2024-11-06	Discover Bank Deposit	-16860.23	Uncategorized	\N	f	{}	19aff4dff6999a2fe2578ddad8141629b9ccfbcb3884d3c2165cb7c30bdbcc2b	f	\N	\N
e6ccbddc-dacf-406c-8a05-87903462e92a	2024-11-05	Michaels	-13.98	Uncategorized	\N	f	{}	96a57a23f9e3545c3cbeac782f86e712c4aff42856c183cfc587b7435cca69af	f	\N	\N
01468ff6-81be-49c2-bfa0-4d9df2971bee	2024-11-04	Papa John's Pizza	44.76	Uncategorized	\N	f	{}	6cedddb953b27457da72e6313df084ecce8cd2a5d7013e1dfabba98226efbfb6	f	\N	\N
46a95982-2d68-40ee-9b1c-c45df1c36bd6	2024-11-04	Rise Up Coffee	21.00	Uncategorized	\N	f	{}	48c2ffe2ab0515ca2afeb4a8cfe015a74c8d97425ed5954bb719325f7d0b1d76	f	\N	\N
4e820db8-d1d7-4bec-9371-8ba00175fbb4	2024-11-05	Transfer From Checking -5873	-155.00	Uncategorized	\N	f	{}	bace0486709cfaf374d3ee371401674a00b6e049d3df00c04cad7b37fa8255a3	f	\N	\N
1f7776b0-69a2-4ad0-9415-055b68cb3fd4	2024-11-04	Jpmorgan Chase Bank	2107.66	Uncategorized	\N	f	{}	027a7c7a9434b14807e9fa15402610f8f6dcec90de2486b805ce8033f56914fd	f	\N	\N
cefccb24-82d8-4ceb-a894-3a48801e5336	2024-11-04	Transfer to Venmo	50.00	Uncategorized	\N	f	{}	593de7637fe6e599213e23ec05026721be98edf2abe77902ed7dc5f9e4024e30	f	\N	\N
b9c4582c-5e6e-4498-8a2d-907a532bc5da	2024-11-04	Tax Payment to Poppins Payroll	49.00	Uncategorized	\N	f	{}	5e2982479c847e6d9fc18d468dd85fe4c780cd5323adc92fe731a48b6b57ce95	f	\N	\N
f607bf1e-1657-44f2-8c50-c0556604f865	2024-11-02	Chipotle Mexican Grill	530.00	Uncategorized	\N	f	{}	eec4996bdcde0357a1048bffc7759a641b36b9a3e660ffaf2699aa2d629d4802	f	\N	\N
6157bb81-1058-4679-8b5c-6e5bf98a7d12	2024-10-31	Sam's Club	226.24	Uncategorized	\N	f	{}	57a174132a5e50c835ba27e675bd92ab7a86a539a7da50fe1d7f489e2fc385a4	f	\N	\N
1cab6cbb-b502-4407-9d91-7590167440fc	2024-11-03	Payment to AT&T	202.90	Uncategorized	\N	f	{}	a497ed1dab643c16716159159cb94a10e4314a5830d1248f0f46335b7a96019b	f	\N	\N
df6c4c92-82ba-4321-8b97-926f944f3765	2024-11-01	Wegmans	171.04	Uncategorized	\N	f	{}	b129b59e93bf54cbe7303de21c69f517e7f3179c175c2c786590552b2d17bef7	f	\N	\N
f6e209c9-2a4a-4944-a473-14b2ad859476	2024-10-31	Elite Sfn	155.00	Uncategorized	\N	f	{}	adfe44b10536de9b62e9b3955317c95a03b08dceb479a16391c3d457219048b6	f	\N	\N
78cb6ce4-850e-4afa-867c-5849a1c4e3bc	2024-11-03	Transfer to Zelle	100.00	Uncategorized	\N	f	{}	057bae2b9ee926c60964f7fe21ab4e13929b971d8e0c94dab285826fbfb9c41c	f	\N	\N
79fe89f4-ef63-4401-b058-7a8fdd973efa	2024-11-01	Staples	58.91	Uncategorized	\N	f	{}	a61d40727557f7cb98e9a03dd0633835442c02e312f23b571b96f7efcc97c118	f	\N	\N
94524366-03ed-4014-8bea-525bc80a9f5f	2024-11-01	Floyd's	58.77	Uncategorized	\N	f	{}	d7759eb8c1934860a80e4bd4e0f1a26e6e3660a38aa370020a6b88af1483d094	f	\N	\N
0d6239f5-73d6-40b4-a9f0-922843bcafc9	2024-11-03	Transfer to Zelle	50.00	Uncategorized	\N	f	{}	a4cf02b2e873f6f62c7360c6596be068f30d5fb73c5c10265a3e6f0236b12f61	f	\N	\N
969e5d36-f648-4128-9f8a-c39867889a3b	2024-11-01	Peloton Cycles	46.64	Uncategorized	\N	f	{}	d9e16cdf1dfba5e69db94a639220ec7bd0e8073df56dade776577fc2a94ab5ea	f	\N	\N
07938dfe-feab-486c-bcd7-ea4e1364b809	2024-11-03	DEBIT-DC 8678 SQ *VIGILANTE COFF COLLEGE PARK MD	36.25	Uncategorized	\N	f	{}	f3df405327dd1b74795b89712846c7b7ec01be524a300e060ed40f54e3150080	f	\N	\N
eefe99dd-2db1-4c22-8bee-8faf1f252baa	2024-11-02	Amazon	29.50	Uncategorized	\N	f	{}	3945886328942338e33ca2ebc0dc44765da40d023dc8ee69c635d9ac78bd28c8	f	\N	\N
cf9bdf21-95c0-4463-89f6-3fc470499f2d	2024-11-01	Amazon	24.36	Uncategorized	\N	f	{}	c2ef61f17cf783d4656f185b05fc298b30f26c332a246c419c8f233949e827ab	f	\N	\N
3d88e871-29dd-4f18-880c-739ab9c691ec	2024-11-02	Burger King	14.16	Uncategorized	\N	f	{}	07669ff5b0dab89be0c4f941ef11f8c1bc6e91a6f3b094d2fca93e37a5a65e01	f	\N	\N
ae5450e4-2b6e-41b9-8bc7-44420101b5ab	2024-11-01	Giant Food	11.07	Uncategorized	\N	f	{}	ce348a4c34a73e46372125f1e6e61b20fcb255dd15a454c00d1bd345a5ece9df	f	\N	\N
0b99acf4-0f92-4a25-8e23-a9353f197e7b	2024-11-03	DEBIT-DC 8678 SQ *VIGILANTE COFF COLLEGE PARK MD	10.54	Uncategorized	\N	f	{}	9cec66d97716cea23e3b4a4c817839a68717c6a4fa39c2de4006a21bc12f6f9b	f	\N	\N
5d8777fd-baa0-41ef-b070-6a53ccda4457	2024-11-01	Safeway	4.99	Uncategorized	\N	f	{}	7bed06cdb721344b9cb0bd1e6959ad0474272ac46e5213644ae2a8fbf42c91b2	f	\N	\N
6c097ca1-49ff-4586-b068-c8cc65da1836	2024-11-02	Chick-fil-A	3.56	Uncategorized	\N	f	{}	f964db02ad590582f430cdce4af712625ae7f103e158c024a7dd38ea990f0dac	f	\N	\N
95b1fdbb-47b7-4604-ba7f-41215538db9e	2024-11-01	Apple	2.49	Uncategorized	\N	f	{}	a3f54cb65380765a6b95be5091d3a6c23fe98ecee48b375168bc5f5b6137c607	f	\N	\N
dbbdbcd3-3909-4ab5-8ed2-cdc091fff6c9	2024-11-01	Walgreens	2.48	Uncategorized	\N	f	{}	b3c06a0626123654e286c14595f25fe2ff855116548d62766d4f30d5dd02ce53	f	\N	\N
7034df03-1b63-401d-979a-642c4bea77c7	2024-11-01	Payment to Discover Bank	1173.88	Uncategorized	\N	f	{}	03450e964f5d6e2be5a6cebc2c4453396373ceb6e514de3e54dd1cce4563bcf3	f	\N	\N
6842464f-c88e-48cb-952d-585fd6bf5dd7	2024-11-01	Payment to Chase	400.00	Uncategorized	\N	f	{}	56dbd01756a0b70bcf4c0deff31b4f56fa83489a8d9cb7b894abef8213d4706a	f	\N	\N
a918bb79-ef86-4dc9-b264-a10d11beebc3	2024-11-01	Payment to Apple Card	241.20	Uncategorized	\N	f	{}	7efd24b8d1f93cf76d4843f9fe2a4512bef7960abccf067715a5be82533d8a31	f	\N	\N
162e5e84-aa06-40f8-8b47-2c83917c4e4c	2024-11-01	Payment to Chase	125.00	Uncategorized	\N	f	{}	e22eec58a1f6be93045922a163593540f8986f8292edc6f12e77b0cd014c4429	f	\N	\N
a9130917-73f9-4fa2-9106-591cd308508f	2024-10-31	Amazon	47.69	Uncategorized	\N	f	{}	07b1ecf258c764748f041dfe9bdcd0c089b93d7a94d245e15cba04cf50435edd	f	\N	\N
efe9b7fe-2d61-4c14-b03e-276ddff561ab	2024-10-31	Walgreens	30.53	Uncategorized	\N	f	{}	29887183de81ea361479ed8b51fa95ce420931060c5978e250dbc9bd7f6c4cdb	f	\N	\N
4170612a-281c-43b0-8bf8-31c296d2d27d	2024-10-31	Michaels	28.19	Uncategorized	\N	f	{}	7eca154fb912b2f45103812619da408e7013fb57c649e8e9e20ddccd13536072	f	\N	\N
a8b485bf-b9a1-480b-8806-0e57734842f9	2024-10-31	Michaels	21.09	Uncategorized	\N	f	{}	8370b56501c042f7be0767fa6ebb2dc49efc088958d03cea7cd500c43722a90e	f	\N	\N
39def364-a517-4c85-b91c-064eb9cf9ec0	2024-10-31	Michaels	17.89	Uncategorized	\N	f	{}	0ca91f41d387cac2da7662fc5b5e3d1bd5c17b4ad94bc78961b4dbd4c29e0c85	f	\N	\N
082a12c2-7c19-463f-b3e4-d2b0ec99cfa4	2024-10-31	DEBIT-DC 4581 UEP*FORTUNE COOKY GLEN BURNIE MD	16.17	Uncategorized	\N	f	{}	f7d6ab48b5e0d09564a95e8b6b8b98e22481404df40738bc476b6ee04efb62ce	f	\N	\N
5c48caba-7684-4274-a29f-a9ea5135a911	2024-10-31	Michaels	14.83	Uncategorized	\N	f	{}	9e515edb59b4d3efa9852a574fa6d0672bb23a88fb6ef9c30ff419d9939ae02e	f	\N	\N
baf68af5-47ae-483b-ac1c-b1e722bc6cc1	2024-10-31	Amazon	9.53	Uncategorized	\N	f	{}	0572f173dbd33994046273819c583c70b787d1c8ad4e9012a8e4561e2fd182e9	f	\N	\N
6f1c1aba-6754-4eed-8f6f-e92c34a57c9e	2024-10-31	Rise Up Coffee	6.57	Uncategorized	\N	f	{}	2730cdbf9dfe0bf8488185b6e53a182a1392d98935af460f4a326e2269296798	f	\N	\N
cc125876-0503-4be6-85b6-114ec3999e63	2024-10-31	Michaels	2.89	Uncategorized	\N	f	{}	c09117e5b1727be8751a313a7eb2169f777a629da64de07403fb7d9a093ea0ce	f	\N	\N
20d53b3c-ae61-4b2b-9001-905a817b7748	2024-10-31	Walgreens	2.53	Uncategorized	\N	f	{}	3530df28e2c9c16bf9958835485a300846a6bc5a7aa54b9b7f4a5aa7a92af3c0	f	\N	\N
8ba480ef-20ad-43ab-a30e-f216b95a5d20	2024-11-01	Cash Withdrawal	400.00	Uncategorized	\N	f	{}	ca55a54722f0df5e7b7ee1cceaebc8b38440c0797018d1329fd58a2bad5c4195	f	\N	\N
37971c55-a5ab-4b05-9d08-7b01df97678b	2024-10-31	Interest Income	-0.67	Uncategorized	\N	f	{}	79b7ebc7145b784ece396d8de7fde8b787877445a83ab03ac44c7a66eca08f46	f	\N	\N
00b63ed1-4b61-4906-9413-c01085575915	2024-10-31	Payment to Baltimore Gas and Electric Company	266.00	Uncategorized	\N	f	{}	1da13cbfac2bdf404f18ec6bc2388f5b3fb07fecfb8eece7047ba95b96423bf4	f	\N	\N
c7354ef7-3147-4f6f-b757-3df22c3706dd	2024-10-31	Transfer To Savings -0387	1500.00	Uncategorized	\N	f	{}	773d6cc1971bed9558637e41e7fe80b85373c32495fc041007ca93d6b4ff386d	f	\N	\N
b548a09e-6180-44ee-b0f2-61f37bf57d20	2024-10-31	Transfer To Credit Card -7148	525.00	Uncategorized	\N	f	{}	232c10df72723745e02c07492e29e64831b25e8aca8dcdd397a667b87fb14632	f	\N	\N
a95a647c-1fdf-43d4-9e02-c2f579111356	2024-10-31	Transfer To Savings -3298	428.20	Uncategorized	\N	f	{}	78d0635f5e7254d8648c9fe8d486776299fa57567983744ba0f47d3e56df4436	f	\N	\N
94d1bdde-24f2-470c-aab9-81cde8a9fcec	2024-10-31	Transfer To Checking -2740	250.00	Uncategorized	\N	f	{}	901cdc9ff73d7f96d1c7b844db6383ba2e5f678761701a4d5db4588818b87643	f	\N	\N
2510e067-c1b0-40ce-9763-3268416d38ad	2024-10-30	Sam's Club	36.90	Uncategorized	\N	f	{}	01bc8bf8fc329ac810531d1e5b77c727c1a8c825ddb00fc898db094f5b0f3c8d	f	\N	\N
638abff2-c3ed-4771-bf72-15368247befb	2024-10-30	DEBIT-DC 8678 GOFANTIX* LANSDOWN GOFAN.CO GA	7.00	Uncategorized	\N	f	{}	aa06570d691feb142a5791910350b483432404befdc5a7b2894abe43b7c21f36	f	\N	\N
017e56bf-7960-481d-b11e-85c7590421a9	2024-10-31	ACH Debit - Claudaya Hood Be	1000.00	Uncategorized	\N	f	{}	9f7c35fd3cc0f7985fc542cae70f49b952f554f7d84c918fac5afc74341fc1cc	f	\N	\N
d5da6e79-73ba-4e91-b692-e6c39e67d148	2024-10-30	Michaels	-35.13	Uncategorized	\N	f	{}	3df0b3a551a40e3998811cb178ec4864d609e19cf65df0aae2b901a79f6c3d63	f	\N	\N
0861c228-2674-4e41-be39-d8e899d0113a	2024-10-29	Amazon	324.22	Uncategorized	\N	f	{}	0452927b9131e90cd335029f1564cbab5f1d7416e47dce9e3fc183a35fb40903	f	\N	\N
5b223f08-c98b-4e34-b15d-1b4e6efe573d	2024-10-29	Sam's Club	30.85	Uncategorized	\N	f	{}	83687b08fa4a49ef02c885713df02e227b1f66ed9ee55306c381912883d58c73	f	\N	\N
0a4f3039-32c7-4fc5-a15a-132d0155315b	2024-10-29	Rangoli Restaurant	29.67	Uncategorized	\N	f	{}	c8d457b25c41b1a82380f61dd5d438fe1878f97fbba651494244b2e53e704d83	f	\N	\N
d682ef75-9bdb-4cfa-a344-0bcfd682ee36	2024-10-29	DEBIT-DC 4581 OTF GAMBRILLS XX7925 MD	14.00	Uncategorized	\N	f	{}	cd205468c960276b5d4c3e7ae893d45a1761c074810469e10d077ae41f751dd4	f	\N	\N
fc9dafb2-3078-4819-9161-77cfbb43072e	2024-10-28	Chick-fil-A	10.38	Uncategorized	\N	f	{}	c1ccf1bc79a13f632772812aed061c88c93e568ca4b6fb2c192e584e048bd6d8	f	\N	\N
5f4c6368-4136-4662-9bcc-98b83a16b941	2024-10-30	Microsoft Deposit	-12089.65	Uncategorized	\N	f	{}	05fe9811c7d785e7816b42aa96295778d4a01d35dbe04414a0da58f01378ce18	f	\N	\N
c477a3cf-a02e-45f6-9c3c-f4e539bbc955	2024-10-29	Tax Payment to Poppins Payroll	188.37	Uncategorized	\N	f	{}	414ca0ba55d3d76e9ebddf033ba60c27b889b12d2c063b74241690fbcfa464e8	f	\N	\N
a4703e12-13f4-468f-be70-6d903cde3034	2024-10-29	Payment to Citizens Bank	88.12	Uncategorized	\N	f	{}	aa8051716abe1b5ce64ff8e82f34c7d43daa24bea974e4a819dc83dcf5a1eecd	f	\N	\N
467e3cee-e5af-4044-94b5-d746afe5c997	2024-10-28	Amazon	40.02	Uncategorized	\N	f	{}	c52efa7b25a4cc742bd599afecca0f9f1e89835d376493ee73ca6b60cdb62fe9	f	\N	\N
96ae808c-5a8e-4c8d-836d-cc6e021e83e8	2024-10-28	Target	31.90	Uncategorized	\N	f	{}	471cf92edec089a1ad26f7674c28b8d000687040f2d829c17fbc2de3f2011aa1	f	\N	\N
8868d15d-ef92-4b11-8daf-21c44db99d16	2024-10-28	Amazon	24.79	Uncategorized	\N	f	{}	84bc0a3c962fd39e24beae282f20092322ce3ffc5ccee52df5ba33275f40897a	f	\N	\N
9cef33e7-3707-4095-a1cc-179b746318b8	2024-10-28	Target	21.20	Uncategorized	\N	f	{}	617908324b7540f93fe4d61aa046986e83b8caa26ebfde0e14b48e2d331f3df4	f	\N	\N
9daf417e-f8bf-41bb-9314-1085aea59855	2024-10-28	Popeyes Louisiana Kitchen	14.76	Uncategorized	\N	f	{}	c575a1ed4244fd17ac970ebd233c0371bc354d2a97d91890c04679e256af1ff5	f	\N	\N
10f4ad92-fb8f-4556-9f30-8aab45f3af30	2024-10-29	Transfer From Savings -0387	-400.00	Uncategorized	\N	f	{}	b6989a0a919ac9a289de69423442e56747a37a48b1f384a8a5eee665abe722c9	f	\N	\N
248aa833-5c97-4c35-9b55-8ad360810027	2024-10-28	Payment to Best Egg	537.47	Uncategorized	\N	f	{}	f93dcae6853cc81a5fe5f99786a234946e86cec2a47b8a88f2e5e8fd70af1aa2	f	\N	\N
96e03d3d-1ff3-4bcd-b900-bc26f5b72363	2024-09-23	Elite Sfn	2.00	Uncategorized	\N	f	{}	6141761e257ce9adffb26440b333d8fe8c8abecfb6c69041486f07a8fe4a5c44	f	\N	\N
32235df4-fa69-4e3e-bfa0-41659ab4e427	2024-10-26	DEBIT-DC 4581 SQ *EARLS TYSONS C MCLEAN VA	197.16	Uncategorized	\N	f	{}	77d4407b8f6361a70dcf64fbf546bbe5ab6919ec9ed1cd0e5bef9a2179bc30a8	f	\N	\N
3fbf6c1c-3605-49e7-9c44-a579174237a6	2024-10-27	Giant Food	64.47	Uncategorized	\N	f	{}	883f63a017ba512632e96543e84acbd5fe3b465cc80fdbbbd043870aac010be4	f	\N	\N
839af0b7-93c3-4d6d-ab12-cfa33d717ca4	2024-10-25	Target	50.73	Uncategorized	\N	f	{}	b5365b56aa499114ed059e210a121651d607a6a70bb4ed1da373dca6ff8fdd65	f	\N	\N
9b4e5bc5-af4e-4ed5-8dd6-c59bfaa6475b	2024-10-25	Papa John's Pizza	33.99	Uncategorized	\N	f	{}	b4c229356c60b3c8061d3e1429645a1715012b1ca78d4e5424271f1b1a6c926e	f	\N	\N
7d97b0fe-feb1-4758-907c-462950d9de29	2024-10-26	Amazon	27.55	Uncategorized	\N	f	{}	6352d58eb0ac5a115feef80772b163340381e20786f3cc9077fa9bc0ea0f5912	f	\N	\N
4a309ccd-02ce-4943-a09b-f02ed852ae06	2024-10-26	Target	25.68	Uncategorized	\N	f	{}	d4cbe3bae4eb93e3f2cbfe04495ecf54036efce98f523402f56f48cacee7a32f	f	\N	\N
866878bb-5068-4855-a4cb-84e9ccbad7a4	2024-10-27	Chipotle Mexican Grill	23.75	Uncategorized	\N	f	{}	a247941fb0133e2516173f89deb83a6aeb4e496a7663a31dc89e267f0a5c8c62	f	\N	\N
95b3c700-5605-47e5-95be-ca2a61b3932d	2024-10-26	DEBIT-DC 4581 TYSONS TOWER ROSWELL GA	10.00	Uncategorized	\N	f	{}	c2e354e4ef64d4c2b68deb04f9712bde603ba25fb84c46897fb978a71de6d459	f	\N	\N
3ab9abc4-7a9a-4371-a062-9db6ccd820c2	2024-10-26	ATM Withdrawal Plus PXX5083 Hanover MD US	100.49	Uncategorized	\N	f	{}	54aae9d19e2dcbce51a767e2a62e90c4b921b3ac0a5f185e0c9cd778c2e22d95	f	\N	\N
3231297b-de78-4a78-8717-647da95becbe	2024-10-26	ATM Fee - Withdrawal	1.00	Uncategorized	\N	f	{}	8fa6ade70cacd21f2f6e3b1c0d54c3068e167a8e675e4e8c19c18140a6ca6e9b	f	\N	\N
a8ff95c0-f79a-4dc2-aa4d-a170d4ac372f	2024-10-24	Transfer to Apple Cash	380.00	Uncategorized	\N	f	{}	33ce3121973fe983981e82dcb588154412cb45b3a408b27dba6239b69f13fa02	f	\N	\N
d99d0f58-9451-45dd-a2f6-d636cf3bd409	2024-10-25	Transfer to Zelle	75.00	Uncategorized	\N	f	{}	cb24637d585e281e3d08954ec30bb55adbafd172a24e6f236b1a6990cf279a6a	f	\N	\N
2d8dac21-a785-4af0-8d46-d4c961e0f5ff	2024-10-23	Parking Authority of Baltimore City	1.73	Uncategorized	\N	f	{}	acce088e68df24060ee32207a12c12bafdbaa61d8d4a081c12057c8983b6f340	f	\N	\N
6d32ed41-4b04-4262-af0e-d91cc5e60ab3	2024-10-23	Target	46.55	Uncategorized	\N	f	{}	6c44d4afa2230f6188f9f584f7be8e5cfc297413d224693630817934cac6121b	f	\N	\N
27b00f5b-a98d-41da-ba2a-7723d3554971	2024-10-23	Sam's Club	37.20	Uncategorized	\N	f	{}	bb3f668da7634008712edebb48f2e99e7738315e96dbb08b6395090c6d1c0621	f	\N	\N
6c7f0d83-9265-41d6-a45a-6b5c694e1e1e	2024-10-23	Giant Food	15.57	Uncategorized	\N	f	{}	9c6eb76289d7520e05a1b3adb834660704413b8e16afcadf009d340d13f681dc	f	\N	\N
b3e08c4e-dffa-4265-9e46-8eccdca48350	2024-10-23	DEBIT-DC 4581 OTF GAMBRILLS XX7925 MD	15.00	Uncategorized	\N	f	{}	558296779174f4aeabede09fd45008f11ed81177d1b4e1226bc43e7a90a6e007	f	\N	\N
28501117-399c-4e95-bc9a-fcc078b9470f	2024-10-24	Returned Item Fee Check# XX0001	29.00	Uncategorized	\N	f	{}	af36c540a3a0d4f937a5eb379b55313cc7e86665f9690ef0fd2b63451e1a1a95	f	\N	\N
eb323fc4-218c-42c9-9e82-9d7fc668d9a4	2024-10-24	Deposit Henry M Jackson Payroll	-1751.25	Uncategorized	\N	f	{}	96a6c6af356740c3800264834f666c815c3efd998dfe6a34435efcc1a5bef04b	f	\N	\N
dfa9286d-7917-4422-89b0-f0c2a4af1711	2024-10-23	Payment to Liberty Mutual	202.86	Uncategorized	\N	f	{}	ef0bb4c800ae7cc66f3c041b0025285c66b0d634b5fd48828f9cd88e62408fb7	f	\N	\N
aed07809-2a97-4ad3-9648-ec760aca3ab3	2024-10-22	DEBIT-DC XX0419 CAVA WAUGH C MCKINNEY GAMB MD	15.48	Uncategorized	\N	f	{}	3e1b52731dc9dae3021e4bd2fa0875b07cb4c6161bc1a8bb1e75239b96e8772e	f	\N	\N
353baa3a-21a1-46dc-bf12-3286107975e1	2024-10-22	Netflix	7.41	Uncategorized	\N	f	{}	c6faf6a1271cbe14b53a229f32aa1eabfdf3e88770e62f0646ea86f9c79ddd3f	f	\N	\N
61dbc1d6-ffda-41bd-b2a8-014fef6d4d34	2024-10-22	FedEx	1.37	Uncategorized	\N	f	{}	f6cc5c33f9cfde2413aa402a79cde5664da030a0ad88aa68703ed6fea449b643	f	\N	\N
84436af0-2e8b-4638-8277-3f529bd7b864	2024-10-23	Transfer From Savings -0387	-500.00	Uncategorized	\N	f	{}	a457bfbabaaf36a99781a4a11e25b8344b5cfcea68017ff4dff183559df3652c	f	\N	\N
40e1fa77-73da-4356-85b9-9324e05f37b6	2024-10-23	Transfer From Savings	-36.90	Uncategorized	\N	f	{}	0d65a55add5c1fc10cc330c5e0d21ec43ffe4fc242063b445029429109852155	f	\N	\N
9564a77e-22c5-4d63-a71c-655ad8acd47f	2024-10-21	DEBIT-DC 8678 EB *A PALETTE OF E XX-7200 CA	34.95	Uncategorized	\N	f	{}	ad0fada627f4cf108aa76c019b078ee9cace198f7e82cfa34e6f39208930478c	f	\N	\N
18277618-3e3e-4acd-93bb-c963da018703	2024-10-21	Sam's Club	16.25	Uncategorized	\N	f	{}	3f7569b8049513cbd4b09b193656eca759644fa5068936bf5ecdc955813aedcf	f	\N	\N
88305932-f928-45d5-8feb-40bb7d4fd98f	2024-10-07	Orangetheory Fitness	199.00	Uncategorized	\N	f	{}	6080f51e3ad3df48eec754f938f5b157e81a179126791ec49e73ed971604a695	f	\N	\N
3a7ca32f-8858-4517-ac88-5aeaf82049f9	2024-10-07	Lovevery	84.80	Uncategorized	\N	f	{}	e40d9eb0d29fac389f504dc3a00d34530c40a94b40271682f2864ba22cc5ed09	f	\N	\N
154781fe-4e6a-4613-856e-4601ec462d14	2024-10-07	LA Fitness	35.99	Uncategorized	\N	f	{}	8b2279612770077d05d6ec02d69620d5ef484ff505d50a55dee27099b137698b	f	\N	\N
2a3a9e9c-ea44-40a3-89d3-505768a5d164	2024-10-07	McDonald's	9.54	Uncategorized	\N	f	{}	adde361b1878643d0197be5e82dd6f6706504538d8dd6a63b1e3ac50fd072b22	f	\N	\N
78fd3ee4-09e0-4a83-ad80-a149cec95619	2024-10-07	POS Debit - Visa Check Card 8678 - REJUVINATIONS PASADENA MD CLAUDAYA C STEPHAN POS TRANSACTION	250.00	Uncategorized	\N	f	{}	6b993cf353da814d4c488a625b6cc851aefaeb079a71916ce60149536d5a7d5c	f	\N	\N
47aa8d49-f21e-4866-ad7f-d024f0d3ab12	2024-10-05	Transfer from Shares TFR FR OTHER	-250.00	Uncategorized	\N	f	{}	0cd924a5472c96cdfae2eb7af1020a8f2267b27180d4e504e79940d89a01be5c	f	\N	\N
529212c4-3cb8-448d-bbd2-3e4bf0660f1c	2024-10-07	ALDI	86.57	Uncategorized	\N	f	{}	bebfdd53148996e93c5554140ccb2ae111aa265e80981363357adb8b28f65489	f	\N	\N
76141e16-3217-4e1a-8284-2dab37e149b7	2024-10-07	Sheetz	9.48	Uncategorized	\N	f	{}	9a30906f41992a10aaaa5ce1dc1f0911a0fcdb275bcc47ea58c9aef23aba90c8	f	\N	\N
68ade553-d2e1-487b-82ee-877031cfae22	2024-10-07	Sheetz	39.94	Uncategorized	\N	f	{}	99fd5a3fc2f533d121499159cdf6102bac912642876d0b220008237f21edf387	f	\N	\N
3585209c-19b9-4c31-ad47-7a3937f6060f	2024-10-03	International Transaction fee MinistryofExternal Mumbai IN INTL TRANSACTION FEE	0.41	Uncategorized	\N	f	{}	7cede58df608126f44fa7d0f2db551fdaa3531ecfb1577c1edf5f1b51478b2cf	f	\N	\N
475be6ed-8163-4c77-81fe-375aa0d10ffb	2024-10-04	- Visa Check Card XX81 - MINISTRYOFEXTERNAL MUMBAI CHARLES R STEPHAN TRANSACTION	41.00	Uncategorized	\N	f	{}	e8e7f094b234bd822d3ae19a700d8cbbc75d762c4002f8e3774ed9b05c56010b	f	\N	\N
e998cfb2-4bde-432b-afab-2d9f7afe64e2	2024-10-04	Payment to AT&T	201.55	Uncategorized	\N	f	{}	459cf5a7c1e0edde9cf6071666280a27a8bd8125063afd27cc6a059bc71f17ca	f	\N	\N
8726ec7c-dc3c-461e-8e39-e03b592fd708	2024-10-03	Giant Food	22.41	Uncategorized	\N	f	{}	9c01f95f142cd1b9e80a6809459dba19952780ce1389cdfcd971ab0732d7765c	f	\N	\N
6cbb0a5f-628b-4aeb-ad15-81e7413240d8	2024-10-03	- Visa Check Card XX78 - SOUTHWES CLAUDAYA C STEPHAN TRANSACTION	11.20	Uncategorized	\N	f	{}	32c971c3ffe41099a72a0badc94f547fa3039e4b2dadd549454ed8b7bd033e7e	f	\N	\N
ccc5ed35-e5ee-4a34-a362-98a961ea0d79	2024-10-03	Jpmorgan Chase Bank	2107.66	Uncategorized	\N	f	{}	112b2c772f2b655f3fa1675a18e778bdd4f58d921dc1d3186b77001019addff1	f	\N	\N
c57bf229-c13d-46a0-9437-1beb593d2b26	2024-10-02	Elite Sfn	155.00	Uncategorized	\N	f	{}	48bfe55424972b4f4c7180af21839581893645e6259976eee184aaa47a3716df	f	\N	\N
f40aa68c-9f79-485f-820d-b0bf876dd122	2024-10-02	- Visa Check Card XX81 - SP GAMESANDSTUFF C XX4581 CHARLES R STEPHAN TRANSACTION	21.18	Uncategorized	\N	f	{}	155a2c46e4a50920c8bdb36b272848df2ada3c4f4b6c1a6dadf052f1169c8150	f	\N	\N
c688ba4c-7ce6-4192-b57f-ca06345f5413	2024-10-02	Peloton Cycles	46.64	Uncategorized	\N	f	{}	65828235aa84f02b5802de51552a372875531226b35bf5886e88cdb0adb29304	f	\N	\N
561289a6-31cf-4e48-9710-2a55ec2b762b	2024-09-09	Bruster's Ice Cream, Inc	15.34	Uncategorized	\N	f	{}	e6e5a37754b8b41ccc7d567ac177630de960bbeff708b2729bf4187a337faa9e	f	\N	\N
fcffe6f8-7aba-4cfa-a8cc-a645595368ee	2024-10-02	- Visa Check Card XX78 - AMAZON MKTPL DB6UA AMZN COM B CLAUDAYA C STEPHAN TRANSACTION	9.21	Uncategorized	\N	f	{}	25ba42efadb173d8247038df64517f495c8c8807de4c15690e9f2d49a340badc	f	\N	\N
698ee24e-42c6-40d1-9654-d1eef1335644	2024-10-02	Apple	2.49	Uncategorized	\N	f	{}	ab959b0e15f3f6f922b3f2e20135ebc80a6017ce1a86121a568ac3914c5f2c4b	f	\N	\N
14c6ef8d-3066-4d28-b819-0af36bc85a08	2024-10-02	Amazon	84.79	Uncategorized	\N	f	{}	163ab0dc08db52af382c4896aff7bf90f8bf4e7523e379e0ac1d8f3005d78002	f	\N	\N
cdec6e1f-7cf5-4504-a97d-d623fd460f5a	2024-10-02	Anne Arundel County Board	161.36	Uncategorized	\N	f	{}	49d386e7af106e2eaf1a0c76afc9b1da4532de62998239162b53ffed5a1ae4c3	f	\N	\N
b29f8030-0361-4f6a-ac86-1ecb46578806	2024-10-02	Transfer to Checking TRF TO OTHER	100.00	Uncategorized	\N	f	{}	80d681aa2bca958f7f3c9012199725a57229a677c059f7b9b53970cb18fd258a	f	\N	\N
07ff0cdb-1d25-43e6-88b9-f3b0ccba404b	2024-10-02	Transfer to Checking TRF TO OTHER	80.00	Uncategorized	\N	f	{}	dce909e259d9298982518fadd7ae6ff0415347adbac174f4e3c74077107effe7	f	\N	\N
17cf6028-5dac-47c8-9005-d05cd8c25b1a	2024-10-02	Transfer to Shares TRF TO OTHER	200.00	Uncategorized	\N	f	{}	1770c23405cbfd161d6cff61c295a9a51b571d38e34fe580c327f30564e0129f	f	\N	\N
c729f887-c16b-40e7-abfd-15bc93a96c2b	2024-10-01	Rise Up Coffee	6.03	Uncategorized	\N	f	{}	98a50a86df37c5b3cafe2d9945fa45cba4df1a3bbaefee64cc3d6f933213ecbf	f	\N	\N
c5ed0f6a-2073-4f29-b7ff-aa6efb39bebe	2024-10-01	Payment to Baltimore Gas and Electric Company	266.00	Uncategorized	\N	f	{}	bcc4b8f73f0cf59fca9ebb8f1a89054aabe7b5528589a91d05207c7fa6c1ed8e	f	\N	\N
4b10cfb6-9aba-4afd-becc-3db535bf5dc9	2024-10-01	Giant Food	99.17	Uncategorized	\N	f	{}	476b8dce869460ed936980c1f8510405ce90bb0325b37428fc4a0d4bc7d47d79	f	\N	\N
16f3cc00-1b96-4f01-9c95-b40512d38410	2024-10-01	Dunkin' Donuts	1.49	Uncategorized	\N	f	{}	9bc7887b33577a068f593ed4418437e8cf59a462782df56a8843a2fa4a61731b	f	\N	\N
b8fe71e2-c6d9-4f37-a2a5-8b60a8ace717	2024-10-01	Payment to Apple Card	1000.00	Uncategorized	\N	f	{}	b7b2659265ebb5830ac97e5671cc2794d8871dfc02d02ccba7530018fecb72db	f	\N	\N
cb2dd1f2-6a37-4a51-bd3b-ac67a7aa7641	2024-10-01	Payment to Chase	175.00	Uncategorized	\N	f	{}	40018d56791895a7bd75ae78d1b86a3900758ddd6e156d29a7aabfb3b36266a3	f	\N	\N
7b7c926e-4162-45ce-afe2-518c3ac56969	2024-10-01	Sheetz	28.85	Uncategorized	\N	f	{}	fb23f66896e61e9e536565331f6df219f6eb4d4642bd2ff1a6256f08e9938975	f	\N	\N
bf954399-0c1b-4a2b-b473-2c55cfd109b1	2024-09-30	- Visa Check Card XX78 - BATH WATER BREWPUB BERKELEY S CLAUDAYA C STEPHAN TRANSACTION	117.36	Uncategorized	\N	f	{}	4756c98418bebad180ea985e853b44a50b5429d4b4ce2188d36bd7859147f084	f	\N	\N
b45563ce-e488-4f94-806d-b4e3486e6bac	2024-09-30	- Visa Check Card XX78 - CHARLOTTES CAFE BERKELEY SPRI CLAUDAYA C STEPHAN TRANSACTION	64.40	Uncategorized	\N	f	{}	bff2685640ea8ed95d43dba0ef3b36810540e822b553856f3f0fe1f58dd49f43	f	\N	\N
c1579063-1361-4ae1-8b3f-ef09367f9ace	2024-09-30	Ace Hardware	186.45	Uncategorized	\N	f	{}	68dc6b514532d4f9276c6a49372f89b932d6d7ceb62e059f146c2ea4d7b368aa	f	\N	\N
b6525ae9-f0de-4f0a-9d41-98759410a413	2024-09-30	POS Debit - Visa Check Card 8678 - SQ IRIDESCENT JEL BERKELEY S CLAUDAYA C STEPHAN POS TRANSACTION	43.46	Uncategorized	\N	f	{}	fc98425d8bc8feb448bf82147c063e87b9ad0bb3586eece00d5f53eec3fb5e51	f	\N	\N
de6a6214-aa13-4a6e-9070-afc613297d40	2024-09-30	POS Debit - Visa Check Card 4581 - SQ IRIDESCENT JEL BERKELEY S CHARLES R STEPHAN POS TRANSACTION	1.06	Uncategorized	\N	f	{}	36babcb5d379cf02e19c0ab876f1e686f41c1d949fd96decc9ec7f2fa5842c45	f	\N	\N
dde4f696-8377-4ce4-a637-a6d8364a7d22	2024-09-30	Athleta	27.83	Uncategorized	\N	f	{}	dc84cb4177d69946973212e8caaf670c509b9da6ba4ce28b575233c3f7ee600f	f	\N	\N
011a303a-8607-413f-9689-e1e0eeacbf66	2024-09-30	Athleta	55.63	Uncategorized	\N	f	{}	9c34bb0f2bc44175d8d16cc041e83304ba1289e5f8bd03a9f3d0ff3048d7719c	f	\N	\N
66011eec-022a-4f35-b03b-43f42f0f447d	2024-09-30	Athleta	62.54	Uncategorized	\N	f	{}	347322f9720674c0c7b09b8be7d17477b429a28c82b602b4ededd367eb294888	f	\N	\N
971413ea-b45f-4ff2-9075-c6197265e940	2024-09-30	McDonald's	11.72	Uncategorized	\N	f	{}	713c28c2d61480a93b813efdf069cc9ae0dcfad958baa6a0211550e1a1725495	f	\N	\N
67f33b76-7903-49f1-941b-e5259008601b	2024-09-30	Food Lion	93.18	Uncategorized	\N	f	{}	49552c690fa281f12e3ab53fd7b5873de273bad18a75450b215a893d3b713b0f	f	\N	\N
ac04405d-b7ec-41d9-bbc3-29f1ff7d6df1	2024-09-30	Transfer to Shares TRF TO OTHER	241.28	Uncategorized	\N	f	{}	16984eb6b8292e3fff6b64a88de7441b5a89e2577f9965962ff2a4a042dcc9ef	f	\N	\N
4f5c6320-409a-442a-a5d8-c798aee165d8	2024-09-30	- CITIZENS PAY LINE OF CR XX7148	88.12	Uncategorized	\N	f	{}	be99dde86a7c96e237262cc9a8ccda68ffdd22a028679b3474805addfd80f203	f	\N	\N
8e17decb-ffd3-490b-a8e5-45fbf1bedd6f	2024-09-30	Dividend (GT20)DIVIDEND	-1.47	Uncategorized	\N	f	{}	9afd6184da8dbfc4d1694c472a64b41c533e7182947e708673107b8372ca4dba	f	\N	\N
0dbea51b-1310-488b-981c-0ab4723529e3	2024-09-30	Transfer to Credit Card TRF TO OTHER	525.00	Uncategorized	\N	f	{}	fa52bca760ab1cf8e81072194cb8ce5da18f3789ae76a027101e1052b4cefb10	f	\N	\N
3f0e8752-2f57-4547-8448-abc72609ccd0	2024-09-30	Food Lion	126.46	Uncategorized	\N	f	{}	6fc9cb8dfdc095d9f39fe4575df463a404a72c17588d141ca5447765d4c48450	f	\N	\N
79fb16c4-7509-4367-8cdc-d67affd1205d	2024-09-27	Pizza Boli's	16.69	Uncategorized	\N	f	{}	bbe1817a92d6a26a09ce6b8a65881a7d1e7563dd63f89c145fa2ae95ae0dfb20	f	\N	\N
339bb8f6-282d-4e26-a59c-880d4bb87ba4	2024-09-27	Sam's Club	29.85	Uncategorized	\N	f	{}	7b1fdd8f8596fd8984807521865d4fb481100e0b77b7b4c185f0fcdec36abdfa	f	\N	\N
35d86dbd-6732-4ac8-9ca1-90f008338ad8	2024-09-27	Microsoft Office Deposit	-5228.43	Uncategorized	\N	f	{}	79dd4f19b4043f98df4251813684b7382d3bdaaba31104c8ca323f97f7590182	f	\N	\N
4294009e-59a3-4fed-90d9-a7ea542e9ef5	2024-09-27	Ledo Pizza	20.13	Uncategorized	\N	f	{}	ab7da87dd9aebb0a30e33178dc716f2aed2c47339590997cbffb9fe735fbe7df	f	\N	\N
a72e0c86-9eec-4a67-9d72-94fc47e22178	2024-09-26	Deposit - HENRY M JACKSON HENRY M JACKSON DEPOSIT	-1751.26	Uncategorized	\N	f	{}	cdcc808772d75a5af3b99d750d7fc963ebcc9fb79c89925064932942d8931348	f	\N	\N
075e2a4b-b189-409d-bcd4-01de461daf86	2024-09-26	Shell	10.15	Uncategorized	\N	f	{}	94f0a8ee57b0c32c7963047f898252d330e6f210a6ec0d388f2e97b66f2c9940	f	\N	\N
4bb8f370-2836-42d2-847c-13c457167d64	2024-09-25	Transfer from Shares TFR FR OTHER	-100.00	Uncategorized	\N	f	{}	cee859b00bc207fcc1e01e1d8f84d6253e0ec0d50626c2766daabaa9223853d2	f	\N	\N
1ce13b10-9327-4d28-b7cb-1c8638b4a6e4	2024-09-25	Transfer from Zelle	-30.00	Uncategorized	\N	f	{}	fe655d90dc823aa6d52ff6f109ce8a96e9822aa85f38ec07ab5fe270ee1297e4	f	\N	\N
b9ccf2bd-b6a5-4fca-a516-9c99a884a5f7	2024-09-24	El Salto	52.87	Uncategorized	\N	f	{}	26f52e3b0c714508e17d93ba02e279d5e2c65e0e1cd3e8b874b75bf2b326fc77	f	\N	\N
24175f27-606d-4180-a77d-ce09fd9daa80	2024-09-24	- Visa Check Card XX81 - TST BARCA PIER ALEXANDRIA VA CHARLES R STEPHAN TRANSACTION	63.00	Uncategorized	\N	f	{}	818b6d814948345d20f095af58581e31331078ee6ca5028c041a960c594031b1	f	\N	\N
bd25e3f8-1edf-494b-ad83-48ef1251b635	2024-09-24	ALDI	34.54	Uncategorized	\N	f	{}	023d01180df9842945381059f5792065d49b86c19e4ff96b278a059d66aeda99	f	\N	\N
a64f0c5b-5840-4ee3-9ff1-5e317400a70c	2024-09-24	Transfer from Shares TRF FR OTHER	-161.75	Uncategorized	\N	f	{}	5cc1235eff92ccd648c7ef4158eedb3198991e6dd1095171f8c9f2fac2563b40	f	\N	\N
cff53bd6-64d2-4368-a598-73f9ea808ec5	2024-09-24	Payment to Best Egg	537.47	Uncategorized	\N	f	{}	741ccd3717f053afc7060478ae59e345f8c7b1126f1aa532a44034da3ed0e78f	f	\N	\N
0345381f-121a-4386-96dd-a4234f9a9425	2024-09-24	Giant Food	24.86	Uncategorized	\N	f	{}	84f952cc19f970efe48b12794ff3683703c7226bcf1f3808748feed93dcf137f	f	\N	\N
2af19a78-c494-4cbd-a273-15240aee0abc	2024-09-24	Payment to Liberty Mutual	202.86	Uncategorized	\N	f	{}	26f287e55eb5f1f4a45043afd0ddd600384cf31bb17a6e533505c4ceddd2f483	f	\N	\N
3f19b596-9835-48fc-aae0-abaf0714d0ea	2024-09-24	Giant Food	6.35	Uncategorized	\N	f	{}	7826af1e85639846b92267ccc82ddaef023b0dffecc55ad2c51d117c8470ea67	f	\N	\N
ca250e2f-d7d6-4b40-b390-6e97b8b562c3	2024-09-23	- Visa Check Card XX81 - GAMESANDSTUFF COM XX4581 CHARLES R STEPHAN TRANSACTION	20.65	Uncategorized	\N	f	{}	9502327370905ba6eab0d432123c01b2e97aaa0cff9907669226db6a0f18c976	f	\N	\N
32d3b048-788f-4ed1-a928-285e0d08f016	2024-09-23	Hb Parking	15.00	Uncategorized	\N	f	{}	601098ad96a47bd6612551922bebc44d0b192d6bbd47e97ce8add6781eadcae6	f	\N	\N
c2f810cb-dbee-4164-ba72-abfdd244736a	2024-09-23	Outback Steakhouse	76.44	Uncategorized	\N	f	{}	2cbf4490e2252537c5163e07e28660713514eae82f5bab946f3356cdf2320833	f	\N	\N
c0db6599-b6e2-4fe7-a77c-55037ba94203	2024-09-23	ParkMobile	6.45	Uncategorized	\N	f	{}	d4022c7683074a0d48e53d97310eced552a7ffb16271c47a2ae1b2a15ab59b9a	f	\N	\N
e2587cc8-f7f5-470d-b294-427d8fdb05f2	2024-09-23	Airbnb	179.80	Uncategorized	\N	f	{}	74d34bbb6a69031a650dfd78c7d6ed547438558fbafc9be27f2805dc6542ddbb	f	\N	\N
5ec6955f-ab09-4591-ab8a-de8e69ff8f94	2024-09-23	Netflix	7.41	Uncategorized	\N	f	{}	426511dd07d1f096fdc89758b6280d859e84ab067fe7a0cf379f9d7050073dcf	f	\N	\N
38853c0f-3fed-4f86-9944-c61a04cdcc07	2024-09-23	- Visa Check Card XX78 - MERRIWEATHER LAKEH XX8678 CLAUDAYA C STEPHAN TRANSACTION	78.00	Uncategorized	\N	f	{}	d4a0cd79fce06db32b23da7c82f0d6bdb378b321acb29a8e03c6a4bf02a4f0cb	f	\N	\N
2d539c05-8328-4f8e-967f-66345b7cc602	2024-09-23	Transfer from Shares TFR FR OTHER	-150.00	Uncategorized	\N	f	{}	ab1f3af55e2fd6403ac4c6292c3869a1ff7573f8595c26abb635226ae3ea5462	f	\N	\N
d077ab42-e682-4176-ac3c-7b27483260be	2024-09-19	Orangetheory Fitness	25.00	Uncategorized	\N	f	{}	117f61a1c8c30f169f51e56fe51125a7e3110a5dfe53cf7923c16c433ee3b89f	f	\N	\N
377acfa3-efd9-428e-903b-ae508737ee72	2024-09-19	Apple	7.99	Uncategorized	\N	f	{}	a23f3aa64f5c7943a21b16278c58cd712c6c4fd00d26646fc68b9270d3a14c31	f	\N	\N
2f270624-2c1c-4cac-a4d5-07c7206a17da	2024-09-19	Uber Bagels	8.69	Uncategorized	\N	f	{}	ca042b1075a1e0d1a0363a7d0e261ca4860071572b3db79b17043fe669d14b68	f	\N	\N
24575cb3-1b9b-45f1-a29d-5917d8b1a722	2024-09-19	Uber Bagels	10.59	Uncategorized	\N	f	{}	7c7fa1664618394e0d50bc3b282eaff9e690eeba48a101c5765e55185ea1158b	f	\N	\N
b87fc673-9267-4351-8845-eabfd1f501b6	2024-09-19	Steam	7.41	Uncategorized	\N	f	{}	d078a105acd50f7d200259e3072e548508ecfac7eb24c4cf9a505e91ead70b34	f	\N	\N
3b201040-3340-4f4c-84b1-071b4396baaa	2024-09-19	Amtrak	81.00	Uncategorized	\N	f	{}	978737a9551c7b9b0605069e6bd3fe3bef4cb854bfe8204570bfbf6d103d0b1c	f	\N	\N
be23fb16-150d-4163-a9eb-f4477336e59e	2024-09-19	Taco Bell	8.89	Uncategorized	\N	f	{}	52e6843dc69ce8c96e157f0a57b8ed1099aeb169bbdfa181e1ef946194a7cb2e	f	\N	\N
2331786c-8e6b-462d-a969-334d2517eeea	2024-09-18	Orangetheory Fitness	14.00	Uncategorized	\N	f	{}	52f86bac86ea7d1a8c6b55eb0fd2d2345d4a364342d16795c5855acc35748972	f	\N	\N
5dfc61cb-cdeb-4136-9fa9-ed253b9fbb7c	2024-09-18	Wegmans	98.13	Uncategorized	\N	f	{}	15b326ed35acd765ee42f064d46647313782e5c8d7ce6e7eca45629ba9048600	f	\N	\N
545a5fb6-9c73-4348-878d-673d04daf7ca	2024-09-18	Marriott International	25.00	Uncategorized	\N	f	{}	876a7980983534e2d0869ed44570a0a6e92aa5201e4a17253859828532f55044	f	\N	\N
bc18fb78-c4b4-4e6e-a4e2-fcc601145c3f	2024-09-18	Amtrak	172.00	Uncategorized	\N	f	{}	26a043f707f473ed226a6fc625d15f3b0abd2f9bd28c02559d88a3427eb8953d	f	\N	\N
bbf2d6ad-8f70-46f3-8293-0d9365a52631	2024-09-18	Wex Health Deposit	-450.00	Uncategorized	\N	f	{}	f5f920de7b8e5b11deb3f559f911ffc04863bf600ad2ea0a3e73e5688b5f6ca0	f	\N	\N
0d747cc0-cd22-4faf-866b-55854f40e8e6	2024-09-18	Dunkin' Donuts	7.72	Uncategorized	\N	f	{}	eb5fb94ef831952043c5be799d833693e828345a1f49ea21c8d4e428692fd365	f	\N	\N
06a37916-25d9-4723-af80-9363256fa85c	2024-09-18	Transfer from Shares TFR FR OTHER	-500.00	Uncategorized	\N	f	{}	942e3852e126d2acf4bf619dc83ac0bb9f0b3503df3f27feef92807ad798c5c1	f	\N	\N
981e0042-c30d-4708-b48b-4b8f00bc4186	2024-09-18	Transfer from Zelle	-100.00	Uncategorized	\N	f	{}	a0efebe72ff74cbdffab26b1ff73ecd72377982b4dd1adee740a0a54f999bf34	f	\N	\N
9ae2d1e3-ca57-46b7-bfaf-b4aa17871d3c	2024-09-18	- Visa Check Card XX14 - WANDERU WANDERU CO HTTPS WWW CHARLES R STEPHAN TRANSACTION	5.00	Uncategorized	\N	f	{}	a65c909bd172d48b71185b88ab112afa569cbcd519f266031f6e0ddcda3812e8	f	\N	\N
2beec12d-930b-4b5d-b167-35407d62b893	2024-09-17	Charm City Run	8.48	Uncategorized	\N	f	{}	a23935f167945d329da4a9f6e07f7ade8519f70a58b7f3c4c876e6c5bde7da12	f	\N	\N
1bcd4e2f-c447-4acc-ac9f-fc2eec0842e1	2024-09-17	Charm City Run	278.77	Uncategorized	\N	f	{}	cb0282aece244d33a82d39b8f48c530b984ff9ea7ea3b730d423c6ab786e08c5	f	\N	\N
c11145fa-7b6c-4b5c-84c6-653f32f8c3fe	2024-09-17	Payment to Capital One	294.00	Uncategorized	\N	f	{}	3b6277fb473c8467817c6ea2cfad8425979010821a7924b9416dd99f83419c96	f	\N	\N
91efc8f6-e68a-4484-bec2-c1de4fc9091a	2024-09-17	Transfer from Shares TRF FR OTHER	-110.94	Uncategorized	\N	f	{}	21c6dff45be0a4d2fd8a68dd1c506b6cf04aaaef609da680a20cd6539cf91103	f	\N	\N
3cb3a921-c730-4f18-b8f6-e21558a3a9d3	2024-09-17	Royal Farms	35.21	Uncategorized	\N	f	{}	eed24e6dfb98fc65c443d241d566b71e504990bc9bbbd279b2f19f77dde4e3b8	f	\N	\N
124c35dd-5ac4-4ce4-93d5-90577ae4082f	2024-09-17	Payment to Educational Computer Systems	100.88	Uncategorized	\N	f	{}	1b829b0a495314ca399fe013972934ddf551648291cb470c7818e40e018d40a7	f	\N	\N
78206ed7-e238-4e6b-a025-0d1ce4ec5f31	2024-09-17	Payment to Capital One	3500.00	Uncategorized	\N	f	{}	f7a04ff0b05ae324829c8ca12985a0ff9e0c039c909cfcadb9b005f7b4aa2a5c	f	\N	\N
7ac7cca0-7c62-4696-bcca-5b5d898c87e5	2024-09-17	Transfer to Apple Cash	25.00	Uncategorized	\N	f	{}	5773980e7ba7f0a0aeeb90783ff83e2efc37b4971eedb8a5e00a426f22f59da5	f	\N	\N
2e03e12e-1abc-4125-bdcd-c02012573261	2024-09-17	Toyota	900.00	Uncategorized	\N	f	{}	aed7761b2897b553c7882e3752b30f54e5ba4cb660a9f82ed40097fd30bd0881	f	\N	\N
6925235a-7e31-4be7-8be7-4f1008e73aff	2024-09-16	Premium Parking	10.65	Uncategorized	\N	f	{}	746d8b2b6e0f0349e375ecea600a85ea264c7486b3b08154902e7eb99fa6ce93	f	\N	\N
f545d2a8-8f2a-42f2-8fce-c425cb3fed94	2024-09-16	Premium Parking	8.65	Uncategorized	\N	f	{}	003cbe2cc938691b67483e828a4628e01fe9db33cc734547ea20b4ce7355de17	f	\N	\N
a912ebfd-9630-408e-89d9-6ef851659b81	2024-09-16	- Visa Check Card XX81 - NEBULA SUBSCRIPTIO HTTPSNEBUL CHARLES R STEPHAN TRANSACTION	30.00	Uncategorized	\N	f	{}	9f3dc983943d4c970193b2b78a2b554916b19d96583fb31434b958354e9b3c9f	f	\N	\N
5c37441c-750d-4b2c-b4d1-14fcab050af7	2024-09-16	- Visa Check Card XX78 - FORTUNE COOKY HTTPSWWW FORTMD CLAUDAYA C STEPHAN TRANSACTION	49.55	Uncategorized	\N	f	{}	ff06e44fd8ac6cade3482136eddd637c9509a3209428d2487f4199585b3e4c5e	f	\N	\N
28d40f61-cc54-4386-9ee9-f9e1d5bd957d	2024-09-16	- Visa Check Card XX14 - GAMESANDSTUFF COM HTTPSWWW GA CHARLES R STEPHAN TRANSACTION	40.00	Uncategorized	\N	f	{}	5080f0e097c2671675e24118a46373c688708b8e1adf96c0669a844a748c12e8	f	\N	\N
e599dd3b-6e45-4f6a-b589-30cec0cf5dd0	2024-09-16	- Visa Check Card XX81 - TST DIVE BAR AND G XX4581 CHARLES R STEPHAN TRANSACTION	51.43	Uncategorized	\N	f	{}	6b0fdf5d06c5340f11958dc4eb2202422d3a5a6010984e07a7a8554f84eb2cd9	f	\N	\N
8937e38a-bab5-4bd4-9ec4-a340ed0589f4	2024-09-16	Amazon Kindle	12.71	Uncategorized	\N	f	{}	96b03fca59bec676350cfce683b2b96481a8e68b5d0f30c4e7afd239ca84546f	f	\N	\N
fc0d056c-6763-4e07-9b00-800ade805d55	2024-09-16	- Visa Check Card XX81 - TST MILK AND HONE COLLEGE PA CHARLES R STEPHAN TRANSACTION	47.00	Uncategorized	\N	f	{}	7ccb828954b5d2eb4e34210ed7fc5f578258b10c4be8f859a6e976bdd95604b9	f	\N	\N
e1dc572f-869a-4fe5-85d6-b85726afdfe5	2024-09-16	Roggenart	27.20	Uncategorized	\N	f	{}	9cfba236d84f0e24302a3eb034ab0a352091052554b2aa51bbed4bad7cd4aa65	f	\N	\N
993fd633-4563-47ff-857d-7c9a91011454	2024-09-16	- Visa Check Card XX81 - TST BYGONE BALTIMORE MD CHARLES R STEPHAN TRANSACTION	45.00	Uncategorized	\N	f	{}	3de85d8849bb2bb51caa7acb583ab860f144017a73b84be1cf36a83b2ccdb0e1	f	\N	\N
72533489-7544-42ca-bf69-402e9a901bcd	2024-09-16	- Visa Check Card XX81 - TST BYGONE BALTIMORE MD CHARLES R STEPHAN TRANSACTION	382.05	Uncategorized	\N	f	{}	e42a98b4c61d7967dd48aa6e97c9065a64753bac74efa4e9b66b4661e9cbae69	f	\N	\N
6a2d8115-5b49-4ea3-811c-cd60118a333a	2024-09-03	Target	17.79	Uncategorized	\N	f	{}	ff94041a5d22002706beb83a0e378d3eebefe6ad9a4ff565d7755307373f392d	f	\N	\N
9a3d0a87-f5d5-4a7d-a03b-1211b59959d7	2024-09-16	- Visa Check Card XX78 - AMAZON MKTPL 2J3PM AMZN COM B CLAUDAYA C STEPHAN TRANSACTION	61.79	Uncategorized	\N	f	{}	2f522f391a7c924c84bd3a1de3a3a58199a293d806c9d31bef9996556860a094	f	\N	\N
1b0401cf-c168-420a-a26a-8980efe1765d	2024-09-16	Amazon	129.73	Uncategorized	\N	f	{}	0916468c9d8422b9bfe3c48569b28b19b8ec9052f898ef614b08288d060a0d05	f	\N	\N
ad7b206c-8674-498d-b743-37d65838199f	2024-09-16	The Grill	97.69	Uncategorized	\N	f	{}	6216a501af756ff1b7104d057631d4384b50981d5ecb101b0460b849a5c27a2e	f	\N	\N
e981d5bf-977d-4086-9fa8-5de8728d2d8d	2024-09-16	Payment to Discover Bank	11983.76	Uncategorized	\N	f	{}	d218ba6129cb7bee75162a6b8903c19685835204d7628e81aeb69875dad8f782	f	\N	\N
36775853-944d-4198-b33a-ced24c283acc	2024-09-16	Payment to Best Egg	1338.03	Uncategorized	\N	f	{}	e46d1adaeb62877e2734d834854221fa23215e024520066592b0a8eb5435f49a	f	\N	\N
d4ac8252-01f0-4568-9913-ca9e402fc8ae	2024-09-16	Giant Food	39.39	Uncategorized	\N	f	{}	70f2c7ead353e1ede7deba5def1095ef6532da907aae1297e247969a8dcbfad1	f	\N	\N
6db656aa-5c5e-435a-9439-373157dd1835	2024-09-16	Tax Payment to IRS	540.17	Uncategorized	\N	f	{}	5eeb1c88d3413e2020ebf0ae7f6c56cf65b7c6db39e061f1673b60925cf37b86	f	\N	\N
2880558b-46d6-462c-a26f-226b16827d5e	2024-09-16	Transfer to Venmo	250.00	Uncategorized	\N	f	{}	9043637826b768e911e0fc01dab90c965d30b64a2eac660dd7a8d9798a97a17e	f	\N	\N
cec53c9e-ed66-4715-9708-46247c5278fe	2024-09-16	Red Brick Station	111.90	Uncategorized	\N	f	{}	744ca1a361ab3935c98e3b9c6baedda49e02faab01ae0f44c941523a6f985816	f	\N	\N
1e4d60f0-5e7c-491d-a753-3becfcac37b0	2024-09-16	Payment to New York Life Insurance	616.54	Uncategorized	\N	f	{}	adc5db212c05235dff67f0994b6d30ee65c631ea394993417142bf6d1d394874	f	\N	\N
2e28e5d9-666d-4484-a49f-e871b8efba82	2024-09-16	Payment to Discover Bank	11.76	Uncategorized	\N	f	{}	ad162d79f5a641de47d119f56b0c9fd31c1eb6577f82c0b4bb731e22f322f488	f	\N	\N
1680baf5-91b0-455f-b5a6-8f178ff8aa1f	2024-09-15	Transfer to Shares TRF TO OTHER	1000.00	Uncategorized	\N	f	{}	38d50446808967cb94e6c324639cb0ae9d9b23eee99c766c512a7d86acde4f48	f	\N	\N
74e57406-6028-4496-a21a-dc1b9a0ed23c	2024-09-16	ALDI	39.50	Uncategorized	\N	f	{}	d8e7d269a1169f966dbaf0feb8415a5e0e8e57211fa19bc71e765e95acf9b41d	f	\N	\N
2f5805da-c49b-44e8-a5d5-38c5e4f2eaa6	2024-09-16	Shell	32.10	Uncategorized	\N	f	{}	9ca892a84c5c84446919fe6d8fee5eeed893befe70c97edd9b41b540967706d6	f	\N	\N
dcc2418a-1ff3-49d0-b274-3e414276ac2a	2024-09-16	Transfer to Zelle	50.00	Uncategorized	\N	f	{}	021f26c5da3eb1ed1403994d346506c8ac4b7abd6c8493c8a58d128c1e53e086	f	\N	\N
18faa39e-f598-4614-a437-d59c2a8a074d	2024-09-16	Wex Health Deposit	-400.00	Uncategorized	\N	f	{}	2542b2d7ebabbfb79fb44f3d430fd5b3917841ad9308fcbf790f8d821aa72e95	f	\N	\N
73517a63-f0f2-45fb-8f03-8f0898a20996	2024-09-16	Transfer to Apple Cash	75.00	Uncategorized	\N	f	{}	535eece773c4e9e0cbacb230fa10bd1c870cefd3ee8f753ba9d21942d12cd196	f	\N	\N
474d2e08-8a9e-44ab-9edc-2cc24801a982	2024-09-16	Target	151.96	Uncategorized	\N	f	{}	fb177be1912fe25a3342c68aef5a402981753b2120fc464272949f3e6db1587b	f	\N	\N
eb40ce3b-b996-4df7-8d37-21df82fcbaed	2024-09-13	- Visa Check Card XX78 - T BAKER BEAUTY BA WWW TASHAS CLAUDAYA C STEPHAN TRANSACTION	100.00	Uncategorized	\N	f	{}	cd558ed1508578df56742b34a209066792f6100b0f4872c7e9a5c0ecbabfe9b0	f	\N	\N
66ff7a44-0614-41f4-97f6-5c43b4db45b2	2024-09-13	- Visa Check Card XX78 - SQ THE POTTERY ST GOSQ COM M CLAUDAYA C STEPHAN TRANSACTION	137.80	Uncategorized	\N	f	{}	85cd628eb42b85c4f96a6de489cb95e6f87aa48a4fa33156f3aeb1ebf7963b27	f	\N	\N
c40ecd01-af3d-4662-ac97-c9b05d972e46	2024-09-13	Transfer to Credit Card TRF TO OTHER	400.00	Uncategorized	\N	f	{}	3a51d5148d81f9bb7754c0bcae3323b056b0bbec529b32b59032615ed0efc814	f	\N	\N
2ace2a28-3e5d-4058-a22e-dfe26a89b97c	2024-09-13	Payment to Chase	425.00	Uncategorized	\N	f	{}	742548a7595aaefa4fcae92fd0a16f24e700ee3fa07f155731ef4fc35f1cd7e3	f	\N	\N
d7440e49-ae9a-4df8-978b-5f246f88938f	2024-09-13	Chick-fil-A	11.44	Uncategorized	\N	f	{}	062819352ba175626c52e7d34339b7eb04727b2c72cc7cbcc3885ce7ccf3aa4f	f	\N	\N
12ecdb60-2df7-422a-885a-795aa6e70aa0	2024-09-13	Harris Teeter	121.86	Uncategorized	\N	f	{}	d05ded5998e766a194a70db3562229e6bea6f74cd07e8dde8f74a400875da0b7	f	\N	\N
02751333-5b98-450e-9807-0285093ce742	2024-09-13	Transfer to Checking TRF TO OTHER	100.00	Uncategorized	\N	f	{}	ccc114e75185e8aeabadeb95f45380f6caa54a40bf015d37792a9a3f430c275d	f	\N	\N
472effa8-25dd-43aa-8fff-645d42ba7502	2024-09-13	Target	39.20	Uncategorized	\N	f	{}	d0688ac8dddff689c9455bb9c58de2b58b67b09a115429549e333433fd89ce18	f	\N	\N
544628d7-a1a1-4a7f-a231-c0ec4bf7c0de	2024-09-13	Target	80.09	Uncategorized	\N	f	{}	361fd73b0dadbd45ebeb79fd3fdfde42a6ba93a8e644e51adce1151ae045185b	f	\N	\N
132c9ebf-a97b-4872-a33b-3f2db43f632d	2024-09-13	- Claudaya Hood Be ACH XX3572	400.00	Uncategorized	\N	f	{}	b280adf59c8ab53a79206d7a6efc5c9f4f05d9693487c6d875eea459cde02ad3	f	\N	\N
228b4d91-8e1e-46a6-a0ff-d66826dd62f3	2024-09-12	Transfer from Zelle	-25.00	Uncategorized	\N	f	{}	a3cab349a503b413d71e6a189f0e383832f89abef2f09f3d5c333e27d7617241	f	\N	\N
42952133-64dd-4aec-8cc3-3863f071d882	2024-09-12	Rise Up Coffee	7.95	Uncategorized	\N	f	{}	0fe05b7b0cf39170ab24df9dc91a0eda4f779677f65856cb88f9dee438ff2ea7	f	\N	\N
d08336d3-dc18-43c7-8958-1d6f347a1bc9	2024-09-12	Bmore Licks	14.00	Uncategorized	\N	f	{}	d4cfaaff48657d40d9920f69adbf6fc5a61c939dabb39805ace5a7823fa6d3f1	f	\N	\N
af2dd010-d6ce-44b6-8347-7860e5589f15	2024-09-12	Giant Food	5.77	Uncategorized	\N	f	{}	5ef150ad43c40aae71e44cce4d5dad9d3df130eb477ba943e9098f2815fb4d72	f	\N	\N
6d6b3e3e-d0cb-48ec-91fe-3756fea2f201	2024-09-12	Deposit - HENRY M JACKSON HENRY M JACKSON DEPOSIT	-1751.25	Uncategorized	\N	f	{}	54647da6523250e43ba820c63e2391009d66929096b483408ecb364f9cb96556	f	\N	\N
3d325fa3-dbe5-454d-92e3-ef397490732a	2024-09-12	Sam's Club	36.18	Uncategorized	\N	f	{}	d7991b94f3133aec68031e5ab7d8568038f2adbc4b973a7a8d058dee343c1a46	f	\N	\N
38339260-3113-455d-a746-e5761c16fae4	2024-09-12	Payment to Verizon	89.99	Uncategorized	\N	f	{}	50bad9a68bd7484f18b7a14ab5f31e07e201152be26340b8c45b5e19b655d8bd	f	\N	\N
5f755c75-0c45-4b17-a57d-d787a3d07f1f	2024-09-12	Microsoft Office Deposit	-17149.26	Uncategorized	\N	f	{}	c440d5e19e741cb8eb002d9d891a5f8989fbf8a64957d0c1171e49307646edfa	f	\N	\N
7774cfd2-8d6c-47b3-822b-ad9778431e07	2024-09-12	Transfer from Shares TFR FR OTHER	-4800.00	Uncategorized	\N	f	{}	04900a4da7d4bb7f2a95c7197ed8a2016d7c6a1cbad9a97353de31b569283459	f	\N	\N
53b439e3-9494-45cd-a547-3353c1763b21	2024-09-12	Transfer to Apple Cash	35.00	Uncategorized	\N	f	{}	205194f54637970e9c525a1d5188ef7920dfc7f89008b2ee819c2b34ae5363c3	f	\N	\N
76759417-1940-49eb-a064-93f900e89aa4	2024-09-12	Target	13.46	Uncategorized	\N	f	{}	06051b092403844ac126c3a373fa46b65002da4f4722a1a3f72576bfc7046739	f	\N	\N
28894927-ef6f-4a68-9ff5-3ea458ba399a	2024-09-11	- Visa Check Card XX14 - UEP FORTUNE COOKY GLEN BURNIE CHARLES R STEPHAN TRANSACTION	11.93	Uncategorized	\N	f	{}	76dc00268786248af0ae450045c6ea277bb42acdf328cee26695ea0b8601bb05	f	\N	\N
e3fb335f-dffb-482e-a827-0cb1c133991a	2024-09-11	Rise Up Coffee	8.95	Uncategorized	\N	f	{}	34c2ebe8617adb74c42aad3aaedd327cf5d249bed5e08c29a40f14226ee4ffb1	f	\N	\N
63afdd14-ba55-43b2-b2a8-4d5cd245f756	2024-09-11	Uber Bagels	4.93	Uncategorized	\N	f	{}	ff020542c6165b79fcbbceeeb452ea76f0fc48f7e6675a20a6cd2dfc1a776dd0	f	\N	\N
77bc2d36-d30e-428b-8148-d1b701deeeca	2024-09-11	Target	34.65	Uncategorized	\N	f	{}	3eb42bc8c68aeecb5847c1aead7c2f3463ae6c97b0e91173896fa322ae435a0b	f	\N	\N
b825a41b-4e6c-460c-9b95-01f2631b2f52	2024-09-11	Target	103.24	Uncategorized	\N	f	{}	7934ba0f5b45d5957de5174e01e380e91b8e0baad61892af0efbd8b678431817	f	\N	\N
232a299c-196a-4170-9e75-ba46094b4565	2024-09-10	Naval Bagels	10.31	Uncategorized	\N	f	{}	0b4bed59f31da06c8a2a1d26d76c8c6aee7b049405ceae34ab996d7f8ad4b0d7	f	\N	\N
d59cc516-760d-44ec-bd72-923918a8445d	2024-09-06	Target	-31.79	Uncategorized	\N	f	{}	59831da5610be3596b19548faeb95b73dd82cdf479b76af6656f745e6f173d07	f	\N	\N
aa93345f-a8b3-412c-8004-b4f1936563d7	2024-09-09	- Visa Check Card XX78 - TST SCITTINOS ITAL CATONSVILL CLAUDAYA C STEPHAN TRANSACTION	8.00	Uncategorized	\N	f	{}	83bdae54f5b17d26bc9e3660b40179d280056cfdb125330d0a08d8efd056360d	f	\N	\N
546caa19-4e73-4bb6-aea2-0718d14c2a30	2024-09-09	- Visa Check Card XX78 - TST SCITTINOS ITAL XX8678 CLAUDAYA C STEPHAN TRANSACTION	46.00	Uncategorized	\N	f	{}	86441212234046598185adc8487d8f5e9fd3d186542093a4b7d383898b5626ad	f	\N	\N
1ae19f60-f6fb-408e-862f-05238afc35b0	2024-09-09	- Visa Check Card XX78 - TST DIVE BAR AND G SAVAGE MD CLAUDAYA C STEPHAN TRANSACTION	88.37	Uncategorized	\N	f	{}	ffbbc71cc265dedbdd0866ad845bd59dcc98892e02d1784c3688bc9efa2b2ed1	f	\N	\N
719f5f70-a060-4fb3-9d39-603f56bdef59	2024-09-09	Giant Food	62.14	Uncategorized	\N	f	{}	8488ddb439af75683432d3a25bb2381c626c467129fd370856caa855d81b5790	f	\N	\N
90f49b1f-f126-4d93-bd8c-1456f67161ae	2024-09-09	Lowe's	129.07	Uncategorized	\N	f	{}	7b57da68ad3462f0c6a98d48255a4b76269e9e1e2837a8bb65acfcf753124b4d	f	\N	\N
f32422f3-4706-4143-b46e-6d4d7c0f3c28	2024-09-09	- Visa Check Card XX78 - OAKDALE WINE AND S CATONSVILL CLAUDAYA C STEPHAN TRANSACTION	19.61	Uncategorized	\N	f	{}	e494c7c6d0a7b8d048e90cf49c3b22b6af6f59689a44dbd5b195ad2f6c43d0ff	f	\N	\N
a6872baa-8b0a-4211-a342-9a66bd1d6845	2024-09-09	Target	23.97	Uncategorized	\N	f	{}	9bbe8c2145a275ac9324de9a4ac43f468ca4a1ddb3ed9fdc8fa2bc27fbabcc4c	f	\N	\N
97f3fdb1-4878-4901-9d04-eb8d00fe0460	2024-09-06	Orangetheory Fitness	199.00	Uncategorized	\N	f	{}	55f3fb89ec1662c1b963f99ca31d1346f8be15f08a50f249be774507467780dd	f	\N	\N
0e54e098-5b8f-4788-844e-cd8d7d6fd1ce	2024-09-05	- Visa Check Card XX14 - THE SENATOR THEATR XX6114 CHARLES R STEPHAN TRANSACTION	26.00	Uncategorized	\N	f	{}	c9f5dc53ef581984c290eca5ed9aa68c343ab9a7768397c2596c00a256ea6ad7	f	\N	\N
529143ca-801d-4838-b0cb-76db3fe74299	2024-09-05	LA Fitness	35.99	Uncategorized	\N	f	{}	d6ec40da83096b8535961c1abc099ac046726c10ecc206e6d67f6965414aec76	f	\N	\N
860a01b2-f4d7-4f1c-9ef8-3a8efc381120	2024-09-05	Transfer from Checking TFR FR OTHER	-60.00	Uncategorized	\N	f	{}	c1f3de36b76a25b9ffef85dee2009a75c1c810bed5bda4a944c5a6b5eb37bccc	f	\N	\N
657eb63f-d3c8-47d1-9a1d-53a01efe464b	2024-09-05	Payment to AT&T	200.30	Uncategorized	\N	f	{}	a7ec7d41a16986fa97a2afb4ba8c88816a10157d4a2e4b9914b9a772a43d7bb0	f	\N	\N
17d341de-ac7c-49d7-9479-9ca37b1dc1e0	2024-09-05	Target	44.05	Uncategorized	\N	f	{}	0741cd24503788c4314eaa852dd19f41f07096e8a391800071bc3a29ba582ef2	f	\N	\N
906446e8-4bda-46c7-8d80-86e2137f9a6b	2024-09-05	Target	12.62	Uncategorized	\N	f	{}	d13b4d545ae083c4e2a154c50b2edb7edc7a8415360d62a363c913c8b804b9ac	f	\N	\N
85e0d85e-979e-4fa0-9f24-1f89fd996e5a	2024-09-04	Akira	61.92	Uncategorized	\N	f	{}	a34c4b07da3db0c5c8abcaa90fa572f069cc1728c24ad449f36f1b83ecc21636	f	\N	\N
021f8bd3-0c30-4ea2-bad3-61886967d529	2024-09-04	Transfer to Zelle	150.00	Uncategorized	\N	f	{}	9bfa87b192dfdeaa3970fa63851079981b1a62778af235bfef0345cf7d22f9bd	f	\N	\N
cc924374-181e-491a-a6c2-ac094fb023aa	2024-09-04	- Visa Check Card XX78 - GREEN VALLEY MARKETPLA PASADE CLAUDAYA C STEPHAN TRANSACTION	72.15	Uncategorized	\N	f	{}	90643182dea46a68b0914b3c0ef443765080011d4f9b1954c33f0ac0335db8c5	f	\N	\N
92e11941-2fcb-4cff-a700-4005e315cff9	2024-08-02	McDonald's	8.98	Uncategorized	\N	f	{}	03107560cbe0d477f8d5d7746db9db8c2bf8ca32456463195047f0d458b1154e	f	\N	\N
9336bb84-9db3-4047-9342-69c106c67d53	2024-09-03	- Visa Check Card XX14 - SHENANDOAH PM WWW SHENANDOAWV CHARLES R STEPHAN TRANSACTION	579.16	Uncategorized	\N	f	{}	35e7d4f0c43eebe5132c2cd9a4ba2613f4b1309a074ed51ddcc9c7d8505980f0	f	\N	\N
273062bd-106b-4606-a609-f7e635c64fed	2024-09-03	Elite Sfn	155.00	Uncategorized	\N	f	{}	9548513c78a4d633ad6e64d8d4350ed33b9821651f3bff7f66820091df833fc0	f	\N	\N
74511f30-b966-4ff0-9442-4426dc2e7611	2024-09-03	- Visa Check Card XX78 - BRAVELITTLELAMB HTTPSBRAVELIT CLAUDAYA C STEPHAN TRANSACTION	31.08	Uncategorized	\N	f	{}	2f328fcf809cd05dac33efd6c7cfd7cbf9202ba333b676cf2ad0a841d50f7c4c	f	\N	\N
d69fd7c9-34d9-4e96-b106-4840dc2e37d5	2024-09-03	- Visa Check Card XX14 - GAMESANDSTUFF COM XX6114 CHARLES R STEPHAN TRANSACTION	86.87	Uncategorized	\N	f	{}	e66dcf06209ab21270d27395d36a959216d70ba0924e5cccfaaa09f9e5d09df1	f	\N	\N
c34a0855-d014-440c-ad93-62fa43475a67	2024-09-03	Sam's Club	41.08	Uncategorized	\N	f	{}	ac3beafd0c8fa8aa431d050c0bc0f744fc8ae1e450061b2192db3149cb0d1bf7	f	\N	\N
feabfb10-8b5f-49c4-8753-fedcc349c043	2024-09-03	Peloton Cycles	46.64	Uncategorized	\N	f	{}	ca21d49da0fee5c227e1e9ddc850f38abe04afbe83d1107723df276947de7e95	f	\N	\N
cfd48b16-d4c2-4e09-8b24-2f836df98201	2024-09-03	- Visa Check Card XX78 - TST PITANGO BAKERY BALTIMORE CLAUDAYA C STEPHAN TRANSACTION	18.81	Uncategorized	\N	f	{}	bc4150f9784cb1e75a8596dfca8238c033d0d769193d0b2742605fa145a3ec9d	f	\N	\N
11ca954a-b2b7-432f-bec4-9f56b0f247ce	2024-09-03	- Visa Check Card XX78 - TST PITANGO BAKERY BALTIMORE CLAUDAYA C STEPHAN TRANSACTION	59.00	Uncategorized	\N	f	{}	bf3577ba8235559126c7231e423113bc863502c3210de329432fd68375d8929f	f	\N	\N
21d7185f-1631-4c96-8f2c-6fa8401e452e	2024-09-03	Transfer to Checking TRF TO OTHER	55.00	Uncategorized	\N	f	{}	5b80c197526ffc970a3f6c91055d7369b8339ae87b7f6e43ae49af556a6ca889	f	\N	\N
b9980f34-2783-4704-a614-89a909380453	2024-09-03	Apple	2.49	Uncategorized	\N	f	{}	a251cec132f3e9218ac440e241b9709cc2d3c3e5f65758a6a58e8fccf1ddfb72	f	\N	\N
e3da41cb-1c28-4a44-a733-d2477bb0e48a	2024-09-03	- Visa Check Card XX78 - TST PITANGO BAKERY BALTIMORE CLAUDAYA C STEPHAN TRANSACTION	1.48	Uncategorized	\N	f	{}	7cd354b10d7541a77fd23510a9f950412038f4055770f572a5f3315fdc516325	f	\N	\N
ce9c99f4-4294-4d73-a083-93cf1385a914	2024-09-03	- Visa Check Card XX78 - TST PITANGO BAKERY BALTIMORE CLAUDAYA C STEPHAN TRANSACTION	37.89	Uncategorized	\N	f	{}	cf0346b7998a37cf4300f60a34f5f782471378eb9670b4fa296614b230d438a6	f	\N	\N
19e4e633-f3f2-49ca-9fcd-d362714ff9cb	2024-09-03	Target	-42.39	Uncategorized	\N	f	{}	e55555bd72aac8f959268d7132109f48294f50e9d75764992b76ed7f4602adbb	f	\N	\N
5bc325a2-5e44-439c-95f0-f51c313ba3bc	2024-09-03	Amazon Marketplace	63.59	Uncategorized	\N	f	{}	d260594b8da4645e719c8198c96393376f085f5d0a189fbe6eced426c407e2e6	f	\N	\N
1aa0940d-9748-4fb2-9644-38952aa11502	2024-09-03	- Visa Check Card XX14 - TST DIVE BAR AND G SAVAGE MD CHARLES R STEPHAN TRANSACTION	44.14	Uncategorized	\N	f	{}	83b0939c1c60da04fd04431882e3022df62057dd1d8d886d892ce32ba2998c64	f	\N	\N
a3919399-6479-4e4c-acd0-e823b138d094	2024-09-03	- Visa Check Card XX78 - TST MIKES CRAB HOU RIVA MD CLAUDAYA C STEPHAN TRANSACTION	59.52	Uncategorized	\N	f	{}	38a176fbe57d56886d41bf038bc422244041ecdf4626343908e4a3a67069eeb3	f	\N	\N
a9853ff8-4a6b-40a0-9968-0cb5fd71c705	2024-09-03	Sam's Club	28.35	Uncategorized	\N	f	{}	4e17dde9a02c5ec59b0363f1a31dd62239c2c4839f7ea1fc90575861eef3a4da	f	\N	\N
e037ee1e-44fb-450b-84a7-647f6d7788d8	2024-09-03	ALDI	12.20	Uncategorized	\N	f	{}	884e67ebcee16c8be3983792066499221d7f42bfe225cc11cc8a90a5d8d8794a	f	\N	\N
97fce372-6259-4227-8d94-5cdc9f1c6fe4	2024-09-03	Adjustment - GETAWAY XX-0021 NY GETAWAY XX-0021 NY ADJUSTMENT - CR	-55.15	Uncategorized	\N	f	{}	4f39bf97035da472d3abbd6b25f0450764436daf9af825b94e6e8780c461886f	f	\N	\N
8bb459c7-c856-4b57-b76a-b6a888fe0def	2024-09-03	Parking Authority-baltimore	1.69	Uncategorized	\N	f	{}	ac4aa725afba60e79441ed779b4f6a5bde03fa4b3492b1bd4c64e84b3ba703ef	f	\N	\N
9a32042c-c04a-48a6-9a6f-614c16fe7255	2024-09-03	Sam's Club	125.91	Uncategorized	\N	f	{}	4e2ed7c2192915ddd0b20d84f0bbc83638ec4be7b74ecdfa478927a445309d4e	f	\N	\N
319f50a7-fef2-4b05-ab8b-e2ffbda995b3	2024-09-03	Payment to Apple Card	400.00	Uncategorized	\N	f	{}	80e9825d238436b6f3a8f77ae7b3df721e9f6c2880b1c0e98ef1df9a774180e1	f	\N	\N
f1b53d8d-6a6a-4cab-a17c-8d7efe89413b	2024-08-31	Transfer from Checking TFR FR OTHER	-87.00	Uncategorized	\N	f	{}	d9e55bdd7ecd7c8fd0aa5a13ad1914e701ca64f199118def09e6c96903be9218	f	\N	\N
784e67fe-07d4-43c5-ace7-a247020fa78d	2024-09-03	Payment to Chase	125.00	Uncategorized	\N	f	{}	43e927a7ac534e5db36447a65c21190cedeaf2302bf4d6da4100bc5808b83eef	f	\N	\N
9d853958-4574-4db3-be95-ae2adfe46c46	2024-08-31	Transfer to Credit Card TRF TO OTHER	525.00	Uncategorized	\N	f	{}	521aa3219a7a728adb8419f30dc560e26e10d39d44ffe2e52ee69f276975aa3e	f	\N	\N
e7f5fcab-c9df-4d16-bdd5-22d69e033de8	2024-09-03	Jpmorgan Chase Bank	2107.66	Uncategorized	\N	f	{}	67f2249a8d756300c589b3120d3e77ac3bd3614a6739c66db53a8750a090fb4d	f	\N	\N
8bbbfd50-1641-4927-8276-ab4858b5225c	2024-08-30	- Visa Check Card XX14 - FORTUNE COOKY HTTPSWWW FORTMD CHARLES R STEPHAN TRANSACTION	40.49	Uncategorized	\N	f	{}	212d8cd30a0cb2b5f4bfcdec99c4af34913accfd68a4db8e71c256adfa832538	f	\N	\N
f553cc19-2901-4897-b8d0-69beb80041f4	2024-08-30	Transfer to Checking TRF TO OTHER	30.00	Uncategorized	\N	f	{}	79746962b75ceeed5c5c4803081926204d80d129b38f99c7d0396725ff899733	f	\N	\N
fd577c67-4530-44c7-bd90-47659049e141	2024-08-30	Transfer to Checking TRF TO OTHER	40.01	Uncategorized	\N	f	{}	68717e161023dcd797a7001e234075583c55259141d12ffde0c132af9e9fc6a7	f	\N	\N
a002a8f0-831f-4469-80d0-f1ca9aca14ff	2024-08-30	- Claudaya Hood Be ACH XX3572	500.00	Uncategorized	\N	f	{}	68632071bca36cb1b1af22eb10c8a58b60c332e6ec11800dee39d7bac7786caa	f	\N	\N
1d4c9177-2d0e-4fa5-bde2-3c0f6aeb8a64	2024-08-30	Payment to Baltimore Gas and Electric Company	252.87	Uncategorized	\N	f	{}	759d77f21e44af567835705e7816d6174b5aaba220fa84058176a8143f87aa2e	f	\N	\N
13c15771-6137-4724-af8f-2954fdfad00b	2024-08-31	Dividend (GT20)DIVIDEND	-0.90	Uncategorized	\N	f	{}	fd73806f661628e15bdffcdd9c8772f0d3117c21bc9a1e68108356a02781624c	f	\N	\N
7c3df96f-319d-42a7-bd0b-6f87bc66e4d8	2024-08-30	Transfer to Shares TRF TO OTHER	137.39	Uncategorized	\N	f	{}	eca5b2f91e6494acb44572199dbc6c2b84556f813c44b107337ef23422028327	f	\N	\N
e2e58e69-a05c-40ee-8d0f-fd023e29ebb4	2024-08-30	Transfer to Checking TRF TO OTHER	65.00	Uncategorized	\N	f	{}	36c4ada991268e7e3becc28c593e0de285a7f6ebb3a1e8a4a0cd1c7988d246dc	f	\N	\N
e8e7e08f-81d9-4a31-9549-d2a949f72090	2024-08-30	Transfer to Checking TRF TO OTHER	100.00	Uncategorized	\N	f	{}	4a83353e4deaf8ccfbfc04b69857377156db390e777da4837552a825523bdd94	f	\N	\N
9e8c7a7c-8218-4877-a9f8-a196326a82c4	2024-08-29	Rise Up Coffee	5.83	Uncategorized	\N	f	{}	22753420d1290d73d079d04fbda5844bdfae161f68aa3582278586947f3dc511	f	\N	\N
77f3c3a7-b49c-4abb-a818-73b6804bf657	2024-08-29	Deposit - HENRY M JACKSON HENRY M JACKSON DEPOSIT	-1751.26	Uncategorized	\N	f	{}	aee31bb81e1de14450ec0dcb4176f76df3a48824eab0b71df6919ba0892f91d7	f	\N	\N
16d920ea-fe93-415e-a43f-ce121d00d33b	2024-08-29	Microsoft Office Deposit	-5362.19	Uncategorized	\N	f	{}	622e8290b44799bf8f4b32b7a81b100fdf4d3949c06a376c13d6513d92dbda9b	f	\N	\N
0e1e44ac-d185-4a86-9fe1-67587ed2127e	2024-08-29	Zazzle	94.87	Uncategorized	\N	f	{}	4544e27f0b29d5c282c25e3e2a7afca2a6a728ff192c02e544c0f4a120c7fcf9	f	\N	\N
f5b1e263-d0d7-4dbb-a5f6-d72c156853b5	2024-08-29	Pizza Boli's	60.59	Uncategorized	\N	f	{}	0ae041318d86b3e1d07a8335804918f12827a93da13e9d95783e9b0f9fc718d0	f	\N	\N
80d79cfd-2a3a-48a8-8fde-2eb15820ebe8	2024-08-28	Transfer from Zelle	-100.00	Uncategorized	\N	f	{}	c39a8f4797039e9a2369c9ccfa33303d4a315b8daf21591d1f7f5c7b2698a86d	f	\N	\N
e5c87abb-0db7-4e9b-99bd-0c085dec90a4	2024-08-28	Payment to Citizens Pay	88.12	Uncategorized	\N	f	{}	2e203302e1ac4a083e61d38547b8fae8460bbde844d7563af199ab457bd7fd57	f	\N	\N
98a30de5-71b5-4271-a067-6d5c54ca6e88	2024-08-27	ATM Deposit - FCV9 CROFTON MD DEPOSIT	-500.00	Uncategorized	\N	f	{}	5ee7f6223d3d4a6c1019f1ca7f37f653a7e4748740e51913ab409710a9150a8f	f	\N	\N
08cc1af5-fb19-4111-8b22-67dfb10bb46f	2024-08-27	Walmart	101.46	Uncategorized	\N	f	{}	3917e55918cb4892ca9d0f841fc4beea320493fa697b41b4b63a9c0c76c16d77	f	\N	\N
1ee2593f-a677-4ed8-86d1-b9baed708f08	2024-08-26	Sam's Club	39.10	Uncategorized	\N	f	{}	cad27a85bab1f4505c4ed77025971d48a6797696e20c75614d985a0556ee28ec	f	\N	\N
ff7724c3-e471-44bb-8a49-11f4f3452dc0	2024-08-26	Target	51.87	Uncategorized	\N	f	{}	e47ac9f793b70fcda007806a42dd6f8a085016849665d065180243dde1f73ec6	f	\N	\N
18af43ba-52a7-4814-8448-fb6ca20bf38c	2024-08-26	Sam's Club	89.52	Uncategorized	\N	f	{}	f61fbdbc2e69c9aaaee01bb41263e67f7efb6650807fff1f6d9e1289c2099bbe	f	\N	\N
091a9740-9f17-47fd-bca1-9d30d9433c1c	2024-08-26	ALDI	21.37	Uncategorized	\N	f	{}	841fba87a96099bf032b135f0c3416a764c0bfd715525b80f29f99650a78fea1	f	\N	\N
a0654724-a1f3-4102-bc29-452d679e448c	2024-08-26	Food Lion	4.79	Uncategorized	\N	f	{}	0da0b814f90f441f8760b1aa08add69db6b92c89c274bd9cdb4906b57aa0adfb	f	\N	\N
eacc1286-ea35-4f73-adf2-06d43ea10b2d	2024-08-26	Sam's Club	5.67	Uncategorized	\N	f	{}	8393dface022a489487f53714ef15a626ff2c2beff1fa2aa8dba1eb54fcc627b	f	\N	\N
f2c4ec10-d334-4cad-9062-5f19121a8b4a	2024-08-26	Jalapeno	20.57	Uncategorized	\N	f	{}	2e23e3260a0101e4aaf3134b94e4590b5e5048f4fd1f701838da97f9a2bb6d21	f	\N	\N
c260c5e6-8ec0-4f19-9b6b-1535e9c82f04	2024-08-26	Giant Food	10.91	Uncategorized	\N	f	{}	36a4f256d4227d2cbb750a028c232d7571505af2a7aac67e294504d9725b27b6	f	\N	\N
51d54626-fa76-4ff2-9ba8-02b5955b23f5	2024-08-23	Orangetheory Fitness	14.00	Uncategorized	\N	f	{}	230fbfdd8ccddec537825b8b21c0b47d76b801461835ca9ed54b2355f90f5072	f	\N	\N
59f51b2d-ee55-4e7d-8f92-4adec864a974	2024-08-23	Netflix	7.41	Uncategorized	\N	f	{}	f40054946b7a7001e725d58bbc5ce212aeedc485e37a761604b2d1ef2a82040b	f	\N	\N
b2b577a5-4712-4eb2-a54e-5da279019e62	2024-08-23	- Visa Check Card XX14 - DC GOV T XX6114 CHARLES R STEPHAN TRANSACTION	200.00	Uncategorized	\N	f	{}	2289699332a85a2660b6ae83e7e872b874cef6fd2d33d689c3c660795336119f	f	\N	\N
025880ae-18a1-4169-a2cd-962301a4f52b	2024-08-23	Roggenart	40.00	Uncategorized	\N	f	{}	a1dc01e3982b876155b3caac755788cfc6dd4bfc48484704c7e7985df4d88ee9	f	\N	\N
60ace825-4479-4623-9e39-9561fc7fd755	2024-08-23	- Visa Check Card XX14 - TST THE ALE HOUSE COLUMBIA MD CHARLES R STEPHAN TRANSACTION	115.00	Uncategorized	\N	f	{}	f81d9ce686bdb51c1ea45649573b23a6d790da711128ef56002a96a19694bfc8	f	\N	\N
1d59057c-7d2a-42f3-ac9e-bf53b730953d	2024-08-23	Payment to Best Egg	537.47	Uncategorized	\N	f	{}	47932b85b555e2fc9180bd2ba934eb709bc22437352cc4a3a67e897967b82a8e	f	\N	\N
d86ff1c9-0539-44ad-91cb-44e53a3edf69	2024-08-23	Giant Food	25.37	Uncategorized	\N	f	{}	89e553b35628e6a52b70bae38117532a0926bf755b34f21d75877e2b30b602ab	f	\N	\N
9a4f1d24-78b0-4283-8e31-4ba1bfc8ee4c	2024-08-22	- Visa Check Card XX14 - SOLLYBABY CO HTTPSSOLLYBABCA CHARLES R STEPHAN TRANSACTION	89.04	Uncategorized	\N	f	{}	d4436f6c362dfacc0dcc91c8c172939e5fec86d6954dda460a803c1322e3f6c9	f	\N	\N
f647b9f4-ca4e-4762-bfca-150c20a45a26	2024-08-22	Payment to Liberty Mutual	202.86	Uncategorized	\N	f	{}	f3a857f26176f8d0395c1cf2039236a9f17e606bbf7e31d0045b7623b1b2d56a	f	\N	\N
5bb6206b-e892-4eac-ac28-8ba2863cdb08	2024-08-21	Transfer from Checking TFR FR OTHER	-33.63	Uncategorized	\N	f	{}	1379dafe58944e4eb6d7d7358ae9d43ad5097d17481844c582baf8cfedcaccf9	f	\N	\N
c083370a-41ea-42ad-a2e2-f56c90c6dc73	2024-08-21	Target	74.18	Uncategorized	\N	f	{}	04121e4940ac98044abbdd99e311eaa734a0f20ced46c039e99736f7a6b11c1b	f	\N	\N
a978ca69-00f5-4f05-887e-fccf0e531f91	2024-08-21	Giant Food	30.55	Uncategorized	\N	f	{}	1a93882cfac4eaca44fea7d15d4770b6036ca533d68abaa637f32d4dc75beea9	f	\N	\N
5cf4d4fc-0cf3-4a84-a31d-1ab8c156787a	2024-08-21	Edible Arrangements	32.84	Uncategorized	\N	f	{}	977da626d1968a5c322af61b569adb8d106c10d33d1cf024dd314ee634540394	f	\N	\N
5069b436-7a62-4505-a2f2-4f2721243457	2024-08-21	Xbox	33.63	Uncategorized	\N	f	{}	869d0e9a36e8113daf6555fe6ad606bcd0c50ab68862d9be6b6426d1cba2641a	f	\N	\N
c05fd782-1a57-4874-b8e2-9365c705ffe0	2024-08-20	- Visa Check Card XX14 - AMAZON MARK R49B7 HTTPSAMAZO CHARLES R STEPHAN TRANSACTION	7.17	Uncategorized	\N	f	{}	e2ff5b317c4f1eca5a42450bb5caa7010e22bf2c07ff44aff841b274312fbb3d	f	\N	\N
52ccc17b-9ac1-4f98-9aab-d1ef987fda58	2024-08-19	- Visa Check Card XX14 - GLOSS LOLA ROSA - HTTPSLOLAR CHARLES R STEPHAN TRANSACTION	35.00	Uncategorized	\N	f	{}	146b33ded42581e2a0a9cf003361716c5b78e87fb61dd603b3225a7acee861b4	f	\N	\N
ac6615a3-ba00-46fd-9457-804d2cb713b1	2024-08-19	- Visa Check Card XX78 - UMB PLAZA GARAGE BALTIMORE MD CLAUDAYA C STEPHAN TRANSACTION	12.00	Uncategorized	\N	f	{}	81893b6b1ee644495b888fb27d046012fa602dac1a41e2ca5e54fe08d5ce2c8e	f	\N	\N
36f0b7a3-1ada-4158-852b-4e01acfb5a84	2024-08-04	Giant Food	8.96	Uncategorized	\N	f	{}	3fe197f53a74867073db24d3e4fa958ac1fa2bdd783e033c90108448f5d0f183	f	\N	\N
8b2f7c22-f4c4-4911-9d76-f28bef6fb100	2024-08-19	Papa John's Pizza	47.73	Uncategorized	\N	f	{}	66260794a042f7d29a5e4063498d5f03d170e9ab9531409dd80eaf0455f94956	f	\N	\N
ece83a29-d77b-4e92-8f2d-d60a0e7d29a8	2024-08-19	Dollar Tree	3.98	Uncategorized	\N	f	{}	44a31280c9a5c6e711aa0adbf0dc0ed87fd3545831d15a84c2e855e4bf98d07b	f	\N	\N
5ea26b5f-8c16-4c20-86bb-0996535c9eba	2024-08-19	- Visa Check Card XX78 - TST BEST WINGS N P GLEN BURNI CLAUDAYA C STEPHAN TRANSACTION	70.00	Uncategorized	\N	f	{}	a20ec02cc0972b18187dfab9693711c05dd05e35fc193dbc03421104612f40e6	f	\N	\N
0b320e32-7e58-4eaf-b8be-ce3801754347	2024-08-19	Apple	7.99	Uncategorized	\N	f	{}	a77f6645325f48b0c921249f64fc04b2667103a4c202673764aece88e509f972	f	\N	\N
83f8726a-840e-4841-936d-fc15bb026155	2024-08-19	Subway	12.06	Uncategorized	\N	f	{}	9debde39bd6de79a203dc6518f9b6bace9f10aa9e15691b9719f09504a36d2e6	f	\N	\N
e2212212-d734-4777-b6f9-4397f0c01728	2024-08-19	- Visa Check Card XX78 - SQ CLARK S ELIOAK ELLICOTT C CLAUDAYA C STEPHAN TRANSACTION	17.00	Uncategorized	\N	f	{}	39ddf217a2a1cd632cde59d3cdaa402519720beeb3d532e747c6602dce66cb4d	f	\N	\N
62557688-1aa5-48c9-ad46-8435ab3911b1	2024-08-19	- Visa Check Card XX14 - TST SOUTHERN BLUES XX6114 CHARLES R STEPHAN TRANSACTION	27.31	Uncategorized	\N	f	{}	dafad908f2bd74e1713219efdb5751f648ebb7c090ee4faf20a22b2bdc6d012b	f	\N	\N
6b0412bc-d9cb-430e-8862-ec37c6348e4d	2024-08-19	Target	173.26	Uncategorized	\N	f	{}	97c6649aea118de3306fdd0ab22ccfcec99775302efde3ad9cecf888d41dd01c	f	\N	\N
fe81b883-3a9e-4f84-8863-f7f626db51eb	2024-08-19	Giant Food	21.48	Uncategorized	\N	f	{}	71e9e0b0a5fe23302688b9c1b6099ac3410ee3f99a7a51f540dfaf349cc22f1f	f	\N	\N
40aff530-24b3-43b1-bfb9-031f470ea3e9	2024-08-17	Transfer from Checking TFR FR OTHER	-4.00	Uncategorized	\N	f	{}	d57e8b9c4a6c185ecd08b8fbcbc5f08d9c262f4d33b3cdec81b65a8abecdb2e7	f	\N	\N
43ffd949-878d-4443-bed8-3ffb48776905	2024-08-19	Payment to Chase	400.00	Uncategorized	\N	f	{}	75d0c42c0934148dc3776e35e6f395bfd564917a347fb7dedcb3b92455c2bf78	f	\N	\N
d398af08-41f9-45da-8378-3bd34d0a25cd	2024-08-19	- Visa Check Card XX14 - AA COUNTY LANDFILL SEVERN MD CHARLES R STEPHAN TRANSACTION	7.00	Uncategorized	\N	f	{}	d56a555b9d9014fe04d7d3639c57e34b94b4171c5267ce51513194e5a8ef90ae	f	\N	\N
6a92ad14-31dc-467a-bee1-623d355cddc9	2024-08-19	- Visa Check Card XX14 - AA COUNTY LANDFILL SEVERN MD CHARLES R STEPHAN TRANSACTION	33.00	Uncategorized	\N	f	{}	cd83228aed50ee2c378c73ca5df9de8b7a30ccec08d2142e4e6263aff2a7f56e	f	\N	\N
eecc358f-3fbe-445c-8ba8-6058e1973206	2024-08-19	Dunkin' Donuts	13.32	Uncategorized	\N	f	{}	9c0de4678e65cd6466f7380977f8d7ad2ee08c6cf21f4873e2ef35341bc4bd07	f	\N	\N
780b947f-0336-4843-8ef5-243b46188642	2024-08-19	Giant Food	6.14	Uncategorized	\N	f	{}	5a2b1113552c2fc6285ab286f0a5f758e9201be14ea388b7448353c5ff61d02c	f	\N	\N
7498a6ea-b3f7-476a-9daa-777c82fd995b	2024-08-19	Grammarly's	152.64	Uncategorized	\N	f	{}	26cd962d4a56a2e42c7b73848eea7cf4526133a1d2f7b8cbfadb66b79239fb37	f	\N	\N
04d54bad-9a6c-476d-9905-82aaddd79fc0	2024-08-17	Transfer from Checking TFR FR OTHER	-13.50	Uncategorized	\N	f	{}	f4550c158809a062b79a80a78f0479ae88d38c66fa804158c9f474ae2986a717	f	\N	\N
b60f394b-b119-4770-b522-c8a45f01ee9d	2024-08-19	Payment to Capital One	281.00	Uncategorized	\N	f	{}	67219eefc74e8f005119cbe3c6cd9ab0bd9087b224a66fd1cebd964a6676a46a	f	\N	\N
07d9428f-9e00-4f63-a8fc-a26643c0f200	2024-08-19	Target	15.00	Uncategorized	\N	f	{}	e3729ce013de151bd3ce01d58fa552018928315d08870b8bcde4b0935867012b	f	\N	\N
dee6e232-568e-4686-a54e-014f598145d4	2024-08-19	Target	18.81	Uncategorized	\N	f	{}	2c83265c6b4186922320e45d2c1848fe4bac7c8dfbd78f30d0985ecc48233d6b	f	\N	\N
1cee6806-0649-4ccd-aa37-11a7955a6075	2024-08-16	Toyota	900.00	Uncategorized	\N	f	{}	4d4fa26dbd0d1c6cc96bff4703a302fb0dae9784ebc796ffc8b8db56ba37b160	f	\N	\N
77d0aa06-7553-40d1-adc5-4da66dc79be9	2024-08-16	Payment to Educational Computer Systems	100.88	Uncategorized	\N	f	{}	db8e5cd0af12281d7986967b36bc376c9834b1e4d0408940d2d0e6f4c1caec01	f	\N	\N
398b68ca-8f67-482d-8866-1af50970f745	2024-08-16	Transfer to Checking TRF TO OTHER	27.33	Uncategorized	\N	f	{}	6e9a8360b630124a759b52a145d97a6eaed895431cea05f6abe87c0f2b6c47d9	f	\N	\N
3c7b4042-c43e-436a-a3bc-68f0114fad16	2024-08-16	Transfer to Shares TRF TO OTHER	200.00	Uncategorized	\N	f	{}	42727a70ad3b37127bf8897e7fee85606886ad8a2d445933c6ed8880ff59a1f7	f	\N	\N
4d1badc0-c092-40ed-b627-9dc6323fac84	2024-08-16	Payment to Discover Bank	326.00	Uncategorized	\N	f	{}	8da220fbc6823068b1763c7382bd34c882fe17fa4a7cc025db1f49e02c8dab06	f	\N	\N
d765901d-9010-4cf0-bd99-299c528a6623	2024-08-16	Payment to New York Life Insurance	616.54	Uncategorized	\N	f	{}	fd9b04ffed2bb9734df786a45b256805274fcbb712d882fadab15f783a5cb4ba	f	\N	\N
78d50fd9-8364-4a37-8252-f0c0490b25f0	2024-08-15	Subway	12.16	Uncategorized	\N	f	{}	14a80132e7137dc64fbdab13517d19fdd96a5a63cd33f475f6541d8111c1ca96	f	\N	\N
76e26867-e0f6-4af0-8432-34e6fafd41a4	2024-08-15	Target	46.64	Uncategorized	\N	f	{}	306c01a0f201df0c26df5363474296910f44eccd6a44ac4c30d3fc1cb095c707	f	\N	\N
d42447c2-e677-4482-aa89-7147c4294552	2024-08-15	Transfer to Credit Card TRF TO OTHER	400.00	Uncategorized	\N	f	{}	9fdfc49fb020c80456b198781b055f8c86103305f958529c6d0613cc2738b7ce	f	\N	\N
3e521d04-f47a-4be7-a42f-87e226d31fab	2024-08-15	The Great Cookie	12.77	Uncategorized	\N	f	{}	b5b4daf56d67979f58071bc431d2631d89e6bef1023012692d570fed3e0ffa2b	f	\N	\N
5f17f5e2-cf2c-45bf-ae21-8186606e3d57	2024-08-15	Deposit - HENRY M JACKSON HENRY M JACKSON DEPOSIT	-1751.26	Uncategorized	\N	f	{}	ca6204e0d874fffe29d5613b471add000fd165467d16dc34af27ce6e91edf88d	f	\N	\N
7086b2ca-b6ac-4ddb-b336-257889481561	2024-08-15	Wockenfuss Candies	67.79	Uncategorized	\N	f	{}	1d87599c8155e46cd952f3596d7322122235b48ffb628a56cfb2a092cce40deb	f	\N	\N
1788861a-e1b4-44eb-a826-99a015e10efa	2024-08-14	- Visa Check Card XX14 - KINDLE UNLTD RU3GXX6114 CHARLES R STEPHAN TRANSACTION	12.71	Uncategorized	\N	f	{}	8340dbb641a1ba8161ec030f9da3d8243f646217adf42b39a685816dfb4cb069	f	\N	\N
11020dd7-ed82-4580-be36-644ab5779051	2024-08-14	Payment to Best Egg	1338.03	Uncategorized	\N	f	{}	41ed4ee475f18a4e49a4c6121b6d7262bbb06b94a68724f42a0e72797ea45e28	f	\N	\N
85404208-fc8e-4d4c-916d-33bc542fd88d	2024-08-14	Microsoft Office Deposit	-4524.85	Uncategorized	\N	f	{}	805c93bd3127f2374b9c32aa0653e04237b4e6745b1cfcd5e33512d2e45f44fe	f	\N	\N
5ae8998c-ee72-4292-baba-ced7e3e33f7f	2024-08-13	Elite Sfn	150.00	Uncategorized	\N	f	{}	1314072f6e508dd03b8b58a89e2889911ffbb624863a44f9dd4923f817cda873	f	\N	\N
1495b6d1-1467-4cbb-8a07-5da1cbf3c150	2024-08-13	Sam's Club	43.25	Uncategorized	\N	f	{}	a387fcaac4b904d32b8a0dba611c528e0c98e85f91747103ff9c4afcbc37c312	f	\N	\N
dec684e5-d7a5-4fe8-8b47-39ea9df53db1	2024-08-13	Giant Food	13.97	Uncategorized	\N	f	{}	d3cad5092d459a234f2519f2cc1d954075d24dea3ae106066552a432e1042e01	f	\N	\N
4abc1371-2048-40f7-a5e8-96b6541d08ee	2024-08-13	Payment to Verizon	89.99	Uncategorized	\N	f	{}	7050965380f322347f744126f0b2d53145fe3882882eb3583d89fa41fcde9eb5	f	\N	\N
36c3526b-cc0a-476c-bd6c-a8e7f2575c4d	2024-08-12	- Visa Check Card XX14 - UNIV OF MD SCH OF XX6114 CHARLES R STEPHAN TRANSACTION	150.00	Uncategorized	\N	f	{}	2a74353c104f0b0fbfba406b83423e6842b8e5b7aac33740c0a1cd0c2b7cbf4a	f	\N	\N
cec3a072-5238-47a2-99e6-789a93ee460e	2024-08-12	- Visa Check Card XX14 - FRAMEBRIDGE HTTPSWWW FRAMDC CHARLES R STEPHAN TRANSACTION	100.70	Uncategorized	\N	f	{}	f4aa45c290eccd028eaad75a80f231505cb367440cf02189df08e73ef498722c	f	\N	\N
8ddbefab-49ec-4c91-a0ec-f7582fca01a5	2024-08-12	- Visa Check Card XX14 - ARUNDEL PRESERVE W HANOVER MD CHARLES R STEPHAN TRANSACTION	13.07	Uncategorized	\N	f	{}	431da57d50daf4c0d51cf5f8e602abfed5d317b562057aa45741ff07297be35f	f	\N	\N
d0fd5150-f240-4bab-a063-47c32e37662b	2024-08-12	- Visa Check Card XX14 - ARUNDEL PRESERVE W HANOVER MD CHARLES R STEPHAN TRANSACTION	41.56	Uncategorized	\N	f	{}	b949ee318ef5233779d57b21a0f63560ae33ef65f939a42a1a8df85185b4baa6	f	\N	\N
4baf2470-aae1-45e6-8b8c-655c1fef4d2c	2024-08-12	Giant Food	97.77	Uncategorized	\N	f	{}	d40ac0828c84ab75aa07f3b72820affabc795cae94a71700ae709815a7821cc6	f	\N	\N
97df827a-bbb8-495f-a16a-9957ff089f26	2024-08-12	Chaps Pit Beef	34.87	Uncategorized	\N	f	{}	5d8c8f588ec1b135483abcf307b8406e2f62b987672e03ff58894ca6776ad441	f	\N	\N
bd41999a-5aed-473b-82fc-2d6e90f548ac	2024-08-12	Giant Food	42.61	Uncategorized	\N	f	{}	68de67c9bdd550ef55f131c171a0bc9463dac3a2b1515cf455499154e6fdd169	f	\N	\N
307b735d-cba2-4d37-9898-1ac397f78b8e	2024-08-12	- Visa Check Card XX14 - INDEPENDENT AUTO C PASADENA M CHARLES R STEPHAN TRANSACTION	80.00	Uncategorized	\N	f	{}	fa5518e2820aadd9f8d2966c0b97d3547ded1ca7d1441751337f92dd2ee403b4	f	\N	\N
3ebe8e66-363b-4b28-bf5e-98f138cb885d	2024-08-08	Rangoli Restaurant	52.98	Uncategorized	\N	f	{}	5fc75b3e94330ff4791c223c59a90ec40653eca9154ec0603378de9370336415	f	\N	\N
fc30bbc9-4342-4c1e-aa4b-7fecbda5d61f	2024-08-09	Rangoli Restaurant	52.98	Uncategorized	\N	f	{}	0142d1596a1a9849abd9744704ab2bbd4accf8c76a5d8728e08f6e05b39c7fc2	f	\N	\N
47645716-2aff-4384-a15f-4cd28280ff39	2024-08-07	DEBIT-DC 6114 GETAWAY XX0021 NY null	55.15	Uncategorized	\N	f	{}	761756423bceeeeae4a2d3de7aea9807a42945a835239aa135d03b7b3e568d3f	f	\N	\N
91241f31-a050-48b0-a4f5-2a456601488b	2024-08-06	Parking Authority of Baltimore City	2.00	Uncategorized	\N	f	{}	f464ae0e8035f93f6b56924cdf41b4c8af544fc16c34e6ca1e66b7590c909964	f	\N	\N
225f7264-bad5-4402-bab7-72fba5aff95d	2024-08-06	DEBIT-DC 6114 VENMO *Claudaya S Visa Direct NY US	300.00	Uncategorized	\N	f	{}	b73ef28ceb3f931452269da958bd1b11ea65700e88bdc7cf995af64c5255ced6	f	\N	\N
5fae9190-dd4c-477c-882b-d87ea41b8cda	2024-08-06	DEBIT-DC 6114 ANNEARUNDELCO-UTIL XX-1144 MD null	158.53	Uncategorized	\N	f	{}	7fed284d52e525378bcaf74a7ed09bffbb48b7baf426566d0a0fedc37f1cc7ff	f	\N	\N
8f4e64ee-12be-45e0-8863-3958303cd2eb	2024-08-07	Lovevery	84.80	Uncategorized	\N	f	{}	33d55d6855a18bcdef357cfcb1800019339ff4877a3fc696f277d1cf477a9cf6	f	\N	\N
50c703a7-ede6-40ef-8c46-3352f96c99aa	2024-08-06	DEBIT-DC 6114 STATE HIGHWAY ADMI XX3199 MD null	82.00	Uncategorized	\N	f	{}	3e143a3f291db3a97fd3430311b6c9da32afd689d5182c403872f120d15db5a9	f	\N	\N
ad303804-0f3d-4a4b-a299-ac17d1158c48	2024-08-06	Peloton Cycles	46.64	Uncategorized	\N	f	{}	44ee73e3abe5580c7c9ab9c429675d926aadb0155d0cd3c12ddac57dcb26a7ca	f	\N	\N
8f6dae8a-d105-4be9-8567-6d5c4a7d7978	2024-08-06	ALDI	39.91	Uncategorized	\N	f	{}	cead9518d7a80d7dda394bce0563c7df24fcdc9d2c09dfe91133ab8904c1bf8c	f	\N	\N
d2577ffe-1901-4c36-a626-830a697f8eea	2024-08-05	DEBIT-DC 6114 OTF GAMBRILLS XX7925 MD null	275.14	Uncategorized	\N	f	{}	e9d5b81470472013536e19e66b70b71576f432d63206f2b6fa6c57af9aecebe9	f	\N	\N
0f45e004-115f-42c6-8d05-42e2bc33628d	2024-08-05	Giant Food	96.67	Uncategorized	\N	f	{}	b738b11eea54bbcfd6ce3fd4c79047a482ff65ce830f48efc1d4a3afd3628798	f	\N	\N
44470a9c-83dd-47f4-81bc-4f28a0d35eeb	2024-08-05	ALDI	78.90	Uncategorized	\N	f	{}	b2be6b68cbe144efd6a9f9581dc46c2b1fb47cad3a90a012570292f22e42038c	f	\N	\N
42503fe2-a9d2-4b9b-b73d-29ea81ce83a6	2024-08-05	LA Fitness	35.99	Uncategorized	\N	f	{}	4e4e81d7b901569bdffa71b61278169e12c52067a435c80ddf5efb566b176d20	f	\N	\N
3ac161cb-77f3-4e36-a22d-fb73aa267d5c	2024-08-05	ALDI	2.74	Uncategorized	\N	f	{}	f195127870028cd333949ea643dbb70df65fc048a280d82742f05ddbed03eee8	f	\N	\N
20931ae9-644e-44c3-b088-7729045b11ae	2024-08-05	JPMorgan	2107.66	Uncategorized	\N	f	{}	fd4e1b78ffdc02ae47eae0d530ba7b2ded518544a9b8003869fc65c561bd7ebc	f	\N	\N
936acd82-fd60-449c-8127-e977d0bbf54b	2024-08-05	Lowe's	2082.41	Uncategorized	\N	f	{}	8c2a03a9b7867e5042cfa2fde33c9a574152f5852bd5af6f690dfd4dcc750475	f	\N	\N
8514100c-412f-41c6-b8a3-151acd15db9e	2024-08-05	Payment to Chase	200.00	Uncategorized	\N	f	{}	2c273461ec947db91c0289cc5ba36451262f02f2ee72cb128c94d67da2ec51ef	f	\N	\N
79697c76-a9bc-43d5-8e90-24deda8e2cf0	2024-08-05	Transfer To Checking -2740	160.00	Uncategorized	\N	f	{}	074edda0491432102bfb9d0c4c869cef6388c60ab7657d4529709225fb607a7e	f	\N	\N
b220de3e-24f7-4b8e-b535-9f53ec8771f1	2024-08-05	Transfer To Checking -5873	100.00	Uncategorized	\N	f	{}	6b20c5f1f5d6aa2aab33b66e14e24d3eb2b702eb4da6b7ee7893fbab856097e1	f	\N	\N
bd45353f-f1be-4d4b-86c6-3e8f700f434b	2024-08-03	Payment to AT&T	200.30	Uncategorized	\N	f	{}	225f526f2149b76e9900c416adf730c5263f60f07442cfb7993b303ec0a2fb46	f	\N	\N
a00cd3a0-f85b-416c-a383-16f883e2d54f	2024-08-03	Payment to Amazon Prime	147.34	Uncategorized	\N	f	{}	d675954ccd1cf6355796b1645ffe5a3ae981f84d1bf55032e9f577449e45c349	f	\N	\N
1662bf68-4411-4437-ba36-3840bad22d1e	2024-08-03	DEBIT-DC 6114 TST*BEST WINGS N P GLEN BURNIE MD null	94.78	Uncategorized	\N	f	{}	df7546685fd34109fc6a447d656237292104d2feb0edd33e6a9ac13e54ad7463	f	\N	\N
44a4e274-1725-4cdc-98ce-c3775e80e2a9	2024-08-02	Sherwin-Williams	64.76	Uncategorized	\N	f	{}	2684cb56f9e829a8d36e6bedcd84db778a7766f9e2a15482ad35ba2162647621	f	\N	\N
2989669d-8627-4805-8a84-6574122ce6f2	2024-08-02	Ledo Pizza	47.39	Uncategorized	\N	f	{}	497a176012d6779ec97a4f035361bd9a9e42908760cb96dfdabb04a87f5c8b9c	f	\N	\N
945c9dbe-14fb-4c22-92c1-7d7b3c20acdb	2024-08-04	Giant Food	43.05	Uncategorized	\N	f	{}	c928dfbfe235d8dbfa9e5fa0a20e5af6c6531b4763798a6c4bc94abfd504ddc0	f	\N	\N
4f184140-55ff-464d-b94c-524abecc9891	2024-08-03	Sam's Club	33.37	Uncategorized	\N	f	{}	6006fc3b696c9d680803f9e69cddd907c51b36e7dd725546bfde08f56f5c2965	f	\N	\N
9875cb6c-602d-4706-b99b-a5eb09ee34a1	2024-08-02	Transfer To Credit Card -7148	500.00	Uncategorized	\N	f	{}	ba9c92b9e4dd78f01d04f9f493672e91eb81151199b20170f53d29c136269324	f	\N	\N
8dcb675e-69c5-4cbd-9107-3d19e2665610	2024-08-01	DEBIT-DC 6114 AACC-CASHIER'S OFF XX-2236 MD null	668.00	Uncategorized	\N	f	{}	f2bfb76cbe10393a9b4bb5b9c31f3cef3c4c8de58a61bec7229e4595ca746a2d	f	\N	\N
c9809f61-b81e-440a-b209-6fbc3be12a4b	2024-08-01	Transfer to Zelle	120.00	Uncategorized	\N	f	{}	3a4d10ec1ae29b862f2e5773ea909a1b24091411332c782379675d5d60299a77	f	\N	\N
2b556f79-c21f-42ae-9caa-0e7110a691c4	2024-08-01	DEBIT-DC 6114 SEVERN LIQUOR DISCOUNT GLEN BURNIE null US	31.13	Uncategorized	\N	f	{}	dae03d2c486470a0e73d1f742b6004d3d0c2edb34607b1bcc7833938ee1066d6	f	\N	\N
0a3f1422-de60-4eac-8860-0400d005abe0	2024-08-01	Giant Food	20.18	Uncategorized	\N	f	{}	19cd6da08ce69a1992f720b4e70434a0a9939d867369cb28c35c3020ab63dfd7	f	\N	\N
b2c980fd-8ef3-439d-a397-93b567928592	2024-07-31	Burger King	5.62	Uncategorized	\N	f	{}	d44733cba22c93fe3f3d4e704995538ea9fa757459919178e0df0f6f9b6ee33b	f	\N	\N
2c7c510e-f814-4998-afff-d5cde594c324	2024-08-01	Apple	2.49	Uncategorized	\N	f	{}	2c6a017f84284ce0cec205f63ffd131db87076f387ada12ce824b7d69be52597	f	\N	\N
50d6c4ac-e5ee-48ef-a21c-df98868bcb88	2024-08-01	Payment to Apple Card	1000.00	Uncategorized	\N	f	{}	fa95922466bc57585267f6e071265b7478e5e483a5dcda6902dd24ab9819ea7c	f	\N	\N
39754f57-04e2-4998-9b7e-eff7ae05d34b	2024-08-01	Payment to US Department Of Education	616.87	Uncategorized	\N	f	{}	b683f7b683dfefa6cf1fd5afb6c05ce46ebf17a0e3d3bb533655c52b5db042dd	f	\N	\N
e74203b4-21bd-4330-adc6-8d1db20ba5c0	2024-08-01	Payment to Best Egg	537.47	Uncategorized	\N	f	{}	25260cde86c15abc723e61143f3c13135dae09b9eb28c71b4e9b48382dc7ba61	f	\N	\N
ee04648d-9289-4e32-8462-082caf5f220e	2024-07-31	DEBIT-DC 6114 UEP*FORTUNE COOKY GLEN BURNIE MD null	15.80	Uncategorized	\N	f	{}	7cbda5778b1947b0bc67d7cc3c21f853a2ada7bc4e8826e5d4715ac8a480f228	f	\N	\N
a33c3465-ee5b-4b0b-9fd8-36f354b7130f	2024-07-31	Giant Food	13.98	Uncategorized	\N	f	{}	3034a78df4d21aa87be7db589eda023b00747ffc94ba88384f69fea7abe4a468	f	\N	\N
7f88cea2-9088-4a2c-9bb0-0770c1cc4ddc	2024-07-31	McDonald's	10.58	Uncategorized	\N	f	{}	70e321087c67d5325b01503b7906635802b3a1fdf2168f92a979d8878f7bfadd	f	\N	\N
93f289c6-a8c7-4098-83a7-e348432a7419	2024-07-31	Giant Food	7.41	Uncategorized	\N	f	{}	c6b50420a7afbcb08918495e79c0291285544cbe2ab8de13c189c5f1dedb6ffd	f	\N	\N
2a15d181-2b31-4449-a8c9-ba53e9e20678	2024-08-01	Deposit Henry M Jackson Payroll	-1751.25	Uncategorized	\N	f	{}	bafed74fcd94e918f0c61cbf891ae043bd4428792b6b6a16b5489755afc0314c	f	\N	\N
d12053db-1d71-40ec-93d2-6748742dcb37	2024-07-31	Interest Income	-0.49	Uncategorized	\N	f	{}	814e832eb144b86c35f0ee149f0ec682536decd81d75f716e46bfee2efc100f1	f	\N	\N
0ba56c9b-80f9-40c9-a5e1-5f708ac7c7db	2024-07-30	Payment to Baltimore Gas and Electric Company	266.00	Uncategorized	\N	f	{}	33488e5e9c446ebf1f246caac7863ea304573b21e35775bdf1d9ab5587563721	f	\N	\N
9af8a4af-fd15-4424-9453-813f4b4bdae3	2024-07-30	Payment to Citizens Bank	88.12	Uncategorized	\N	f	{}	bc4119ab5cc77b8ffe3f89b9f5d312918b40c9d814e8611a351aa7d2860b70f1	f	\N	\N
bca018ed-d1b7-4993-8ba6-7f52c7721c2b	2024-07-30	Microsoft Deposit	-10391.11	Uncategorized	\N	f	{}	bdac54c57fff8562d46ca669b7b922bd7510110ba1effc16127d1e90e3aea379	f	\N	\N
c3f286e3-3edd-46f4-8cea-61370b096874	2024-07-26	Transfer from Zelle	-120.00	Uncategorized	\N	f	{}	225ee843f92e3ea044487c1dd10241e75aded0f1c2eb76f8cf0ecae820f13b04	f	\N	\N
3527eb9e-8768-41d0-bae4-ac35b3fd0eb1	2024-07-25	Payment to City Of Sedona	2.00	Uncategorized	\N	f	{}	d6de864d88215244a833b3eb974ca53c7c3dabb354dc786d34d85927adf5ccb2	f	\N	\N
11815017-15e0-48ac-b39e-06f77b0d5cf6	2024-07-24	Payment to Liberty Mutual	202.86	Uncategorized	\N	f	{}	cf4c9f57a5a7fb80fb61f7ed948c0bf5ddc4a09d53dc1d822a361f9d3e15f5c0	f	\N	\N
7a218cf2-c448-4cd5-b355-4fa5b5248b1e	2024-07-22	DEBIT-DC 8678 VOVOMEENA PHOENIX AZ null	12.00	Uncategorized	\N	f	{}	6203ee7c79f18998bcca68ec333c95fd4a1d19d525686846981b2931d725a236	f	\N	\N
0ba178ac-9e84-46fd-be4e-7ea846680a88	2024-07-24	Returned Item Fee Check# XX0001	29.00	Uncategorized	\N	f	{}	ef6f9fa4d23398fc851f23382647b563255f5123afd09374afdb3b0dd9fbb2bc	f	\N	\N
efc424bf-7517-41a4-b06d-7a94f1134736	2024-07-22	Netflix	7.41	Uncategorized	\N	f	{}	80fd49eb7d6182e8ae7a3bf9272a3d04e1ed95786725ae79312c3f244677e41e	f	\N	\N
15d9f0ca-b4fd-4145-a59b-ee26be85908d	2024-07-20	Ledo Pizza	20.12	Uncategorized	\N	f	{}	01089e1a35c53d64b212774e963096e8f4443c267e8994aa13baff44932dc9ce	f	\N	\N
a2684a3f-d436-4f8c-8144-877bf171f3ad	2024-07-20	MIKES	18.08	Uncategorized	\N	f	{}	6a9aaea83f36c886534a815b6b04991bb2718f88565f44f31058e16d6eb4ad76	f	\N	\N
0878d8a0-6cc0-4b0e-bf95-6cab96f83961	2024-07-19	Popeyes Louisiana Kitchen	12.70	Uncategorized	\N	f	{}	ef4936a1f3d0b03d19ed5cdaf6f50a62a6f2cf35ed3d026cf8f94447f8946191	f	\N	\N
badbe783-c9ef-424c-8202-898f5cbdb203	2024-07-18	DEBIT-DC 8678 TST* PITANGO GELAT BETHESDA MD null	11.20	Uncategorized	\N	f	{}	29da18937adf15377ced2bbf1d13a5bab67191fe26096e14e5a7d55ab6ab5616	f	\N	\N
efba7c6d-680a-4962-bb73-ec6384b80f60	2024-07-21	McDonald's	11.09	Uncategorized	\N	f	{}	a6905003efdfa97480994e37627dc709b0417233414c895b0c8dd5d52542dd87	f	\N	\N
225f3352-26d3-419e-a244-7c8fb8622d72	2024-07-21	Rise Up Coffee	9.21	Uncategorized	\N	f	{}	4cd9a9dcc34d99089e9d795c96ad7e6938ef1e510969cbc0249bc988831bf9e8	f	\N	\N
a7f532bb-ca3f-41df-9a9c-a570e569277b	2024-07-19	Apple	7.99	Uncategorized	\N	f	{}	4764abb9fb665392ab15356a4e8fd92a4783ab2c38723fcfe423c2f9359693b8	f	\N	\N
7d34a3bd-e13d-4542-a0a3-6b7ca12d7118	2024-07-18	Payment to Piedmont Natural Gas	6.00	Uncategorized	\N	f	{}	f4cacdb7c2c04baeb28a367d3c3103e3e300e1857de4365713460844aae8c126	f	\N	\N
569269c1-3f0b-4ae7-9659-95126b86cb56	2024-07-19	ATM Rebate	-9.00	Uncategorized	\N	f	{}	e018091967ea0d3f39e0a9885b2b9771ce682c2fedb267e70555d08bafbc6e18	f	\N	\N
3943b23a-d6f4-4cca-8486-5688eade72c0	2024-07-19	Payment to Best Egg	1338.03	Uncategorized	\N	f	{}	f9c2398c655946e6ffd07073be392e7d25712c15ac7efbc33255366a2e284a08	f	\N	\N
292830f9-70ea-4bb6-a02b-002d20931d9b	2024-07-18	Moby Dick	30.00	Uncategorized	\N	f	{}	dd0755e60627d0084cea484d1fabd1b78f2aa7665a86a16751633565098e5337	f	\N	\N
578b1201-1efc-4063-90b8-255c903d83a0	2024-07-18	UpTown Cafe	12.10	Uncategorized	\N	f	{}	38ae0aeed61364c3846af02875c35825c814bcf9becd566b82f78a0f2f48e2f9	f	\N	\N
d884f89f-3a07-478a-b7f5-ca9b9bf910f5	2024-07-19	Uber	9.72	Uncategorized	\N	f	{}	eb2d89c5ac3314afbb3d0facfaa0112f6c374cb3caef6a27f764a2b3a302eeb3	f	\N	\N
67747420-7cf3-4bc9-a41f-8cc4e6aac959	2024-07-18	Payment to Chase	450.00	Uncategorized	\N	f	{}	3a4a9e1b49a6f3b097e5fe2432115cddadaf6d25dacc60a7f4d39e1d721039f1	f	\N	\N
d235954d-2207-450d-a5cb-aeec2f0fa72d	2024-07-16	Trattoria Caffe Italia	159.82	Uncategorized	\N	f	{}	1ec09fba08aab663c74380c1e704f2b5dd3c2003cf2a1c2ea93e8e9c0360b5b1	f	\N	\N
2dbce36c-9838-421a-ac32-bb1cc559d018	2024-07-18	DoorDash	37.52	Uncategorized	\N	f	{}	37509ed25e0d7743029b483f8d9ff5f40f019c64d18849999d123bdd72fd1c17	f	\N	\N
7002ec6d-b795-47e2-9be9-cf326b1a552a	2024-07-17	Beer Wine & Co.	25.05	Uncategorized	\N	f	{}	4b2aa9512a7b104b179d3028b1e6831cc629063c4506da24158f29ecb052faf8	f	\N	\N
bc14c203-9bf7-4de0-a64c-5d475a3164e1	2024-07-17	7-Eleven	22.40	Uncategorized	\N	f	{}	74119da144c2e361ecb3ac9f53ea58ba00b428b72a5d1d0f677b0dd49865ffd5	f	\N	\N
205d56a2-0676-4b93-9e41-e906575b84be	2024-07-17	UpTown Cafe	20.64	Uncategorized	\N	f	{}	2b4faefaabd1448127fe57f0b3830908c7469aef431a069637f27a93fda8acbc	f	\N	\N
1b63f6e2-57b7-4999-8a44-ecc9f7963e89	2024-07-18	DEBIT-DC 8678 GDP*FRENCH PRESS Bethesda MD US	20.00	Uncategorized	\N	f	{}	8ad5a3c376dd5803e1109869cc1286cc7477a9a928b7e2d856d933f06a69836e	f	\N	\N
8759c982-d245-4a01-86b4-d41521be06ab	2024-07-17	DEBIT-DC 8678 PARKMOBILE-MONTGOM XX-9036 GA null	3.95	Uncategorized	\N	f	{}	f16993ab7f9209ab482e9ac86d9bfb273c2539744b7757d074bc7c21c9d8df90	f	\N	\N
bc8b2940-e313-49a2-95e6-f0d499626a95	2024-07-18	Deposit Henry M Jackson Payroll	-1709.20	Uncategorized	\N	f	{}	fd66337af556e78a051a4d87f28f7bfb9137e275677c6052c1144fbe78eccb89	f	\N	\N
6cfa1ccf-bd5d-4d19-b881-f38bb2ac0316	2024-07-17	Payment to Capital One	274.00	Uncategorized	\N	f	{}	ab7ed8df00faa01f6cf8e15336c4d33ce844e0e7139bd290698af100061dbd02	f	\N	\N
d0f60457-feed-449c-a0d9-09b9def35dd2	2024-07-16	Sam's Club	43.10	Uncategorized	\N	f	{}	6a321a1c946e97785559b9ee4b9ade6cfe167d7e99dafb176b508a543ee6dc27	f	\N	\N
64489d93-5e56-49a6-8e31-f1ccc4386dd7	2024-07-16	DEBIT-DC 6114 TST* PITANGO GELAT BETHESDA MD null	30.00	Uncategorized	\N	f	{}	e91617dc55dbcd930fd0e1990db005dbe914aa26cdae6968e94a4e3e6563880b	f	\N	\N
6b309373-2a05-49c3-ae9b-a5e7621bee75	2024-07-16	World Of Beer	18.30	Uncategorized	\N	f	{}	593ea3a46e3582c64219ed75d97f6d8338348d9c60b5666494fa58b7be7e5410	f	\N	\N
5ccaac11-2e99-4bff-a85d-d14c57332e71	2024-07-15	Sarku Japan	12.02	Uncategorized	\N	f	{}	9a42d4aafe3c565a72a4589fa4d6c09c89a846c8b8eac59c724d674796c4c804	f	\N	\N
eff4f49b-aea7-4555-851b-5715bd5a97b2	2024-07-16	Garage	1.50	Uncategorized	\N	f	{}	0b3887f89f0d02ab59e8bf8dd48d5c1cb8d79880bb2bd1cf10a555bb68b43fd4	f	\N	\N
46638034-65a4-4680-9201-db64e9e94d39	2024-07-17	Returned Item Fee Check# XX0001	29.00	Uncategorized	\N	f	{}	9c1acf22d6f2cb4afbcb56bcbb9212a99189c866d16612b05965cb7392dafbbe	f	\N	\N
2af8d5f2-1b79-4846-adce-0651899ad27e	2024-07-16	Toyota	900.00	Uncategorized	\N	f	{}	d550a17e50dd2bd36582686be4101c788d6ab1718f91126b470b7f773bbb4ad0	f	\N	\N
a3665494-13ed-4a1e-95c9-f24ade14ec03	2024-07-16	Payment to New York Life	616.54	Uncategorized	\N	f	{}	25b7aad9c1957dd17531966bb9d98cf6c91e54bb547b011a16db2eeeb333a1af	f	\N	\N
039a7fa9-aca5-46da-9822-29aa212d218d	2024-07-16	Payment to Discover Bank	331.00	Uncategorized	\N	f	{}	726129a0d584506c610b65b17aca690d32b6bbb8cad1e0b4ae40188880f90caa	f	\N	\N
61f008cb-03c5-4f07-a75f-ad65327b1879	2024-07-16	Payment to Educational Computer Systems	100.88	Uncategorized	\N	f	{}	9c3fd669959976b6bd289d7a8cb986203be0e28ebcc652916de6ecca54bb8b2f	f	\N	\N
d9d6d5e6-3731-4205-b215-eb269e90a873	2024-07-14	DEBIT-DC 6114 TST* FOUNDERS TAVE PASADENA MD null	51.94	Uncategorized	\N	f	{}	25c49a218998b616d80f658ddbac0a70e3dabe9eb30b8d44de846f2ea1657fd9	f	\N	\N
442e1872-5a43-4584-ba81-65f679be44c3	2024-07-15	Francesca's	46.53	Uncategorized	\N	f	{}	9ee456197a1de78da7bd592621a32a73afa1d06ab70c6f5352477d7f3bccbaf4	f	\N	\N
8fe98db4-f1ea-4812-ba5a-4b5ab7712d5f	2024-07-15	Wockenfuss Candies	45.37	Uncategorized	\N	f	{}	5c5acdb581607cb7158d8f8e2656c09fd26c3fba99af3ca37a3324ca9e54ebe0	f	\N	\N
542d37d6-9907-405b-bce3-9fed5efd78f6	2024-07-15	Target	42.39	Uncategorized	\N	f	{}	0929944a7a6332695aea72dcc5d6340f7fcbeb2d424e24a2ded2b05529468dd9	f	\N	\N
7acc236a-0f70-4901-80c2-b77f5fbceab3	2024-07-15	Target	30.00	Uncategorized	\N	f	{}	ebf593efdd06f1d7b7c1a7ae8d664ea4df6ab7a7580271d566db593506a67e04	f	\N	\N
e8d6725b-ceef-4084-be60-c577b7fdbe6c	2024-07-14	DEBIT-DC 6114 SAKE JAPANESE STEA XX0150 MD null	27.51	Uncategorized	\N	f	{}	b8a7d5e0345efdbea849ebf3b061e38b03c319cf56f95ba6f1834e381a9ade17	f	\N	\N
9b8e52c6-2382-44b0-b068-cd62d54e0841	2024-07-15	Rise Up Coffee	6.63	Uncategorized	\N	f	{}	32a6d5386c79108b3a40b2c53c67fc15c406ee37b3f8f6587c09b0579e12a56a	f	\N	\N
3e8d968a-04d2-4dad-98a3-0fec8bb22990	2024-07-15	Lowe's	600.00	Uncategorized	\N	f	{}	4918e6caca9bf4913794ac19fd2bd1c82fe137c5c0e5d42442e4f4384d9a4237	f	\N	\N
7476a465-8414-4e18-990a-0bb982e44535	2024-07-15	Transfer To Credit Card -9005	400.00	Uncategorized	\N	f	{}	64f50626aa3d5261097c93f8070cd1eeb22e284e83b1ed15edb5e071fc04b00e	f	\N	\N
5b481a54-20ef-4cd1-bd4d-8845c38ecdf6	2024-07-13	DEBIT-DC 8678 NUNABABY.COM NUNABABY.COM PA null	318.00	Uncategorized	\N	f	{}	46ec012d1822355bf26d9057c6fafe103ec473bac833fa037dc26d51cf2955c1	f	\N	\N
1c739e69-8237-46dd-b0f0-ee1c583316b6	2024-07-14	DEBIT-DC 8678 SP HARPPABABY WAN CHAI null null	157.50	Uncategorized	\N	f	{}	65519c58496af9bcc7c8f21d5c090b58c6be04fdc03854bdb12aed4f877dfc3b	f	\N	\N
c38be149-a823-4fce-b94e-5e9dec3d1d46	2024-07-15	Sam Edelman	79.49	Uncategorized	\N	f	{}	15849b51dd53c64732c773f9bc2a19ab8caea9e1f1876826708af2a25fc2a937	f	\N	\N
3a7be920-e345-4807-b913-aa156da534a0	2024-07-14	Target	68.42	Uncategorized	\N	f	{}	5dbf6d853146767608abc46d0db7745dcf0d020e5d7bc11723ddf66e034feba8	f	\N	\N
cae5ac7a-cbf9-4608-ab69-86cf99a3fcfd	2024-07-13	Rise Up Coffee	29.68	Uncategorized	\N	f	{}	e603f43941db0230a55824d7e8702bd465b2e26e071914ca734b617c2d24fc74	f	\N	\N
c830b0b2-6f2f-4c79-8d23-433f7f1d54b7	2024-07-14	DEBIT-DC 8678 GAR SWEETWATERTAVE HTTPSGREATAME VA null	23.99	Uncategorized	\N	f	{}	713536a2500b01affe69f4cb4778946d3086808daac4858ca60b52b8c835e0a2	f	\N	\N
07352dec-c07e-4ba4-8e14-53015e84721f	2024-07-15	Harris Teeter	23.96	Uncategorized	\N	f	{}	5f2fd4d03706e0adbf6f465e683888160800144da7e5454a4d654f29cc11c5ae	f	\N	\N
fbdfe76d-2d07-4e62-846b-ae779d5ef883	2024-07-12	DEBIT-DC 8678 SKIPJACKS BALTIMORE MD null	20.00	Uncategorized	\N	f	{}	82943610b7a63478628dd230558b21c6e0da8c474448e2eb28e8993d0fc3db44	f	\N	\N
86d25588-5e68-4d90-89ec-ef114b6be5ed	2024-07-13	DoorDash	16.28	Uncategorized	\N	f	{}	3ca5f4f32ae22e92072138dd24a3dd9cc932de556c18f8e2cec4c40856d8efa3	f	\N	\N
5440f3f1-172f-4a2d-bbc4-5a7eb158ae6c	2024-07-12	Taco Bell	15.87	Uncategorized	\N	f	{}	c23693a6325a8e4fed820ae72d46aa7aa528f871a52b579b258af48db57ee05e	f	\N	\N
825d46e5-448c-49a6-ac99-dbf3007abe95	2024-07-13	DEBIT-DC 6114 STOLTZFUS SOFT PRE ANNAPOLIS MD null	14.85	Uncategorized	\N	f	{}	33a3f9a471ba543f20685a7ab283b6ddb040c0a0ca8edb66b648c2ddb8602182	f	\N	\N
9abffbeb-79ac-46dd-a34a-a030943fde2f	2024-07-14	DEBIT-DC 6114 ISAAC ALLAL LAUREL null US	13.15	Uncategorized	\N	f	{}	4d27dc4f7747cff7ee1041cbad70dcb157f79e7425a3b0313c387137a48ba2f6	f	\N	\N
df61c627-4ed5-4fec-bf62-3b681aa847bb	2024-07-13	Amazon Kindle	12.71	Uncategorized	\N	f	{}	110f7b147259a0d8c04117c783c4e5855cd184e7330b7066d8486ddc9ec213a1	f	\N	\N
26754d65-8f5b-47bb-a919-a0a3f44bd445	2024-07-14	Harris Teeter	11.49	Uncategorized	\N	f	{}	4ca0626a30bb9c35bc43e2844e2621311872ba84d5638de09bb37417f7491efb	f	\N	\N
f772f17b-3651-4bdc-bdf2-e542a847b1cb	2024-07-13	Wendy's	11.12	Uncategorized	\N	f	{}	dfbf9d315f9bb3a126f387fd841d6b7d5d8d0d6850758a2047ac4ef0810ea4be	f	\N	\N
5e17de94-f969-4610-aec9-2e2d23db555c	2024-07-12	Target	8.74	Uncategorized	\N	f	{}	5ebaeeb3c426f10cbbedf64b9323173fed916c82ea256831e51da43642523230	f	\N	\N
3e04097f-1990-43e9-984f-6c88e04cd0c3	2024-07-14	Dollar Tree	5.23	Uncategorized	\N	f	{}	5078feb684e0a79c0abd30adebd67085dbe4cd338e92c48eda75c1e4ad20bb1a	f	\N	\N
ac60510a-fdef-4d21-b88b-9cdeff8700b2	2024-07-14	Intl Transaction Fee Visa Sp Harppababy Wan Chai HK	1.58	Uncategorized	\N	f	{}	531fdff09d5c510cb33f0b88c9574b1e3dd4c6f76a277577c1c60b135bf6c11c	f	\N	\N
4e07d47a-e96a-4cee-8b2b-f7dbde26d390	2024-07-13	Transfer from Zelle	-460.98	Uncategorized	\N	f	{}	d789cb88341670d221e8d81c1d0e778ce38a120594bcdaebd0b830a9fe21c57b	f	\N	\N
5decbe4d-eb5a-4bef-880e-1777ec0f41c5	2024-07-12	Amazon Marketplace	-148.39	Uncategorized	\N	f	{}	d857f91769fd1589c7f32eb49188f41c9b88b81651f4216e06a262ed31ef0d44	f	\N	\N
582f8cec-73d0-4057-a776-bade62d263c2	2024-07-12	Payment to Verizon	89.99	Uncategorized	\N	f	{}	4b20ae61cc2eec328453b32bae9f2cecbbb58714b586a927d98b22ba060852ac	f	\N	\N
c01c83c1-ad89-4ef1-bdbe-8e0d4898edef	2024-07-10	DEBIT-DC 6114 UMMC MIDTOWN - PAR BALTIMORE MD null	3.00	Uncategorized	\N	f	{}	698af17796035e4a3e33f89d6d5e5a41d6a5e1b890f937c1b4409bfa1b62b1c3	f	\N	\N
1eea214b-9893-40e6-aa76-22baef7d720e	2024-07-12	Microsoft Deposit	-4524.86	Uncategorized	\N	f	{}	b837e402e573161ec4f3a127001cd4152b26de0786002f44221e3f295a9e8bb4	f	\N	\N
cb40a30c-adef-4c13-ab8e-4d8a3e875641	2024-07-11	Etsy	5.30	Uncategorized	\N	f	{}	3f406c519ae34151a2e9aa461578ef640d42b861eb6ccf7deec9b9a416e515cf	f	\N	\N
6f4a80e8-bd53-4768-b940-f806c5616b94	2024-07-08	Pizza Boli's	11.65	Uncategorized	\N	f	{}	0a677050a519f79c4b0f6b1ae31cc8b3bac81efacfc89c5608e29ed65881e896	f	\N	\N
a929b137-709f-4985-94d7-138fdaff0370	2024-07-10	Returned Item Fee Check# XX0268	29.00	Uncategorized	\N	f	{}	4ceeaa655f623fee7cf132074cb52acee87812127241732c85adc7f5e2ec23a6	f	\N	\N
b7cd40f6-1e15-47e5-a83c-7cd0727789ca	2024-07-08	LA Fitness	23.47	Uncategorized	\N	f	{}	4d2be89efd89a5cfdc9b2e341a938f785add77caa5cfd185d0d6aed99eed350d	f	\N	\N
ad32b790-6c39-42c0-80ce-83e114f69c39	2024-07-09	Transfer From Checking -5873	-50.00	Uncategorized	\N	f	{}	a52717b8ccb9248c8eaf89252b43f2e4852f74d09afaf51e3163c914452358f9	f	\N	\N
74578818-d9b8-4de6-a4f5-e09a68fbc515	2024-07-06	DEBIT-DC 6114 HOOPERS CRAB HOUSE XX0154 MD null	195.90	Uncategorized	\N	f	{}	79340817fd1ecd558b05cbdfd1753678b9166de6e5c8088611798da191f1dddc	f	\N	\N
65fa9f66-adf3-4e57-94d7-8ee397989ab7	2024-07-05	DEBIT-DC 6114 TPX-MOC OCEAN CITY MD null	112.45	Uncategorized	\N	f	{}	620857af2854e1c143577a47e1487d41094a4b6e398b23825691c53f2f19a5e0	f	\N	\N
91458518-f253-4c71-aef6-192b11c0535b	2024-07-07	Giant Food	75.06	Uncategorized	\N	f	{}	9771bbecf340c8b896a8b40aa4d93f73068418d909ce60d1f9619014d87319e5	f	\N	\N
aabee62c-8b6b-436d-9945-f2a772fbc67e	2024-07-05	DEBIT-DC 6114 ROSEFELDS JEWISH D OCEAN CITY MD null	75.00	Uncategorized	\N	f	{}	3e21a3a5f98aa0a2a0c177eb5188937538cb2494a13da947f3431fbddae39566	f	\N	\N
50a8c1a2-059a-4da7-8bbf-a6a015106460	2024-07-07	Harris Teeter	71.96	Uncategorized	\N	f	{}	38e6deabd5ebb469c25eb4fd23f40d61a7ad1c2e9daa053a0fc7600603d7636f	f	\N	\N
c74b933f-2c08-4739-9e59-965a889b0213	2024-07-07	ALDI	59.93	Uncategorized	\N	f	{}	47cbd0f22c7a0f1187e603c6d1ab6bfba59b5bf78de1573a9e977ad1749e7111	f	\N	\N
5bf877cc-198e-4016-9667-93f7904effc3	2024-07-06	Trattoria Caffe Italia	35.66	Uncategorized	\N	f	{}	4c558c080c51323767495255135ee4963df5db8e54e4786f19a86cf7401654c8	f	\N	\N
b0ee7aae-b306-47b8-80f2-e35b18ac42ef	2024-07-06	Chick	27.41	Uncategorized	\N	f	{}	29a5b811bbc6be4ca3f5e4c5e6c14a18ad6044e5d7288ed6a07caa51ba0e6f5a	f	\N	\N
08935120-4cc0-4e84-b966-fd37e004fe7a	2024-07-06	Parking Management	21.00	Uncategorized	\N	f	{}	2b3d9513c8a1ebc42b3b45fae0a12067c82c804a049ad16cca715eaf86b4a300	f	\N	\N
5dd6cce6-6a6b-4b07-8223-77d18de250be	2024-07-05	Rise Up Coffee	18.60	Uncategorized	\N	f	{}	74be7f47e8603dba8920504a568802adaee9328c8e37392b71857931d7ac0e98	f	\N	\N
c3dae589-5f9e-4177-b3b3-623bb9057907	2024-07-05	Rick's Market	13.57	Uncategorized	\N	f	{}	126c3eb07d4356ae8450b482fc4e330e24edd8597eb7d335d56040b14e3ece82	f	\N	\N
14589359-da99-4751-9f81-fec5ffbf65b9	2024-07-06	DEBIT-DC 6114 CANDY KITCHEN - 93 OCEAN CITY MD null	10.18	Uncategorized	\N	f	{}	571b6588cf1b87d509d09287423362b938089c0b4cef0bdd9d76c8531e84d73d	f	\N	\N
2fb74366-ceb3-434e-929b-25d6b7a3ff47	2024-07-05	LA Fitness	10.00	Uncategorized	\N	f	{}	a639d691acbec321f306d9e86d1837a7b8928e7e365c654984d73eb685d681c2	f	\N	\N
d4293510-2d3f-43bc-b06d-a3185afd97c0	2024-07-04	DEBIT-DC 8678 CANDY KITCHEN - 93 OCEAN CITY MD null	8.82	Uncategorized	\N	f	{}	2ddd73723d2099b798d2443954ea11c1fd10b52b714ba3c579397376e373e977	f	\N	\N
558f6fde-91e5-4456-b65a-557202f25142	2024-07-07	Rise Up Coffee	7.09	Uncategorized	\N	f	{}	f3f30d2ebfb9449101479c34fcf0addf982a99dede1e6fbd95663951d726347c	f	\N	\N
8cd3c3df-f02e-411c-8bb7-f5b16aed7335	2024-07-06	ATM Withdrawal at Payment Alliance International Ocean City MD	123.00	Uncategorized	\N	f	{}	af177457de14f3fa25dcbfb89d914d1dc2a6b7456064e11dc3f27574bc982f2a	f	\N	\N
ff5ec388-af10-4c28-a354-4387d8fa94cc	2024-07-06	ATM Fee - Withdrawal	1.00	Uncategorized	\N	f	{}	21def5b81f5d0bd03abd0bd8cfb2c1e0e18d99f6a5d7f3553ce2eff3dc359fa1	f	\N	\N
aa5293e2-5c31-45a6-b5e8-6209324f789f	2024-07-06	Transfer from Zelle	-275.00	Uncategorized	\N	f	{}	495adfb330dd5e2281fee90fa277e9742cbfac6925effeceab813dc400990923	f	\N	\N
d62d6c26-1182-4059-9959-3cb144e36d68	2024-07-05	Transfer to Venmo	20.00	Uncategorized	\N	f	{}	c91156318e6e21dd3a79320eadf5a04098957705e3b26a8bb6911e246dbe9974	f	\N	\N
f762ca54-135c-480c-80ad-c0666509fdc1	2024-07-03	Airbnb	360.74	Uncategorized	\N	f	{}	53808a2deac61e4280656c9fe9903baeaacd17493b2d570d6ef33e5bd43f6b67	f	\N	\N
051921d8-db53-48fb-b936-f9c0969c7e3c	2024-07-03	Payment to AT&T	200.20	Uncategorized	\N	f	{}	d7da66f506e602c89a472733c07c45c2128801a3eea2ad7fa7a91137c180c2ed	f	\N	\N
0dd1aa43-ce7c-42e7-a89a-6cb12eab6e87	2024-07-03	DEBIT-DC 8678 CANDY KITCHEN - 64 OCEAN CITY MD null	103.85	Uncategorized	\N	f	{}	68a51ec33ce0aec2349ab578c684987ed1d2435b204d8ced4e3133cf965dd48c	f	\N	\N
bc755335-b082-41fe-b921-e20ba6762d05	2024-07-03	Rise Up Coffee	35.00	Uncategorized	\N	f	{}	b22c91fefd4cc236c149231adf36360918fad771f56d2607d62650f5609fcc90	f	\N	\N
0b0de02c-3355-441d-8aec-0779f258d8fc	2024-07-03	Rick's Market	20.83	Uncategorized	\N	f	{}	2401d82a7a03621cc9349885ac565a5d8446375b92ae82c2826f9384acffda1f	f	\N	\N
4871dce4-2da4-465b-9a56-9185dab90f64	2024-07-03	Rise Up Coffee	12.72	Uncategorized	\N	f	{}	44cf97342a67dd6b2f78d594745a5b80814a5d697ffd1868f956bb695d9c68ff	f	\N	\N
b17bebfb-628d-4b31-b3b8-262c595ba17c	2024-07-02	Wendy's	10.14	Uncategorized	\N	f	{}	4df945892ae696466616115cbfa7983f982edcdc4aa3f3f45c100d67e5781914	f	\N	\N
becd7b08-71bc-4b42-8545-046cf4930697	2024-07-03	JPMorgan	2107.66	Uncategorized	\N	f	{}	791e53e3e54206193cc6f0446203babd6736ecde7ecacc59507215912bb11d33	f	\N	\N
30860d5d-b9a7-4e1a-af27-2a6bf8d3685d	2024-07-01	DEBIT-DC 6114 SEVERNA PARK COMMU XX5843 MD null	260.00	Uncategorized	\N	f	{}	2e4a6e17f892e2e301dbf486c85deae8e8c26b7af08bf9c13d33778c1042cbd1	f	\N	\N
715b8fb5-9679-48de-8ebe-be0a9b4b4df3	2024-07-02	Sam's Club	178.81	Uncategorized	\N	f	{}	148477472d655e4b05985e4079d2bccefd6da919eb44a1c69c7c35afbbf389a7	f	\N	\N
1b847816-8e1d-43c7-a595-b015863548cc	2024-07-02	Target	97.11	Uncategorized	\N	f	{}	a3a0f707be75bc35ad893149db4e1ee655b3e20e8ac28a8ad9a8edf9c2f50f4c	f	\N	\N
2c951321-d77f-4c9e-b1e6-a421aa67376a	2024-07-03	Deposit Henry M Jackson Payroll	-1709.21	Uncategorized	\N	f	{}	b91c228caa01a407bd71d8ef5c0425afe955dfc83182ae9b46aaf55ab95e5caf	f	\N	\N
5f97b0f5-7687-42be-a012-72aaa704fba5	2024-07-02	Payment to Apple Card	205.53	Uncategorized	\N	f	{}	809990c02eb7f5c6d2ccfa0fafb4228e80cb7f339942b643afb9130fd41f5a37	f	\N	\N
f993f4e3-8a4c-4f5c-8360-62ae56e3b110	2024-07-01	Amazon Marketplace	332.41	Uncategorized	\N	f	{}	f838ecfa096ae359154a08c5bfb42100596123eff7358eec0d1e245581b76ea7	f	\N	\N
f1baafe1-183a-4b59-a753-c8262788eec8	2024-07-01	DEBIT-DC 6114 AACC-CASHIER'S OFF XX-2236 MD null	100.00	Uncategorized	\N	f	{}	6f530fc8933b84037db28ddcb4852f5c57d3b9bed4aa453a8e6392135db9993b	f	\N	\N
bad6d7bb-5c4f-4728-9e27-6ec72aa5732f	2024-07-02	Airbnb	90.19	Uncategorized	\N	f	{}	4543949e478723f43b177d1373b611b073e613692a4b82cf7f58c8a82c64d5ae	f	\N	\N
c33cabed-e4dc-4233-9eb1-07871cf77fc6	2024-07-01	Amazon Marketplace	79.45	Uncategorized	\N	f	{}	552725b33964c67560fb49b8eed90ce582da4b7e71b3659b79a12074c79cab21	f	\N	\N
0e847d42-e47d-47a7-bdd7-d40c20d10535	2024-07-02	Steam	13.79	Uncategorized	\N	f	{}	c7f6ae0636d9aaf2f8cf36a7a38299f215aca349a4e81d77c6e5bb8d2a3f2df1	f	\N	\N
ba9b39bc-6159-4541-9bbc-db1fe91d543f	2024-07-01	Apple	2.49	Uncategorized	\N	f	{}	bbeb33e015de43228f535bbcae69410a2469a99362447d793160b15410675e43	f	\N	\N
127b4fea-b3cb-4f64-b7ef-1127371cc2ad	2024-07-01	Giant Food	2.29	Uncategorized	\N	f	{}	719fc4f88fa2023b65cc37a9ae119389b1f53b9be72b1dede46ad3bdcebd2ff0	f	\N	\N
14c119c4-c5a5-473d-8a46-94545416c28d	2024-07-01	Payment to Baltimore Gas and Electric Company	266.00	Uncategorized	\N	f	{}	e9a368f891873586d9c25172dcea9c829c6749ae8c8b1a66457ff8144ba2d6bb	f	\N	\N
378a5cc7-a32b-4788-b3f6-282f0ca4e962	2024-07-01	Payment to Chase	200.00	Uncategorized	\N	f	{}	815d5588d8dcbd623319809febe4f2e677ea32e86e094ad0b56cf72c8fbcca18	f	\N	\N
103b38da-c812-4901-a377-a31c9cad135c	2024-07-01	Transfer To Credit Card -7148	500.00	Uncategorized	\N	f	{}	e68e523b72e4f4b3484768f6ba81288729880410bbd18652007768bc0a3bf106	f	\N	\N
356ab681-afe7-456b-9490-7e0c16761499	2024-06-30	Giant Food	71.25	Uncategorized	\N	f	{}	fa3c14b1ad8c2a19a9cea7bc1c337de93acc662a8a146b4d6972cd692944e4f4	f	\N	\N
5fbac0a8-0385-4b40-b9ee-f8ad4233b13f	2024-06-29	Pizza Boli's	46.99	Uncategorized	\N	f	{}	4c5f0d495f32efd4a5c0c3c3b28a64d564baa5a9cb675c96ca5ea0e3242218be	f	\N	\N
708920bf-7e10-4d9b-bd7a-74b231ce44bb	2024-06-30	DEBIT-DC 6114 AMAZON MKTPL*RC2HY AMZN.COM/BILL WA null	40.20	Uncategorized	\N	f	{}	090286993ded24dc6635192f8ac227e959aa2b065d4dd5b24f70068487842a55	f	\N	\N
6f4345e7-0f26-4d42-94a1-be39b06d67d9	2024-06-28	DEBIT-DC 8678 TST* ROGGENART - C COLUMBIA MD null	33.12	Uncategorized	\N	f	{}	1d043aace244b5903ab398030376d086fcbf132072290b52bb9e0b2412deb510	f	\N	\N
ec9abfde-53ba-444f-a1a3-686485ccfb53	2024-06-29	DEBIT-DC 8678 CASH APP*DUNA SAN FRANCISCO CA null	30.00	Uncategorized	\N	f	{}	c070b1ab30053cd8db61ca7398354df916ebcc86afd4274d5fb9a33e0745b763	f	\N	\N
7973b39f-cbe5-4b26-ac4c-4780feea61ef	2024-06-28	DEBIT-DC 8678 GREEN VALLEY MARKETPLA PASADENA MD US	23.07	Uncategorized	\N	f	{}	271412b6c4672667647e8bca5848d9c29b7f77e46bec8a63bc2e96f32853a13c	f	\N	\N
08f4131f-b8a3-4a93-9153-52df6c9e789e	2024-06-28	DEBIT-DC 8678 TST* ROGGENART - C COLUMBIA MD null	20.15	Uncategorized	\N	f	{}	46ac57e225bdc7956ae32a5214bc868e6e7227b632d8f56ff5e02052399c3760	f	\N	\N
fa97410e-9cbb-47a7-b2d6-a2694bb77207	2024-06-29	Steam	15.89	Uncategorized	\N	f	{}	427baf83db2304e9b0bd4a73e5647735cfeebc78dbc96ac57b6666512c5d6a57	f	\N	\N
c6e1ecad-27a3-4adf-9ae1-6e3950b1bced	2024-06-28	LA Fitness	10.00	Uncategorized	\N	f	{}	4ea37e4defbc44b19c6e6d743559bf8bfe185980e82a371721ccb823ed8eb26f	f	\N	\N
14219dbf-d119-4ede-af18-93bfad1cf806	2024-06-28	Interest Income	-0.61	Uncategorized	\N	f	{}	79a0e87273ac2aaa03a9d2696d2d50ede3f04752b5e29a10622ab23afbbd2ee1	f	\N	\N
4a04038f-d94d-4522-aaa1-10557acae93b	2024-06-28	Payment to Citizens Bank	88.12	Uncategorized	\N	f	{}	b322ed04f28fa42e1e0464cda63107fc4b546e1443eea4e74d9ea47fb09e9d90	f	\N	\N
270bb39b-a372-44c7-8a49-3a18d78a6812	2024-06-27	DEBIT-DC 6114 SQ *THIRD EYE COMI ANNAPOLIS MD null	50.86	Uncategorized	\N	f	{}	90868fde5e13799fcb1b604dc6e42a023dab6a01bc5d1d551f0e0aedab426603	f	\N	\N
da3e4287-f182-4e40-b8ac-43975a7a38c6	2024-06-27	Popeyes Louisiana Kitchen	16.19	Uncategorized	\N	f	{}	701d05b07b8adfc12624e03c3a0c698011594595d812f5b730380804a6b60a3b	f	\N	\N
056b4d26-df1c-4af9-9f3d-18ac6f7c3f4c	2024-06-27	Rise Up Coffee	9.21	Uncategorized	\N	f	{}	5420a906b0cc1fe423fe8658e0fb5bf443af52cd048b63dc8bd319b11350547f	f	\N	\N
89d76b0b-5f54-4ebc-9cc4-e6b8627b6f69	2024-06-27	Uber Bagels	6.15	Uncategorized	\N	f	{}	9c6283e6299c9ada3b1b5a86bb60cf2690a3f6653ea038e4f4d8361a3257849b	f	\N	\N
d2269899-4313-474b-9337-7364ea1afce4	2024-06-27	Harris Teeter	52.03	Uncategorized	\N	f	{}	1aa22a6792253d33e0dce3a6e02bf4e35f622409f7dfa1231c6af1e6799e4ba7	f	\N	\N
9bb4a7f7-d41f-4350-8a11-b6a1b0f46563	2024-06-27	Microsoft Deposit	-4524.86	Uncategorized	\N	f	{}	2e9266903fec7be306f68921e3d86c6cf2304f19a11c64ae324151e5b7a47491	f	\N	\N
c8d9f7d5-5dce-4249-b662-2ec2850108ea	2024-06-25	Gradimages	105.45	Uncategorized	\N	f	{}	5db763b9232596415449d1439f74a0a1376c1fa51d86e78a8ed7845639837b94	f	\N	\N
d1f87e41-d429-489d-aed9-923ee8f62a2d	2024-06-25	DEBIT-DC 8678 SP POOPOURRI HTTPSPOURRI.C TX null	94.57	Uncategorized	\N	f	{}	a33408858ee129ef2e73045deea02eaf6733509efb4b91e11464d02b138834ca	f	\N	\N
6969b3e6-470b-44b0-9404-726f9e5f9560	2024-06-25	Uber Bagels	13.36	Uncategorized	\N	f	{}	958079802dab6cf4a1cc38cea0f521feefa7ed8462b5e22378b7c3bf17e87185	f	\N	\N
2c38fea2-9dd1-4de2-8e08-4f2706e4d457	2024-06-25	Payment to Best Egg	537.47	Uncategorized	\N	f	{}	30bf703a49c7830c055ba08a8655a0b04cea0ebc7821e8d8789db845bca915b7	f	\N	\N
145c99e7-6124-4b0c-a738-cff7a9c473b2	2024-06-24	Target	78.62	Uncategorized	\N	f	{}	7e4ac5e36115caed671bb5b4a4db7b2c0bda2a19ea9dff2bf9493d4ee6806971	f	\N	\N
0f4a5978-f915-4cb2-9fee-4dbcda065112	2024-06-23	Wendy's	14.71	Uncategorized	\N	f	{}	7e3a0c5e6e4176b7d85d171368ee6d68a226376388f423e7db167c344ed20fdd	f	\N	\N
2097706d-80e6-4d1d-a5af-7ad7e2d23728	2024-06-24	ALDI	9.26	Uncategorized	\N	f	{}	19898bf59da38a41be2acfc4cc4da2c594d20fa2ecb80e9546d936fe2caa6ba3	f	\N	\N
0d2845d3-2058-45e4-ac39-6fa320f376af	2024-06-24	Rise Up Coffee	6.09	Uncategorized	\N	f	{}	4e06517e362cba6071caf218c637a9f4726eda31a8cbcd670b010ded4170f5a5	f	\N	\N
63f55dc8-9d8c-4f24-96ef-235416f306f7	2024-06-24	Payment to Liberty Mutual	202.86	Uncategorized	\N	f	{}	65d0bbac178499d3183cbb192784b7b5b0cf55ec3dd7575dedbb46bcc8426005	f	\N	\N
917a1d72-6740-4b4c-b304-eabca7f6e01b	2024-06-24	Transfer to Venmo	30.00	Uncategorized	\N	f	{}	60a3a9a45b6210bb16708fcab9c29bf69ff053fd816790e9c31005d7439b8a87	f	\N	\N
9cb52eda-79aa-40cd-9b5b-b762d7618fce	2024-06-21	Lovevery	84.80	Uncategorized	\N	f	{}	e85a72b11b68e535af3cc531514993034ffdcaf5d85b2d60cd8d965f4b729b0a	f	\N	\N
7aee9b3c-5186-494c-82bb-8145c3f4e4a7	2024-06-23	ALDI	81.62	Uncategorized	\N	f	{}	f7aed406355de5d09593e99f8834625b03f7d5fdddc94876d8623f5da7b4c5a7	f	\N	\N
af000228-4fa2-4e97-ab19-248a4d4a7f72	2024-06-23	Giant Food	78.67	Uncategorized	\N	f	{}	7ef126e2c266c7fbad4241ffd9df9a4e3a9e2bd5fb052a74070933eb771d96c6	f	\N	\N
e744231c-d29e-4cf9-bf2d-56b9c404a08f	2024-06-22	Walmart	53.79	Uncategorized	\N	f	{}	a042bdfdd0fa0b404cf7d979ca1a6c4c0d495162efed0ad662f569a0d84a46ca	f	\N	\N
e290a0c6-1d2e-4679-a3bf-6f62a0fd0e7a	2024-06-23	DEBIT-DC 6114 FORTUNE COOKY HTTPSWWW.FORT MD null	31.48	Uncategorized	\N	f	{}	f6621e032463e22a93c6c5f06cd61df29c57a589eac20617a0701a9f99571825	f	\N	\N
28776e16-884e-4c74-8688-6895056fdd9e	2024-06-22	Walmart	27.70	Uncategorized	\N	f	{}	9ff9e9877fbd97ce8d59215f3687e5c0877e484736dc7983f05b3adb57cf2fa7	f	\N	\N
2d2d3e05-0cf3-4655-a47e-f7cb59b24fc8	2024-06-23	Target	25.99	Uncategorized	\N	f	{}	9271bfc8d51c9d6db4ecba5675a829331938d4377fdcbc884135484802d514b1	f	\N	\N
573b293a-d006-4850-88cf-0c19a1338bc9	2024-06-22	Panera Bread	24.28	Uncategorized	\N	f	{}	b26d8ca5925b19cd1187de9fbd1eec22805f0e4512a2365c05e1bf2faa57bafe	f	\N	\N
2c6bac40-cc4b-476e-9fcc-b039b31b367b	2024-06-21	Jersey Mike's Subs	18.26	Uncategorized	\N	f	{}	0de8a9c75d3438ffb1771ab01c8c87ad893f8107aa2d1cecd2f9e87444322c90	f	\N	\N
6c5c79a7-8045-4be1-a551-6ee5c778e58c	2024-06-22	Giant Food	12.28	Uncategorized	\N	f	{}	4b5b813a7e07b2ff9c51c2b1f2481b7e054a9791578bf67afcc5f9deff3f4823	f	\N	\N
1b3314d8-c3d2-4b33-83b3-3945baf323f2	2024-06-22	Wendy's	10.48	Uncategorized	\N	f	{}	04cc9a130c9e0e57490b2ea6663645085116b0666a845af5ffad552b1bbb9f88	f	\N	\N
49b3a86e-4d94-424f-a897-b99728b9b879	2024-06-22	Panera Bread	4.70	Uncategorized	\N	f	{}	28cafeab14d7fdb12d302a72723a865d51df37b243895d6428e512b6958cf3ad	f	\N	\N
b762377b-ca33-40d0-b070-1c07b49a08a2	2024-06-21	ATM Withdrawal at Bank of America Aberdeen MD	354.00	Uncategorized	\N	f	{}	fc0cc6f1e293399770f847a17301e812f261fef4ad6c23fd491d71384cea1085	f	\N	\N
5e778e9b-7990-4a6e-9944-b4a99b51fe2b	2024-06-21	ATM Fee - Withdrawal	1.00	Uncategorized	\N	f	{}	9f42bc1f751487122e0de629a22e27f7920c5f3c6f8c47bacd708993560e9de6	f	\N	\N
dfda41fe-3215-4e79-bf4b-31e61fe386b5	2024-06-22	Walmart	-33.76	Uncategorized	\N	f	{}	422289596d69d0dfdbc3a0bda42001d7fe0984fe8f8fb7f5c659cc0707286760	f	\N	\N
2acf0a4a-195d-41ae-bd7b-f39613c89d5b	2024-06-22	Michaels	-9.00	Uncategorized	\N	f	{}	f425c2d4e34133172d11ce6650062d0c6682bc0cedfef484891a453e98f1b275	f	\N	\N
0fdb8d4e-90e0-4278-bfaa-7f6da4505b02	2024-06-05	Sam's Club	42.10	Uncategorized	\N	f	{}	e16f647747433c4c949c942493afff0527a1adc5d3a871c7d17cae223b63db38	f	\N	\N
5ecaf330-42e8-4434-8064-827a73ff873a	2024-06-05	- Visa Check Card XX78 - TST UBER BAGELS SEVERNA PARK CLAUDAYA C STEPHAN TRANSACTION	7.97	Uncategorized	\N	f	{}	b3811007df43c38c53ad07b8dcb152c2aad2acd5bad8e0e34095d856481ca80a	f	\N	\N
aad3b6a5-07a9-46e7-ba16-495b85492ea6	2024-06-05	REI	37.10	Uncategorized	\N	f	{}	aa74592d6975133a15b051db4b6a323e222fbb804717112468d2cee3e2ea4d50	f	\N	\N
cb9fc560-c738-4be3-8610-9fe05683f3ec	2024-06-05	ALDI	13.94	Uncategorized	\N	f	{}	3a28eba5049786a8335fd8c4c7bb4836e6cfb9564cfb02a0be5ab2efd488e302	f	\N	\N
2d0c27fb-a218-450d-90c5-e18e595f2e7a	2024-06-05	Target	28.09	Uncategorized	\N	f	{}	02481e3dd46dec5781b891b609a28c5103ec6cdee2e1e1518236fd49242f323b	f	\N	\N
e4b3496c-99d6-474e-8816-db968764e007	2024-06-05	Target	67.39	Uncategorized	\N	f	{}	abbad9bfd6430402a5bd1ae392ebe03dc8ee90b7247bd1a4995b7042f3b78a28	f	\N	\N
7b0d1af4-8398-4f37-a8b6-efe3163e8093	2024-06-05	Target	10.59	Uncategorized	\N	f	{}	15be8bbc60d1aed18dfa7a35413efbb4c711c5e2018062fb3004530e9be8a6e8	f	\N	\N
bfab56bb-2414-4d67-89a8-914daddd7ef7	2024-06-05	Target	30.99	Uncategorized	\N	f	{}	1eb1be3ce508ea8584e59d58988c513b58db8bef7d13b95c623d1d9da7f8855b	f	\N	\N
cb594194-bba7-4cdf-a3a7-011c691889b8	2024-06-04	- Visa Check Card XX78 - WAVE - GBP SWIM C XX8678 CLAUDAYA C STEPHAN TRANSACTION	400.00	Uncategorized	\N	f	{}	e456299b7127c39a2b8145545893d2ed000cddea3b869ae3ef5f8f0a1ffe9ed1	f	\N	\N
8d23e20f-f79a-48a7-bcfb-8cea8824e0e3	2024-06-04	Rise Up Coffee	6.09	Uncategorized	\N	f	{}	d804cb13b6edb28339e2933f5897a02a0566a27d728fde735445431351ff68b9	f	\N	\N
af2e6873-cfc9-476b-9448-5bc251663ae2	2024-06-04	Payment to AT&T	200.20	Uncategorized	\N	f	{}	24997b7bc4c660af27f9c4cc07bfb0b2ca3669cd635da21d8cb43c439e57be94	f	\N	\N
f6743976-25b0-4182-a216-4b0f3462aa99	2024-06-04	Payment to Chase	125.00	Uncategorized	\N	f	{}	b2200df6894eba7acf72007c256e678d1313753c8613672ac723a3a0bbceb72e	f	\N	\N
593ace02-1f8d-4577-98f6-00b55d6370dd	2024-06-04	Taco Bell	7.60	Uncategorized	\N	f	{}	c10eb21d1831ab24a05a762bdb5746f429c4dd1b728b6838d0385ece696cb011	f	\N	\N
e29ca825-0279-4e73-88fc-9df69ba9fc8f	2024-06-04	Transfer to Zelle	30.00	Uncategorized	\N	f	{}	b5de9f781e1091a34d05898415108c30f735e11d25263d29778500b8a4025b68	f	\N	\N
22c5a48c-1cb8-4642-90a4-bb9b9649e2a8	2024-06-04	Transfer from Zelle	-30.00	Uncategorized	\N	f	{}	7d11fb01acb9b0dc4da1156b92a2617e6ca2c2e75eaf5f8a83a22dd3dd3530a0	f	\N	\N
daa200c0-915e-4b40-9c57-4ee1a62cb2a2	2024-06-03	- Visa Check Card XX78 - SP IGLOOPRODUCTSCO HTTPSIGLOO CLAUDAYA C STEPHAN TRANSACTION	78.87	Uncategorized	\N	f	{}	9792a4a44bdc55ce87b8ee2573e72a09edbe728f313e5e77833c1968d7b46348	f	\N	\N
75771fd3-8dda-4565-aeb9-729699e6f778	2024-06-03	POS Debit - Visa Check Card 6114 - FH SEA ROCKET TS SEAROCKET CHARLES R STEPHAN POS TRANSACTION	71.47	Uncategorized	\N	f	{}	adba7df412ad7b6cefb6e58870c3f345acaab905aee74542f8667cf9cc1d9744	f	\N	\N
ed5092f4-1235-4b5c-8e25-59e566af691b	2024-06-03	Uptown	80.19	Uncategorized	\N	f	{}	a84846bc154357b414e0dcdd24ba7ae7cf6a7d275bc7776bb7f4622b36c66f57	f	\N	\N
813df578-979c-438d-afc2-43cc97085576	2024-06-03	Ledo Pizza	37.09	Uncategorized	\N	f	{}	04dac7cb713a496b760ff3ccfc75ed4dce5758bab8716e7c7090d0186b282d96	f	\N	\N
60f12182-ed86-4f4e-bbf4-7db68af18216	2024-06-03	Ledo Pizza	38.64	Uncategorized	\N	f	{}	4fec5d8580c93e937984adb3b59a792dec281b13461515de7a047672587ecac4	f	\N	\N
cb166c1f-5172-41b7-ba13-ec94a1727a95	2024-06-03	Naval Bagels	9.43	Uncategorized	\N	f	{}	ef20d66bb10177a22ef45f83b04425a6aa3dab08d11ece3855b7f9de08462234	f	\N	\N
6838d997-73fd-4c02-9f7b-87616bfb2459	2024-06-03	Quiet Storm Surf	8.46	Uncategorized	\N	f	{}	1e28c0dd79317d3af252a8c2723715be4f4399274b704d19439dbb07a54a3c45	f	\N	\N
25eba552-f1c0-4c9c-8684-e642a1fabda5	2024-06-03	Steam	8.13	Uncategorized	\N	f	{}	4937a65d02c835dcd3d0d1ea351303ae0aa1741dd848024d860a39d6529af571	f	\N	\N
6e48c0dd-0ec1-4139-9cf8-af6988db921f	2024-06-03	McDonald's	11.30	Uncategorized	\N	f	{}	65db37ecef6bc4c7cc11dc36e9f797c371a2fdb13cec8c24e94b9da735c27d34	f	\N	\N
e4dc5f6f-39f4-47bc-9f25-d4cb6f269e84	2024-06-03	Rise Up Coffee	12.19	Uncategorized	\N	f	{}	f41a5ea1bacd21aecd2a35e52796bb5219831606af3babf4f7f4f21e6c8667d0	f	\N	\N
505c084b-5852-4a5d-8143-43e78dd66553	2024-06-03	Apple.com	2.49	Uncategorized	\N	f	{}	04b0e777c3894e770e641ef4ce0d33af4353995d6f8f9f87274612d01174fdf8	f	\N	\N
abc411b6-978b-4513-b240-6a32f2215716	2024-06-03	Tax Payment to IRS	500.00	Uncategorized	\N	f	{}	c9b9e6e41481b41cc87d41d79d15eab899ec0240d02bbc290199df8b9e7e262a	f	\N	\N
94c52b72-b15e-4f20-a158-28a29bd8295f	2024-06-03	Sunsations	36.02	Uncategorized	\N	f	{}	78f0bb98a0ec91227178c979cd19010518f3490bebde8b7bef81fe7c250437aa	f	\N	\N
9424b9de-e980-4a09-bc08-e7308d259d69	2024-06-03	California Pizza Kitchen	7.74	Uncategorized	\N	f	{}	6ae95ecd8fad18b0386dfb33cd665d16d34a5df0f73d19aa4d38f232db206869	f	\N	\N
fbbfc185-388c-4b11-89f0-a25ee5537e44	2024-06-03	Harris Teeter	42.93	Uncategorized	\N	f	{}	e1421253d9740c5a7811da77abcb2cd043afbd052fd298c653446df932699183	f	\N	\N
d7b8bbd3-79ba-4ffb-89cf-d7c04e459b48	2024-06-03	Payment to Apple Card	209.53	Uncategorized	\N	f	{}	57780b35504adf514376db0308432ce64629106252d35ab7b737aa9a65406f4f	f	\N	\N
5fe270db-232e-46ff-9f75-246cc90cda40	2024-06-03	Transfer to Credit Card TRF TO OTHER	500.00	Uncategorized	\N	f	{}	493f2d2623c5bd74539507ec5805935d109201198b9f86832ee6e7316497801a	f	\N	\N
b69cb639-0bd7-4ae9-a06c-dd378fee7ccd	2024-06-03	JPMorgan	2107.66	Uncategorized	\N	f	{}	6572dc5017281e039ec75145b4e274cb57e2379241cf852cdd53e85bd33759ce	f	\N	\N
d9f367d9-711b-482d-a2ee-a4dc00e8ac4b	2024-05-31	- Visa Check Card XX14 - FORTUNE COOKY HTTPSWWW FORTMD CHARLES R STEPHAN TRANSACTION	26.17	Uncategorized	\N	f	{}	0aab6debd723fc7862b65912f2cdbaea88be7746356b5ecb8696426672ba113f	f	\N	\N
be2d2c52-8ccb-43fd-b860-07160531eba2	2024-05-31	Dividend (GT20)DIVIDEND	-1.04	Uncategorized	\N	f	{}	4fb6d0d16e33619bbc2ab19955b7a308cf615c2f323e0189b630108d8e4d3cf2	f	\N	\N
89b29591-28d8-4846-af05-cfe2ccfe5225	2024-05-31	Chick-fil-A	8.32	Uncategorized	\N	f	{}	77a40044101ca57dbe18320e27dff0297737d954d80be902016abe1a37949d96	f	\N	\N
b8c6a032-be16-4435-adb9-65c1236b2147	2024-05-30	McDonald's	11.30	Uncategorized	\N	f	{}	37be26170f01c088689293f441cafad088c18e5145b64c377741695b8e3f8480	f	\N	\N
78972d7f-587e-496e-82b3-142633d4dfee	2024-05-30	Apple.com	19.07	Uncategorized	\N	f	{}	bded1a233cf8c1a1f411121030e0d39363ab1f6dcde42259beeb1fbd886a27dd	f	\N	\N
c9f13bd3-0a47-4c36-b1ab-d7aeee668121	2024-05-30	Microsoft Office Deposit	-4524.84	Uncategorized	\N	f	{}	654325f2a542e2510fb05469dbab640f56a722e97953e657f64e9030dada9ac9	f	\N	\N
253a639c-c639-489f-bd33-2ffb1218bfa0	2024-05-29	Sam's Club	35.10	Uncategorized	\N	f	{}	779aaf5054ad76145c5f193efd55a305bb34c742f239ce92daaf9b92318dab8e	f	\N	\N
2bb78abc-a690-4c44-bd2e-3ce77a2c48cd	2024-05-29	REI	85.62	Uncategorized	\N	f	{}	3af68e487a6cc297f1644e371dead5e6bf38ffffee4c3a41102c4e1dd33f8761	f	\N	\N
2470560c-b3a0-4cea-8265-6a6b34634f5b	2024-05-29	Payment to Baltimore Gas and Electric Company	198.00	Uncategorized	\N	f	{}	945ffe9524d2f6552da97c7ed0ca0536ef77d63b6a1eaba922b32344d2aef8a9	f	\N	\N
9e1f36da-0359-4071-b2d2-b8d8c1b6209b	2024-05-29	Paid Check 0000000151 PAID CHECK	5875.00	Uncategorized	\N	f	{}	246f5c5f99a9d404370e9cacc51e0637919d84203d5685411c35b8647749beaf	f	\N	\N
43393f6e-71f9-473f-976b-a34b66eebb3c	2024-05-29	LA Fitness	10.00	Uncategorized	\N	f	{}	414e358d0739b19240ca8b373a6a10525206e9e7f1e07f3b8088d6277f26fc03	f	\N	\N
ab7c1fa6-4744-401f-b5d5-e7fb5ba57358	2024-05-28	- Visa Check Card XX14 - TST CROOKED CRAB ODENTON MD CHARLES R STEPHAN TRANSACTION	106.88	Uncategorized	\N	f	{}	07c6d7cca865cd5ad2ef1d34a28db30d69efd99847def8173cfe2d3fdfbd08bb	f	\N	\N
1a91daa6-66fc-4837-b224-f2b71f18e36b	2024-05-28	Rise Up Coffee	9.21	Uncategorized	\N	f	{}	ae64d07989c02f280795a72fc5f3f6b1b3c79c2d37c93cbd932d8f65b9c69bdf	f	\N	\N
23162633-4272-4b06-88bd-0a31e1b616a0	2024-05-28	- Visa Check Card XX14 - AMZN MKTP US DB33V AMZN COM B CHARLES R STEPHAN TRANSACTION	66.77	Uncategorized	\N	f	{}	10b4e7ec960eefdf91f9344e5015649662179ea797777fad44d2449d62fb302a	f	\N	\N
a932af71-9ace-4c9d-90e1-a942d03be856	2024-05-28	Amazon.com	42.27	Uncategorized	\N	f	{}	35199ad1b21676548225199363e865dbf565d0a7f76abbbe54f770ac56ce8c46	f	\N	\N
ff23780b-408d-4d0d-a217-e4b6965209c2	2024-05-28	Target	57.14	Uncategorized	\N	f	{}	b253700e5725ec1fd1073560edc70cd0e4647a8c6f168bb7b8cd17fc1faa12af	f	\N	\N
309b9db7-2b2b-42ad-95ce-8a48fb79771f	2024-05-28	Dunkin' Donuts	5.40	Uncategorized	\N	f	{}	cf45c0a65402e141c6ea741551e66f8e8086a129a5ed52dddaf8ccafe53c3087	f	\N	\N
86f0d10d-0d66-4194-9ead-8f796b35d16f	2024-05-28	Zuppler	95.49	Uncategorized	\N	f	{}	c168ceef25925c2f0045facf4c89e9c1c1ef6530a33cf598ef459bc81c37e5f7	f	\N	\N
f08f0d6f-a815-4403-bcef-f320a7d0ccec	2024-05-28	Giant Food	75.82	Uncategorized	\N	f	{}	1f421a225bad8d7bc373ea4e16e637e6b33b901befbab0cd87f1da3abba3c1ca	f	\N	\N
5c12ba1d-3b20-4e62-b3ba-d562abf5bae5	2024-05-28	Torrid	48.35	Uncategorized	\N	f	{}	965e32096fe302af9c6373523b3ab8a653af9df6e8d52be7480b2201eaed9783	f	\N	\N
2c41f186-8767-4326-91bf-48aed3f50cf0	2024-05-28	Payment to Citizens Pay	88.12	Uncategorized	\N	f	{}	b25c7e555b1255bb7afa2388851328025895123c4c50470c2f4da1da57047e81	f	\N	\N
375ae35f-523e-446c-9051-1a2ffc38fb01	2024-05-28	Target	7.59	Uncategorized	\N	f	{}	b331eb61ded398a6184bd1d67f0d171f2d8da11ea56fe63fac41e53725679c8c	f	\N	\N
71a48316-c978-48d9-8e42-9b627d440e70	2024-05-28	Target	29.75	Uncategorized	\N	f	{}	ddc0e74a00b55bee83e417fcd78664e5adf4c8ca92e1802a16e9ee61076a9f36	f	\N	\N
87cce535-6306-4084-9ae4-05509f2a1d34	2024-05-28	Popeyes Louisiana Kitchen	19.59	Uncategorized	\N	f	{}	91c1ee01464595cc1a6fd54b8124b01e27938a22b2804fec78d35200e84d9892	f	\N	\N
116df38d-1b3f-4bef-a271-fa7ad270afe0	2024-05-28	Target	1.45	Uncategorized	\N	f	{}	bcc007d5c5846e191b9f134a62376c2cabdff5e88d80a660aa415d22048a4918	f	\N	\N
d96aef06-6b6f-4f31-96d7-3726efcec605	2024-05-28	- Visa Check Card XX78 - BRUSTERS REAL ICE GLEN BURNIE CLAUDAYA C STEPHAN TRANSACTION	1.48	Uncategorized	\N	f	{}	c78a5552fdb54b6d10b461c1af66253a273f19583cd04fe3918a6b4c3d897ece	f	\N	\N
0cf477cc-3408-4cd0-97da-0e1152bda398	2024-05-28	- Visa Check Card XX78 - BRUSTERS REAL ICE GLEN BURNIE CLAUDAYA C STEPHAN TRANSACTION	7.99	Uncategorized	\N	f	{}	9e43d8c9d46cd7aaf19f1370f5189a70ef54a8d86a2bb25c5de9175938e0e3b6	f	\N	\N
f56672a2-cd08-47cf-91e9-49b305b780e4	2024-05-10	Lowe's	600.00	Uncategorized	\N	f	{}	64485a721cb3d85ee6083b8bc6513b3dc1a029bd0fd9474e7a5fc4360085db5d	f	\N	\N
84c1006b-c0d5-44a8-bcad-167b2bcc1040	2024-05-24	- Visa Check Card XX14 - UMMC MIDTOWN - PAR BALTIMORE CHARLES R STEPHAN TRANSACTION	4.00	Uncategorized	\N	f	{}	b37ea767a040e8841a5c74c501971112ffd6b3f87c588924213010c6d34f4114	f	\N	\N
15c9a52e-2c96-4ddc-b33d-6759271cb1ec	2024-05-24	- Visa Check Card XX14 - STATE HIGHWAY ADMI XX6114 CHARLES R STEPHAN TRANSACTION	42.00	Uncategorized	\N	f	{}	87c43fccb592dd0c84f3d5cad386bb7ba94e9a826b0f357feb87e589815fc480	f	\N	\N
fb0ff22f-bb07-4df2-b39c-65b166173d7d	2024-05-24	McDonald's	8.87	Uncategorized	\N	f	{}	42f5d734604f4f042ccc46ea85cab85a7edac9ccb6e8e92d99616eaf23d6c3ec	f	\N	\N
8a8f825b-9840-40b6-9e74-eab7d8c64372	2024-05-24	Giant Food	10.58	Uncategorized	\N	f	{}	5cf4475640cf690e691aa083031ef5ce82c2771e34d90331c16a53439b5374ce	f	\N	\N
74e8cc0b-ba6b-4c1b-b69f-7cd1c6ff5a8b	2024-05-23	Payment to Best Egg	537.47	Uncategorized	\N	f	{}	1a4f685a505f02fa4c224c70432d7c2a711b0c3163b8a81f0e621afeb84f572e	f	\N	\N
dfd979b7-0510-4a98-9ad8-6d70feeb51f1	2024-05-22	Debit- XX 6114 Aacc-cashier's Off XX-2236 MD	100.00	Uncategorized	\N	f	{}	9a6687a6dd317b9f17d9e57eaeafd96611fa4ee3cc7cb3c2ab482a16afcf159c	f	\N	\N
0bb357d7-0329-43a6-9a90-8c037d2ec317	2024-05-22	Walgreens	17.40	Uncategorized	\N	f	{}	4435c19500e18f00730e00f68524f854bd92c96a0cbebf4e64d2517f0b701ed7	f	\N	\N
495b0195-30c0-4c30-a7ac-94273225a9bd	2024-05-22	Debit- XX 8678 Sq *lisa's Luncheo Annapolis Or MD	7.69	Uncategorized	\N	f	{}	48a4717dfaf48f9702f42cf3919a32e7493afbb4ab385afa45c7f9902037d7b1	f	\N	\N
2c9fcd10-2d54-4f86-9ab5-6a6031eb4399	2024-05-22	McDonald's	7.07	Uncategorized	\N	f	{}	31643c08677ed6201ef888353a14088d4fc1fa666eec75c00d6cbf572df1c89f	f	\N	\N
b96c0938-cc70-46cd-8b1e-6ff44e3ee55d	2024-05-22	Canteen Vending Services	2.85	Uncategorized	\N	f	{}	3e7211e5af3c64999a05d667c8f78a69f860cc763035d38140c8fe998873645c	f	\N	\N
92ef407d-cd7f-427c-9529-046f7edc3b5b	2024-05-22	Rise Up Coffee	2.12	Uncategorized	\N	f	{}	2fcbf8e970a62f6c14e85f1a718e1761693d0afa6b698fc2dba004dba55533d1	f	\N	\N
f7aa365f-02d1-41db-a133-38955199bf5b	2024-05-22	Canteen Vending Services	1.85	Uncategorized	\N	f	{}	93ba88d72ed8462be933a819b00a4258d201eb9f3cd19fa2dc21006e63bc1120	f	\N	\N
d363782f-ff7f-46af-b05a-b5b410569ba7	2024-05-23	Deposit Henry M Jackson Payroll	-1709.20	Uncategorized	\N	f	{}	f50de3ef3f072e8eaf2cd4c336a471f233c22d1be0c322e5cdf5216c41d1ab78	f	\N	\N
1d74162c-ed0c-4994-9d8c-5d1a62c0b16d	2024-05-23	Canteen Vending Services	2.85	Uncategorized	\N	f	{}	21e263fb20ab71a3cacf716b44ed46babba1f3fbf72ef3c97efa2f229e64bf5b	f	\N	\N
267145b0-b5d2-40d2-b8ca-2c7919455674	2024-05-23	Canteen Vending Services	1.85	Uncategorized	\N	f	{}	1b342596ee24ebdd95d34eb14cc612e790d31b2d2446b8d6aba5ec3e68c6a871	f	\N	\N
3f7ddd08-2f15-42dc-bb01-345a049f3f4c	2024-05-23	Walgreens	17.40	Uncategorized	\N	f	{}	6e8e1443090cdb0a8d2e0d9656e831a5b6bd73d16bbda65a20eee5bf481f185c	f	\N	\N
a4d33b67-812b-40b7-b36d-15eb016f3509	2024-05-23	Rise Up Coffee	2.12	Uncategorized	\N	f	{}	2b426418c239ac9041e2590ea2923066871a18a29e2bb43f71e31560cf172c09	f	\N	\N
7965ea90-8938-431c-bfb0-f6daf712fd1a	2024-05-23	- Visa Check Card XX78 - SQ LISA S LUNCHEO ANNAPOLIS CLAUDAYA C STEPHAN TRANSACTION	7.69	Uncategorized	\N	f	{}	45f2c30a46992f70c03145593886acdab54c26af0a24538a1ace5e065c625334	f	\N	\N
d8e3e453-5621-4ecf-a96d-07d71b536f01	2024-05-23	Deposit - HENRY M JACKSON HENRY M JACKSON DEPOSIT	-1709.20	Uncategorized	\N	f	{}	a29f0e7c79b737fd4d6dfdaa0909be1b424689253c5151b48272f731a90ecdc3	f	\N	\N
cefb1dfc-3f31-428d-8379-cb6391982add	2024-05-23	- Visa Check Card XX14 - AACC-CASHIER S OFF XX6114 CHARLES R STEPHAN TRANSACTION	100.00	Uncategorized	\N	f	{}	baa17e6995353e17cd6e051f8aa62857d9aab7a6bf4a73500150819206c96457	f	\N	\N
1224cc1b-47f7-49fb-9cbe-db0a6d36ca72	2024-05-23	McDonald's	7.07	Uncategorized	\N	f	{}	6a64315439696e4243ae927cb95ea4f453ea729532fe184e2aa90036736f6fb5	f	\N	\N
fc3d9363-1bdd-4323-8614-29080ff1cb17	2024-05-22	Payment to Liberty Mutual	202.86	Uncategorized	\N	f	{}	34da26e5b06d0e7d5fc1ec1dea0c2a832af84d6846a54af25dea80d506f94ef3	f	\N	\N
21633729-19e4-4caf-b775-6176dad2afe3	2024-05-21	Debit- XX 8678 Sq *the Commenceme Baltimore MD	65.48	Uncategorized	\N	f	{}	a304773685ed5d63854e6ee6fddd6b5be83bf3cf1ba609b1feb6005663fc8b37	f	\N	\N
724074de-9468-4b6d-b721-a3a32719e396	2024-05-21	Target	52.99	Uncategorized	\N	f	{}	b839424268931887f40ea8ae27e96e02299ec3a74bbe9631b5ce7df5e4d46e8c	f	\N	\N
5f287d88-080e-4bb8-9ef2-20bcea2b97f2	2024-05-21	Sam's Club	29.62	Uncategorized	\N	f	{}	99e280e6b9fd3e67de2bf81c172cd3b06b0aa22232f81864005fc06d057da657	f	\N	\N
589c1c82-3763-4543-a95b-823de8f437d1	2024-05-22	Transfer From Savings -0387	-6000.00	Uncategorized	\N	f	{}	030bd8a0409a03dfc81ff53a5f2dc8551f1685264d325add327e0c7e54b82864	f	\N	\N
84f5e4b1-efff-4987-8dac-ffc95d7703d3	2024-05-22	- Visa Check Card XX78 - SQ THE COMMENCEME BALTIMORE CLAUDAYA C STEPHAN TRANSACTION	65.48	Uncategorized	\N	f	{}	557e0cbd397a9d7abcc52c7b8a9c08c76e24a42a3ecb53acde9a97a43d3a4c0c	f	\N	\N
971ccd04-9399-4d29-bf09-a50d955ad10f	2024-05-22	Target	52.99	Uncategorized	\N	f	{}	b5f5a70b6c4c7de4cd39c9cc4e111ef35f1b665036079b26a7d12908f14b682f	f	\N	\N
8103f327-f599-43ec-9825-243c7915f112	2024-05-22	Sam's Club	29.62	Uncategorized	\N	f	{}	a68d2a73d373222e4f1db6e63968ed90582bb437daa579832a430d834076619f	f	\N	\N
8f3ad59e-dca7-4ed9-b959-186b994ef07b	2024-05-22	Transfer from Shares TFR FR OTHER	-6000.00	Uncategorized	\N	f	{}	16ff87a6ed1a48b9cc5571b0838c6603340b36352d2bc0e1b0462b186858ce04	f	\N	\N
070fcd95-e371-45e5-885f-1869eb7f5c38	2024-05-20	Giant Food	11.01	Uncategorized	\N	f	{}	b58b89d37254516f5ca27d2700035b0c18a77a1efa4aff296d766019a20fdf57	f	\N	\N
41cd7b5a-4045-4fa3-b7fa-17004c2087c4	2024-05-21	Giant Food	11.01	Uncategorized	\N	f	{}	c198881b2a511da35912d444d0eba9569a17a2468a53cbfcdad5bcf75130d4aa	f	\N	\N
f9931c89-d1d4-4ba4-9b20-276e563ff2c1	2024-05-19	Total Wine & More	87.15	Uncategorized	\N	f	{}	5aed096500c12673252183ff9d1075dd77d2d9fdaf30db74e7e62eb0cbae7847	f	\N	\N
5f451622-0533-4e14-979a-74dce1cc84fa	2024-05-17	Debit- XX 8678 2levy@orioleszippi XX8200 MD	46.46	Uncategorized	\N	f	{}	6db327fcf6178ff8ce19ca099cd51343d6ff3e8b47fa24bbca92adfdf8dd75a9	f	\N	\N
add14e6d-a522-48d9-aefb-ec106127377b	2024-05-18	Sam's Club	40.40	Uncategorized	\N	f	{}	8136146bcc87f6b06f4a68f164cac09e618d47c451e75d454df70e835ce0159f	f	\N	\N
84984106-6199-4760-b6ff-1f418a6466fe	2024-05-17	Debit- XX 6114 2levy@oriolesparkm Baltimore MD	37.86	Uncategorized	\N	f	{}	15bdac25fe4e3c2de903ffbcb5e9324f22f7f1a2b460f2726845ba349cf1e4df	f	\N	\N
f3621c2b-685c-46de-a6be-22d7b2326ad0	2024-05-19	Sam's Club	22.73	Uncategorized	\N	f	{}	4c82d32fdd42ed7f3111cbece4368010e41bd9fcf54110bd0de7123253322c98	f	\N	\N
b7860ec4-de4e-4944-a3ce-f04742b8d505	2024-05-17	Levy Restaurants	21.47	Uncategorized	\N	f	{}	405a9dd2278a46c49741fe345128115ba0b190e7e5ee0028ac4a782a66ebe35a	f	\N	\N
faa39c61-d9a6-4711-92fa-e69da58dcf5c	2024-05-17	Levy Restaurants	18.80	Uncategorized	\N	f	{}	42fe76dac083e70e81db433bed07ec2365e693828636cbb207e48bd611e3282c	f	\N	\N
e8aa1d97-b905-4ce1-9c20-f6933d907ee1	2024-05-18	Apple	7.99	Uncategorized	\N	f	{}	5dd7721205e47811ef82e9c154e9d6e592c808c19ebfef5558e8c9788cfe470f	f	\N	\N
b72827b6-2fd1-436c-a3ad-7209ab66754d	2024-05-20	Transfer From Savings -0387	-800.00	Uncategorized	\N	f	{}	e7486d84757871572c29bfb5326e10609cfb03581c74400efd65eadf303ff91e	f	\N	\N
693349db-148e-43d4-a4f3-1a9bf8aa34fa	2024-05-20	Transfer from Zelle	-400.00	Uncategorized	\N	f	{}	283b6ace75c2ef3a6dc8f784271be92ffa0e89008bd2c176907bb6142c61fcff	f	\N	\N
092d5e1c-b8dd-4753-9c5b-2175823e7038	2024-05-18	Amazon Marketplace	-31.79	Uncategorized	\N	f	{}	ff019b24b935d86d02ed1c0a0f8e7a786753e85ee9a2c1fbf119479b41827e74	f	\N	\N
50e42c4f-38b4-44dc-b648-c605a5a71108	2024-05-17	Payment to Chase	425.00	Uncategorized	\N	f	{}	2be68e5d98a9d1834d3ebbb02b2dbb61f766b9977fe17751f29fe59616b724b0	f	\N	\N
3d2eb2df-ac81-4454-9ad1-80b17c57011c	2024-05-17	Payment to Capital One	276.00	Uncategorized	\N	f	{}	184f96c52456651de291c59f61724377f05260f5e65c7ee34975f78d2df59c49	f	\N	\N
b4f764c4-def3-4623-874b-aee409a491eb	2024-05-17	Transfer To Savings -0387	800.00	Uncategorized	\N	f	{}	c35695a438a09997f683b9547b8238d11f7420898c89e675ddd01fc1556e3751	f	\N	\N
900e227d-7849-4011-848b-81f6f40d6f04	2024-05-16	Shell	30.10	Uncategorized	\N	f	{}	cd4f1ac341a6207d19eb7d5b0655c3e9ac3c1ca0e8bd050b4bd2c24948ce7738	f	\N	\N
ecde9303-29a7-400f-a923-5ad8be0bc650	2024-05-16	Toyota	900.00	Uncategorized	\N	f	{}	aee052f51db8739c4e18d643f75c039fdbf6624d48d415849d2fc8a2f1456bd1	f	\N	\N
58bd66d2-cc55-46f5-9eed-605d4c6e9f41	2024-05-16	Payment to New York Life	616.54	Uncategorized	\N	f	{}	5d3d5b72c0d829ccc433dbfc5b6bcaffa3c301a0f3cca68df02f61f253910470	f	\N	\N
ea04a88d-198d-4dc6-91f8-7363cc50749c	2024-05-16	Payment to Discover Bank	303.00	Uncategorized	\N	f	{}	130711440bf6613a35af06b41951c2b60a5fbd1dcfe842e80afcd185d3cebcfd	f	\N	\N
a766906f-11b1-4460-85c0-47aa8a8a71ef	2024-05-16	Payment to Educational Computer Systems	100.88	Uncategorized	\N	f	{}	34eae814a9e83fb6b714754a909315a336cd565348ab4ce935b61a310c94cd6a	f	\N	\N
ee5d2eaa-9965-4346-b9ca-6dc00251bc69	2024-05-15	Ledo Pizza	10.59	Uncategorized	\N	f	{}	2c5ed2cbfffd098c8f7face003129ed2e74287313f2712b13c7c8c888ee3c9f0	f	\N	\N
d5574a4f-253f-4560-bfb7-353559a545cc	2024-05-15	Transfer To Credit Card -9005	400.00	Uncategorized	\N	f	{}	04c77324a6482e5a6b63a4b8f82badc6bbebdf559c42ea72f723868c8fcd7c58	f	\N	\N
b1cb483c-40d0-4ca0-8fe2-39778a1b67f7	2024-05-14	DoorDash	88.47	Uncategorized	\N	f	{}	db3baa5e35fed5d9ba17124c11189373139f32580a76e83aee026c570271de1e	f	\N	\N
28e7db74-5527-4585-8862-ad1b676afb9f	2024-05-14	Harris Teeter	59.80	Uncategorized	\N	f	{}	3bc867e05f3a7ab01f62bee7447614b61b5ded1b409f074164d2ebd5d5e08cd7	f	\N	\N
183bad19-b36e-4481-8729-b4a712691d49	2024-05-15	Ledo Pizza	52.98	Uncategorized	\N	f	{}	4d04e2638e2d0e343917365ef557171fecc291022ad21b0f6ef09537d7421ef9	f	\N	\N
62aacac8-1dbd-4266-8ed7-81a9f392f03a	2024-05-14	Payment to Best Egg	1338.03	Uncategorized	\N	f	{}	b4f7702ed566c705e334a0d11d9dbfd9aa48e8b087f7c082bb5411e16a73b78b	f	\N	\N
6e927dba-5e3e-49c4-84ce-86a9737a7e13	2024-05-14	Payment to Verizon	79.99	Uncategorized	\N	f	{}	9752bcfd3215bd975fc7591a687596e1b79428f1c22bc9689c39d0fc2fab0c0a	f	\N	\N
ddb1a5f5-5a6d-44b9-b7d8-1c50af848590	2024-05-13	Debit- XX 8678 Sp Its A 10 Hairca Httpsitsa10.m FL	46.44	Uncategorized	\N	f	{}	33a2fd6dd3549949391baa9fb85d952e6b254f34ecfff666db30eca6034ef2db	f	\N	\N
3c398e7f-bfc1-4baf-9813-18f77a06d713	2024-05-13	Starbucks	20.00	Uncategorized	\N	f	{}	e148b1816a00f6e35f51f99d6ccf1ba3bff8f2d787044ab5ecdf012c82c4ac27	f	\N	\N
36d5e73c-85ed-4a43-81af-b993e1a2afbd	2024-05-12	Debit- XX 8678 Wvu Concessions Morgantown WV	8.50	Uncategorized	\N	f	{}	7187e9539c9be12b22dc74ed3e8771db382f49e8cc698f001ef64a492d5c9323	f	\N	\N
9510d941-d94b-44e5-85cb-1034e51e4100	2024-05-12	Debit- XX 8678 Wvu Concessions Morgantown WV	7.50	Uncategorized	\N	f	{}	bcc779271bc63753364ea82f5af94761433b3f79641897d087b07d7cb01a2cbe	f	\N	\N
a9b38974-d554-45f5-be7e-0403386b4603	2024-05-12	Sheetz	5.85	Uncategorized	\N	f	{}	bc8173735d22228a54d75ae342dd2e4be11d969186d3af513e0e028c3a2aa3c8	f	\N	\N
1e7256d7-39dd-4857-b1d9-765f8300118a	2024-05-14	Microsoft Deposit	-4524.86	Uncategorized	\N	f	{}	758837222932b0be0c0a4bcecc0ef9d0d0044e6b9b3abd23b862a7034b85a93c	f	\N	\N
fca30ed7-b930-4d06-9196-f7e7a9362983	2024-05-13	Transfer to Venmo	20.00	Uncategorized	\N	f	{}	d2d6b6f779c92bd980575bdc212e8c90db8078f6cec7c6f43a0b907c102300d3	f	\N	\N
9c7c0906-c907-4dfe-85ab-6ab52598950a	2024-05-13	Transfer to Venmo	15.00	Uncategorized	\N	f	{}	6e7098d5db708f50afa1d77ff0846729234af58024babdbdc45249b516403d57	f	\N	\N
d5b70b18-c9d0-4afd-9dbf-eb0f71fe885e	2024-05-10	Polished	125.00	Uncategorized	\N	f	{}	f3eb4db0308d77791c758e38f542b6a09bcd52796a76347cd251860de726986c	f	\N	\N
c79a5b68-8053-455c-9f60-26b3fa95a74a	2024-05-11	Target	82.35	Uncategorized	\N	f	{}	e9b783b824d88ebe5b7778437911da697bf3cd0e9f349854621d8c03df9bfcaa	f	\N	\N
344afbc7-124d-48dd-a778-d697e2952c8e	2024-05-11	Ledo Pizza	65.65	Uncategorized	\N	f	{}	4cd5df669437989f50afb726823fa729d9ca88aa7178fe0351920cd063b873b9	f	\N	\N
0c490764-261c-40c5-b13d-866754a6756f	2024-05-10	Edible Arrangements	55.11	Uncategorized	\N	f	{}	aae1dc55c8670ac7b0e5eab22272a9e8d3dd3ba0b35d971f7f04320ceb4ad834	f	\N	\N
dee84fd8-8760-472b-9ffa-2e55e1e32c10	2024-05-10	Royal Farms	48.91	Uncategorized	\N	f	{}	6526d99054ced4c2db19cc6610e562c8f4b9ef626903cc0fd82811b5ae059c0c	f	\N	\N
15287e17-d022-4ea4-9616-5484456dba9a	2024-05-12	Sheetz	46.47	Uncategorized	\N	f	{}	818a3c3f8aa3deb0f4cbbf9332954835fbe6fffa36999955cbe31e7d7338e7b1	f	\N	\N
de4799f8-ce03-4acc-abe1-6daaf52f6595	2024-05-11	Giant Food	29.93	Uncategorized	\N	f	{}	2264d88a0f9b377b7f1f9664c71f52ec4618fbf13e4604f0fa1ba3f9d1b0080c	f	\N	\N
ee2e5250-bea1-4e38-afbb-c8b88d9ae09f	2024-05-10	Shake Shack	11.96	Uncategorized	\N	f	{}	7011e492a5f6457055a1f3b7db0d5a021b21f6960784d07790e44e3e7ca3f9a7	f	\N	\N
6eef4bf1-0c44-43db-94ff-b34ae4ce5408	2024-05-10	Dunkin' Donuts	5.40	Uncategorized	\N	f	{}	f5858c40dfdb3352551b94f32a609dd45e2e80b8acda804970265f5b2ded9a4b	f	\N	\N
40fe2533-34f8-4c79-94a6-92a58cb62e5a	2024-05-11	Starbucks	3.74	Uncategorized	\N	f	{}	d44162b479159af435188b34106675c594fdd8ae3bb547743fcc1ada4cee62b8	f	\N	\N
5184fe78-c843-4476-a955-a5a512502799	2024-05-13	Transfer from Zelle	-60.00	Uncategorized	\N	f	{}	f4ec782d6f054e1996739752ef035f9b12564e720cd16f518195fb2a2fcb9374	f	\N	\N
be7f6d0c-3670-4678-b234-c850192e17f9	2024-05-10	Payment to Educational Computer Systems	120.88	Uncategorized	\N	f	{}	691c875fecb0a220eb7b24f2fa5c572bfdb07516a1def3f17cb3d515aba79611	f	\N	\N
cd452fd5-e963-44ef-a218-e64723922f14	2024-05-09	Harris Teeter	37.36	Uncategorized	\N	f	{}	f69345a87b821669b897e6c5d17d513dcfd177954c925ac46469a9eab7addfdb	f	\N	\N
45e5c72c-b3a2-49d4-a6fd-37d2636a71c4	2024-05-10	Giant Food	32.19	Uncategorized	\N	f	{}	645a6543b436984a1c611a8133aedf472359253fafb10b41adb3a5978be17ef2	f	\N	\N
7de69dfe-c604-4640-b637-8d14e3836607	2024-05-09	ALDI	31.55	Uncategorized	\N	f	{}	2c1ee090c40eeb778f8ba1132de5b55463c95f37e7c22ccf6612a10d55a65bdb	f	\N	\N
d976bd21-d139-447a-a1b4-8436d2096ede	2024-05-09	Tax Payment to IRS	1000.00	Uncategorized	\N	f	{}	f2ae1c88b193ac54d6d4142e3c0a42b512215600e32d6fc3627ddd8980720f1d	f	\N	\N
63f3ede4-0c96-4d78-b924-038e2383937b	2024-05-09	Transfer To Savings -0387	500.00	Uncategorized	\N	f	{}	c0aa5c7595fa0d89b60010ffc5373e822b82cc98b1951eb2dd23bdf9ba71ae80	f	\N	\N
af23f330-c43a-439c-aac1-224e08a1d779	2024-05-08	Debit- XX 6114 Shri Sai Kripa Httpstherango MD	59.33	Uncategorized	\N	f	{}	1a06efea0e39a41caf7f791e4d189b78ca73f211daa03657620df4948f6bd5fc	f	\N	\N
d3df1c51-fb56-4393-abfd-d7aa370c684d	2024-05-07	Debit- XX52 - Bwi Long T Baltimore MD	48.00	Uncategorized	\N	f	{}	53814889822f9b356450c531ae48ebb4b93de8c93f661585abd8ff7dee264b84	f	\N	\N
bffa6415-f129-44b6-acb1-d0b6cd5f0854	2024-05-08	Dunkin' Donuts	5.40	Uncategorized	\N	f	{}	1a182eaac928957f8428193add881c1b36fbf5d34c957b3d2d18604924aaae64	f	\N	\N
898c3d43-0363-410a-b8b3-9723c8613808	2024-05-09	Transfer From Savings -0387	-1000.00	Uncategorized	\N	f	{}	739713f7d14059c5aab6465dd49797d9ba6b30f315418274d5e0fa4ff9d7490b	f	\N	\N
19916fd9-9302-4147-bd7f-ce12d3427c25	2024-05-09	Deposit Henry M Jackson Payroll	-1709.21	Uncategorized	\N	f	{}	e4a303bde6a758c223010753b7da30c2b82ed50edfe1e0da688b69422a962618	f	\N	\N
ae7b4201-6de6-4bbe-829f-4d6c8ce0c22c	2024-05-07	Ledo Pizza	39.45	Uncategorized	\N	f	{}	40aad143a088d6e19bb00d61042c27572559036a48ad3c6b4d9f1c1ca99d03f0	f	\N	\N
a3658215-cb73-49bd-b6c4-013690c79903	2024-05-05	Debit- XX 713 Tattoo Parlour Houston TX	300.00	Uncategorized	\N	f	{}	7e056d31e66b84ff26130b90061cc6ef8cd965acfbc8c4b1ef0cc9c9f31449ec	f	\N	\N
07defeb3-afb5-49bd-bf93-56c214637a59	2024-05-06	The Pit Room	50.27	Uncategorized	\N	f	{}	e2221bfd555758cd823807fd62cf38073bf6b5a75be3721b58e8467747f05ca6	f	\N	\N
28884bca-8843-4d03-aca8-b7ee14c3aa7c	2024-05-06	Debit- XX 8678 Sq *cidercade Hous Houston TX	50.00	Uncategorized	\N	f	{}	c11e7849dd4364ee069c4d5788ed084104bd9a798a636b5326ca1eed474bcd37	f	\N	\N
54bda06b-e7eb-4d1b-b342-05a1fc0883d9	2024-05-06	Honey Farms	41.40	Uncategorized	\N	f	{}	967d735a99032ba7d2dcc5f03ccad20dc6ce1182f75ff14c4e49956420a41fa4	f	\N	\N
8ff18336-0275-4b29-8e05-af3d1df92eb4	2024-05-06	Blacksmith	17.24	Uncategorized	\N	f	{}	a0c7a421b9057230ee86f47f66ccb82788e00c8638f57ec606342724bf1150c0	f	\N	\N
26b9c288-7cf3-4291-aa78-2266b22055ca	2024-05-06	Kroger	16.05	Uncategorized	\N	f	{}	24653b881ba60073ca4d48ddf394240acb945b0f196e4e2a9f195ea7eb6fe926	f	\N	\N
c5736b03-7f2a-4046-bffc-9b38f578adfb	2024-05-06	Debit- XX 6114 Dd Mainbirdhotchic XX-1040 CA	15.14	Uncategorized	\N	f	{}	e36605b30613fd93b8c7dde337a68b4cd3f70dabddaf048996b5ee9286d4c9eb	f	\N	\N
52b6479c-5050-45bf-a02b-3c96aafa1bfb	2024-05-05	Debit- XX 8678 Tst* Holey Moley - Houston TX	5.21	Uncategorized	\N	f	{}	1b9dbffb3ce1ac7808003aa4cd75f76cd78087bc0e573ea33950be0df6955e2e	f	\N	\N
bb3407f2-6f52-4e9d-9080-3a3dd70b305d	2024-05-05	Edwards	5.00	Uncategorized	\N	f	{}	07f1c593f7eedf54e4aaa8e0315cfd565756a7e2def9a73073fd328468058a3d	f	\N	\N
1e78dd4a-e889-40f4-8c15-7fa254f1a347	2024-05-07	Transfer from Venmo	-360.00	Uncategorized	\N	f	{}	390c676ac4996647c3f89063b2ff4342c63f88f622cd6773c7c7b2cbda1a27c6	f	\N	\N
a171019e-a2a2-46a3-a76e-c78746dfa8aa	2024-05-06	Payment to Chase	100.00	Uncategorized	\N	f	{}	73c8070309d9967f4682e003909c9d0c339286d419b1270aea6f14922c4879d0	f	\N	\N
d7ec0788-54d3-49ba-85b8-9e1a310c5534	2024-05-06	Transfer To Credit Card -7148	500.00	Uncategorized	\N	f	{}	b9df8eeb7240b4fbebea4d6004215944dd9151b463e06a44550f29aaa93e3f05	f	\N	\N
3e53e6d0-8955-4e44-807a-46997521ad16	2024-05-05	Debit- XX 6114 Holey Moley Golf C Www.holeymole TX	229.60	Uncategorized	\N	f	{}	839e8bf00239c7b85144134d321c9f3abdb020194b299ad24aea2ac9f8793ed3	f	\N	\N
87a8e497-09cc-4a66-84d1-43480d273819	2024-05-03	Payment to AT&T	200.20	Uncategorized	\N	f	{}	64945508b05d8ee913fc39683b0783d9950886796651115ef1e0a11fb98ad203	f	\N	\N
2cafd19f-01bf-4d6c-a4b5-f37aafd99549	2024-05-03	Foodtown	190.77	Uncategorized	\N	f	{}	54ca6ff62fcd5a3dc62e8b13d62e873b5a1d5b4160822bb1906b7dc669c17eaa	f	\N	\N
bf6f83f5-8473-48c5-b029-63c4b1d606b4	2024-05-05	Blacksmith	114.00	Uncategorized	\N	f	{}	edbda456a9643b8ad2f6a5d208fde617ee44dad9651dc91e59f4464696e51626	f	\N	\N
ca74077b-c5f8-4686-bdb7-140a1f8f00ce	2024-05-04	Houston Zoo	88.74	Uncategorized	\N	f	{}	9f9df7cc84d87e48e7c2f53eb9da0a619f46ad74a3771592c78fcbf7f7c9c026	f	\N	\N
cddd7c96-f36e-464f-adbd-03a776daaf46	2024-05-02	Debit- XX 8678 Tst* Saint Arnold Houston TX	86.61	Uncategorized	\N	f	{}	a48fd553004b400c752129d8c77587f952b0fc9a0aecfc8ffe98aa385e1aa972	f	\N	\N
f8ffc576-1e29-4024-befa-097f19da5195	2024-05-03	Truth Bbq	82.26	Uncategorized	\N	f	{}	12b6bbfebc7fd9dc7aa8a6cc72769912e0d82e88f61983dbd7f3364e8a2e2e96	f	\N	\N
f7c776f3-82e9-4906-be90-c2a271c81e04	2024-05-03	Debit- XX 8678 Scgiftst2652 Houston TX US	46.52	Uncategorized	\N	f	{}	84473fe68a3f1363160255068ac75755ad04099bca997f0bc50d70682f54b22c	f	\N	\N
da63bd7f-32a6-402a-9496-429beaa72dde	2024-05-04	Houston Zoo	45.46	Uncategorized	\N	f	{}	9d74884722838412eaf7cbb027d8336511681a0ac7ed7c9ddf44ce4363b70803	f	\N	\N
c1a6990f-d5e5-49fc-b99b-444044e204aa	2024-05-03	Debit- XX 6114 Space Center Houst Houston TX	40.00	Uncategorized	\N	f	{}	1269aa0c20823bc4390d227ef29ea84f37c05d4f32bbd1cf28f59242b734c7cc	f	\N	\N
59168b4f-14ca-418e-b9c8-cb0a15c33238	2024-05-03	Space	35.00	Uncategorized	\N	f	{}	dd71de1913d72bbcf45b1575ec75c43920fbda16262df7b7d18faca54fecb6f0	f	\N	\N
dc5ba06b-a737-4e1e-8025-5c5b4980c3ac	2024-05-02	Jack in the Box	27.12	Uncategorized	\N	f	{}	2f11e8dc16b7921def3ba2756f3bda5ba07cbdc056fe6cb0e3271ff10604ed69	f	\N	\N
1b22b52a-e483-4804-ab34-ddfbf76f9845	2024-05-04	Houston Zoo	27.06	Uncategorized	\N	f	{}	4677c40c8927253c3dcf0737910b738c2a5325e07dc390bb67c8c2b6d935be8e	f	\N	\N
24714547-870c-4827-a6d3-efc6a4f9488f	2024-05-02	Debit- XX 6114 Bwi Obryckis Bwi Baltimore MD	26.00	Uncategorized	\N	f	{}	952cbe86f77a9dab791373b5f1658932d7e234c5f7375df1d673bf0aaff52931	f	\N	\N
976c8eeb-d528-4f08-9f7a-138caec18655	2024-05-04	Houston Zoo	22.73	Uncategorized	\N	f	{}	7bb7dd5e390425b3289bf41e74da049c1a27d9822e7ee4f1d8d2d02d0c7b000f	f	\N	\N
fcd5001e-071a-4ef0-9f0d-e38b3b06a1e7	2024-05-04	Voodoo Doughnut	21.75	Uncategorized	\N	f	{}	14ea161a504a7a64cf2b37f3823677eff98f6052cc06a37a9c19cc1cbf641bd8	f	\N	\N
7dcf9794-efc5-49ea-a484-22f1194a018c	2024-05-03	Chevron	18.88	Uncategorized	\N	f	{}	d75f260e1ffc095d071f7fd5d3286513a05a8bf6348dd3757591c64d081d7930	f	\N	\N
7a9673ad-b9ec-4d2b-8ff9-6e906b1445bc	2024-05-03	Debit- XX 8678 Native Coffee Houston TX	12.45	Uncategorized	\N	f	{}	0ec16d8a5ab365d4e67e2e6509a3ca788e66e1f2bb828d07dca31cccad4c1e81	f	\N	\N
24658620-a1c7-42f8-ad0e-72203164eb47	2024-05-03	Metropolis Technologies Parking	10.99	Uncategorized	\N	f	{}	654ef94c6a70cc63929cb3d89330c86c46204e2c5b291f2867e725dadb98e8e3	f	\N	\N
5dca047f-c261-4682-8053-97a9aeed586a	2024-05-04	Houston Zoo	10.83	Uncategorized	\N	f	{}	128d2a68479842468e77ce232d66fe8e4fb2093d2cf0465b49a37d968423842d	f	\N	\N
66f4ed05-dc46-440a-a853-f4ebaa12d71f	2024-05-05	LA Fitness	10.00	Uncategorized	\N	f	{}	08468b0fed6d11568d98c21223cda72b9e172834551f06d134d1ee38a1116c3d	f	\N	\N
4a7bad32-1ada-4318-ba12-dafe2dabaea0	2024-05-04	Houston Zoo	9.00	Uncategorized	\N	f	{}	089db51815bbc481cd791eebfe81a6fd9ec5f903894c20059d1209d50510bdde	f	\N	\N
e752e5a2-5b11-4b9b-a06e-c2c2ae3a0a18	2024-05-02	Auntie Anne's	7.62	Uncategorized	\N	f	{}	0157a3022b2846c09b86fb66c3f2864f10403ac41c0d024b518dcd09bb54f1fb	f	\N	\N
ad0edc5e-99fa-4b05-b827-c686efdee6a8	2024-05-03	Debit- XX 8678 Spacecntrhoustonca Houston TX	2.91	Uncategorized	\N	f	{}	e061e0b5c566ffb4a5111402d69dc7f55e352b954d47781ac18ec9ff81130a0a	f	\N	\N
3aa9e682-acc7-4a8d-9465-5fd0ffce4d89	2024-05-06	Transfer From Savings -0387	-500.00	Uncategorized	\N	f	{}	ad6a64a558778912bd397d5d7fa048ccb72541a7ae9811f199e2bcccc466f9eb	f	\N	\N
6e310bf3-4fc9-47d5-834e-9f9b7f693635	2024-05-03	JPMorgan	2107.66	Uncategorized	\N	f	{}	a886ef409bc7f82e59e4fc214549738b1bc06aa5e4f4a3ccd990d8e7b99ce25f	f	\N	\N
c789e8b8-42c0-42c8-bf38-4c5a9d87f27d	2024-05-03	Transfer to Venmo	90.00	Uncategorized	\N	f	{}	d82cf9e0ef874c0cb67edb0f252bdc7c63da08de29ca57bd46537c92fccaaca0	f	\N	\N
0c7f2599-a3b4-4180-9b3e-032fbc041c8e	2024-05-02	Connected Services	84.80	Uncategorized	\N	f	{}	1c718d67db25e29c06e307a342f5f79dad09a92948eda81d5d4988005904bc6a	f	\N	\N
5982cc47-8875-4784-b0e9-13b2d052919b	2024-05-01	Debit- XX 8678 Rejuvinations Pasadena MD	80.00	Uncategorized	\N	f	{}	5568829250c83ed609a3cd7168c696e24236f9948e507a27a7e815eaa41d17cc	f	\N	\N
4e28fbd7-f413-4696-ba97-74dfc1b91eec	2024-05-01	Chick-fil-A	13.77	Uncategorized	\N	f	{}	4e61b459323ac690eeec3dd57b6dfd5931c3615247eb5dfa79d06bcb66a8b6b8	f	\N	\N
5d064d51-a3d0-4445-b498-134ab14f0bcb	2024-05-03	Transfer From Savings -0387	-500.00	Uncategorized	\N	f	{}	8978a8c67045c3330d92d622c080795bfb15afb7bd0a92ce312e529d253e208f	f	\N	\N
a6a7ddbc-f582-4553-a968-0128de124b60	2024-05-01	Target	29.60	Uncategorized	\N	f	{}	13bb18c23408771232f88b48475b08d8c83b3611e137925ffe8c3db8c6de531f	f	\N	\N
97f9e878-0ff9-4bf2-8061-3fa1ca6709bd	2024-05-01	Apple	2.49	Uncategorized	\N	f	{}	62770564749a78cfff20edb9e6fe61549684230e8122cc8f956ac507236c13f4	f	\N	\N
bb5d7594-e0a3-404a-b91d-55cc4d5b72c9	2024-04-30	HomeGoods	-229.99	Uncategorized	\N	f	{}	3b95219bf13190e37e117782aed84f4b6727e59e87746c559ae8a11dceb75658	f	\N	\N
90a6d6ee-6582-4334-915f-6abb688c1366	2024-05-01	Target	-45.04	Uncategorized	\N	f	{}	3f94b156ff1b0fad7f7eb8d6b819aeb248212ce247b10a84fa4ea935992500ef	f	\N	\N
8b023457-63ec-4134-b85b-3f0b12c4c900	2024-05-01	Payment to Apple Card	1373.45	Uncategorized	\N	f	{}	3f0279f280fb3cceb637086dfb188ed7ababb2215761be46169e45a78d55db36	f	\N	\N
af08a66f-5f5f-4a91-966d-2b77740ac074	2024-04-30	Uncle Julio's	65.00	Uncategorized	\N	f	{}	a24ec879846fb34804b0aa261fc00eca85677a875e1e4d03498b90ac2cf437ab	f	\N	\N
9db898dd-9bfa-4be9-aadd-50a79c4b5bce	2024-04-30	Giant Food	11.33	Uncategorized	\N	f	{}	06202dad9b7f202023b23a75649b0563498bed6424aedccf44a175a3927f9c7d	f	\N	\N
4cf8993e-073f-42f7-bb7c-bb6501d70881	2024-04-30	Interest Income	-0.57	Uncategorized	\N	f	{}	b1c1207069237a3a17bf45c6993e0a20d87a6edea7fd82894628aa478ce26b52	f	\N	\N
2a9310b7-df1e-4b9f-92eb-566dfe1a274f	2024-04-30	Payment to Baltimore Gas and Electric Company	198.00	Uncategorized	\N	f	{}	e7d6abc30b0a0c36e0e0c0301975544b564bb47d99cf04919d65ebe2d76691f0	f	\N	\N
0626131f-f751-4ca4-a6f1-0b4c69454098	2024-04-30	Payment to Citizens Bank	88.12	Uncategorized	\N	f	{}	f5e3f1d84a315a538d01cdfe1c1edaadf5a8a6074d7d49082d03e9b5ff7ecc54	f	\N	\N
3e980510-9801-46da-8c0f-51b69490824d	2024-04-30	Transfer To Savings -0387	3000.00	Uncategorized	\N	f	{}	88e8c378170b564f3835b0b575976c1a076e569fd1dd31b4f2afb4a675c95b76	f	\N	\N
0a8415b7-8ddd-45d6-a9e7-6708ed1ba9ea	2024-04-30	Transfer to Zelle	750.00	Uncategorized	\N	f	{}	5025f406cd965013426a29052ae69fc8241d208cd625e722c64a7d5b6c38d46f	f	\N	\N
a5ede19c-2668-4b76-84f9-1bac396add06	2024-04-29	Precheck	85.00	Uncategorized	\N	f	{}	3509f028eb46b6011faefdd241b307a0ec686c1a2a2a4cd8faeb2c94fe80233d	f	\N	\N
97836885-2001-4015-b9cd-373640c72098	2024-04-30	Transfer to Zelle	50.00	Uncategorized	\N	f	{}	b263a44bd8b9bc4932706f951d839ccd7edb37450c83f42fdc3fc67e075409bc	f	\N	\N
1acf1b00-900c-464d-bcbf-2c3cab3a4d0b	2024-04-27	Debit- XX 6114 Yards Lot Q 1925 Washington DC	35.00	Uncategorized	\N	f	{}	0f3c7b8a10b68bb1bc9a85f4288353c0ba496d598ec75b99b67addcb17f8e741	f	\N	\N
cbdd05d8-a41d-4f4c-9733-25a155a617b2	2024-04-29	Giant Food	18.45	Uncategorized	\N	f	{}	a2703ffb8ce124c4fb6ba48871c0b270cb238b4b819abe9a995d94fa4a047366	f	\N	\N
77163b06-dc59-48ce-a182-db2fdf2bcadc	2024-04-29	Target	10.44	Uncategorized	\N	f	{}	c35bd031bd23115cccae090ddd10b7fa2f88e1d4571a1adb25f580d49f372a09	f	\N	\N
8fc49b92-f26b-406a-9837-ce96834ead1a	2024-04-29	Dunkin' Donuts	5.40	Uncategorized	\N	f	{}	8f193c4af5a6a4863f815ecfad547eaf1a57aee7a4a7df487bf9bb00462804db	f	\N	\N
dcd04dcf-a04e-4c44-bfb2-9edfaea7dec9	2024-04-29	Transfer to Venmo	20.00	Uncategorized	\N	f	{}	60f851dd6b6ed8ca98a637010d0f361b816f2049d6ee8d6c1c3ae538a92d2e65	f	\N	\N
123a7f54-5ebf-4d26-abf9-d72896d1405f	2024-04-27	HomeGoods	282.98	Uncategorized	\N	f	{}	e1e0b3da88f1f2f411ca005276faf9a646d72524052933b3e93582b358993b40	f	\N	\N
bb5de757-38b3-49e0-a542-20ba3bb23cd7	2024-04-26	Debit- XX 6114 Sq *nick?s Barber Baltimore MD	192.50	Uncategorized	\N	f	{}	48782e1ee14003c03f5d32103270552c6ba7ef4c37c83a0a70cf045fe7d761e4	f	\N	\N
acc05ad5-0de5-4a63-8599-aca0c56f7baa	2024-04-28	Target	173.98	Uncategorized	\N	f	{}	c11447fb8b2c2f68edbfceaf97c1461bfec6b10e3949270ef57f138d60027515	f	\N	\N
7f39b718-f084-469f-9334-14eb91a7b770	2024-04-27	Ulta Beauty	83.21	Uncategorized	\N	f	{}	75636de7f4fc406743807fe7e715c520ff0fd04fb2bdbfacb6d68dc2126c8d5e	f	\N	\N
46d1f3ec-e784-45f6-a6b2-f9f7c1d5e3b8	2024-04-28	Old Navy	72.45	Uncategorized	\N	f	{}	8edc8d49add097fcf99bdb0b1b6f3ea6cfc0380a5f38250403f41bd88489bdb2	f	\N	\N
34093662-d30a-40c8-8ec0-118177220a73	2024-04-28	Amazon Marketplace	59.83	Uncategorized	\N	f	{}	45d5b7dff38a7c073cabd08ce1b35d9215827884f12bb70ae2a9b1eb4c9f9505	f	\N	\N
79a718b2-a27f-4954-ba4c-bbaf10a7c812	2024-04-28	Target	55.63	Uncategorized	\N	f	{}	35bf84523b2814b73aff86e88cdffb3fe358f374e296967b799e2736400cff99	f	\N	\N
888a868c-dfd9-4df2-abfa-662de409c518	2024-04-27	Harris Teeter	45.07	Uncategorized	\N	f	{}	099c42d929f11401700383a8d0aa8666146ade13622c4497c64517cd45f8d0fd	f	\N	\N
31695d95-c4c7-47c9-af6c-7bed60426f12	2024-04-26	Popeyes Louisiana Kitchen	42.89	Uncategorized	\N	f	{}	599416faaebbd74216ee76a041fc100a39d9c08011b645870172be215b1015dd	f	\N	\N
ccc8b354-5ae9-48df-a14f-9f75e259ab75	2024-04-26	Bagels 'n Grinds	23.28	Uncategorized	\N	f	{}	d5d5a7693df9e5771427569849ee56505f47b401c1db8da8277b632c0ffaea2f	f	\N	\N
553e0172-fd08-4959-8eec-41b9ae136f37	2024-04-26	McDonald's	20.72	Uncategorized	\N	f	{}	11bbbbb4199b6fd0d030df8d2c944529d3e07695d911c6365cb750df51c70092	f	\N	\N
f18f6755-8aab-4d4e-930a-265d631d0423	2024-04-27	Debit- XX 8678 Rejuvinations Pasadena MD	20.00	Uncategorized	\N	f	{}	34be2a98dfab0b5089c7271800aac507bf8deb4748ec549147f564bedf01b95d	f	\N	\N
0555e48e-dcaa-437c-a31f-f7e51941a60f	2024-04-28	Amazon Marketplace	18.50	Uncategorized	\N	f	{}	cda55d437a3e840a8fccd8d95d933c7f101d6f69d637e3e243748553484b0ccc	f	\N	\N
94f019f8-aefd-4512-bcb2-be549b220009	2024-04-27	Levy Restaurant	18.08	Uncategorized	\N	f	{}	dacb382c993caee2e07e0c8a3406dc2f2eabe87645861e073442c213770ca3c4	f	\N	\N
5c28e10d-5cd2-4c36-bbe9-fefddd7d06c4	2024-04-27	Debit- XX 6114 Waterloo Jessup US	15.00	Uncategorized	\N	f	{}	c35941ce931421fb573256d37ca9dfa286f6fe5b5cac433dd4bc6ee9545d21b6	f	\N	\N
0682babe-8541-45c4-bf89-03cceaa83284	2024-04-27	Dunkin' Donuts	10.37	Uncategorized	\N	f	{}	bc792254b5ca687efcd38f436d3e8ea468ad7ce904280bde2bfe160d017e7428	f	\N	\N
2475307f-56df-4a66-80de-382075d0c642	2024-04-28	LA Fitness	10.00	Uncategorized	\N	f	{}	d67c9fd483b027cd3e5737410792d897264d36a6147a70b3ca5ebf2598c3c637	f	\N	\N
7c2fbfed-1b5d-4911-a982-396a328b5ca8	2024-04-27	Chick-fil-A	9.06	Uncategorized	\N	f	{}	b56be88de4fcf581d0b95fab9d2de9549a3313b6fda54d59f1d227e45a2c8289	f	\N	\N
a335a9d1-79d3-456b-b160-78a731a6c686	2024-04-28	Target	8.47	Uncategorized	\N	f	{}	f7a193164d9550e459b536a04cbc28d1545edb6985b510e7011c3eca9484400f	f	\N	\N
7252294c-0e15-4fd9-8b53-1fb8b2da1256	2024-04-29	Microsoft Deposit	-10391.11	Uncategorized	\N	f	{}	e2e0d717e75f97a2869438181efc2390c90aaed24ba0013b9335c210aaf8db60	f	\N	\N
48925e96-b219-4eae-bb3c-edc86a930673	2024-04-27	HomeGoods	-52.99	Uncategorized	\N	f	{}	dc097ee04e8ff0b53f7b32a556a36b70b02646b982e6d50ceb0b463043ad5e98	f	\N	\N
0dad8679-b44b-41c8-aed8-267840925f7c	2024-04-26	Payment to Best Egg	537.47	Uncategorized	\N	f	{}	49d173302bf547891834817ccbebab22338672cf60a96ee28a07b1b61fc4cdba	f	\N	\N
e4b188a2-8cd8-4ab0-b568-6ea0acef1229	2024-04-25	Rangoli Restaurant	73.27	Uncategorized	\N	f	{}	decea3b6616248ee45f43bb0b41b80ef8cab4843eb8ab407fe564b463d20acd8	f	\N	\N
ab7b951e-ccf1-49bc-be31-44d54e5ef86d	2024-04-25	Debit- XX 6114 Aacc-cashier's Off XX-2236 MD	50.00	Uncategorized	\N	f	{}	1ac67da190072db184d7fedcd00cb9be03ee164660bd5219cd889a9a2bd2d455	f	\N	\N
65fd9531-579d-42d2-b9bc-1e4a0c0be7f8	2024-04-25	Costco Gas Stations	48.70	Uncategorized	\N	f	{}	4daabd3a56eab74e59fec5e195a26bc551b3f4db78cc5c84e15fa9bdf429cf6e	f	\N	\N
7cb23169-ebc9-49b8-966a-14a1f22725d6	2024-04-25	Rangoli Restaurant	25.28	Uncategorized	\N	f	{}	50e789a5219856f46fcdabd476021f7c0c6819d9d324f51e4b49d2a8f15ada5e	f	\N	\N
53ef9987-d888-4d45-8407-13e5253992a2	2024-04-25	Deposit Henry M Jackson Payroll	-1709.20	Uncategorized	\N	f	{}	34b3816468afea0b1275dd26593d3f65e879beff45fd31f2cd7ebd046a48f6d7	f	\N	\N
06c634f0-5486-48aa-9628-bcefcd986b95	2024-04-25	Transfer from Zelle	-100.00	Uncategorized	\N	f	{}	f69235d06dc92eae8b07f4f3b814f2026750d323d74670fc1da45e3ae2c52b8a	f	\N	\N
4224251e-ac59-4407-a1c7-b7ab8e2a592d	2024-04-24	Payment to Liberty Mutual	202.86	Uncategorized	\N	f	{}	02c819e73f567195b3e78b544c56cd7f377f82f6c6fc6865da7f109fe2d6c462	f	\N	\N
d4858258-4506-41a7-9e4d-b897cc498a82	2024-04-23	Giant Food	45.26	Uncategorized	\N	f	{}	c6002d2dc469c3a8c5c9f3d8ab1de527232e5a4e6d9127a4f887ba790c778072	f	\N	\N
ad9915ec-9997-40a3-bbab-d22ffd1fde37	2024-04-24	Returned Item Fee Check# XX0001	29.00	Uncategorized	\N	f	{}	0cbfe8859d0e8f878f2762c86884416125a4a82e7168afd2f47b4c8d53a16c32	f	\N	\N
9311fcba-b30f-457a-97af-e05e2dfb7adf	2024-04-21	Frank's Den	15.96	Uncategorized	\N	f	{}	e93361b99190bfabda50cadf7f024d6bedb7ac8c899616450b8b77ce8c0ab7e7	f	\N	\N
752e01cf-7cc9-4e9f-bca4-807ca8fd7ce3	2024-04-21	ParkMobile	9.45	Uncategorized	\N	f	{}	68b5b8d52000de7a4125950db906e4b57417c2c67eaf85cdb7b714c62f3854a0	f	\N	\N
05e7a023-a38c-464a-83c1-0df92d11d054	2024-04-23	Transfer from Venmo	-270.00	Uncategorized	\N	f	{}	fe066641b89b2660cec111611e72b3c2979e5e15162f871e26de3792746253db	f	\N	\N
cbc31b93-6797-4a05-b0a0-a7861d2aec32	2024-04-22	Transfer To Credit Card -9005	395.00	Uncategorized	\N	f	{}	8b49668dea1376009e3022aa01d483b381b7b96f10a05017ab3d96fb6e2c60ed	f	\N	\N
b280e3e7-b2c2-4eae-84e6-85978ea39877	2024-04-19	Debit- XX 6114 Fortune Cooky Httpswww.fort MD	53.15	Uncategorized	\N	f	{}	cbd25827454057390db6ea5f7c436ea95e18e9c39177d64e18abaf4821aa0adf	f	\N	\N
b8f88813-1dfb-4339-8072-ce212e70d212	2024-04-19	Target	23.63	Uncategorized	\N	f	{}	4f3e6dfb5a73a67eee42482ceb59c7f16553df3667fcd26e9a2cc7258786fc0e	f	\N	\N
630a4db6-14b6-49ff-8b0a-56838255ad5f	2024-04-20	Debit- XX 8678 Muddy Creek Liquor XX6267 MD	7.00	Uncategorized	\N	f	{}	36669c706d0d4a5333cab996ebc4e95aa7c3c1891c9b7073cd3d5f9f5e5d978d	f	\N	\N
7a6c70c1-46ea-4323-8b5f-5dbd55e21045	2024-04-21	Target	3.07	Uncategorized	\N	f	{}	be6cb24d0432f92e3b6ad8482ef166f9d43a95f1636395a0fc7584ede3145476	f	\N	\N
88614bde-d21d-4fd1-84dd-73666cfdab7e	2024-04-22	Transfer From Savings -0387	-37.19	Uncategorized	\N	f	{}	a52bca387e820039bf27017bcd1174b4ffd6115eb72567113d2c9a9444be3569	f	\N	\N
7cef3431-2de3-4232-b820-7bea4f876b95	2024-04-18	Life Pho	23.65	Uncategorized	\N	f	{}	177f3281ca2809cf1a6d387ca68bdac1522bd1a51dfc3a0620f7193826d36b63	f	\N	\N
43337e7b-b022-4d7b-add2-8c4c799ee479	2024-04-18	Debit- XX 8678 Brusters Real Ice Severna Park MD	11.13	Uncategorized	\N	f	{}	49317b10da8fe6d39045e281f4b0cf4451964e8d351192540eeb8993c9dc9c68	f	\N	\N
89a955f9-a89e-4312-b74b-5c1157a7c509	2024-04-19	Apple	7.99	Uncategorized	\N	f	{}	c7e3545f15a37083c07c9ee360609dc1fd9053211041003ca84a3439d8b1e367	f	\N	\N
2b5994c3-f77c-44b6-bba6-a1611813af70	2024-04-17	Debit- XX 6114 Ummc Midtown - Par Baltimore MD	4.00	Uncategorized	\N	f	{}	9dcc1b84882febc6e3c745ee8ef5fa3746602d3c746ac827cb8f70661a341c94	f	\N	\N
5ef00dc3-09c0-4b04-8289-bfebc994c8f9	2024-04-17	Airbnb	602.48	Uncategorized	\N	f	{}	6d2eda11fec8bf73997b6f1d6cafcad39488386e8ea8d80a639f29580eb1a6e9	f	\N	\N
22c6b903-d3b0-4811-90c3-cc85a5686d2f	2024-04-17	Debit- XX 8678 Brusters Real Ice Glen Burnie MD	28.91	Uncategorized	\N	f	{}	8041384610bf424383e0abb90abbe8527f50f76e3d9e552cf88e64359be16f7a	f	\N	\N
6c1ab811-2dae-4a16-90db-be8cc183ff2f	2024-04-17	Payment to Capital One	287.00	Uncategorized	\N	f	{}	c2ff143f8c5e1a20bc59e422703010c6e6d4b3f357871141989b2a7e68f79120	f	\N	\N
e8df9a69-92cf-477b-be50-bd49524efb20	2024-04-15	Debit- XX 6114 Southwes XX-9792 TX	22.40	Uncategorized	\N	f	{}	a2d9d97decb0810d7c89b403c4282b31b9d696adcdf2b3c0b89bcab0de33d67d	f	\N	\N
c31c77d3-a9e2-4741-83f6-7dcc82a54e34	2024-04-16	Sam's Club	18.98	Uncategorized	\N	f	{}	0aa6f11d61f6db057187c66d59fe200855eac3bbc4c15245b9a77c2dfe2969c7	f	\N	\N
2e8446c8-61d8-49e6-a3d5-2a6a38e69352	2024-04-16	Dunkin' Donuts	1.49	Uncategorized	\N	f	{}	baa111c29350533df105809d88c0eb775d89825145872dab9526afbd673e22fb	f	\N	\N
ec82fda6-8218-4661-9f71-ee7e88a493e9	2024-04-16	Payment to Best Egg	1338.03	Uncategorized	\N	f	{}	7b787778696cb902be494fbd72df518d5099898cd9898e6399b8d98bd723a5fd	f	\N	\N
9f2eb4d9-a492-4ea9-918f-92a9c3ad19a1	2024-04-16	Toyota	900.00	Uncategorized	\N	f	{}	9be53f2c0bd313c681d4cc7121c78c31a4dbc6112a92fed89740a07b25efac2c	f	\N	\N
adb82b75-0606-40eb-8b43-ba867b8df1eb	2024-04-16	Payment to New York Life	616.54	Uncategorized	\N	f	{}	abecefabc0ebac2d2e0e323fba6b11d93c2dba48f17c1c4347d9ca9ebd705c93	f	\N	\N
7ae3ee92-b870-4a83-9e84-970b403fc5bf	2024-04-16	Payment to Chase	400.00	Uncategorized	\N	f	{}	d8c783995ca3443b131fbbfa61b8efc0ab6cc0ed3947d058d33eb7ef45d30637	f	\N	\N
671e0e66-d81c-4244-a76b-d8b1f913cd26	2024-04-16	Payment to Discover Bank	212.00	Uncategorized	\N	f	{}	cef01ea8680655575f4b5214f307152bbcd72186f2b778d50253d58267f899d3	f	\N	\N
8d637215-17e2-444c-8ba5-3911c31530e8	2024-04-15	Sam's Club	166.93	Uncategorized	\N	f	{}	ceda407d464e2cf14bacc52d550a509d349d396fba1aa8e6d97a82206e4af534	f	\N	\N
679fab1d-340d-441c-a54b-eda164991ea0	2024-04-15	Costco	71.90	Uncategorized	\N	f	{}	7173ecdb82fd56ec7e06fff69364ec43bbe16a3438b9d803f5d44f0c9c24e9e4	f	\N	\N
9fcf6d28-4fea-4436-a01f-9619d3b3b46c	2024-04-14	Polished	70.00	Uncategorized	\N	f	{}	6fc1a8dfb219748c6449a0e83c76f9ed6f9cc78f9c000ee14490ec5f9741bfa2	f	\N	\N
3525049f-f9a1-461b-b3ed-60281e1a1ad5	2024-04-14	Old Navy	25.43	Uncategorized	\N	f	{}	58acd125fecea00ffc10c15620dce30eb97451ff8b02f6c2d7753423d958cb5f	f	\N	\N
9f4eafbc-8fc1-4116-b3ef-77e8f486c276	2024-04-15	Popeyes Louisiana Kitchen	13.75	Uncategorized	\N	f	{}	9fcb628a80ee54affbe565766d37fafbfd1d42eb8a558ccff0a24c03f8d81d5d	f	\N	\N
daca906a-22c5-46bf-a1a0-26709b70f40a	2024-04-15	Costco Gas Stations	10.80	Uncategorized	\N	f	{}	985295562c7c32b70e991086716df9546422c6aa8d8bda7c4ce18654e508b42c	f	\N	\N
3ab09e09-7070-40f2-a57d-a1297e1bc8eb	2024-04-12	Target	167.55	Uncategorized	\N	f	{}	bed9f4b5ae674eeeb5fd08877a9eb3c478266b2f7872054e31f534ab51bb1e09	f	\N	\N
6d2e6bd4-80d1-4264-b28f-66fe4ad809d4	2024-04-14	Ulta Beauty	139.92	Uncategorized	\N	f	{}	23023948a1f5d184ae62149cf1646d8b4aa299dec36bf35bbbbfa6a383012d9a	f	\N	\N
e07436fb-f73c-4b72-8e3c-e059ba5bac01	2024-04-13	Debit- XX 8678 Bay Nails Of Pasad Pasadena MD	74.00	Uncategorized	\N	f	{}	bd99b7b6e9fc682a9dd3e15a6263d0db00e3a3d4e646893507f3c95ad8ca8bb3	f	\N	\N
0c57fa6b-4489-4947-ba94-2dceba6ffe3f	2024-04-12	Once Upon A Child	52.99	Uncategorized	\N	f	{}	4a548b0beb3f85033e717daa38281d44a6864bbeaed5ac72cacdba0a90ff295f	f	\N	\N
f5fedc38-acc3-4d3b-97d6-75cc57029bdb	2024-04-13	Royal Farms	51.69	Uncategorized	\N	f	{}	5c5889fba5908957f0ebd98015698d6d99bfebd5629cc1d4657fe6349bfc73bc	f	\N	\N
c1fd4a43-40c4-40cf-a4f9-07c8c0e5a4dc	2024-04-13	Debit- XX 8678 Di Pasquales Marke Baltimore MD	50.22	Uncategorized	\N	f	{}	5abf8b45cbf7bb11efd310edb1f2fed9da43673c26c209af916978d62f89cefe	f	\N	\N
475c070e-3d7e-4320-903f-6b02077bc837	2024-04-14	Old Navy	22.25	Uncategorized	\N	f	{}	4de63a9ace2f211aa64323206a3bf994d28f17bbffe85c3e5b67f609f4274bb0	f	\N	\N
d2288049-080e-4f53-9100-b57fb444d70d	2024-04-13	Debit- XX 8678 Chynnea Marie Beau Httpspocketsu MD	22.00	Uncategorized	\N	f	{}	560d0c4aa1dfb84f2e9b8c53a63d08a9b2e1f04f7b6c87be4f66222da10a0336	f	\N	\N
93297222-9008-40f2-a23f-3cc089d5153d	2024-04-13	Debit- XX 6114 Sun Wah Baltimore MD	15.50	Uncategorized	\N	f	{}	af69503760964b159e505d5887f633258e618836e9c1180ea8e9947d4b9ab959	f	\N	\N
401265c4-fcc3-434b-93e6-c82c94f6d329	2024-04-12	Chick-fil-A	10.91	Uncategorized	\N	f	{}	e21f51c0d071ee4f42edf57ed4c957538f45423cd33c614514b5a9a4fad461e9	f	\N	\N
cb421fd9-559a-4528-b878-3c251a5d3535	2024-04-13	Royal Farms	9.39	Uncategorized	\N	f	{}	1a7fc366a6d32fb0a5745ab85e5cc9cfcbff9540d5c3b5321b1cadb7980b4d62	f	\N	\N
7bfc3c8c-ec1a-4d44-ade3-aea5e1fde455	2024-04-12	Rise Up Coffee	5.57	Uncategorized	\N	f	{}	632307832fe33216771f6e251789535f4008e2e2d8a35f3bbacc7540c650695a	f	\N	\N
344f024f-3e64-4825-9aa7-cbcc05c82f6b	2024-04-12	Debit- XX 8678 Chynnea Marie Beau Httpspocketsu MD	5.00	Uncategorized	\N	f	{}	76467c6de32639e61234b589df8b72fa6310f69b1f4ee0e69f1fb7df8574a865	f	\N	\N
ad1ae0b1-4587-48ea-acca-92297ab851ae	2024-04-13	Naval Bagels	1.38	Uncategorized	\N	f	{}	4d93aafa24a93ff16f7eacb85a2cf4a349ef2198972ba5509c8b529ed24470c4	f	\N	\N
819fd7b7-e3f2-40a4-a888-163bbccc2fdb	2024-04-12	Payment to Verizon	79.99	Uncategorized	\N	f	{}	9bc595b347a469427352577d6aa9cbf7b60791d16961564cf983e379a0afa8f6	f	\N	\N
19bf20a0-0884-4ddd-8975-e91e96b39571	2024-04-12	Microsoft Deposit	-4524.86	Uncategorized	\N	f	{}	83b948b1df15fe25ab9ff7b59d8c9a9e065265271dd1fe24c726b8cda2ffe84e	f	\N	\N
6c17b99c-e559-4706-a735-93d70701367b	2024-04-11	Deposit Henry M Jackson Payroll	-1709.21	Uncategorized	\N	f	{}	3487c0bd7fb55e76b4582214d991bb46de98fcf222a819be710bc719405ec553	f	\N	\N
825f16d2-edbf-4c21-8678-a090fae6a836	2024-04-09	Lucky's Food & Deli	25.20	Uncategorized	\N	f	{}	66c80df69219e354d022a12188bf84c40e3d1e3c693fc2a9450921568e1f7163	f	\N	\N
265a4c4e-d993-42c0-ab8d-f4c9db5bbec0	2024-04-09	Lowe's	600.00	Uncategorized	\N	f	{}	edd6d85f725c0263359efc405fb8d9a98a06d461208b7f4c7556fb575629570b	f	\N	\N
1c1e5794-7ea4-436a-85b7-f96031ace679	2024-04-06	Giant Food	183.73	Uncategorized	\N	f	{}	c8825a632464b260946f60868320e2d0fce993b33c959df7141d5841682d3ba0	f	\N	\N
c718807e-0c05-4fda-bb66-8d6e4b750c6b	2024-04-06	Debit- XX 8678 Sq *nick?s Barber Baltimore MD	87.98	Uncategorized	\N	f	{}	937032b9b05bd7f9b6458fd05b077ba36ded97c0253cce1cbbca7f90412fe638	f	\N	\N
e922a39b-3421-41d5-a9d2-7bbce0daf1eb	2024-04-05	Amazon Marketplace	42.34	Uncategorized	\N	f	{}	dd3fe097d84e62a4f818df849669b7701947b8a40654bbcedc7fb030d43d01ab	f	\N	\N
b8112e56-ce41-424d-b141-bebe3157750d	2024-04-06	Debit- XX 8678 Di Pasquales Marke Baltimore MD	24.15	Uncategorized	\N	f	{}	466b4e5d7c3f7df46e1c113b2b8ae251f5c1bf8d5a552985698f3f1272f916e8	f	\N	\N
f2d81c63-c2a7-43d8-bc8a-8de30d0ac3e7	2024-04-04	Sally Beauty Supply	21.19	Uncategorized	\N	f	{}	a5a90c9ab0ac9291db84e7f0f2ec255eb821d98b4cf593f471031bfadf7245d6	f	\N	\N
47bd7eea-22d2-4a19-9b51-d5887753c878	2024-04-05	Amazon Marketplace	20.09	Uncategorized	\N	f	{}	74a397db6390db3eb0c2b9d5dffde82ec071e274510e18b378ee64a3a0dbdabe	f	\N	\N
741e0afe-1600-4511-aa7b-f6d18e30971c	2024-04-06	Naval Bagels	18.35	Uncategorized	\N	f	{}	294fd4fd3c4b882990e7aabc061553fab851121d4a97eaf2480499e2d9c7254c	f	\N	\N
7e750ae1-5451-43c5-89cd-56253f196c27	2024-04-06	Target	12.69	Uncategorized	\N	f	{}	dae24be91ee295ea38dc5aa35b66c1a1cccc1402ccc8df317b90bf8e0af84c65	f	\N	\N
f8bb778a-fcf2-416a-9b20-c77c6799a9e8	2024-04-05	LA Fitness	10.00	Uncategorized	\N	f	{}	4b474429d121f1bc4c11c5bf7e8cca3c8d2fca66869598f20939625f4e183ead	f	\N	\N
00498e9c-dbd8-4261-b80d-e828cb23afb7	2024-04-08	Transfer From Savings -0387	-150.00	Uncategorized	\N	f	{}	10557ba3a4ea8aa187b1b43ac77ecd62b634e487cd6ecfbb28eb3d974d465ecf	f	\N	\N
35b85144-b52e-4e17-b532-73cee9d43ecc	2024-04-05	Payment to Chase	450.00	Uncategorized	\N	f	{}	c1a759a80f414eca12d04ffaf9902d3e473a73e4a2042b93d693ed9899411b5c	f	\N	\N
7c81847c-cb40-4540-aa45-0f741361bcb0	2024-04-04	Popeyes Louisiana Kitchen	14.17	Uncategorized	\N	f	{}	cd741be6c22ee2d2ad25a47058aefde99b64dcb06b968314a2287c01d840fbe0	f	\N	\N
020c607f-276b-4cbe-8f18-8380cdecd738	2024-04-04	Giant Food	3.38	Uncategorized	\N	f	{}	8d0134abd1effb35801ed294484a8b2125765b04aaf00978db78c5f30b4a27de	f	\N	\N
a0304d01-b872-4027-ab51-4f99b0e71589	2024-04-04	Transfer To Credit Card -7148	500.00	Uncategorized	\N	f	{}	473af325e97f9be322d05ad216d465a3de5a6e9637b5ad4d37b1797f5806fbb3	f	\N	\N
30e59d92-2924-4d77-b1ba-a4daed514101	2024-04-03	Payment to AT&T	195.34	Uncategorized	\N	f	{}	61f8d5362b7e96bb0ac1713a97b38f61d408087c1a106c8efa2c0bb1dc50ca15	f	\N	\N
91bb5078-5247-4899-8736-fb7309674ecd	2024-04-02	Pizza Boli's	35.23	Uncategorized	\N	f	{}	649d087babb8784b339d13e1353c897a58f9a50250ef71a5e72d8217c7ba85d7	f	\N	\N
53c20c05-6c0b-4525-9490-8dc744b36869	2024-04-03	Naval Bagels	13.75	Uncategorized	\N	f	{}	d396cf29c232aaed059e982c38b8bd243ec7ccd190affb0223074994d1a13563	f	\N	\N
25bca403-2cc5-45a3-9cec-b60fa1f52791	2024-04-03	JPMorgan	2107.66	Uncategorized	\N	f	{}	6b257fa065292215a22f59842f13a98eac46af3091cd80d104ba0bb56b507c46	f	\N	\N
c889a68b-e088-4ad1-b9a6-4b8decd32532	2024-04-01	Debit- XX 8678 Rejuvinations Pasadena MD	80.00	Uncategorized	\N	f	{}	96aa2cd43ee922103c45968b09d170f04f6c17c2abf32160f8d05382a6af3bb7	f	\N	\N
56702ec0-dc16-4b4d-9db6-143b72ede573	2024-04-02	Giant Food	62.09	Uncategorized	\N	f	{}	077512ea1ff1e0f0f47d6311050cb4d4c19e6c3528afed185934b22da099ffcf	f	\N	\N
5fed2248-34ed-433b-882c-4fcef06c628d	2024-04-02	Popeyes Louisiana Kitchen	18.84	Uncategorized	\N	f	{}	0185e47698e58b4e25d346c2ced6445e2ab0cb5868626ef6b1c1f79601503148	f	\N	\N
ad82df9f-9781-4469-966a-9182fe8c53ee	2024-04-02	Rise Up Coffee	11.39	Uncategorized	\N	f	{}	10800be4061fb192bffb785870acccffeed7bba89aad0d36dc8da2613329d955	f	\N	\N
99209ce5-4ac4-4921-9fae-242138cfb351	2024-04-02	Apple	2.49	Uncategorized	\N	f	{}	2024c00291688165ee735148d6487719360fba349b1bfb697836fecf8c9ad8ad	f	\N	\N
2dbdfc58-6fd8-48db-9bdb-bb748187c36c	2024-04-02	Payment to Apple Card	400.00	Uncategorized	\N	f	{}	215de0c5cee0e7c3008482ac18ca4742758d227317a1023e382e88d50c282644	f	\N	\N
df7ba41b-080e-485c-af66-49cbe4147905	2024-04-02	Payment to Baltimore Gas and Electric Company	198.00	Uncategorized	\N	f	{}	cd709c28dbe981f6df262cc0dacdbc2b7d35df19c767bbd6d3607a7455d48df2	f	\N	\N
a9e39fa0-f765-4634-8603-46e54ccf4274	2024-04-01	Debit- XX 8678 Annearundelco-util XX-1144 MD	132.38	Uncategorized	\N	f	{}	d7ca662113f1defff47c9a7d15e6500bd913ca2a72a7f0a60612618e3bd05f2d	f	\N	\N
119106b8-0595-4e44-b4d0-4241eb8e0829	2024-04-02	Costco	120.00	Uncategorized	\N	f	{}	35b0fad3f0290dec58e20323d28c37dafe5c5619750c9162d54148ccfc9b32f5	f	\N	\N
ebc1334a-bab1-49ff-b71f-c6ba847ac0f6	2024-04-01	Debit- XX 6114 Jenkin's Mini M Alberta US	23.10	Uncategorized	\N	f	{}	a51968fd14bf60b40cf4918e9f375de9ad01f9123c35189972f85b2bc5d71b4e	f	\N	\N
3cd5e0a3-12a9-498d-ba5e-a1b5b85e3d5c	2024-04-01	Amazon Marketplace	19.07	Uncategorized	\N	f	{}	878c6a3bd279ac95d78d2d0b406774229d353a66bab49eba7d9b4b801ea0554f	f	\N	\N
81f34c49-79f1-4e86-969f-cf26dd946857	2024-03-30	Harris Teeter	205.44	Uncategorized	\N	f	{}	f7b6ca72e3f084f5ceaaec0e41b0835b166a23e230adeb25e59972dd1fae89c8	f	\N	\N
95637dcf-cd4a-43b4-8834-496bd17828a1	2024-03-29	Food Lion	85.13	Uncategorized	\N	f	{}	72ec72ee6ddfde2d8292a94b4d4c22ee23eb97b927b9b27e8394404e8f435534	f	\N	\N
8227e3cb-4c42-488d-b57f-70ab4bb79bec	2024-03-30	Target	78.03	Uncategorized	\N	f	{}	ab1a9165d8628bc3b7836420ee62587ac2350e8d6b37377d7778e60246a72d9d	f	\N	\N
c1cc98ed-b798-4b88-93c6-50c0266deed7	2024-03-30	Circle K	42.75	Uncategorized	\N	f	{}	377a5b1c7eb0c903aa6bb299864169f78c99f56d19ac2c3e847ce289253fe119	f	\N	\N
5653fee2-702a-42b4-8cdb-70e55fc60e26	2024-03-28	&pizza	37.07	Uncategorized	\N	f	{}	3550360e1755cc0438c1c1f639d760e3218cf6c76d9965794ac4d11c07b414b7	f	\N	\N
821c876a-51c7-4e61-aa15-07b73f51feeb	2024-03-29	Sam's Club	30.50	Uncategorized	\N	f	{}	92fc3c0c8173a1a2f94589c4e036cf911b4faf7471ba054782ca0ae7708b399c	f	\N	\N
9ec6d495-c6a8-4fcd-a2bc-8c98c907278b	2024-03-30	Debit- XX 8678 Tst* Blue Ridge Ca XX-3633 VA	28.33	Uncategorized	\N	f	{}	180b03d00e16bcd91bf98db0e195a879697b560f87010a002c8f26bf7b087a53	f	\N	\N
e76ff34e-a506-46cd-9352-108f901cea35	2024-03-29	Chick-fil-A	12.97	Uncategorized	\N	f	{}	d2865f68ef647f71b9ad07e48141b7e6da1f8d01817c3ff9da8b2106b7d8005a	f	\N	\N
c46c402a-8bda-456b-872f-1667a19d0914	2024-03-29	Burger King	8.66	Uncategorized	\N	f	{}	02cceaa4ca3ba609db4902d03b87888cdd30bc4febbfa5181a0a4a12e47cb500	f	\N	\N
26679b1b-a25a-4c63-8a35-d5b3bdc89a08	2024-03-30	The Fresh Market	8.29	Uncategorized	\N	f	{}	d19cdb5d3e97a24032506c730c3b008e6f5a6af30f9609e7258f6fe50c30bda4	f	\N	\N
fe1933a5-fbb0-4cd8-add9-2ecac816215e	2024-03-30	Debit- XX 8678 Borough Coffee Greensboro NC	7.37	Uncategorized	\N	f	{}	6bc3915ed7d871387d6fb04f1360056d676a92d8116b94db7fe55abf3400a1b9	f	\N	\N
b9709643-826a-47b6-b089-782286232b52	2024-03-30	Circle K	5.39	Uncategorized	\N	f	{}	b7d139ef4df51b4b61732167fde0567f21363c5137c1231e487c9d7852aae924	f	\N	\N
09223e83-1c2c-4091-a522-ad240f091fab	2024-03-30	Apple	5.28	Uncategorized	\N	f	{}	14aac0b18cd694f457498ad3545857a883dfbdbdc1a9aeb22000d79b49f5ac71	f	\N	\N
ab629f2f-f9a6-44a2-8eb7-f79f277b80bb	2024-03-29	Bullfrog Bagels	4.40	Uncategorized	\N	f	{}	23686cb85bd89fa95e4da95f5b574047d4ab6861a458d43cb63cd182d12b3b72	f	\N	\N
b5f640f8-cd9d-4295-aca8-e23b4fe70c0d	2024-03-29	Popeyes Louisiana Kitchen	3.03	Uncategorized	\N	f	{}	dafa22a31cce21e5fbf7dc30a9ade36bacb006002d44f2c359fc51c61fda81f5	f	\N	\N
f692ff7b-892c-4044-8023-566aa5048954	2024-04-01	ACH Debit - Claudaya Hood Be	500.00	Uncategorized	\N	f	{}	7c7a22cfe4fc9fdbc5125cffd98357f9fb8d0769177fb3f5899ef46f7bdcc9b4	f	\N	\N
43c8272d-bc47-4423-96f1-06f11ca8ce47	2024-03-29	Interest Income	-0.84	Uncategorized	\N	f	{}	3ff06b48b343889e4feaefa50bbffa6fe5c2b654f7cef46c6236446cbd504f13	f	\N	\N
1cfa7f7f-26b8-42cc-958a-611eace4949b	2024-03-28	LA Fitness	10.00	Uncategorized	\N	f	{}	598ad963cf385ee532239b9f72d712aaff77cd99f3769c6cf37f4d999754167e	f	\N	\N
a1879793-dcb3-47cc-922d-7d9acd02a053	2024-03-28	7-Eleven	8.48	Uncategorized	\N	f	{}	3fd04f3e9f6a33ef462e12940d861565d3714b368098ddb261efc16c22c7481f	f	\N	\N
5a62f8b8-70c9-4b96-9dcd-4524b85f5366	2024-03-28	Payment to Citizens Bank	88.12	Uncategorized	\N	f	{}	003bf99d63a879bda0333486a4bdc3d77b4e03e8c5db2be12aa0fcfe8de99aa5	f	\N	\N
5c7ee10a-3174-4641-a684-176d7d4bfeba	2024-03-28	Microsoft Deposit	-4524.86	Uncategorized	\N	f	{}	3cf2f82d0bda0820601c7f595328b746d61380c3e8dd9ed222055e4069096794	f	\N	\N
8f0e1c64-85bb-47ae-8f4a-4c5c2840c9fb	2024-03-28	Deposit Henry M Jackson Payroll	-1709.20	Uncategorized	\N	f	{}	e1639a749b42fb84d4c83de93ba135388b0c1bdd5497dd2a2b4f80f5fc859c24	f	\N	\N
d79193f1-b166-4a4c-9362-8d14cbf5a826	2024-03-26	Debit- XX 6114 Aacc-cashier's Off XX-2236 MD	100.00	Uncategorized	\N	f	{}	425f955deb2b8110d536e6819fde7c4df1e5f4b5af225242c3241321981ec420	f	\N	\N
6730c11b-7e93-473e-b715-7f4d969818c8	2024-03-25	Debit- XX 6114 Sun Wah Baltimore MD	38.00	Uncategorized	\N	f	{}	e3abde308edb8723345b7ab81f2d52260208b53f2a91d249bc70df551c90f6da	f	\N	\N
f659cb19-baf3-49c0-98a9-41cf91f25f7c	2024-03-26	Dairy Queen	10.49	Uncategorized	\N	f	{}	68b42e035fe6c845c9046b9bd3e1c85525fc4ba85ec3defbb51eaeb9d6ccf111	f	\N	\N
592e6596-f592-4d34-95ea-b6b802a96dec	2024-03-26	Target	1.00	Uncategorized	\N	f	{}	e4781f81b2d504b1e2c74fdfbe245dbf6154911023f584d9d837eb4ab5ab3826	f	\N	\N
f40072bc-47da-4c72-b1e7-39e9800b4c2d	2024-03-24	Harris Teeter	115.88	Uncategorized	\N	f	{}	5ac65ca820fa627a81684ea9d4a2139cae21fc88828618ddab44035d471470c6	f	\N	\N
c9b99e43-3f05-49c3-9df0-f68012a81858	2024-03-25	Target	29.76	Uncategorized	\N	f	{}	799f486ae4ade5b424239a0b7cebb3b77256fb84dbf0271009a86e73ee55e81e	f	\N	\N
d913db8c-ce7d-4ce0-96b4-5510daae4db9	2024-03-24	DSW	18.04	Uncategorized	\N	f	{}	bf933a31dce9e3fb6856e7b098107397837960fdef12bc63a579c0cbb8a05ea9	f	\N	\N
b0c8a456-34bb-4725-9cd5-8e5284ab4d33	2024-03-26	Transfer From Savings -0387	-50.00	Uncategorized	\N	f	{}	a9e19ebbd557d504a30c15ea4d67c8f367cac58a59650d573ceb7db659c3dda6	f	\N	\N
9e389175-a1d4-4f15-97a6-1f588cad598f	2024-03-25	Payment to Best Egg	537.47	Uncategorized	\N	f	{}	cd2fd7726c71bbae9ea8e99ea6369090f6078d042fd9d281d5084956a61c134a	f	\N	\N
94665e7f-1dd9-4686-ba5e-c3ed890776eb	2024-03-22	Cabela's	169.59	Uncategorized	\N	f	{}	fde87de2d336aa7b8dcc708601e1070013c84679fcf7b3838663cba8f8eee38e	f	\N	\N
7525a611-8f93-417b-aeb4-f17791e6e32e	2024-03-23	Sam's Club	73.36	Uncategorized	\N	f	{}	25003ab10fb2c956e69504fe73b8116948a34b6cfcf7461c12ff5156f16a6d27	f	\N	\N
c22e1671-82fc-4ab5-8d1b-a152091a31a1	2024-03-23	Popeyes Louisiana Kitchen	25.28	Uncategorized	\N	f	{}	03a1284a04c43107e522241fc7d33c5c5d7ecbcac96c8330cee0a89ac2b938b9	f	\N	\N
469a9aab-cfba-47e6-a915-b41ed574bc40	2024-03-23	Dunkin' Donuts	17.02	Uncategorized	\N	f	{}	0902b1deeb79229776559a6bea84e555b1de4d218f5b83619d71b7f5a49da95a	f	\N	\N
055d8874-56f9-400c-936c-de8d0d41add3	2024-03-22	Naval Bagels	7.25	Uncategorized	\N	f	{}	6b77a717c2cfa57098b27c4527d150df3fd4a285062147fc199b6c87717ea636	f	\N	\N
d0c7c16f-9219-4d47-9584-146753db435e	2024-03-22	Payment to Liberty Mutual	202.86	Uncategorized	\N	f	{}	c90929181cf06b2d6d29d6868b019eef9e54fce9cc3919fc53b87d18227b6894	f	\N	\N
44128606-09ec-4ea6-a9af-6c6dd5de6c28	2024-03-21	Sam's Club	32.00	Uncategorized	\N	f	{}	6361529c24568630fc1eb7c312eecaf2c35ba882338f08c8b80a93425c9df71a	f	\N	\N
e7fce6f8-2411-40d6-a648-c5a8b9d211dd	2024-03-20	Chick-fil-A	5.52	Uncategorized	\N	f	{}	445ff4f78b5835dd38d5cd4943dcc10c1a4ac115a2898b1eb3e89c6d0ee6baa9	f	\N	\N
7f3c0e3b-49aa-4ca3-a0b4-b657c4be5d22	2024-03-20	Crate & Barrel	327.00	Uncategorized	\N	f	{}	6c976708fa6607f8b451583ee9ce1220362a8e7500c53c6876a9ee0dae3ecab0	f	\N	\N
5b5de502-1a4c-4858-9195-940d925eca14	2024-03-20	Target	85.46	Uncategorized	\N	f	{}	cf82efe8b64b853cb5353eada4f71e8d1cb6cae955f287793f091ef68bca2216	f	\N	\N
dd5662d7-f874-46b4-87f4-5da6e98ee6b7	2024-03-19	Airbnb	367.47	Uncategorized	\N	f	{}	b26c82abd1b0a3f546ebf10bc3300081fbbbc426d70d9eb9ca444fca4f365fad	f	\N	\N
edbb957b-ab80-46ec-b6ff-2804ba11a525	2024-03-19	Debit- XX 6114 Dc *gov't XX-5000 DC	100.00	Uncategorized	\N	f	{}	d11222080a75fb150024a93887b3aafc517e991dc61700f3c4805f1c37c66e1a	f	\N	\N
54a48fd3-e55c-4146-b485-b7efbe93bf89	2024-03-19	Texas Roadhouse	32.04	Uncategorized	\N	f	{}	0649629cce75710bae7ef2939a2023a6a3f37c3fd7577e6c6adcbbfe3073a165	f	\N	\N
f2a34642-5003-4fd6-a30a-ef3943e2a6e2	2024-03-20	ATM Deposit	-340.00	Uncategorized	\N	f	{}	a5bc021632208e74b9ecad04f98a64998429e0f28ce67bc4cc3bc418f4b5b6d9	f	\N	\N
5750a26d-0603-4b7b-8123-d62f82549769	2024-03-20	ATM Deposit	-285.00	Uncategorized	\N	f	{}	0294608608dba20737b4b0645bdf27ea8103cdb295c2d8b022ffc899904765e2	f	\N	\N
bd6a4e4c-f211-4580-ac76-184765480aef	2024-03-20	Transfer from Venmo	-245.00	Uncategorized	\N	f	{}	51686aca4f442c6fccd4e74b826ea8aeaf8f0b1b544cb23eff012771e2491ecc	f	\N	\N
75f10b56-2218-4e7d-96c9-2ea5e188e9e0	2024-03-18	Amazon Marketplace	29.89	Uncategorized	\N	f	{}	ac5626981c11d2540df0fc630d35d14ad782810c3fc8660c891c6e4beb2682f6	f	\N	\N
c08432c3-b3ce-4254-88e3-19c491c1762d	2024-03-18	Apple	7.99	Uncategorized	\N	f	{}	3098dd56c700199393dfd1550b93ab59276e7581a3c543cb11352c8dba2c65c3	f	\N	\N
559fe0c8-35a3-44bf-9b4f-1dc980f869e2	2024-03-19	Transfer from Zelle	-200.00	Uncategorized	\N	f	{}	0ddb70ea91405bd50099d9aae50550af86bb6956aeee68548a5006ee9fb77e66	f	\N	\N
98774a37-e686-4f29-a86c-999b1e7a36fc	2024-03-18	Toyota	900.00	Uncategorized	\N	f	{}	503ad16d39e3f83f9facb4b8e1a01e4e47c9288246e4a94e5a653e03b5867757	f	\N	\N
5c1e95e8-e81d-4f9d-b0dd-0284f81da35b	2024-03-18	Payment to New York Life	616.54	Uncategorized	\N	f	{}	5244bbe4be452fe758f4356cfd09d1430c1a814e34ba73d672fe13a0dad8a892	f	\N	\N
1f034f97-e396-4208-986c-3da10fe7a87e	2024-03-18	Payment to Capital One	500.00	Uncategorized	\N	f	{}	3a554b59c6a77f3cdbce139fc594f4d26246d139e641a8aede071a3c31713757	f	\N	\N
08ac2964-30e1-4231-a80b-79f0cc8b7425	2024-03-18	Payment to Discover Bank	430.00	Uncategorized	\N	f	{}	7a01d0cfd9c8d828b3076e4b6a2fc8422c50bef78079b7bd1f4991ba005c1573	f	\N	\N
283d3b8f-e9ec-4191-829c-d557eb67b7f7	2024-03-18	Payment to Chase	400.00	Uncategorized	\N	f	{}	9b9734c2da39fe6820eb9866b1ce8128de76c024f1e07bded9ba30d5f93ae91b	f	\N	\N
c1273350-16c5-4406-ad96-50ff0a7ebfc7	2024-03-18	Transfer to Venmo	40.00	Uncategorized	\N	f	{}	ad1b3376e9cb1f840e9fa4b128b66518e188121294613f547547ddd82ff2bf43	f	\N	\N
b104746e-cab0-41bc-ae32-36ca72fdbc62	2024-03-15	Giant Food	169.55	Uncategorized	\N	f	{}	7fa29f37a310646ceedf405e19eaf86aa5b713afcce590807b0be3296381afb8	f	\N	\N
b794a4ca-c2e3-46b3-92ff-49cc41bcb5f3	2024-03-15	Polished	145.00	Uncategorized	\N	f	{}	2abdcdc466da27f0b6c08fbec662ba2ab7f1ce9b45425c187df072cb77882e2a	f	\N	\N
75e861f4-0201-4291-9e7e-527e084569d1	2024-03-17	Target	38.16	Uncategorized	\N	f	{}	e0b65c366f65afa64d12e5be251e735bd2c1b383f5f5e70725fae033b0315a9f	f	\N	\N
96c185cd-0dda-4999-92c3-326b4787a170	2024-03-14	Debit- XX 8678 Tst* Scittinos Ita Catonsville MD	35.81	Uncategorized	\N	f	{}	e47ff0a94ccf7abd2605e4984e205391fe65dfd1edaf86f7613197f11eabaf4b	f	\N	\N
1fce18e5-9fb6-4aa6-9742-ea39878d778e	2024-03-17	Debit- XX 8678 Tst* Southern Blue XX-0156 MD	32.39	Uncategorized	\N	f	{}	e3fadb103b36c2c4cfc90eb000386297956e95748ce3cfbcbd1814ea85b9b0df	f	\N	\N
0a0d6fde-3f59-4427-9aef-9b814bacba99	2024-03-15	Royal Farms	30.00	Uncategorized	\N	f	{}	3767c015fc73f11b3c7762c0958378fbcff5b172b444c7fb6cf4c1e0ea5acdcb	f	\N	\N
2feec09c-44ab-499e-98c9-7e399400d9c1	2024-03-17	Debit- XX 6114 Sq *kinohi Poultry Annapolis MD	29.85	Uncategorized	\N	f	{}	5e3d261eadae74f2f4fd0f8bd5524b77e25160135e07451b45a3146d4eb03162	f	\N	\N
89f942c8-265d-48e6-b167-1945d2c5e446	2024-03-15	Ace Hardware	19.06	Uncategorized	\N	f	{}	1fb8a415256f98666ffbeb2c5c172f318ceacb047b35224a980b8c48663ddd16	f	\N	\N
18789354-2d86-460d-a902-bc3f34d7b486	2024-03-16	Naval Bagels	17.67	Uncategorized	\N	f	{}	8e4666cc60be89d7eadadbf7eb35ea781e4990355413c5307692c5af56693dad	f	\N	\N
04c28dec-834d-4da4-9570-4a10f7da99e8	2024-03-17	Amazon	14.30	Uncategorized	\N	f	{}	223c0713d7b36478c11fc55cc28d2b3a9ca4bfb407f08ffd88d62f4cd3fbfefb	f	\N	\N
17a0435b-a73e-4e5b-a4b2-5606f68507e2	2024-03-17	Debit- XX 6114 Sq *shlagel Farmer Annapolis MD	12.25	Uncategorized	\N	f	{}	a2c9b49473bc44c855d066465022a87eb881fc8000712810063128a6f9458aa8	f	\N	\N
82fa0721-557e-4200-9ab7-4b9369875dd7	2024-03-15	Debit- XX 8678 Ewc Canton 0814 Baltimore MD	10.00	Uncategorized	\N	f	{}	fb2de572686ddcd969a6e1f57751b02abd28f145ca82b0769e96ed35023c1e7c	f	\N	\N
6205f779-d94c-4aae-887e-4617f2cfb696	2024-03-17	Debit- XX 8678 P A Bowen Farmstea Brandywine MD	8.48	Uncategorized	\N	f	{}	d24c2f84745fb947883eee63e73914cc3dbfd4557dc43bfeb462617ac3a2fc99	f	\N	\N
4c9872ec-48ed-44d5-96f1-f321b999d661	2024-03-17	Debit- XX 8678 Sq *morris Hill Fa Annapolis MD	8.33	Uncategorized	\N	f	{}	4195d6af0d9ba9c85b8e3528f99636a8df9f3381addffc28a5d5aaee80dc4bff	f	\N	\N
e9eb5d68-43fe-4e20-9cb1-74ab055363a0	2024-03-14	Debit- XX 6114 Tst* Scittinos Ita Catonsville MD	7.99	Uncategorized	\N	f	{}	152286568aa9dcd9bab652d6d73fa0afaccaa56cde0307df68c07965d46bf99b	f	\N	\N
eca4c2da-4248-4583-9295-7943285ac067	2024-03-15	Rita's	5.61	Uncategorized	\N	f	{}	d118a2599a70c174c5f3784743d5c5e8b6804f7eb57c2c5397476cab77bac42b	f	\N	\N
2c1dcf7d-a7d4-48a5-9d9d-3d9d85152475	2024-03-18	ATM Withdrawal	300.00	Uncategorized	\N	f	{}	38aab827c6e07e8a3b0586675a433fd457af0f4fae8eb8557eceb5cb184c3993	f	\N	\N
56db57f9-2a39-4ede-b93c-794838ddde20	2024-03-17	Adjustment - Cr Sp Hunter Us Hunterboots.c CT	-129.05	Uncategorized	\N	f	{}	a103e3608c1c25a309db51b87367d479f53440af28e83b594d4f3533fe2ac6ce	f	\N	\N
e6a3d396-5e34-42de-90ec-0b934210b429	2024-03-15	Transfer To Credit Card -9005	500.00	Uncategorized	\N	f	{}	a674c1ac42112482012cd985684c7115494fe324ec60207c0f28dd4aa5e9a815	f	\N	\N
d4529b7c-4f4c-4dfc-89c3-af96eab970be	2024-03-14	Party City	11.54	Uncategorized	\N	f	{}	10a9f7cd180375a61623c4bbf861dd42c7bd8069c4c200006de5f682f6b9f57c	f	\N	\N
70263e6f-8fcd-4cf0-87f5-b39d52beb265	2024-03-14	Apple	7.41	Uncategorized	\N	f	{}	31fdcd26ec13742a332fc96eb295244d532502a5b81f4d670fe63a4456f69e4e	f	\N	\N
b8d176a3-a20a-4676-8c1e-58ed5c2c01eb	2024-03-14	Payment to Best Egg	1338.03	Uncategorized	\N	f	{}	d01f311962e369d1ae03320cc0a1d0dd8281b0a6e84b7ffc0bdcd9697c4625dd	f	\N	\N
18f0d7f3-4736-4881-a3c6-6a4f75bdfe07	2024-03-13	Rangoli Restaurant	69.93	Uncategorized	\N	f	{}	fa2aa508dcbb63aa08ba499b4e71c3de597ee374be36787c3bf5822221cb3374	f	\N	\N
fac3b3e1-866c-4fe8-9033-d73a237e770e	2024-03-14	Microsoft Deposit	-4524.86	Uncategorized	\N	f	{}	d5a4379a809ae15957601aacf5736be733e4c454b170eca700ccefbd82738e95	f	\N	\N
c2692edf-97bd-4124-86f7-2936649541df	2024-03-14	Deposit Henry M Jackson Payroll	-1709.21	Uncategorized	\N	f	{}	0d62a1d432dd6df03a41dcddc3d1451f81fa64d3f68f8902fc5dea1d337aab08	f	\N	\N
db886704-aee9-4e32-a415-82d2e0a0bca0	2024-03-12	Naval Bagels	8.75	Uncategorized	\N	f	{}	1901275bdd11268aa4e5ed8fb42d4eedc04807596b9752ccf19ae54641ce397f	f	\N	\N
1c2bb12a-808c-4bd1-b70e-81c6d79fd333	2024-03-12	Payment to Verizon	79.99	Uncategorized	\N	f	{}	840e912749b377983c0a28a09f29f6645dd3e8258f79318586ad023945689786	f	\N	\N
fe7a41b6-1353-4d36-9c20-b5c5b50bbab9	2024-03-11	Debit- XX 8678 Silky Tots Us Mount Eliza	61.00	Uncategorized	\N	f	{}	1f78c2b489b36be34e05c5ce2c5d20ce34c9cfc476074b96b71b497040c780dc	f	\N	\N
5ee3b4d4-187f-4cd6-9360-ea49121e7759	2024-03-11	Intl Transaction Fee Visa Silky Tots Us Mount Eliza AU	0.61	Uncategorized	\N	f	{}	7b6d47a8bef3aececfc8f928d1aba608e797836bcfa406235852f9b2e20fe8a4	f	\N	\N
2472394d-1ea7-4afd-b5c2-53af945e9d4c	2024-03-11	Lowe's	600.00	Uncategorized	\N	f	{}	6ecc883feb5c38e1e93bb1813584cd68c5e79c301e30bcf0260338a7fab18ba8	f	\N	\N
cd3c1ca6-e678-45a6-90ba-35a2c17b2ee5	2024-03-11	Transfer to Venmo	95.00	Uncategorized	\N	f	{}	5ab784d42b3b51503e038f414ee77d331db8a6885dd5559b5c720766106917e8	f	\N	\N
4c882484-d095-4175-8e2b-1cd3d87d67e7	2024-03-11	Comptroller Of Maryland	17.00	Uncategorized	\N	f	{}	8136c54c0fb0b4b695a0f27299f4aefc02cb0b46d149a53fa3e44b26845c1110	f	\N	\N
8d94a680-4a79-48c4-80ec-daa37c16d848	2024-03-09	Debit- XX 8678 Capriottis Sandwic Annapolis MD	31.95	Uncategorized	\N	f	{}	4c20aa1b94b3d48d0fe57935bb7dd9ac6a02ece9e9efd5e0303e833b4e0f98b1	f	\N	\N
26ce9c7c-7b8e-48cb-9966-c030c4669c57	2024-03-09	Sam's Club	28.10	Uncategorized	\N	f	{}	0654fb55a7f22a9c62df2403432d779572918a1c2d13628a7b6d3413f1343409	f	\N	\N
9ad8e1e3-653a-4869-bf71-db5a85ac70f2	2024-03-08	Naval Bagels	14.64	Uncategorized	\N	f	{}	f4e6af6d1fd22b492f5da8497bb31e28c84e842e65a851c113d094983ff540f0	f	\N	\N
022d69b8-b52a-4d72-a8fe-399b9fc8562c	2024-03-09	Naval Bagels	10.25	Uncategorized	\N	f	{}	9666a35245adf123364fbad797e2d8180894d9e1699224a67b925441a0c1b1d1	f	\N	\N
08f40bbc-778b-4cd8-9fda-8f6507906110	2024-03-06	Debit- XX 8678 Umb Penn Garage Baltimore MD	9.00	Uncategorized	\N	f	{}	a63e1630c62ee607f000bb8a9097f4b33b0533c028f3a6218881b68cdf60a36d	f	\N	\N
4f97138a-8d8b-4202-b5d0-ceff5de3bfb1	2024-03-11	Transfer from Venmo	-195.00	Uncategorized	\N	f	{}	c975b00cf64358da235a67b64b73dfcbe13c1d5c0e043bfba5ed338a958a0719	f	\N	\N
00edc4ab-0642-47db-976c-ea723fa84592	2024-03-11	Transfer from Zelle	-45.00	Uncategorized	\N	f	{}	b312ae79841b59209a9ea5590f9b9b624b5bb1760932200818b4fc336eea2ce6	f	\N	\N
b6d98dad-abcc-4bec-9fa4-eac84cd2bcb4	2024-03-07	Sam's Club	29.70	Uncategorized	\N	f	{}	991a98a80848ef829885130e45a3e5a1b89d9096e33e998245b1395560ed4a78	f	\N	\N
3b98416f-a428-4ad4-a55a-6dcfb697d86a	2024-03-07	Popeyes Louisiana Kitchen	16.48	Uncategorized	\N	f	{}	c69fda0aef54db85e8888dd2017b89431f88ee85a2838ab8778763d36a351d02	f	\N	\N
cbba7a18-6184-4091-9558-1dbec420c9b6	2024-03-08	ATM Withdrawal	250.00	Uncategorized	\N	f	{}	05b8227c5407fd5887de897bcb1441fd21bcb84b1e5814cde5795d8416316a61	f	\N	\N
aa02c360-f1ce-4ba2-b858-0e59179abc6b	2024-03-08	ATM Withdrawal	100.00	Uncategorized	\N	f	{}	fed328b28d156bca34713517d30046f48d21200a376e95d5e4b41072c2ec6a01	f	\N	\N
c6d431ef-8ab9-4bf0-a028-81c0b37ac6e0	2024-03-06	Target	84.40	Uncategorized	\N	f	{}	feeee89da8740355740f810a3ad1774531ece10673739b80ab34238dc043a177	f	\N	\N
98f42cd1-9479-4383-b25f-186d5175add4	2024-03-06	Target	37.09	Uncategorized	\N	f	{}	d52043f34bc6cb217cf9a8c2be9f4c115671091d046a4ff6b65babebb31cfdd7	f	\N	\N
bf383b7d-9c3f-4375-994f-1688f15c1afb	2024-03-06	Paid Check 191	50.00	Uncategorized	\N	f	{}	d532b89c4cf737f0fd5acad0f72f48b748b430638a8487457503044e25291148	f	\N	\N
bfd3cc66-853f-4874-9c0a-11eb2cf6538a	2024-03-05	Harris Teeter	104.55	Uncategorized	\N	f	{}	793cee617192157344b79d054328cd576ec0bddd3e8aa3dabebc52b94ec42cdc	f	\N	\N
31fed790-3961-4e52-a008-48ac7cbfe034	2024-03-03	Debit- XX 6114 Hatley Com XX8539 QC	65.99	Uncategorized	\N	f	{}	2b29ded0de2669ebc36143690f0228e6bf356b71d8922c2681f778b5fe375b17	f	\N	\N
373e82c7-0071-4d39-9642-88a486746a33	2024-03-05	Sam's Club	38.92	Uncategorized	\N	f	{}	29a5c653bd848bbed1d135d62426e5c9222ed4caf9e48b63b05006f077c05836	f	\N	\N
a8662de5-dfec-4797-ba35-45754941d905	2024-03-05	LA Fitness	10.00	Uncategorized	\N	f	{}	55dfaf27e0bb21ca6ec469ce239071c99dbaa1e3643e35ceecb91320d438ebd1	f	\N	\N
a5a4d834-5a92-4bfb-ae53-b91892a1e65e	2024-03-05	Intl Transaction Fee Visa Hatley Com XX8539 CA	0.66	Uncategorized	\N	f	{}	b34e8b0ee09205ac66b6a5b75de45b64f2ed1747c32c16925dc9cc2486c57b06	f	\N	\N
7076e321-d95b-4d64-801f-191afb49699f	2024-03-05	Payment to Chase	500.00	Uncategorized	\N	f	{}	afde886fb84e8f7e260d0b1e34df8bd3667cd3737c0914fd4d8e1e7774aaa1bb	f	\N	\N
27cf7c5b-10a1-43fb-b3ed-842e4cb2c84b	2024-03-04	Debit- XX 6114 Kids First Severna Severna Park MD	135.00	Uncategorized	\N	f	{}	fdd76ad2058de3f82efbbeecee6b72e9e4c5c2d9c88e99bbe2d9c07be4101d65	f	\N	\N
ca9ddb83-a098-40ab-8967-5a793df657ad	2024-03-03	Ted's Bulletin	99.00	Uncategorized	\N	f	{}	b1f267e6553e515600f3c641c93a34fbdd3209920966c41f82719b5f66e36546	f	\N	\N
e904822b-4cc0-4450-a22f-ef10fa3256c0	2024-03-04	Giant Food	17.06	Uncategorized	\N	f	{}	206b2f060e59623c59493a6b171cd3cae704d86d45c2637791193736cd73e65f	f	\N	\N
9e6d7f4a-342d-42d8-bb4f-021fe1b9a2ab	2024-03-03	Ted's Bulletin	11.64	Uncategorized	\N	f	{}	8a96bf702d052bbcce5ebc324e96c93c9beeb3548d8db281160de492bf9919d0	f	\N	\N
46c27acf-e0fe-43bd-b3fc-9625030ed3e6	2024-03-05	USPS	3.99	Uncategorized	\N	f	{}	26db5d4e34224c169d1557d991497e189f3eb88d34ad472d2b1b678b187b4bd3	f	\N	\N
f670cced-e204-45f7-abf5-a1f465691b50	2024-03-04	JPMorgan	2107.66	Uncategorized	\N	f	{}	cc49d7904488b0b2d0fbc2168b1125c22137589721554b428470fbb1843d7f16	f	\N	\N
3fcb9250-93ee-47f4-85e7-b2444c29bc1a	2024-03-04	Transfer to Venmo	100.00	Uncategorized	\N	f	{}	71cd37c7b8b1759457e0e7d8f6275fc2e7a3333b4d49726a349acb6a8fbb3395	f	\N	\N
6c75cb5d-77a0-42fc-8687-19af15eb06d1	2024-03-04	Transfer To Credit Card -7148	600.00	Uncategorized	\N	f	{}	89af8a1fb4793297ae2ae4d6c9a4e266c3b2aa2f4c28fcd09122bd2ea4eefed4	f	\N	\N
72d9960c-0c84-4fe7-ab71-37073af906ca	2024-03-03	Payment to AT&T	195.34	Uncategorized	\N	f	{}	51084b1eb22f52a28538967c55b077feb9149ad8e1689d047def43ffe8457ee9	f	\N	\N
183c36e2-6aa0-4351-b5cf-49dd47856d4f	2024-03-03	Torrid	140.65	Uncategorized	\N	f	{}	c38f549b808f3d4777d844fe6b7bddf0e4c227ac219993e39595b62288acb2ec	f	\N	\N
3445b6b7-6f8d-4911-9343-350609dfcd04	2024-03-02	Boots UK	136.00	Uncategorized	\N	f	{}	eb2c7f1247e71233fbdd18ac20a2b3f3b68cf6b6628ebdcf3c1fb294b911a47e	f	\N	\N
ce96f4dc-c466-4d9f-bbad-2ef44445484c	2024-03-04	Debit- XX 8678 Mayoral Usa, Inc. Miami FL	89.93	Uncategorized	\N	f	{}	4f87d90eb3bcd35262a83ccd8208455895f21ca721db96bc3a88f3a3806449db	f	\N	\N
33b5afdc-61c2-40ab-af20-951cb44ff4b5	2024-03-01	Joyce Beauty Club	85.47	Uncategorized	\N	f	{}	d050036b05614d9c1b235adadebc3074286e8ab0ac45affb3d2cb6c3ad9f42f3	f	\N	\N
dcccfc08-7623-4345-9575-2cb7ee4e00ed	2024-03-01	Debit- XX 8678 Rejuvinations Pasadena MD	80.00	Uncategorized	\N	f	{}	22b2a30c67b36a3a54840a8ecde792d05b04527138ba67d83697941ae17d26b3	f	\N	\N
5367f506-481d-4224-a212-fc733730e5d5	2024-03-02	Polished	70.00	Uncategorized	\N	f	{}	a6aefc7b79b84d14acea721fb0cc1a65375508e322b70a96f0a5e02abfb98ddf	f	\N	\N
949696fe-9589-400a-82a7-9ebba21a8325	2024-03-02	Texas Roadhouse	64.87	Uncategorized	\N	f	{}	dad12ccf5e9795c33ec289692f64523e4491c6c67b3497c34747c6a48a293f11	f	\N	\N
55c920cc-b644-4d44-a5ee-310ff8deeefe	2024-03-01	Target	63.84	Uncategorized	\N	f	{}	91bcee79e660e90cde8427edc69ca5b977ddd80aa88fa9b255e7671ac14c24e8	f	\N	\N
b4dd4e2a-cd80-4e86-9ea1-4a6a1a37ff90	2024-03-02	Debit- XX 8678 Bonfire.com Httpsbonfire. VA	57.93	Uncategorized	\N	f	{}	bd9dade79f75eece871d257b205df4f7fe7e0be0703a38484acf79575527bab6	f	\N	\N
648a9903-b714-4373-88e1-84738f06f63b	2024-03-01	Debit- XX 8678 Sq *diablo Doughnu Nottingham MD	40.00	Uncategorized	\N	f	{}	960f392982b42d663aa8d75cf521e72a14f3e558d1e0522245c8d6df5c029165	f	\N	\N
489fac4f-5224-4540-95eb-26c0868709fc	2024-03-01	Mezeh	15.37	Uncategorized	\N	f	{}	ea6f9e5b43adb05d7c84d6dea950cb222953efaa0ca3df6721f963140f70119d	f	\N	\N
d70512ab-bd56-4058-bd46-ee7134428ae7	2024-02-29	Debit- XX 8678 Umb Plaza Garage Baltimore MD	9.00	Uncategorized	\N	f	{}	f64a8a60f81546e966b9904e6da8d1b9ef0b11f2179c32b2baa0fc6204cf71ba	f	\N	\N
257a8c1a-278c-4043-886e-220646d04db1	2024-03-01	Apple	2.49	Uncategorized	\N	f	{}	0cb0620adcb70f41d00e2cb7557f399302ce579e2c7773b6e119a3f1d1f1bbbb	f	\N	\N
572d985f-1168-478f-87f5-72cb933e204e	2024-03-04	ACH Debit - Claudaya Hood Be	500.00	Uncategorized	\N	f	{}	29f02319f30e5f06aabb15f9589e7c2c73e7d67ab80f9dc998f5a6e8cfadfaf1	f	\N	\N
23514fd6-21a4-403e-9d35-7560cb6917bc	2024-03-02	Target	-63.84	Uncategorized	\N	f	{}	c271b6282b53ba86ecac51846d55649b1b46a6c06654bfe4068bbc9e348fe2d7	f	\N	\N
82e9300b-1e6a-4d1d-8fbb-c51083a1319d	2024-03-01	Payment to Apple Card	171.20	Uncategorized	\N	f	{}	7a8a097f1f56ec1e830c6f190d86400245743b0bca2b41dc4a0c9fe5b0074656	f	\N	\N
7b4ab570-ca59-4ca4-a50b-a03ac9ace32a	2024-02-28	Debit- XX 6114 Tst* The Olive Tre Glen Burnie MD	41.00	Uncategorized	\N	f	{}	8bfc15832d5085b6b2430c1506c6137585a459c5be583069ff0b2893dc94365d	f	\N	\N
f989096f-20e2-4a6c-ae7f-626e90407df1	2024-02-29	Interest Income	-0.81	Uncategorized	\N	f	{}	f6c167554bcdb686ceaba7e326bdde537dc820ec87d7f93d04969da5cce4cdb2	f	\N	\N
838af85e-648d-4774-bdcf-d687b44edc46	2024-02-29	Transfer To Savings -0387	278.18	Uncategorized	\N	f	{}	4d81a506b838f766fcf1dab8e507fa7fde5ee5a7a111c0dcf9c87f0a7e1e84c0	f	\N	\N
ea64758d-59aa-4334-a876-42f929ddc8cc	2024-02-29	Boots UK	136.00	Uncategorized	\N	f	{}	1255fa338f61f6c974fc77d176c63ce3a7c955369208a7fbeb8767ebba7ed2c0	f	\N	\N
da71cf41-cd98-4234-a904-75bea21af9e2	2024-02-28	LA Fitness	10.00	Uncategorized	\N	f	{}	e6a5e017bb472f53280fcc95f13fc43b16a0abe7a223d776ad2e5662894a6238	f	\N	\N
ffb0739a-1dc7-4bab-a868-9b09a1046a73	2024-02-28	Food Lion	3.96	Uncategorized	\N	f	{}	71c04397c7a6957fa1daa61d0386dc71fce0ebf119812d9f44d149cae169c307	f	\N	\N
e65de6d6-9ede-4901-94b6-c9c56eeca820	2024-02-29	Transfer From Savings -0387	-1750.00	Uncategorized	\N	f	{}	7df847b18a97d1219538f3bec2018bff959df70c3ff3721f1716aa262974be83	f	\N	\N
64fc6f2d-610d-410a-b4ae-c03b8327b022	2024-02-29	Deposit Henry M Jackson Payroll	-1709.20	Uncategorized	\N	f	{}	b6df34bdc1e27083886a4ae4f270394408b189a3f3e609c01031fe9b078d29cf	f	\N	\N
91fa7b44-e961-43f3-ad64-e5309f98d286	2024-02-28	Payment to Citizens Bank	88.12	Uncategorized	\N	f	{}	3ea4fcb63527c2a30b3ba7e6d5226eb09cac9f0344c3317f447738281c9d5640	f	\N	\N
2f1fb8a2-cf82-4110-a69e-8109aea40ed2	2024-02-27	Tax Payment to H&R Block	395.00	Uncategorized	\N	f	{}	b860e949e01e295148c67c09ea9e871075a7c47dca0ea773f4d14ff83963014d	f	\N	\N
c5c6a7c5-93c2-478f-9409-5ee168015e91	2024-02-27	Giant Food	32.47	Uncategorized	\N	f	{}	ffbebe3ab28d6b16d74c48e16ce28e332fece5dda5bf3ea22db81081cf21720a	f	\N	\N
837d73d8-7467-47a5-acab-2bcf293c35e2	2024-02-27	Target	19.73	Uncategorized	\N	f	{}	03ba7ec4b97dd30cb9dcd1d125c460b64ea626ff9087cbbb42398869fd5c3d2e	f	\N	\N
158db0b0-750c-44f8-8686-2bee515fef2c	2024-02-28	Transfer From Savings -0387	-100.00	Uncategorized	\N	f	{}	541533f291548deb6b48130894721718c7a18e4275d56d7cd394ccf66ee5d742	f	\N	\N
d1f52140-b15b-4502-be68-03f78872e1da	2024-02-28	Microsoft Deposit	-4524.85	Uncategorized	\N	f	{}	08c9e27468fb458b4a7cf4938fa574ebca055f78c845fea27ca9f54f2f99efec	f	\N	\N
e2219dad-c571-4f18-8801-f429e661d7a1	2024-02-27	Payment to Baltimore Gas and Electric Company	198.00	Uncategorized	\N	f	{}	40f12c4c00226f79d1ef06eb03251952c3576c72412509dd17d6c18d3c56e684	f	\N	\N
3b8f9670-e0e3-431b-a1b3-ecadfd0aaefd	2024-02-27	Transfer From Savings	-121.18	Uncategorized	\N	f	{}	68c873e1dee7ebd886f91ff351a734199568a1f2e53b5f0ad1aeb38fab44d4e3	f	\N	\N
ee0ed3e9-810c-4f21-ab63-5cc36cce46ed	2024-02-25	Harris Teeter	125.36	Uncategorized	\N	f	{}	3e07941118e7374affa88675ed9d0f95d87832f13f242feb93c62845f4baa0de	f	\N	\N
1eb3630c-042f-4528-b291-56a9d9b71df7	2024-02-22	Debit- XX 8678 Mva Annapolis XX4567 MD	48.00	Uncategorized	\N	f	{}	87b5d7eb700824b4e42b1a86670526ba6dd21a8f42566dffce8749c2e4b5c8cc	f	\N	\N
85901049-155a-40a1-9001-03afb357b107	2024-02-24	Debit- XX 8678 National Aquariu 501 E Baltimore MD US	46.74	Uncategorized	\N	f	{}	51b710338c09f5e175b4d63fe224fcf37cf26cb663782556e00f81fa9462ada8	f	\N	\N
f899deec-3b20-4eee-a1b9-e47b1aa97d39	2024-02-24	Debit- XX 8678 Magic Memories Usa XX6740 CO	34.98	Uncategorized	\N	f	{}	b1a6eacfb83e942d27b9d91fd343666e52b91e0d4384ba64f13f592b1b52350f	f	\N	\N
ee1252f6-1bbf-4673-b2d3-51052343d657	2024-02-24	Debit- XX 8678 Ssa-national Aquar XX3021 MD	34.93	Uncategorized	\N	f	{}	5fdb2fa675212eb565ee7d9938fd56e5d03c62fb71a578e6879273ea9f07745b	f	\N	\N
e3a608f1-e962-4610-8ddb-07841da3f474	2024-02-25	Sam's Club	33.51	Uncategorized	\N	f	{}	e0ec655cf9dad9ad1e28fa6f62b75488160fadc9ddfef308d11164b8d067a23e	f	\N	\N
a29d62ae-f7f0-454b-a73e-21e0ed8d814e	2024-02-24	Naval Bagels	10.25	Uncategorized	\N	f	{}	e61d5030ec732927df2a93d8d998c2f35e669870f1e667aa398e27ef100a5e4f	f	\N	\N
54496207-391a-46d8-84b5-1ea5aeb9c115	2024-02-26	Transfer From Savings -0387	-250.86	Uncategorized	\N	f	{}	76ea0a5a566352ee1fd479c124cfe0ff99db01bd7018222585441977709077fa	f	\N	\N
a5f26baa-bf40-47bc-bce2-eb4afff6076f	2024-02-26	Transfer From Savings -0387	-175.00	Uncategorized	\N	f	{}	bdfe4fc56a920a1900fd3720bd01b8e25c696aa4f0fc6adc19ba4aedaf3d8b27	f	\N	\N
d9e20521-5122-4a9b-9e77-1487c07cf618	2024-02-26	Transfer from Venmo	-110.00	Uncategorized	\N	f	{}	2d8302db8688ded188db26b5251f22abb698d5cf9117bd2acf3b1cc594b492eb	f	\N	\N
542ad7b2-e403-435a-87b1-a2c120833326	2024-02-23	Payment to Best Egg	537.47	Uncategorized	\N	f	{}	08ddb7e845e4f4e38128eec6337fe66d7bac300b62473bdb95d05bc7f4861e0a	f	\N	\N
beb7e7ad-0942-4562-95cf-34be44ff8867	2024-02-22	The UPS Store	18.01	Uncategorized	\N	f	{}	99ec39fcf0f4a2039a350094f5007ec887973828248798cce8fcb0014736fa70	f	\N	\N
9315768f-6ffd-4979-9302-12086b3721f3	2024-02-22	Payment to Liberty Mutual	235.58	Uncategorized	\N	f	{}	6c8b396eeebe100d7966e59c2c426e98a5d8d8381ed1bb7cfea25462ee270877	f	\N	\N
cfb0b113-6f16-448b-8c08-975cc89c92e4	2024-02-21	Target	9.28	Uncategorized	\N	f	{}	ce47590691ee34e4357bf90e28b57efa10331a6b953e145f60295d95c5f04d4f	f	\N	\N
751b0a9f-0fd5-4122-bd81-94d6b78ec6c6	2024-02-20	Taco Bell	3.58	Uncategorized	\N	f	{}	d39e20bc647a139a75a1f3c6aff8e5aeb4fae42500eec811ccea2744232b9686	f	\N	\N
3641c9d3-052b-4725-9975-66149a1f889d	2024-02-21	ATM Withdrawal Coop 7eleven-fc Glen Burnie MD US	200.00	Uncategorized	\N	f	{}	da1f550532aa0f16d95346bb32a5d8ea7255e8966dded98ba1ef79db3d7d136d	f	\N	\N
a60a707d-5eee-4a71-a1cd-58b6e9c65d21	2024-02-21	ATM Withdrawal Coop 7eleven-fc Glen Burnie MD US	40.00	Uncategorized	\N	f	{}	edb5375367b2fa1c04994e68c75916d23c38bc0d82332ad02c7be480b576ac12	f	\N	\N
ba2f065a-700d-425a-9833-0bd5fe18140a	2024-02-19	Ted's Bulletin	110.00	Uncategorized	\N	f	{}	f9a04a360472860e3df2592d875d442fc9fe75fe6197cb1f551463b75e3377f0	f	\N	\N
1fd8087e-43fd-411b-8bb1-a07ff88f477d	2024-02-20	Giant Food	101.23	Uncategorized	\N	f	{}	d396b779864e57d2a819e2b656a071335e855649fc56e26876492c46a7eae739	f	\N	\N
efb95471-1fbc-4489-8c1e-3708cee3980e	2024-02-20	Harris Teeter	25.67	Uncategorized	\N	f	{}	99e3286177c8e6f9192caece6a92757c36fe4ff76fabc163ff25109ac510c8bb	f	\N	\N
50460a92-ef00-4e3d-b041-29933df6c5b1	2024-02-20	Giant Food	2.39	Uncategorized	\N	f	{}	df9fea50cf752a5f6f3380e8cafcde774d6e2266f26e482c6be870ab794a040b	f	\N	\N
ecf8f5d0-a140-4575-a88b-cc86c3920ba1	2024-02-20	Payment to New York Life	616.54	Uncategorized	\N	f	{}	6d884739ad702f758b61a9c3143f98bafc1b9553ed852cc1486c71478741e98e	f	\N	\N
859c5965-1e08-4e47-a447-a4324704b321	2024-02-20	Transfer to Venmo	35.99	Uncategorized	\N	f	{}	54f1c97a1faa780e16ae35cc8852f9bf81c86eb03983e9e815a3707b28ddcbe5	f	\N	\N
d1f11d9e-b312-4f68-a2c2-2b456b3c27ae	2024-02-16	Debit- XX 8678 Safford Brown Toyo Glen Burnie MD	269.11	Uncategorized	\N	f	{}	6eebbe2805522236524bb9ecab33158d7f552135f4b900a36a0481a631dc8aca	f	\N	\N
cb0de4be-c35e-4aad-9648-a4008b0ab06f	2024-02-19	Celebrate	140.90	Uncategorized	\N	f	{}	344d9893e0548eaa72dc0250263d03842dcf6f8c3a22b0102b3a061ed79a8aed	f	\N	\N
3f934735-085b-44c2-87a8-86883607f248	2024-02-15	Polished	125.00	Uncategorized	\N	f	{}	cf6e88349b13f1bc9350055da9f5b869fc0751cc913ad2f494f80cb59436d2ec	f	\N	\N
224d21a7-4005-4e21-8025-e93a735c4e4e	2024-02-16	Debit- XX 6114 Rejuvinations Pasadena MD	90.00	Uncategorized	\N	f	{}	63924617526361e4599d5ff10d4f7ddfe54c6f3c69740bf64837169d4489fa48	f	\N	\N
0508538b-b808-452e-a896-6badf0403300	2024-02-18	Target	60.80	Uncategorized	\N	f	{}	6e9d5f85928a3ead0f3bbf5548a482a9a4477e5e6f1099f2b4c8b5f40e96aa67	f	\N	\N
cd72b691-3164-4283-875f-2c0a6c4fac4c	2024-02-17	Politics And Prose	60.36	Uncategorized	\N	f	{}	b5cb4d8abcb4525222953946cc17735dafd3f1a0cde28766606339c3ba11149d	f	\N	\N
0816c095-6dde-4d40-897a-7e21b08a578c	2024-02-16	Debit- XX 6114 Sun Wah Baltimore MD	42.17	Uncategorized	\N	f	{}	2b10cd0e455ec6d3f797815df18896409957ee215e7565eef5ab89100d16a0c9	f	\N	\N
eb578a28-aed5-4f78-881c-efd33eed008c	2024-02-18	Sam's Club	41.27	Uncategorized	\N	f	{}	d7b881880fa2c9045f6bcb6389e7906965c39ec1f000d4a0c578d102ae50aa70	f	\N	\N
f7513c28-99dc-4b00-a1b2-0d3675338b5b	2024-02-17	La Casita	36.59	Uncategorized	\N	f	{}	953388bdcd62dda025603326d903f8d1cc0655470ff9c8520e83b4500d583ac5	f	\N	\N
df0fa8c7-3dc0-4b1f-bcf5-c15d92a777c0	2024-02-17	Debit- XX 8678 Sq *vigilante Coff Hyattsville MD	30.61	Uncategorized	\N	f	{}	e8f3522cb36aef51acd5f041807d72f2675f86abce2408bae7ad43b994f3c6b2	f	\N	\N
02b9c5e4-a407-488c-b756-6c4d10c5c10b	2024-02-19	Naval Bagels	29.72	Uncategorized	\N	f	{}	3ddad0fa020a501377bd115f1983d7c7fa024c14eaac7df0f5d1b65398f82672	f	\N	\N
cecf2fe6-a7a7-48ea-a41d-6110c1cba4c1	2024-02-19	Sephora	27.56	Uncategorized	\N	f	{}	74776af6057ae6d1685688631b15b47a43a16d3275f170eec8d3b71e79e9357d	f	\N	\N
e1570f1a-52af-4303-9caf-02c4636182a7	2024-02-18	Ledo Pizza	27.54	Uncategorized	\N	f	{}	474b47aac19bdbd9053128dfd2c72871d03bb4c60bc8f8f8666c10aac6e0ac09	f	\N	\N
b6b29c69-3a32-432c-af48-622e72b02695	2024-02-15	Chick-fil-A	22.04	Uncategorized	\N	f	{}	51e43d9548f8a0511604acb57b76d40cb84bdeea5c9ef7964f070e21d4a28da9	f	\N	\N
918ca411-ff82-4209-b53d-643302173b78	2024-02-17	Maryland's VEIP Station	14.00	Uncategorized	\N	f	{}	f250e580943400ac7c2db97b3b46c49fd5b7693cff5035120cbe98b8790c0d94	f	\N	\N
bdb65aed-3e33-4332-b592-1681a2816bea	2024-02-20	Debit- XX 8678 Tst* Le Pain Quoti Washington DC	9.50	Uncategorized	\N	f	{}	effd841d12e3b25ab768d399210a27e91cf9ab42955af29cdb6bc6117aa9ebb3	f	\N	\N
14d91f3d-17eb-4468-8a38-75b98cb2a27e	2024-02-16	Debit- XX 6114 Umb Penn Garage Baltimore MD	9.00	Uncategorized	\N	f	{}	e9507bfdc427e19bfee648573e7697b44e1265abf8430792a0cd946d169ca022	f	\N	\N
32c429d6-8928-4f03-bdb3-0b15c7837d77	2024-02-15	Debit- XX 6114 Umb Plaza Garage Baltimore MD	9.00	Uncategorized	\N	f	{}	36b225cb2c974c57a8883b3c648002365096aa4563a2c85ebe49352ebbc65692	f	\N	\N
4a8533d7-d5eb-4600-bed2-06b1d7271343	2024-02-19	Apple	7.99	Uncategorized	\N	f	{}	a24ed91a1aa2e9272d8bb9a3496660c6e158e381e0c767ff08c7779877930a83	f	\N	\N
ca8ee825-bed1-454b-ba2d-5c1a9e435ab6	2024-02-19	Transfer from Zelle	-40.00	Uncategorized	\N	f	{}	4c7760ab4c1f34d4747363aabecbb7f1b5f141349c045280acaff1fa134035dd	f	\N	\N
bd830f22-9ee3-49ad-881f-4d54e8f201aa	2024-02-16	Toyota	900.00	Uncategorized	\N	f	{}	e72c2cd60102b947dc8e2c3a9415f00e8f6141666b4c3a1491c162502fe2c522	f	\N	\N
05b717dd-6afc-43e1-850c-62172bbb6a1f	2024-02-16	Payment to Discover Bank	500.00	Uncategorized	\N	f	{}	76818e136ad80ffbca6f1dabb0c8ec606dd32a58ff6fd6768dbf5c1fcb085e27	f	\N	\N
63c50096-9eaf-4ebc-b3e0-cf173987ff96	2024-02-16	Payment to Capital One	500.00	Uncategorized	\N	f	{}	353ae8638581f4a4a7fd58bb6d50309a4c4714e633ea99d00e65740b5e88191e	f	\N	\N
1d41f86e-ec56-4bff-ac08-43235ffafe65	2024-02-16	Payment to Chase	500.00	Uncategorized	\N	f	{}	7b7cb1b1df7aa96a5334ddf0bcc34c55aef23aa49b9c46a12f523c68562d8689	f	\N	\N
bcd56d8c-bce9-405d-a08e-53dc0deea899	2024-02-15	Etsy	259.74	Uncategorized	\N	f	{}	12eabc51be61c40e336876248c6386925d069034b955bc40b127c4483a56eef8	f	\N	\N
0caf5a4e-d3fc-4cfa-938e-b182403eb28f	2024-02-14	Pizza Boli's	31.11	Uncategorized	\N	f	{}	b3a98592abc9f78358fdd4d0ab77efd2e9efb52232b147391568d4bc31141f3a	f	\N	\N
afc0099e-ad20-4fb5-9ec6-6abbd9e3d3cb	2024-02-16	Brooklyn Tea	28.94	Uncategorized	\N	f	{}	0a682fdac33197cc0dfa5bc7940aedce01885b6a481fd4660c8e547e071eab93	f	\N	\N
a3b52118-c8d3-43dd-a119-4eef9af74eba	2024-02-15	Transfer To Credit Card -9005	600.00	Uncategorized	\N	f	{}	907620fe4e647c6b223a7e47913f295c9872db22569965390c7834615ba9e771	f	\N	\N
8a531548-bf14-436b-a225-f6fe87c87624	2024-02-15	Deposit Henry M Jackson Payroll	-1709.22	Uncategorized	\N	f	{}	965c6c88b09c70a7ce5ca51dfdc654bde5ea3861f4a57438d8ca7dfc3a21ac47	f	\N	\N
014b5191-f864-4370-b7c4-736e342387c4	2024-02-14	Payment to Best Egg	1338.03	Uncategorized	\N	f	{}	0e939b531536b0402f79b7c76be9524e0d079b8101375f1a13d53631ead4c57b	f	\N	\N
9baec27f-5940-4a2c-bd33-87b60cabf835	2024-02-14	Ledo Pizza	24.10	Uncategorized	\N	f	{}	26be005bff0d30736afbf4d11675be6a5f4a8e272b086ee6d8b0821e9e00cc1e	f	\N	\N
6fec2767-e574-463a-95a9-20ce7626f600	2024-02-13	Debit- XX 6114 Franks Den Glen Burnie MD	17.43	Uncategorized	\N	f	{}	f5c9b73eb01cc1e638dad8df3ce81239ae26ee8231505e3c9f098afc62ee223c	f	\N	\N
687dfb8a-8f6a-467c-997d-8c80feddc9b2	2024-02-14	Microsoft Deposit	-4524.37	Uncategorized	\N	f	{}	408691ccfb668ba9f00097517191d864504ccccfe0d05ef1ea6f93a2bc7e66e7	f	\N	\N
3ca28d0a-3b80-4771-9365-c625a8c4a478	2024-02-13	Payment to Verizon	79.99	Uncategorized	\N	f	{}	cadc1bfb1eb343652a7081f41b3b0236903ac0cfb142603e33591b9bb9ad17e4	f	\N	\N
62dd60b6-743f-4fcf-acd5-23cc32b37c1d	2024-02-12	Giant Food	15.85	Uncategorized	\N	f	{}	8a9967af985a1bc5c6c12e9605da22968d22b7f939014cce0ac96c027fa5d75e	f	\N	\N
2fc34e78-f8df-477d-99d5-7aebee3393bb	2024-02-11	Harris Teeter	90.57	Uncategorized	\N	f	{}	31d84a944b928d874c45760963e48aca32f076f079cdda352e56d95a63b6e59a	f	\N	\N
9505a29a-5f5b-4e3d-8a5a-035ae4f7abeb	2024-02-09	Walmart	66.88	Uncategorized	\N	f	{}	9a63b850cfba49e675c54f1f79bf91fa6d0614a1d2959d81975fd836bee65acc	f	\N	\N
0923b102-0fdd-4416-8297-1fb25a820e61	2024-02-10	Sheetz	37.35	Uncategorized	\N	f	{}	087d12a2f022004711f0d0e0160e1b128217cbc57e26b69189390693381a21de	f	\N	\N
f3c85ed7-80c0-4ae7-9d98-6347239f4e24	2024-02-10	Debit- XX 6114 Tst* Southern Blue Hanover MD	34.68	Uncategorized	\N	f	{}	da3236c038d9bfad9827d2198a7ddd4d85de5e11b5062ec5307595f4e5414f54	f	\N	\N
893ff783-f12d-48c6-b74a-696145e55fd0	2024-02-11	Sprouts Farmers Market	33.88	Uncategorized	\N	f	{}	2d219941d551305b0ee48de7fe1e10437a23e3586db179a207e8d277b5f4b417	f	\N	\N
aa6f813c-7dd4-4b98-9295-e1a4919dadd0	2024-02-11	Target	22.12	Uncategorized	\N	f	{}	9a5178f942eb0b12c42622220767e897a74fdbb07e19e055e08c49e0925784bb	f	\N	\N
13730117-8f14-4745-b79c-f74c9fda835c	2024-02-10	Giant Food	19.16	Uncategorized	\N	f	{}	30abb4c2e30a9f1f716bd7647fb7035c9a12bdf92fdfe2b0b7007d44520ff087	f	\N	\N
393b25d3-3d75-43a7-aa8c-283ffc74dc84	2024-02-11	Giant Food	13.23	Uncategorized	\N	f	{}	dd0f9940e01dec654249fa003a9a3405f8399b6ed7dd14af7722b9a89de4f940	f	\N	\N
ee40fd22-fefb-432a-af4e-a64d023967b4	2024-02-11	7-Eleven	10.25	Uncategorized	\N	f	{}	37c0beaac353746013e112b06b2d4a06cdbc7338e88aaae39227c8c2d311e058	f	\N	\N
8e7e0726-6086-4465-b822-f9ef4ed332b0	2024-02-09	Taco Bell	8.79	Uncategorized	\N	f	{}	c8a812152f28a2e42f8c6436e377ca756fcfd65e09ccc1cc1cf0f6ed5734756e	f	\N	\N
cf9f6285-a883-4f14-99c5-cd54168048eb	2024-02-09	Lowe's	600.00	Uncategorized	\N	f	{}	5e8a2a2df8f20696d899359d683d0a2161b667781f0736eae37bc8b02bc35344	f	\N	\N
cd581ee9-94b9-4f69-8b1b-eb713f885e58	2024-02-07	Zazzle	12.67	Uncategorized	\N	f	{}	9ba16c1701b243ba433a66fe852fb352dbf3801184616dd118120ddd144bdd44	f	\N	\N
eaa8d1f3-7b37-4bec-981d-d25f16d024d0	2024-02-06	Chick-fil-A	10.91	Uncategorized	\N	f	{}	edd70e476590d6c3a4b295e66a0074550047df8d3d1d15748d02ac7b35c5f3d9	f	\N	\N
7f4cfd8c-1848-42bf-8842-3f671ac0495e	2024-02-07	Walmart	102.89	Uncategorized	\N	f	{}	cdbf6aa38ceaeeb0f4a34fbfee63bb0ae23cb5ea9bf541525aeb67446620f56c	f	\N	\N
4cdf3a98-7be2-440c-b126-498be4080cf1	2024-02-06	Target	33.89	Uncategorized	\N	f	{}	8bddc0c014c09e44819d56a574e2a590406e22c407cf5c2c59d3b46834de1357	f	\N	\N
d42e5214-a9d2-4add-a13f-dae708d73135	2024-02-05	Constellation Home	99.00	Uncategorized	\N	f	{}	711013e0b3d73410fde41216fd73ad80def5fbee4aaf779d56db1f84b089d16f	f	\N	\N
3f210f06-76fe-4e69-84a6-5c3ff2a7c6c4	2024-02-06	Debit- XX 6114 Shri Sai Kripa Httpstherango MD	60.60	Uncategorized	\N	f	{}	8cc740209ccf92753b9eaf137bad085dcfa1ab067babd20478cf22e26e05eca3	f	\N	\N
fc92cd3f-f22b-4844-99d4-6299b23adad3	2024-02-05	LA Fitness	10.00	Uncategorized	\N	f	{}	b2e77c0c2982a0949721f02acd031d4312e510238a652bf38488ba833856fd42	f	\N	\N
6c0023bc-d36d-44ad-a7d7-62a8b9c63e9d	2024-02-05	CVS Pharmacy	8.71	Uncategorized	\N	f	{}	00b8d1e078e980c110b4189cb41b4c9a329b2be1886e3ad048546043badfb814	f	\N	\N
de9d0c75-072b-43f6-ae7e-b07cd785fb74	2024-02-05	CVS Pharmacy	1.90	Uncategorized	\N	f	{}	726cb1e927e10d2d72e53204f3f7da7fddbbbcc01d37ab8f5ff33c57c8f75d4f	f	\N	\N
2c1ebd58-0099-4b26-b2e8-2c8afbf3fec5	2024-02-05	JPMorgan	2107.66	Uncategorized	\N	f	{}	4c3efc28730712649afc6c62484f76660d50bc8bfacea61bc01587851fa5fd17	f	\N	\N
f4969ddb-c80a-423c-92e0-2d500196d1da	2024-02-05	Payment to New York Life	616.54	Uncategorized	\N	f	{}	7334138fda476ce2b987b4ca1b3481ee30f08da8854c4303409a582533c63b99	f	\N	\N
a93ae60d-2988-443e-ac60-040c30807c1b	2024-02-03	Payment to AT&T	195.61	Uncategorized	\N	f	{}	458cde5a881691fd45fe9f10b758e4718a4c538789f270970ff48ff169cdcaba	f	\N	\N
f98151d7-525b-4af7-980d-c9999029b227	2024-02-01	Lib's Grill	91.00	Uncategorized	\N	f	{}	2e81621241ef6eacf6701b145c3b444ddb3b1a6148935cfd4851b1e2e877438e	f	\N	\N
16d2e7a6-0b98-45de-a0e9-5f361164a3d0	2024-02-04	Giant Food	59.64	Uncategorized	\N	f	{}	c0597982ee064542dbc13f141b8124e6bca8a7a25f3afef590ef1d72e49b41d1	f	\N	\N
054abe3e-facc-4ef5-a959-e227f3fa0050	2024-02-02	Royal Farms	43.35	Uncategorized	\N	f	{}	feb960755d694f99adeb4ce40dbc42526b91059c5a3e257d610d502d2e589c57	f	\N	\N
14be9dc4-bd77-47df-8d9e-19d699ada6b8	2024-02-02	Pizza Boli's	32.84	Uncategorized	\N	f	{}	1369bea8b7c796f5dcfd0ec48172193bc445bee806c3973f581ef0aea84cdca9	f	\N	\N
9edcc050-6c8e-4acd-bae6-ccdeef2f5241	2024-02-02	Ledo Pizza	23.30	Uncategorized	\N	f	{}	2d2ac9360c11dc551c8d12a3db46138d66a3e56bf8bcaa9df0c5a5ff75f6bc34	f	\N	\N
dc61be38-7fe3-4085-9771-8e0694ea3040	2024-02-01	Debit- XX 6114 Oak Hall Cap & Gow XX-0429 VA	124.05	Uncategorized	\N	f	{}	99f51e1d8540d7ead88ae8b1b6a1e64899a431180e1227a16e05c7afb6c58c9e	f	\N	\N
6e076690-04aa-423a-ac96-a1db39f64c0b	2024-02-01	Apple	2.49	Uncategorized	\N	f	{}	b49bcff2272b274930fa884a41261fa5556551bcce79a4f6cdaac15b5b08725c	f	\N	\N
3cb55528-e92c-4163-8b44-9c2da0abafb3	2024-02-01	Payment to Apple Card	3197.10	Uncategorized	\N	f	{}	4cc1eb7110d1cc9e9d51650b1c67069092cc29d81e4edc3f47e63b0953d59648	f	\N	\N
e7df9f86-1698-4bc0-815d-1e4665ee80a2	2024-02-01	Payment to Chase	717.00	Uncategorized	\N	f	{}	a62f8e12a226d3daac4fb44ccb7de5596531cf07f7ed9a933b79b224f6fa245b	f	\N	\N
d2104ec0-88e4-4d02-bfe3-43f31a7aaac2	2024-02-01	Transfer to Venmo	35.00	Uncategorized	\N	f	{}	c1055abfc65b35fe7e5238e5287e9f1471e6093484619a4bd4c5b3ebf67cee41	f	\N	\N
add69abb-7ef1-4131-9347-6e83af1268b6	2024-01-31	HomeGoods	139.90	Uncategorized	\N	f	{}	cc28e151d9d87d261dd34fa82861d72e3523d38d40b4340a2a887262cb08b6c5	f	\N	\N
82ef240a-2e93-499f-bf9b-560efda4b54c	2024-01-31	Target	76.42	Uncategorized	\N	f	{}	5f12fe8e6828ace744f28fc1b0d36ccf0ae31bd12cd9402fbb733880f8ce4bb1	f	\N	\N
4d92b9fb-0526-480b-89a5-000433f4d46b	2024-01-31	Total Wine & More	45.77	Uncategorized	\N	f	{}	dfa877e2d88a2b42afec6cfd7023c922c58b1f89f97940f7309ebef345b4eb31	f	\N	\N
79923fb7-6541-49e0-9fa3-5c2b2bc4d9fa	2024-01-31	Harris Teeter	36.88	Uncategorized	\N	f	{}	925ae48213016fbacd91e7cade4c901c1217797fec8c92223267fab62ed58e76	f	\N	\N
f639541a-ccee-4244-836c-0782317bfc6c	2024-02-01	Deposit Henry M Jackson Payroll	-1815.76	Uncategorized	\N	f	{}	d820525c07b4e6ecb6338e94cfc4e3a9e269c4c00e947b005f899ae55a75043f	f	\N	\N
5f14f2e1-8c92-4354-949a-bc9da25a052c	2024-01-31	Interest Income	-0.75	Uncategorized	\N	f	{}	3693f773c9f95c65443135e8f1cee3910b59e11a57238d7b9e15c7bbdc9c3148	f	\N	\N
37beb549-129e-458d-97a8-6339a7d64bde	2024-01-31	Transfer To Credit Card -7148	600.00	Uncategorized	\N	f	{}	fb1450656fefd3ab13b352879a4de510b0a690c7055b5e531413b45705c1309b	f	\N	\N
79fd7cee-53ec-4b25-8065-f10eceaa193b	2024-01-31	Cash Withdrawal	800.00	Uncategorized	\N	f	{}	2b389d45b8008a45ca3560a131aa52b09eda16c8863673750fe8839f4e04b6f7	f	\N	\N
a45f59a7-67be-455d-8592-bcc9bb0d03f2	2024-01-30	Payment to Baltimore Gas and Electric Company	198.00	Uncategorized	\N	f	{}	27c677d5365869578d0c019e82db6af5569281bba24debed399e56640261e727	f	\N	\N
0b06d096-687d-4030-90b7-6622b7b8fc91	2024-01-30	Payment to Citizens Bank	88.12	Uncategorized	\N	f	{}	770aa58be8bbb2059e571d55d64bba8fb592b50bece4ed48d60cc7dc1c3de25d	f	\N	\N
6ec3ad89-2427-4d85-a1d5-489cee3f5357	2024-01-30	Microsoft Deposit	-10072.71	Uncategorized	\N	f	{}	34c1e70ffa281b7249b0aae702702b192c26b62b0a5a92ba4349678410f7b32d	f	\N	\N
abcc565f-f4dd-4346-808f-422557303aae	2024-01-27	DoorDash	20.14	Uncategorized	\N	f	{}	34abe7146666f3df34d7b6aebbab2f624d79ffab92d1377939d8bdd1450e4ef8	f	\N	\N
39cc4d9f-618a-456c-aacd-a1d836c6daea	2024-01-28	LA Fitness	10.00	Uncategorized	\N	f	{}	cb3afb81f1b60011346e84d6ec29c9420a134290b20175ec83922db10a3f49b4	f	\N	\N
2de521e2-922c-4ab4-9c36-6f599506b724	2024-01-29	Returned Item Fee Check# XX0002	29.00	Uncategorized	\N	f	{}	a7ec3861bfaf995ec0addd7ed0f833821f801c2dfaa995749a206b492d3a7e54	f	\N	\N
ea437df5-7009-4962-9cf9-0d864dc2afa0	2024-01-28	Target	-17.11	Uncategorized	\N	f	{}	499456f318c64d0d0d4a1e778cf01c1ae038d3fe45bbd8fd896fc17aecfa3846	f	\N	\N
db829334-100c-421a-b0c7-e579e628fb9a	2024-01-26	Debit- XX 6114 Girl Scouts Of The XX-4467 NY	35.99	Uncategorized	\N	f	{}	f7d7deee5c0795f8765d8689a058fe8397dda1a3fe646d3889c5aaf1baec5e68	f	\N	\N
060f9a70-0384-425e-b036-f03beb773b3a	2024-01-24	Debit- XX 8678 Chynnea Marie Beau Www.chynneama MD	20.00	Uncategorized	\N	f	{}	ac03433a4e6660f98bd9f5e327ffba16717581d54a61ce7f2ae99853a76bc1db	f	\N	\N
bb511995-4403-44ea-b63b-3e5b35b9fadb	2024-01-23	Auntie Anne's	5.93	Uncategorized	\N	f	{}	baa0921f9f46e5e812279070f9abcb41beb3576f7af5002e5e5abc912b4e957a	f	\N	\N
f53831e5-a47c-4918-a204-b95505e948b2	2024-01-24	Jersey Mike's Subs	3.17	Uncategorized	\N	f	{}	85097cb6909a89bf7820867390e087968fa3431fdeea8f0af618c8499a230c78	f	\N	\N
bdb2b1c6-cbe8-4045-9d39-b7a9b6fb289c	2024-01-23	Crate & Barrel	5.02	Uncategorized	\N	f	{}	6df485afe4513ee9351576cb3d49c64095db800c12d626a0dddb60d5b4dd39b9	f	\N	\N
f04f3e15-a872-4926-ae77-2cb341a06468	2024-01-23	Banana Republic	-27.65	Uncategorized	\N	f	{}	baa4298e9b3784b980bbf23f858e884a1a03076b61ced4946731e365937dfdf9	f	\N	\N
587710b6-8ea9-4379-a9ea-c6b875b3199f	2024-01-23	Payment to Best Egg	537.47	Uncategorized	\N	f	{}	166c991bdd20aa4237ff0e26ae80cd39018e5ec91a89ac4fb8aac18b6ed8eae0	f	\N	\N
7f0435f8-15ec-44b2-b8ae-3f210bd35a75	2024-01-22	Debit- XX 6114 Annearundelco-util XX-1144 MD	169.87	Uncategorized	\N	f	{}	7879fda00a2e7d7fe3c1083665fe9ae7f88059874524ecf94c2299fdbec99ada	f	\N	\N
977efbc8-c5b5-4668-9bfa-6808eb71442f	2024-01-22	Etsy	47.95	Uncategorized	\N	f	{}	25c3282dfb15b4869a0415ba2e820468b3f3c6c80afec484c686628ace11ac6c	f	\N	\N
e0bb8de3-88f6-4e34-927c-7a83bbffedb6	2024-01-22	Target	17.11	Uncategorized	\N	f	{}	76b67a164e26483332c455780429e839cae9e4daf629ac185a7167abe33e1874	f	\N	\N
9c8a1bfe-8ba1-422f-9e94-028c36cac3b7	2024-01-20	Sam's Market	9.98	Uncategorized	\N	f	{}	0af603eb893d2fe2a2c1e71ebf70c48456c0cf1058750c9a3b382544b425ec21	f	\N	\N
bc276cbd-c54b-4fa5-9166-46181b19d19d	2024-01-22	Debit- XX 8678 Chynnea Marie Beau Www.chynneama MD	5.00	Uncategorized	\N	f	{}	7c046935a254486bcd558fab8061397a04c3fa38ad595e24b7726247074fe878	f	\N	\N
41fca3f4-062e-47a0-818d-238faa735fb4	2024-01-20	Debit- XX 8678 Sp Aarin&co. Httpsaarinand MD	64.05	Uncategorized	\N	f	{}	0ceda28cddf10e0c93d014f0573e7c487671f70634a3aada416af5eeebf7540c	f	\N	\N
68929f43-4870-415c-b960-58868adbe9cb	2024-01-21	Trader Joe's	30.64	Uncategorized	\N	f	{}	29b07ba8f116d3655b4d66c44274fa5da6b08ea1a24fbf0412e3c29a1351a344	f	\N	\N
621e7567-2890-4958-a98e-f622d6810f10	2024-01-20	Debit- XX 8678 Muddy Creek Liquor XX6267 MD	30.50	Uncategorized	\N	f	{}	f2e74a69fdc304f60c8ba94c27f7effacd8cf05fc03ab8c7af816ba1e6e46d8e	f	\N	\N
496c7d77-9722-4e32-bec7-4c0f5534fc4d	2024-01-21	Giant Food	16.35	Uncategorized	\N	f	{}	700de5ab36647ea15ed16729e22c6cd07c30f3f21a9bdeab81357a0fbaa9c634	f	\N	\N
4112722f-2b0f-4ac2-9df0-4e2de96f95d5	2024-01-19	Transfer to Apple Cash	14.81	Uncategorized	\N	f	{}	2a9ad1d9e7f31a55a9baddf544d9301a3b170d5a8550f0a4844107bff3c5d249	f	\N	\N
aa99ff52-890e-44f8-8fa0-51b765ccadf3	2024-01-20	Rise Up Coffee	10.07	Uncategorized	\N	f	{}	61c80455a988aa402643dc5166d3cf22471dfb93704e04d98db15d5f1e6c6fd3	f	\N	\N
4157d746-07f9-4b54-bc8c-4988ba341dba	2024-01-18	Parking Authority-baltimore	3.83	Uncategorized	\N	f	{}	894e9dde15a6aebf08bc4fa542fb7f467ab10e01f4c8fc433780476b2d069d67	f	\N	\N
12cfbbe0-838a-46cd-a20d-e85529e66c57	2024-01-21	Wawa	2.33	Uncategorized	\N	f	{}	a8679c564ded9c0f698c9b305cf6460cce09b6509a589f1689bb0d6d7150d0bc	f	\N	\N
049b93ad-3b12-47b0-a6a0-a8b23300cd17	2024-01-18	Apple	7.99	Uncategorized	\N	f	{}	5ed3f493c15563defc6b751437086b88f24c4ae9a51ae1585a6717df01b2ab89	f	\N	\N
88106916-cf93-4a49-b4bc-2e43eec004a7	2024-01-18	Payment to Chase	500.00	Uncategorized	\N	f	{}	eba67ce3b78b98479bef0abc3028850bf550f9be4b63b348fbab9a4b1e1e92ee	f	\N	\N
5b92c450-3b0b-4340-a2ce-1c7f1456c519	2024-01-17	DoorDash	52.71	Uncategorized	\N	f	{}	41d65517cdff71c50ecb3efeb9649203f69c4a3a2812b79585ed892394d1cc3b	f	\N	\N
d4ef168d-adde-4da2-a744-84992781cc42	2024-01-17	Debit- XX 8678 Edgewater Xm Edgewater US	41.84	Uncategorized	\N	f	{}	219bb36fd90d104d7e849494950009a9321d41931d768fe0ce1199bb75a54ff4	f	\N	\N
798e114d-bb94-407d-8092-68a32814d323	2024-01-17	Ledo Pizza	21.98	Uncategorized	\N	f	{}	4da9404c85c5564fd99f9da9b289586d567f2dbda4888015139e55a76fc0867f	f	\N	\N
0519f05c-3144-4071-8876-9a47641295de	2024-01-18	Deposit Henry M Jackson Payroll	-1621.95	Uncategorized	\N	f	{}	2804fa856a3cfcfcab8ac09ecbd916434cfb89d499e966b81d4a3775998e54c6	f	\N	\N
39d4f498-da42-431b-a7e6-1a2a9578c0f5	2024-01-17	Payment to Best Egg	1338.03	Uncategorized	\N	f	{}	33fab95bd84e71a952a780ac2b5bb9767a83e36e8fe82257862b026fa1c9091d	f	\N	\N
1ea38db7-c851-4864-9941-25fe91097450	2024-01-17	Toyota	900.00	Uncategorized	\N	f	{}	2265ddebd2201396160a6a4169cfb9bda74971f3c26ab39ce6f473643587f592	f	\N	\N
e26fc539-4488-4c56-9ee8-f3ed56ffd21a	2024-01-17	Payment to Discover Bank	500.00	Uncategorized	\N	f	{}	b1d38ca402132535a12bc15e3dac20aa7299327e12c17733e1005c5b5f990225	f	\N	\N
6b482b85-2153-41e8-8444-bd384e0c6260	2024-01-16	Nordstrom Rack	169.57	Uncategorized	\N	f	{}	cb1c814c9bdaea199f05550c455e8279eb3f48af0400c89eaad507e1aab692d1	f	\N	\N
34da9410-8332-45e4-a524-e533d4c6df81	2024-01-16	Payment to Capital One	500.00	Uncategorized	\N	f	{}	b3ec926d280c4149e4b5170ae7cbbf8cfbdea7d8d7d57f37c0763150f236ac40	f	\N	\N
e5e78e32-3bbf-4372-8481-885c7f9ad0dc	2024-01-16	Transfer To Credit Card -9005	500.00	Uncategorized	\N	f	{}	95032a6a9074979c15c5f884edff7c11fad19799bdf891f0f7b274568bebd7fe	f	\N	\N
020c27c6-f601-4a7b-ae2f-b3296efe6a62	2024-01-12	Chart House	228.37	Uncategorized	\N	f	{}	001349c4d26b3558cfc690910d115a927a3c5b677175dc1a59acda26c282a6ae	f	\N	\N
a68f9cc3-fdd4-4b7e-9d4d-34099e8f5009	2024-01-14	Harris Teeter	105.67	Uncategorized	\N	f	{}	72bd9b8aa62c6388579d2f1dfe1bbcfc62f11399a2007e68a7fc42aa75820924	f	\N	\N
bdf37057-4df7-46d2-b9d7-143f47cb98b6	2024-01-13	Polished	55.00	Uncategorized	\N	f	{}	ce9621933b460ea610c8566839bc2564f449bcc32bc43a78a3a07f9d0f557e5a	f	\N	\N
336439da-0025-4d1f-9845-048937b60db7	2024-01-13	Debit- XX 6114 Di Pasquales Marke Baltimore MD	42.02	Uncategorized	\N	f	{}	d7b6cf60ecb33f569e96f292e8e40a138a5626bcb2d785b801813c1e5e68a301	f	\N	\N
519210a2-c23f-4d40-abbc-b264ceba01c2	2024-01-13	Debit- XX 8678 Tst* Pitango Baker Baltimore MD	38.96	Uncategorized	\N	f	{}	c478ae1bb3f977dfa010ab3a8e4668693fe06900b14e4bace71a59d8da1dd81e	f	\N	\N
a27081ec-0cc3-4f00-b80a-d0556c862232	2024-01-12	Target	35.80	Uncategorized	\N	f	{}	8849c3e80099ec0df1ffc6c076f77107d466a67bf8033145f12aaa69200d2bdc	f	\N	\N
bdb64d4d-d906-475d-820d-cc1b298489dc	2024-01-12	Target	30.00	Uncategorized	\N	f	{}	8137845e17466293c636a91fbe42e0c0d35010e8537c6d866fdcc0df56d69c18	f	\N	\N
4ce44dec-61c6-4073-9b03-83680877b3e2	2024-01-12	Debit- XX 8678 Sq *bird In Hand C Baltimore MD	29.98	Uncategorized	\N	f	{}	263a0f6839ca9baf9a3c43797670987360bc08e19584e1d258692bff139e2a0b	f	\N	\N
b21fdb5a-012a-4f97-91bf-45353a4938e1	2024-01-12	Clark Burger	21.09	Uncategorized	\N	f	{}	95652a24e7e0f1c721414d3ed538a981fd7a8f65998272282b7bc021e8f9a9f4	f	\N	\N
8eefbb3a-e586-406a-9f5b-cdbe6b2f554e	2024-01-13	Greedy Reads	20.28	Uncategorized	\N	f	{}	62d876a57d34ab301cc46cbc33b0916a6dcc9d9e4c5c4cc1e7afcd69f027b18f	f	\N	\N
c0c6467d-d098-4687-9783-6e593ae5afba	2024-01-14	Debit- XX 6114 Tst* Pitango Baker XX-6447 MD	16.96	Uncategorized	\N	f	{}	9fcfebb33a42f1583cb1af4147f27dacd00acf36479e72bb0eb2e874a0f3bc4d	f	\N	\N
9aae031b-5178-4745-a05c-62ed6c43b7de	2024-01-14	Debit- XX 8678 Tst* Pitango Baker Baltimore MD	13.62	Uncategorized	\N	f	{}	ad945b8b91c7c7760412a9a48f616ea2150a5ba5e89349d983435e11df421c27	f	\N	\N
f01ed964-dbbf-4ed3-be41-7ab414dd3e8f	2024-01-13	Debit- XX 6114 Di Pasquales Marke Baltimore MD	7.41	Uncategorized	\N	f	{}	2c1f34a81e2803f543fc439e8861bc528e76060ead16c2ed5734005cc6033e6a	f	\N	\N
a7f0eb79-0800-48e9-9689-e9e25734f5f5	2024-01-13	Parking Authority-baltimore	2.37	Uncategorized	\N	f	{}	34e7f39c7a7cddfac32585cf86117b1cec9ffb2a73d1a9fbf1ff1b7395bbab98	f	\N	\N
47d50402-5ba9-4717-a29a-8fa2cc1153bc	2024-01-12	Parking Authority-baltimore	2.00	Uncategorized	\N	f	{}	db3db4b5bee7f3a39bafca1f0577084c60e8ff18d6a564d4c56a6e6d43e20433	f	\N	\N
bb3b9887-8d05-49ac-9dcc-05d567308140	2024-01-16	ATM Withdrawal	200.00	Uncategorized	\N	f	{}	52d6ac76b2e70195c55dc52685f1d0406bd674706ac45dcbcb0bcc5fafb747de	f	\N	\N
55ab8722-b7f3-48b7-8087-8fda737dd31a	2024-01-12	Target	-0.10	Uncategorized	\N	f	{}	9341259e10ceafc685b4bcb0204ac342fb75e638b078c575d3f926725ab6a797	f	\N	\N
c213d460-0392-4ff4-9d71-e3e764b7e2c7	2024-01-12	Payment to Verizon	79.99	Uncategorized	\N	f	{}	8b8aa5943a345d0910d75ff328268ddbcbe693697d1eba3fe65e05f82eb7c02b	f	\N	\N
c04a7cc2-7e7f-465f-ad69-4ae39dd542e8	2024-01-09	Safeway	42.07	Uncategorized	\N	f	{}	098f5024ce40ab8813c3ecaac8b3e5672c32a51d5ff0d618df58cb8e311aad9d	f	\N	\N
d5cfa17b-c3b7-4ac2-b7f2-b7463b91fbd4	2024-01-10	Levi Strauss & Co.	20.66	Uncategorized	\N	f	{}	73ff9d263286ff67b429bf5d9448e470981ae175454debb10ee787a45594caf6	f	\N	\N
0b3b0514-5baf-4f40-9c45-342b29235ca0	2024-01-10	Apple	4.23	Uncategorized	\N	f	{}	5503fa6f4e20ad871342e58c30d969b480cb54ba1037f9145600d5fcd1c9edce	f	\N	\N
67246957-9717-4691-b490-0d7e4db87fc7	2024-01-11	Microsoft Deposit	-4841.65	Uncategorized	\N	f	{}	dd0dcaaefbbb226874ff009150c407c387497f4f13a2137a32632d8b4f575739	f	\N	\N
9b812fc2-7a3f-4019-ab0c-9edec4386edf	2024-01-09	Airbnb	518.22	Uncategorized	\N	f	{}	d5ff798913386f45e50b36242122bd6bdc2ea1d2df5841d693c8f2db903563af	f	\N	\N
a18ec2b4-5e01-46c3-9f6e-be734a809a16	2024-01-09	Levi Strauss & Co.	111.83	Uncategorized	\N	f	{}	e77acaf62bdc1a2921f30a087c6db26e1a6633f6875d84976073e1d1e92ea6dc	f	\N	\N
27adefb2-c4ca-4250-be44-5f4fb824c366	2024-01-09	Target	71.82	Uncategorized	\N	f	{}	60097cbd5cffdd2ac7dc4b776ceaef5e417ef1beeeca33c3761da61a68d9d45e	f	\N	\N
46961b2e-e820-45aa-a6c6-95d82a47c847	2024-01-09	Debit- XX 6114 The Senator Theatr Baltimore MD	52.00	Uncategorized	\N	f	{}	ad10932ca57a344d4b01205231c5e0bff3f3595fa1eb334e112140a29ebb6fce	f	\N	\N
d0058411-a24f-48c8-8c57-170f58232873	2024-01-10	Steamgames	11.43	Uncategorized	\N	f	{}	811a9ba25108fa02c23f946d2ec94f1d4946530f3821fc7a04b873c392c169b3	f	\N	\N
8732371b-9d2f-4dde-8e02-e15118f60bfa	2024-01-09	Debit- XX 8678 Lake Shore Family Lake Shore MD	5.21	Uncategorized	\N	f	{}	931f7cf956d152ba110ca376954a769496c7cb8a055c35165fb44fddf031fd3a	f	\N	\N
654b29c6-b9f3-40f0-b620-9e77c0591003	2024-01-09	Lowe's	300.00	Uncategorized	\N	f	{}	a7e563300f86f9a5867f7521945105a69b857d23078930d627e2c9d71ea6ece7	f	\N	\N
51b1936e-6b5d-4115-968a-605211bb9a24	2024-01-06	Debit- XX 8678 Weather Gage XX9500 MD	113.95	Uncategorized	\N	f	{}	bd263e480d30be043175878b84ecfff2c8827ab897b44e7cdea8941227e10ef6	f	\N	\N
ccc104ba-9932-429b-94eb-41a44243fccd	2024-01-05	Sew More Couture	100.00	Uncategorized	\N	f	{}	48c30a727c9735b818fde172f97c5efbadedd736f71ff53951de7120aeab28cc	f	\N	\N
5ce1de8b-662e-4b85-94e1-fc8c1f74f85d	2024-01-06	Banana Republic	74.41	Uncategorized	\N	f	{}	9f781c65712a13ce2fa362241a3686cc0b66b1f1d9b982945de61ab9cc797441	f	\N	\N
9f00005e-65ff-449e-a538-25174e033bab	2024-01-05	Asean Bistro	45.53	Uncategorized	\N	f	{}	12dc681f7d7d3e71e84976c10ee21b8a600a26d6264626ab69215a79c705ec3b	f	\N	\N
8b84af70-f521-44da-a34d-7311abf59a09	2024-01-05	Target	37.09	Uncategorized	\N	f	{}	4f6717ffd416cee3f9b70ed82e0ea6f7287b856c9a9290bafc9290a70d4c8ede	f	\N	\N
65280a8e-47c3-4fc2-97d5-ff19be9271eb	2024-01-06	Giant Food	28.31	Uncategorized	\N	f	{}	7f2f12f87386e13cc2b7e4fa221cd853a0b3baf012e4a42d1ba422d1e2886f26	f	\N	\N
85647952-eb4a-4912-ae8e-de9a8541e232	2024-01-05	Giant Food	20.88	Uncategorized	\N	f	{}	26222c8aa7cb1e27b48f2bfc8c9aef263172b83c7344e271432dd95086ea6356	f	\N	\N
3039b973-b0d7-4119-945c-69d77f10c17a	2024-01-06	Rise Up Coffee	16.96	Uncategorized	\N	f	{}	6f1936b37d74f6029ecaac5607e38f317fa37aecc63e752905a0874d998f0074	f	\N	\N
e773e5af-a309-4528-85e0-cbdf33cc3d24	2024-01-05	LA Fitness	10.00	Uncategorized	\N	f	{}	6ca192f5a6b989fb6680bb4759ad682b03af27d7d16fe11134c2d9d67994f076	f	\N	\N
43e021d0-75fe-41e7-ae84-19808b60cfe9	2024-01-05	Apple	2.49	Uncategorized	\N	f	{}	f05c08470b0e6a3f3b2b9af2d41721667e7f387bd2a1c57f1c7aa583ca9b6b37	f	\N	\N
d563972f-6f57-4b57-af89-0d61ac07d25f	2024-01-05	Payment to Chase	100.00	Uncategorized	\N	f	{}	ffefcef4c46ff984a1d7e77ff7828f969d7686054dbe7888dedfa825771e7cee	f	\N	\N
2bd1fb17-91e0-42eb-a4f9-9b40a6ba15ea	2024-01-04	Torrid	77.09	Uncategorized	\N	f	{}	cadd04c9595bf4a0cc0772a1b5e87ec87d408c298899592c36ef0351faaa2057	f	\N	\N
ae4988f6-521f-4755-b1d4-478fad7939a8	2024-01-05	Debit- XX 6114 College Transcript XX-4200 VA	3.90	Uncategorized	\N	f	{}	8a0360fcef410f660a5c973af0b63cbe8a98111d0e118c9069ff11bae45304a1	f	\N	\N
c0251cd9-373f-468b-809c-f519095ed9ad	2024-01-04	JPMorgan	2114.83	Uncategorized	\N	f	{}	490065eebc68b421fb94ad4719cb3dff610496d4e6a4e16d2d9ec069bc351f65	f	\N	\N
61bebe57-d2de-4bf0-beed-d764c2856341	2024-01-04	Payment to New York Life	616.54	Uncategorized	\N	f	{}	d2eeec17d5294d571a43d01318c5ce411b5cba0d8bf5de66b80f312090d180b2	f	\N	\N
cd1d5c6d-79aa-45ef-b263-d819b2fd8201	2024-01-04	Transfer To Credit Card -7148	600.00	Uncategorized	\N	f	{}	5cb14515eee7bc1634ec1fd520187687ce94a7555bcfded5233eddde9a36c9be	f	\N	\N
ea93cc4b-f12b-4e22-860c-2e315b885118	2024-01-03	Payment to AT&T	195.61	Uncategorized	\N	f	{}	804407dc5956c7db4c6361b7e195f126ca9a82cc7e5893f04f03ceef0f300a4f	f	\N	\N
78a1def6-f723-4a0c-bbdb-b9d6af962a82	2024-01-02	Debit- XX 6114 Vcn*maryland Vital XX1838 MD	50.25	Uncategorized	\N	f	{}	060db6666068fc70075020e76bc98fbebdf285505f634c5966764fd0dd2eec89	f	\N	\N
0f949dc4-fc9a-41bf-bdf1-928f37acda12	2024-01-03	Papa John's Pizza	25.84	Uncategorized	\N	f	{}	89c07eb278982ffdf6f46750c6fdb8df46c27e32c42ebb5d19aa99450e88e9b5	f	\N	\N
b46808e2-fbd9-40e1-85ab-d9ce077b9228	2024-01-02	Payment to Apple Card	500.00	Uncategorized	\N	f	{}	03c8e577aa20a56d2f85c54ea96edee5bf6e952d842a2b51faea09d33aaa475c	f	\N	\N
c1764443-1a7d-495f-bf79-a24b8a8689ad	2023-12-31	Debit- XX 6114 Mayoral Usa, Inc. Miami FL	153.45	Uncategorized	\N	f	{}	48ebab05df7d67b50119bd4b9e3190d8ede678cf07100943d9db1810e426868f	f	\N	\N
264eb9b6-7554-411e-a5ee-84943e8e8fa1	2023-12-31	Naturalizer	105.99	Uncategorized	\N	f	{}	79be6c8c268c7dfdfeee8199ca52aff2f03d469152e2b3f6a94f7fc179d458e0	f	\N	\N
f028cc07-89ee-4942-9fff-4fe20d7be62e	2023-12-30	Giant Food	67.22	Uncategorized	\N	f	{}	2d99505201e6b58d485d482f8ab819f5e688edc41bc53620a51f6d4cb0e58a43	f	\N	\N
93bd27bd-2506-49a5-8fc7-0c4dd41c0038	2023-12-30	Iron Rooster	62.90	Uncategorized	\N	f	{}	349b3930447958a2affe86d495e621523070b0c8f1d0ed97ce0fc02592b4d677	f	\N	\N
1fce31f1-8d01-47e2-8650-070ffea909aa	2023-12-29	Safeway	27.96	Uncategorized	\N	f	{}	2b48f600d6842ca53e4da37ed23a7a84644ec7bda81d7c4f9dd41373434134b9	f	\N	\N
15c8e723-80ea-4f42-b6fd-e6570d88fe9d	2024-01-01	Giant Food	25.80	Uncategorized	\N	f	{}	837ea410da0b7d28ec5875e5188631afa405dcbb9f89c68fea5f40f08d4df0ba	f	\N	\N
6b5516ad-5efa-4423-a035-2dcf82a6a56a	2023-12-31	Wegmans	22.35	Uncategorized	\N	f	{}	ceec79a0791952d9c731bea2f38f10eaa5fd59f613ca06168e03921a486e2acf	f	\N	\N
da70a9ef-3b5d-422d-890e-16e4cd7351d8	2024-01-01	Target	15.25	Uncategorized	\N	f	{}	346a2c6fd3fd6b808d371086efd4639db3dff560e6a4aca37463a2081f1ebd52	f	\N	\N
6a118953-c9af-4b5f-9f93-1ef643ef2a16	2023-12-30	Daily Grind	14.92	Uncategorized	\N	f	{}	2e8afc519a623ebf4cfcaf0f6d56ed7fa80aa1d6edb1daad2554a43fbb83a45b	f	\N	\N
4fb3d6c3-3f5c-4fb1-9a60-db5272ee5cd6	2023-12-30	Harris Teeter	7.00	Uncategorized	\N	f	{}	fec8f89426f3a4e679a102909a90678a57077a4afbf3c1371e78d72a0750e0d0	f	\N	\N
22bc9059-cf43-4d6e-92e4-791b72f8d725	2024-01-02	ATM Withdrawal	500.00	Uncategorized	\N	f	{}	b1faf8ee2ecd90e951cd6fab4b8acb1289713653d91ddd0b6fb0170b15ab41c7	f	\N	\N
b64803bc-45d8-4f21-b8ca-49d0c74e033c	2024-01-02	ATM Deposit	-3000.00	Uncategorized	\N	f	{}	5413740192c36c5d2afb12c73d5255ca4c161a81adfa25f747319a7992c2b23d	f	\N	\N
4f6474fc-2067-4091-bd68-ac09c052eb88	2023-12-31	Dick's Sporting Goods	-56.16	Uncategorized	\N	f	{}	11c441fe94b0f01b9ad125b34c6e43437b61e7d9de9496327f16000661757dfa	f	\N	\N
2ad0ed38-a88d-4446-adac-01a3f1bf42ce	2023-12-29	Interest Income	-0.51	Uncategorized	\N	f	{}	11ba3ea135dd654fd93976510e5777e78975b187fecf094cfaeff7d84d40544a	f	\N	\N
a1b6a865-4a84-4458-a5db-af8000407290	2023-12-29	Payment to Baltimore Gas and Electric Company	198.00	Uncategorized	\N	f	{}	a8cfa5bfde03f38539623a92e00f87bd4c0bfa7eff6040c4df0fa0658b43c5e0	f	\N	\N
f63a11a5-4c06-46cf-a2f0-e5966496dd83	2023-12-29	Sam's Club	305.32	Uncategorized	\N	f	{}	9fa32ce5a817a5269b9148b61a714990df5d73435b1a43261f63e97e22f0de52	f	\N	\N
0b99fe6c-36fc-4909-89f0-4066d4a42f3b	2023-12-28	Debit- XX 8678 Chynnea Marie Beau Chynneamarieb MD	15.00	Uncategorized	\N	f	{}	f4dfadba73eda7d9382067e1098ca46bf4eb8b74ac954e0b30c5df4a9ac71dad	f	\N	\N
af0b9466-4992-4890-ba46-7ff6bfe72d2c	2023-12-28	LA Fitness	10.00	Uncategorized	\N	f	{}	162952c3736c68ed1a494b6b28837e999e36f2643f29052b3e85e6ba6cacf915	f	\N	\N
9e8b36d2-79e4-4a73-b7e4-e06c3d6de542	2023-12-29	ATM Withdrawal	250.00	Uncategorized	\N	f	{}	e72b02d9504db52de31c8c9d88b58ffdbba70638c1725e0c1406be3737c30b05	f	\N	\N
0ba4e11e-3fa1-4436-847d-45c5c9433613	2023-12-28	- Citizens Pay Line Of Cr XX0513	88.12	Uncategorized	\N	f	{}	b8cb25cd44526bc5e7640ca7c711a03d68330b98e0fb39daaf7b256cf782c939	f	\N	\N
c7ae3702-5422-4c06-b2e7-e88559ef3e08	2023-12-27	Giant Food	17.17	Uncategorized	\N	f	{}	f1e2a88d803f34d9e16f8267d1c3a32c7908f04ac3cfbde5c517139282590a76	f	\N	\N
7904e0ff-8581-46cf-83ff-27740e7032c5	2023-12-27	Debit- XX 8678 Chynnea Marie Beau Chynneamarieb MD	5.00	Uncategorized	\N	f	{}	ac18e061c90dfeee403f3fcb80653279baa38f210fe2dcf59b867e1507459a92	f	\N	\N
564a973a-c35b-4fe7-bfab-c9cc7fce7868	2023-12-28	Microsoft Deposit	-5158.07	Uncategorized	\N	f	{}	a3348be13a98640686d0533f0c00401e0b85bd4ed9189a410229d6724f1a6a30	f	\N	\N
ab699b0b-42d7-4462-a72f-d0ef2592d91c	2023-12-27	Returned Item Fee Check# XX0002	29.00	Uncategorized	\N	f	{}	cee19f8e5b0f2fe912b592d6f65b27b8f039efa40564bc1f0edc0396fc72deaa	f	\N	\N
c4760a5e-8b2e-4894-ba23-a22b212fda6f	2023-12-26	Payment to Best Egg	537.47	Uncategorized	\N	f	{}	6bc9643570209e06c21e968a0ce06f152cb3972df2cbd8f8515c8b2f04c537bb	f	\N	\N
de500aa8-0942-449c-afd8-ff3f342ea67c	2023-12-22	Harris Teeter	53.58	Uncategorized	\N	f	{}	45f13e02a84b3417128c80f2a54f6d51d6f8adc0767f722fb358c35fd392c5a3	f	\N	\N
154d1c58-5871-4969-bafa-8872523d22f5	2023-12-22	Debit- XX 8678 Paypal *dickssport XX-7733 PA	52.98	Uncategorized	\N	f	{}	c5d94814aab8cce01359740ad85132b8d39cef0a76b1e4d038357c5a5593cce3	f	\N	\N
0780abf8-eae2-44ac-91bd-74ccbd5ce5a9	2023-12-22	Ledo Pizza	48.71	Uncategorized	\N	f	{}	830cf83fba6c529c5bd883ede19f1799dc51d0a70a4eca9c7e9d7329561b8e22	f	\N	\N
e1e6f901-ccc6-404f-adf6-a02dee0b1123	2023-12-23	Shipley Do-Nuts	5.38	Uncategorized	\N	f	{}	18ba2c2376f9d44dafdb1795ac7311e3013ed21114720ebb0b1a9917a0a57510	f	\N	\N
cb229061-c8b2-408c-b453-f4060fbf6d6a	2023-12-23	Debit- XX 6114 College Transcript XX-4200 VA	3.90	Uncategorized	\N	f	{}	1efcb216f9d122e28e9e961d162a2e28b905cc91dad9dc1e694ac103f66e8e3a	f	\N	\N
c587eb69-2401-4982-9fee-a8d095e144b2	2023-12-24	Target	-6.35	Uncategorized	\N	f	{}	95365846dab4861579fe07d5f9862ec049ce9bb19e4272329fddeb9195605a5a	f	\N	\N
ffd24668-ff11-4d20-9b85-86a9c4410a34	2023-12-21	Target	12.70	Uncategorized	\N	f	{}	05968f5dba5ef72fc897c75c5fdeaa87f7328869250f798e56678bc61eb2bf8b	f	\N	\N
dd65e115-8950-40f4-b81f-630b62c6e66f	2023-12-21	Transfer to Venmo	10.00	Uncategorized	\N	f	{}	b7e8e56b71c28f15b3cf3541e3232b9ff63252283a6ae01e149f6387e04589fd	f	\N	\N
06c8d820-fedf-4af1-a159-fcaae7772566	2023-12-19	Debit- XX 6114 Vcn*maryland Vital XX1838 MD	50.25	Uncategorized	\N	f	{}	fa717624bc4bd27c9ab64afe27cc98d80f129bb6102262c0a9312c1d71badf33	f	\N	\N
a4fd463d-8c5e-430a-bb7b-8bb82d9af518	2023-12-20	Target	42.56	Uncategorized	\N	f	{}	45628d6f58c61bf1908ce41186038aa0dff3bf6e0784cae473594a02f8c92646	f	\N	\N
a313fa13-6d9e-48eb-924b-24dc47e6e5ec	2023-12-19	Debit- XX 8678 Di Pasquales Marke Baltimore MD	42.50	Uncategorized	\N	f	{}	aa7b1f4b1aea30b5f119208a5d3707f6beb43b6652e3ab95bb4387468a80c4b1	f	\N	\N
e5badd52-a96e-418b-924f-bcacc05f5900	2023-12-20	First Watch	15.62	Uncategorized	\N	f	{}	7c218a2540dc93bfd58f0d4d6da1df2ac4049a4866b408de9b0ac97db6b4b5bc	f	\N	\N
9f6fc08e-be9f-4913-8d07-47f59140048a	2023-12-20	Debit- XX 8678 Ls Bin 201 Wine S XX2011 MD	11.98	Uncategorized	\N	f	{}	52d819f260308090e410e3ff01e6d7cb40fbf5639fcad9bfcd4839485b7314fe	f	\N	\N
042426da-97eb-4aea-9292-2d687bf3113c	2023-12-20	Target	7.20	Uncategorized	\N	f	{}	6bd95f6fe1248da3846514922e6fdcca14d1cb057ded076168499ce473616fa7	f	\N	\N
5b483b6a-41d8-497d-a41d-f49397717006	2023-12-20	Target	5.63	Uncategorized	\N	f	{}	aff7977066e3c4b47dbb9ecaf751cc8c70d8c43d9cb1b7919112b19d33645c43	f	\N	\N
66879831-d7d2-4851-9f1c-50f5a4ffd40a	2023-12-20	Target	4.76	Uncategorized	\N	f	{}	e496ce83e8524a7ea04077f284ff5123af010c07a641011d1be728c838f53844	f	\N	\N
7780662a-e642-4acb-bf1f-c8b48b36a0f0	2023-12-20	Debit- XX 8678 Vineyard Vines Llc XX4982 CT	225.15	Uncategorized	\N	f	{}	b484e4ba226d1c74e9bc27b6fba2051e6d9f791ba4df538c9241c63bbc8b0521	f	\N	\N
35a63f70-5098-49f6-bce4-06a9a0f92f21	2023-12-19	LA Fitness	49.00	Uncategorized	\N	f	{}	0775049fd7cd20cc606d4e3e6a9e013ecb9ff6725eabc2f3dd6a9c951236b4c5	f	\N	\N
daf89b72-c285-458c-89d8-05607d836c37	2023-12-19	DoorDash	21.15	Uncategorized	\N	f	{}	f19ef0bafd6c3c16023806f252599a63be60f198a728397b84c9a147bc9789af	f	\N	\N
5b458761-9eef-43f5-98f8-379ea2f12238	2023-12-18	Debit- XX 8678 Sp We Are Amma Httpsweareamm CA	97.10	Uncategorized	\N	f	{}	5897f04a540001b4e14815e7eee6cf356ded39da4e2b0d458a8abda6eefa95f4	f	\N	\N
47eeceb8-722e-4b8d-8fc4-613d14d22eb0	2023-12-19	Apple	7.99	Uncategorized	\N	f	{}	8ecadc11a6e2358d0b6721cbcf9391ca2e8305c374922be10ec3d5b5ae6f6075	f	\N	\N
bf54e67b-7800-4c37-b293-3fdfc6b5c80a	2023-12-18	Toyota	900.00	Uncategorized	\N	f	{}	bd60234b89b77d7602f10f6f5cd46fb972c41b7149631aad59cf824eb6c1f5e5	f	\N	\N
8c978a2f-c133-4916-900e-68a255290865	2023-12-18	Payment to Chase	450.00	Uncategorized	\N	f	{}	ae1b8637be15cf9a47f74938b7a3eeb57d20e92d1f0df60ab4f010d77199989e	f	\N	\N
721891dd-fdeb-4e66-8018-ac9bb4704dfb	2023-12-18	Payment to Capital One	300.00	Uncategorized	\N	f	{}	07cc8101d566b9202c6b0a9aaa40dfdc6842e6c49d5c2fd60623e9b461cb677a	f	\N	\N
fe7e9021-15b6-4711-babb-6bfdee665565	2023-12-18	Payment to Discover Bank	200.00	Uncategorized	\N	f	{}	55860fd44bd29e7f9399000f9dd79b45ea187db69a3bc4a9b205736910fe76eb	f	\N	\N
cbfdbc49-3c78-4b98-9c81-c4900795449f	2023-12-18	Transfer to Venmo	45.00	Uncategorized	\N	f	{}	427c406e56ffbc75f345644b64a1308eb749d0f283e926e9419a358bdc6c6f44	f	\N	\N
e877284a-90d6-4aa5-932e-0d72cef093d4	2023-12-18	Transfer To Credit Card -9005	450.00	Uncategorized	\N	f	{}	594e7aa42e2a2ea278cfa36022d44a1f8704ad94c057d41b17c191725c51de56	f	\N	\N
f9c188ac-3991-4243-a4c2-df7e4d80c1ff	2023-12-15	Crate & Barrel	106.95	Uncategorized	\N	f	{}	06b329f7a78cf498817f34a65c6a57b45717518108d329d868f80cc3f5210248	f	\N	\N
a606498b-b1e3-4b2d-aaf3-5e53d42b0832	2023-12-16	Debit- XX 8678 Sp Kitsch Httpswww.myki CA	73.14	Uncategorized	\N	f	{}	8d1d242b1d849ac6b10eedcae0085c7656e8fc621a2edc14c51e2987c207f95b	f	\N	\N
9ad39b4c-dc3a-4426-8d46-92a33ef40f5d	2023-12-16	Giant Food	51.55	Uncategorized	\N	f	{}	6652978ecd65bfb4b0d50bd2aae88c5d177642842e9372d2f1b09d791678205d	f	\N	\N
4c4cc7dc-e32c-4f6a-90ae-aa72eb2ec2da	2023-12-17	Bagels 'n Grinds	49.46	Uncategorized	\N	f	{}	8b4b824c2afd24d4f20f77e6cf799553d68bdfcc00a49fa610503624d939a532	f	\N	\N
f7db374b-aa43-449b-977f-920ce497a8cd	2023-12-15	Target	29.22	Uncategorized	\N	f	{}	7af7380bdc87ff87842fff89479fed713a19f922848cebd627cc3c8e98731ed6	f	\N	\N
ba7e8521-7774-4a9c-8f28-49750835ba34	2023-12-15	Debit- XX 6114 Thai At Waugh Chap Gambrills MD	22.10	Uncategorized	\N	f	{}	54c2c8d265ed938c0a13ef69a14122c6ae25cd3a24618ed739127a29302e56aa	f	\N	\N
053f1b99-8cc3-488a-8a84-dce1ec29ef7d	2023-12-15	McDonald's	6.56	Uncategorized	\N	f	{}	514fa71356933de993b8b332e5d66b3ba70ea9667d26a294bcb65a063b7f893d	f	\N	\N
68c10684-1370-4403-b8bd-2b4312604886	2023-12-17	Giant Food	5.98	Uncategorized	\N	f	{}	7730b6ca189eab7b1d305d57ccaafb615ba87892882d54598852fbf4c31b4424	f	\N	\N
698f6ae5-6123-43a6-8938-df3ae37078b3	2023-12-14	Giant Food	48.11	Uncategorized	\N	f	{}	be4810687bf6aedacba3a54c486cf1c590edacbe3ee1e7b0c7a4cc526c5d0822	f	\N	\N
9e793af7-5fec-4e65-8564-2d404eec7682	2023-12-14	Ledo Pizza	40.49	Uncategorized	\N	f	{}	f82946d5795c8cb704f3a5fa9ea31202266d75bf4674961f483c0e048b979c1c	f	\N	\N
c4fb01bb-a78f-4b0d-87ad-f1ee308647d5	2023-12-14	Payment to Best Egg	1338.03	Uncategorized	\N	f	{}	63e59047671b76fabe70511da7806aa9f39e15932c5c76cd920a7a8d8064d4c0	f	\N	\N
ae65f400-6333-4247-8457-feac63e69efd	2023-12-14	Payment to Synchrony Bank	213.00	Uncategorized	\N	f	{}	0815d443b13481df5c79824af104089c028212f2ac20b516dde29afa44aaa7c1	f	\N	\N
98b5ba5a-7ae3-4213-9bd0-19e2f425e55b	2023-12-13	Caliber Collision	500.00	Uncategorized	\N	f	{}	2080d57f088f41a44e8f05dc1da175a62182d95cb2e5321270791d736a62c28b	f	\N	\N
4bd897e2-cc4a-46e4-a020-69e9fa0e4e84	2023-12-13	Gianni's Pizza	19.00	Uncategorized	\N	f	{}	8c807d2d2a443ec71eb4c9a185205cecf0bc0d1c5e9f6603bc796aad9e754e6f	f	\N	\N
41676e3d-b27c-4925-9377-8c82abdf46a0	2023-12-13	7-Eleven	4.64	Uncategorized	\N	f	{}	83eee34a6a7828cfaad7a67074f1c814e3f6f7da955303abf17763e36bb954be	f	\N	\N
29efe41d-50e3-4d40-9b6d-e4c9715a976a	2023-12-14	Microsoft Deposit	-5156.62	Uncategorized	\N	f	{}	ac4189d953a87db5a36369de8c78beef3ab02c508b669223bd3587566c71256e	f	\N	\N
d483ad95-c1bd-4216-ad09-2025b5f73898	2023-12-12	Debit- XX 8678 Paypal *dickssport XX-7733 PA	49.03	Uncategorized	\N	f	{}	ce7c128a9568f7ac3fde2cfe76bdd3fc9a030472c739e52b5220af3133326d9c	f	\N	\N
bf647e82-35ad-4dd1-97f0-61e1d7bba153	2023-12-12	7-Eleven	38.60	Uncategorized	\N	f	{}	b1268efe9006150eaa881271a3c6179d1136a906d38d48fec5c13c72c740ed0f	f	\N	\N
98e5bc4c-1405-46fc-a91a-c3c9db40625f	2023-12-12	McDonald's	4.75	Uncategorized	\N	f	{}	596acf187349456e6d8f5b60ccaa9c03a7a8efebdf4d2ff1a2646e2641e48855	f	\N	\N
da57999e-85f8-458a-9c52-081dd7a75a16	2023-12-13	Adjustment - Cr KeylibmXX0001 Boston US	-250.00	Uncategorized	\N	f	{}	7d4251bb1ce465b8808db5bc0004d041438a8d61ee5eaf289ebb66610a177be0	f	\N	\N
09b07713-a2bf-463c-926e-8d317f5f3b86	2023-12-12	Payment to Verizon	79.99	Uncategorized	\N	f	{}	ea51a322093777226df1a5c4534cc0cf2359a0307082cc96c34a2870b17b7add	f	\N	\N
0204d73d-1849-4866-a9ae-0da10bd589c7	2023-12-11	McDonald's	4.22	Uncategorized	\N	f	{}	109f968edcb63f690588d7819ce105cc9ba40b243440bfcfeb3ae140aed55284	f	\N	\N
9e498213-255d-46a8-9de9-7f03cfd20328	2023-12-10	Target	-22.61	Uncategorized	\N	f	{}	03e96d9ff2d3757907f0690d8182e24e51487aed7cbac9d7dfe5f1e90640aedf	f	\N	\N
d992d0d2-b085-44a4-bd9c-74f1f6b5c86c	2023-12-11	Lowe's	300.00	Uncategorized	\N	f	{}	897bb6b7010657907e07e810f6337e4fb022df3d2e11f47ecf700f444179cfd7	f	\N	\N
8952c863-420c-4ec0-b04c-4bad4bff92d4	2023-12-08	Victoria's Secret	82.68	Uncategorized	\N	f	{}	a7ad77cf4a24480be1cb97fed546624ed40b81e8b3f1404215099d663ff7560e	f	\N	\N
9501c6a8-5fa4-43c3-b9e5-7bb4835ddb1d	2023-12-07	Giant Food	118.11	Uncategorized	\N	f	{}	d164cef87aeaa6408145d8c1292120473c8646a4968ac10a46551dfe9b7b97f3	f	\N	\N
9add3ef9-2f40-4fc2-b737-77d551f1d3c5	2023-12-07	LA Fitness	10.00	Uncategorized	\N	f	{}	9cf1e1ab7be676912fb0f0dce4f593399bd4d0a80465f0b6a9a2bac70253d1fa	f	\N	\N
d7aa57a6-4e84-439f-90b2-ea892342a4d4	2023-12-05	Debit- XX 6114 Columbia Famous Da XX-0091 MD	60.39	Uncategorized	\N	f	{}	582f5e6de8a6b896c68e553fae783a3c83dced8731efddca8ed87156c4238fe6	f	\N	\N
563569bd-24f4-4474-9769-18069a1857cb	2023-12-06	Taichi Bubble Tea	37.07	Uncategorized	\N	f	{}	7877a32425c015f606a8e0ff2636ecfa3302816060ecbf0f95edbc853a710928	f	\N	\N
e01b2c5d-831d-4aa3-b116-78f9761c9c1b	2023-12-06	Rise Up Coffee	36.00	Uncategorized	\N	f	{}	6325c9f4a52c923e751e0bb2de4013748cbbf21c8c456b5e7370ce6a08fff9e3	f	\N	\N
fff6df1a-6d7e-4510-92cb-0eaa31197b71	2023-12-05	Debit- XX 8678 Paypal *haloinnova XX-8632 NY	125.04	Uncategorized	\N	f	{}	47fd94c11874be9c846aec1b4115f917bc077bbb5a0227e15b5776d83e748f4d	f	\N	\N
c2b1048f-d22f-46d5-8292-ac39c7db94fc	2023-12-04	Target	62.45	Uncategorized	\N	f	{}	944f9a87480d542ecedfd29eafaf0cf137d4dc48757cc488c69e66d19e8656cc	f	\N	\N
df7e0363-d3b4-4a02-bfa9-348d5d770b75	2023-12-03	Polished	70.00	Uncategorized	\N	f	{}	f4a69826c15be51c4f12867f350e80baa74a1837abdaff18a57ad640bb7c490b	f	\N	\N
f8196387-9fdb-4b7b-b691-a0b860b0f549	2023-12-05	Transfer From Savings -0387	-500.00	Uncategorized	\N	f	{}	9a7402db91347a1fbbe4c25bb409363a49b7932c2d77b7717487062ef8bbf92a	f	\N	\N
9d0ade7f-595c-4ed8-956c-7f54b7306b34	2023-12-05	Transfer from Venmo	-170.00	Uncategorized	\N	f	{}	be021d852be273e36b0ec1355ed9ff5044102a5e5349f7bb3850650cc690a4ef	f	\N	\N
206d1335-32fd-4b55-b551-35e162708efe	2023-12-04	JPMorgan	1926.24	Uncategorized	\N	f	{}	054f58d8d1e759dd201b042880b4ad161db8ee4263b242608f99ea3cd904199f	f	\N	\N
7215e081-cfae-4180-adb0-174010ca0072	2023-12-04	Payment to Chase	250.00	Uncategorized	\N	f	{}	35f0a89756d432fad7203f56700800832ba55f7d0f0e6d4a21fa0794a0d4d6cd	f	\N	\N
3624d22a-7ae5-4ca6-9396-15d59f9468af	2023-12-04	Transfer To Credit Card -7148	550.00	Uncategorized	\N	f	{}	9d5e8cca4b2f51a8882a2baaad9eea558405e172731ff3a50759ddd4d99602c1	f	\N	\N
22af3057-acec-487c-bb54-695673e85f70	2023-12-03	Payment to AT&T	195.61	Uncategorized	\N	f	{}	784f7f647dda9fba7196f3981cd9f00674582d87b217e158039ae3105adbf70e	f	\N	\N
c7a03d22-6db6-467e-b1d5-58dace2c39cd	2023-12-03	Debit- XX 8678 Mayoral Usa, Inc. Miami FL	165.48	Uncategorized	\N	f	{}	867b3ae0c7fdeefcd379b08da26afe4c4dfdd2bdd75c0e24e4f22dedce3301c0	f	\N	\N
02cdbd9a-dcf0-4d73-a8c3-9bfb2e695bc1	2023-12-01	Papis Tacos	79.00	Uncategorized	\N	f	{}	6fe45fce054f13bda93140511dfeb6623b644e68e72453c086ac3d3d972f4d63	f	\N	\N
1bddc8db-e067-43f8-94d1-34c0b585e117	2023-12-01	Debit- XX 8678 Paypal *uproot Lin XX-7733 FL	58.28	Uncategorized	\N	f	{}	bf03c63f76f67278ed9a96bc5fe28a38e8ce3bd43c680436a2dc20e329553cca	f	\N	\N
98f96423-ff91-4c4a-a4f5-faa5ef528d12	2023-12-01	Debit- XX 6114 Tst* The Royal Blu Baltimore MD	16.99	Uncategorized	\N	f	{}	65aaa75d96aaf0f2ddc46eabc214b3af332dcf72f9770ad28a307e405f8fc7f1	f	\N	\N
700a1dc7-d0cc-4b38-b5ce-2a1085d7f509	2023-12-02	The Great Cookie	12.70	Uncategorized	\N	f	{}	c6510f2890bf0e24bba3d71f654364c0b486dab0d75e108543b6b8dd6ba167f4	f	\N	\N
dc2ce3b9-7925-4dd9-b959-b2b72ab6270f	2023-12-01	Debit- XX 6114 Kirbies Grill And Baltimore MD	11.40	Uncategorized	\N	f	{}	39e45f30c6163fee8c951e7f4acfc03853b97677b4c198987195cbad2a53dcf8	f	\N	\N
2e70f20f-4318-41f1-81a1-59a79026de09	2023-12-03	Debit- XX 8678 Ewc Canton 0814 Baltimore MD	10.00	Uncategorized	\N	f	{}	339110724eea4af7e24250fce62609242ea4297d23783eca40e68d5f8782d513	f	\N	\N
b63b8478-9b26-44ae-9f08-e8dedfd04e58	2023-12-01	Domino's Pizza	8.47	Uncategorized	\N	f	{}	ba021560368e0a3825f2ebb71807dd4e3a712e7ef53db003b768f3c8375a0af9	f	\N	\N
d2efcb93-5099-42ad-a0cc-5bcb372b1efc	2023-12-02	Mamma's Pizza	6.80	Uncategorized	\N	f	{}	d36d5e65d4d882ca3831d5993d508a28b4fbf3b0e9ab6e991820d5531592b996	f	\N	\N
b92b2d41-0d25-42e9-9be3-c4894df3c6e6	2023-12-03	Daily Grind	6.03	Uncategorized	\N	f	{}	17071d1a3d37c38e6025a2f4cbea855134654dbff3ace9a1e48986064b884172	f	\N	\N
c99d3692-e00a-4ef0-a108-7613ce344024	2023-12-02	Target	5.36	Uncategorized	\N	f	{}	5cc143179c80175be9dd3377f3bd0df311d8b3534484b27c056bb664733dbb4b	f	\N	\N
6b5dd542-80e7-4dde-9015-27bf92c0914d	2023-11-30	Little Italy	5.00	Uncategorized	\N	f	{}	945d40adc5baf731c2524e458fab37827473f5d52cb8109ad3154e53dfb5085c	f	\N	\N
fe68c475-3e2f-44c0-be3d-4eb9e8ff6c9b	2023-12-03	The Great Cookie	3.60	Uncategorized	\N	f	{}	c0a8ca9280ffa83a6de43efec4295ed5f192c28359b68683cb880000f72f4f1c	f	\N	\N
ca644954-454c-42f9-a9a3-2c0043cffe58	2023-12-02	Apple	2.49	Uncategorized	\N	f	{}	0623719ff8d1705d2d6f8d6d161d7592aaed0f3e1ac2b045b85cbcf1e65d26a1	f	\N	\N
75b27841-5b84-48c1-aaec-e4ed59a2842b	2023-12-01	Apple Card Credit Card Payment	1000.00	Uncategorized	\N	f	{}	00be22e85124a6feeff7db2d8c2b48774ae83bf9ad5e519997c765b35c5fcc8d	f	\N	\N
d64efa36-006e-4576-a41c-9a35d33dd009	2023-11-30	Debit- XX 8678 Tst* Tagliata - At Baltimore MD	148.27	Uncategorized	\N	f	{}	2d8d8f92c707e883827a4b414bc2e9305c013c80c3117b9962250e65694bd5ae	f	\N	\N
84f6db34-34ea-46e5-8e6d-7db3162f0c7b	2023-11-30	Debit- XX 6114 Fortune Cooky XX8399 MD	9.23	Uncategorized	\N	f	{}	844c550558336be036b946036e2572746c742d425678aed20a77f40df624d204	f	\N	\N
2a620026-1465-4065-934b-de13a0e921eb	2023-11-30	The Great Cookie	8.71	Uncategorized	\N	f	{}	98d269008737afd2b883569b6af0d1d41976ca553bda00a1e27a610f2226e715	f	\N	\N
b9888393-726a-41f2-b2ac-b0d202ab1f06	2023-11-30	Rise Up Coffee	8.42	Uncategorized	\N	f	{}	141d8c1963d3ab11abad84e08cdf9013ade95ef70582f466a223c72ef70919c3	f	\N	\N
ff53f678-c4a3-4ad6-aace-da5e3b594cd1	2023-11-30	Interest	-1.11	Uncategorized	\N	f	{}	5b29c84ba4e60c1aa4d5966bc266d53b3796b21b5a98ba6263ec407cdbc07e2a	f	\N	\N
87bb7011-5618-4f49-9cff-ff4c12b7b2ee	2023-11-28	Harris Teeter	143.51	Uncategorized	\N	f	{}	d18f39f376cc8bbb3c3c677230e9237335381b1d71560345e06e2bfa9beae703	f	\N	\N
506ba5a4-9b6d-48e6-9847-4b8bef2f0ca0	2023-11-30	HomeGoods	106.00	Uncategorized	\N	f	{}	529583511bd5eb84a164a2195d32963092a8176846258be884be6c7786638965	f	\N	\N
34c97045-c213-4d51-81ee-94b89a99f70a	2023-11-29	Transfer	72.15	Uncategorized	\N	f	{}	c0ef265fc87da66d664a20fd6959fed27073eade5a468e61adba43e848713659	f	\N	\N
c1ea6163-5fbe-4869-a0cc-068872cea50a	2023-11-29	Debit- XX 6114 Kirbies Grill And Baltimore MD	38.38	Uncategorized	\N	f	{}	9b7e872822d76ab3e54ea09c9a41bd5c3fea4c3d8e8025ad047a161e79a8564a	f	\N	\N
4fadc896-5e57-43fe-9dd7-a581845793bb	2023-11-30	Giant Food	15.06	Uncategorized	\N	f	{}	319521cea469cc42f25963078f907b8f2dfd013ae3f558449246dd99a4a8d1e5	f	\N	\N
387a4070-8bfa-408c-a831-c59b56ce21bf	2023-11-29	Subway	11.67	Uncategorized	\N	f	{}	0378ce4400a1e978962294799189dd2be87b9240a39c7c006f45a934742975ea	f	\N	\N
1b01c9d5-18cc-4112-b378-375d8eee3912	2023-11-30	Trader Joe's	7.29	Uncategorized	\N	f	{}	ccdd6bedb79cb10911b7fca142a5ccd955391c0b107adc24770d64586dc7f444	f	\N	\N
ab2ddc5f-e491-433b-b571-9fca69353134	2023-11-29	The Great Cookie	6.82	Uncategorized	\N	f	{}	848b3ac75bad5392714c8225b34e877419bde8c359295fd57fb470dc20b09f6d	f	\N	\N
35eb44ea-7dae-4409-9c18-8f54948a0b41	2023-11-30	ATM/Cash Withdrawal	300.00	Uncategorized	\N	f	{}	5d291965c8ad25a8b699a206447ffedce36926cb28d12021ab1d8c6b6c3cafa3	f	\N	\N
d891a5e8-2788-4e62-ba2d-4bac554f5ac2	2023-11-28	Debit- XX 8678 Sp Birdy Grey Httpsbirdygra CA	114.33	Uncategorized	\N	f	{}	8f2288414e9a2c09c692209e6b6979620056f105ae67a046265331412d39ef43	f	\N	\N
114b78e8-5be9-48e9-87e8-eff832a30cc0	2023-11-28	Rise Up Coffee	6.30	Uncategorized	\N	f	{}	5ab11033376461d9ddb5ec5ab1c95b882c800b92600e5da979010c28a7676124	f	\N	\N
94d49860-c65d-42f2-981f-f754ababc7fc	2023-11-29	Microsoft Deposit	-5160.16	Uncategorized	\N	f	{}	c883f8b83a440dc8c4cf5480e2d98c93f3e6b7d602d69bde267acff8f0d12bac	f	\N	\N
cc334a80-527b-4ff7-9d2d-c7dfd68deb97	2023-11-28	Baltimore Gas and Electric Company Utilities Payment	198.00	Uncategorized	\N	f	{}	80525457f9a76ac23e6f7e6c687cb68d2f0813b24afd33d1ab82a44b6a815113	f	\N	\N
fc020012-045c-463f-886a-e3f9fa89b0b2	2023-11-27	Target	95.87	Uncategorized	\N	f	{}	f53ea0d90d88eb4f52122b0732746c1502dc1872e32a4b32ae61850d39418636	f	\N	\N
e124ed90-671d-4435-97d2-a560ec0fd1fe	2023-11-28	Zelle Transfer	90.00	Uncategorized	\N	f	{}	65eb0faa9092af91a0b39b3e76fd0059910d212ccb6694ce7bfc2f2d561aa4c0	f	\N	\N
c3c21539-5ebd-4e2a-bc44-26003933c413	2023-11-27	Wockenfuss Candies	45.55	Uncategorized	\N	f	{}	e28cb5469dbf29a644cd56f054e6c25cbe00934d9a25cfb17dc80de092f6e955	f	\N	\N
ad2f6ad6-58ea-49af-ba8f-9776df3ef143	2023-11-27	Target	30.00	Uncategorized	\N	f	{}	9ff635765dcb4d941ae491accf3ae5cfaaaeccdeb22c3ab9d63da5f301c15441	f	\N	\N
3a984582-b106-468b-8281-3e4e26bd1b35	2023-11-27	Target	20.39	Uncategorized	\N	f	{}	b7748a35cb711541ef44e7df7ce9c2e896571c66fad4c3c1ba9c487673dabc47	f	\N	\N
dcb96e97-0d6c-4d94-a6f3-fddd90dae9f8	2023-11-27	Target	10.00	Uncategorized	\N	f	{}	b4c006245f754eaa0114027b8a44a4a25b0ec52b32bd4b8ffe3b785242cf25a3	f	\N	\N
a578c9b7-d042-4bc5-9dde-ba849ab15f90	2023-11-27	Target	3.44	Uncategorized	\N	f	{}	54f5ef18cd6c5459ef88b1a6ce2afcdf1ade6cc986dcb85b6f2d32f92f2a20c5	f	\N	\N
fe878970-f048-49f4-ab66-7281388e497a	2023-11-27	The Great Cookie	2.84	Uncategorized	\N	f	{}	e81ac4dc0a8c6aaf8079d3df06fdcf086fb05945e6b10d1cdbbfe6c08f2fef64	f	\N	\N
e4e6a007-3ab3-4a95-99a0-92c679c1cec9	2023-11-27	New York Life Insurance Payment	616.54	Uncategorized	\N	f	{}	6c139a32d51a5458816a19c77c2037eece29c41dd5f8a86e58170b0a2abf6e6b	f	\N	\N
9ebc3919-9859-4598-befb-b0711aae31eb	2023-11-22	Debit- XX 8678 Payne Christmas Tr Elkridge MD	183.22	Uncategorized	\N	f	{}	82b2e7b1dd2a5532c7ab25b43991d6e507bd1a2dbeb113aab9b7f8e8a7d0f674	f	\N	\N
ee4fa6a7-514a-4466-bfb6-c5bbe2a975f7	2023-11-26	Debit- XX 8678 Sp Calabash Tea Calabashtea.c DC	75.49	Uncategorized	\N	f	{}	25669fa3fa3a71ff9aa48723662e3d3687e34b04c6166dd59d9bafd3f888b522	f	\N	\N
0d5463d8-dddb-4dea-bce2-306a264d88b5	2023-11-24	Whole Foods Market	71.79	Uncategorized	\N	f	{}	e461753f8fa9dd88cda2c1ad577e4dbad116f4088db7a4132b0947ac7d7e7573	f	\N	\N
b1fecf50-4ec0-4e35-b0d2-6d58ce1bd245	2023-10-13	Target	21.19	Uncategorized	\N	f	{}	e4bf244539af811c0efc6bd54f0a58a066738fd5b317d3f6c5d9b6161651782c	f	\N	\N
dbe7edca-c3e0-4b21-bd57-adc172da8e5e	2023-11-24	Debit- XX 8678 Lifevac Llc XX-3822 NY	63.95	Uncategorized	\N	f	{}	fd6ecc2c5703414777a91af52d1bef35a58399cc9972f0340e696c08925e7f25	f	\N	\N
99035ac0-4dba-4bcd-a9f6-4e05f4aa5b4e	2023-11-26	Target	58.48	Uncategorized	\N	f	{}	b5b74b2d90269756af77e42b4a12e27918e455bea25f0883002ed1e0e165b812	f	\N	\N
d6c1a508-7ad4-4595-b72f-7298d8de8f11	2023-11-22	Debit- XX 8678 Payne Christmas Tr Elkridge MD	47.65	Uncategorized	\N	f	{}	10698e2de8f9bf99dc1b1887e8cedf386e72968e2ab03bc8c18b84a28da9cf02	f	\N	\N
5a1ea8eb-512d-4783-9103-41340120e589	2023-11-24	Sunoco	36.25	Uncategorized	\N	f	{}	392e36bef52881fa1b440b85c5d67ad28dd1ff16e83fdee6b7d81c39de84a841	f	\N	\N
367264e5-09e2-4bb8-bc4c-6ae84605b879	2023-11-25	Whole Foods Market	35.84	Uncategorized	\N	f	{}	59968614af88b75baf6457a886aadd727d730ad12d76fc0b561ef18b0a3a7c08	f	\N	\N
4b84755c-57d8-4aaa-afb1-d7f3a2d2e4e9	2023-11-24	Rise Up Coffee	20.00	Uncategorized	\N	f	{}	2f6b61eb52a5408a73a9adf69415e3afbc4b6446790738d76ab060b88e45d6ed	f	\N	\N
fa677d7a-ca23-4472-a0e5-cb9c85d60869	2023-11-21	Debit- XX 6114 Umb Plaza Garage Baltimore MD	9.00	Uncategorized	\N	f	{}	92069d5135f116763e2753119f377a8b66fa9e356a853925d5a890f8e6a90a7f	f	\N	\N
9a9475a1-33f7-4182-94fb-9f14822df190	2023-11-23	Starbucks	5.99	Uncategorized	\N	f	{}	f1002862db9a35390a6b235d28a917512f3143b0d1a6376bb71c00d86e7bbc27	f	\N	\N
fae343c0-c63d-441a-b94d-19d232b07806	2023-11-26	Target	5.00	Uncategorized	\N	f	{}	594bd3da5c85d3b4ffb20de3363d474920b8fa509e62e730094b7f006fc13b39	f	\N	\N
19ad73b1-aed7-40d4-bab9-530814cdad71	2023-11-24	Best Egg Loan	537.47	Uncategorized	\N	f	{}	efd83ea64aca7a2788997a103d0888d3500a7663233e80828359b3a7fbea0c1a	f	\N	\N
5baaa40c-88df-448e-860e-7d2658c4d0bb	2023-11-24	Venmo Transfer	40.00	Uncategorized	\N	f	{}	bfc83c8f0b3f68ae75a0daf1f21754005698e15b60af2080ce265ba07b4c2746	f	\N	\N
2ab53794-89a4-4214-aa43-56a9e7da3351	2023-11-22	The Womb Room	347.50	Uncategorized	\N	f	{}	28937df805f785bed481bc692e2242dadd318f01e08dd491ad811bdaebaf2aa6	f	\N	\N
4ccc42da-5ab5-4cc3-bbfd-ca33bbf46b5d	2023-11-23	Debit- XX 8678 Sp Bombas Httpsbombas.c NY	190.07	Uncategorized	\N	f	{}	df9af6a2af36b832b5a7f09c7d4a20c57ae1ea490a8d1d48e1a5ae031d23a8f1	f	\N	\N
ff0fa5fd-86f2-468f-b6df-9bf39dd0b9e0	2023-11-21	Famous Dave's	175.58	Uncategorized	\N	f	{}	5c6a2c7b1f8b5706f0edd3c7db5b67e0c92cd4797c03a3bc8297499cd03a3441	f	\N	\N
8f26ee17-fa7f-4cac-aa1b-7ff7f937e2c6	2023-11-23	Victoria's Secret	78.44	Uncategorized	\N	f	{}	2d88d45643d24ff4d28c4de69de30a9ff90e7f18278e49d193834b0a00670ffb	f	\N	\N
19787a8d-f3aa-4689-a937-d72a80fed5e9	2023-11-22	Franks Pizza	33.69	Uncategorized	\N	f	{}	6e61da74487ffa8102274283d3764f4453215678f427f5e94b6d175996381349	f	\N	\N
2d598682-9ca9-44ca-8510-5eb4a611b1aa	2023-11-24	ACH Debit - Claudaya Hood Be	300.00	Uncategorized	\N	f	{}	6962bd3c79109ce9773110a0ccef7804316cd11e11792b5e80451ce532d6a9c1	f	\N	\N
7f8b1dc3-7960-49ab-9e15-0e7dd512d720	2023-11-21	Transfer	127.20	Uncategorized	\N	f	{}	13ac48b63b601f6640c9e5144ad1dfa767e38572cbd0607b03c668b109d7f8ca	f	\N	\N
a25784df-84b5-41d8-8604-a937e40d7808	2023-11-21	Debit- XX 6114 Umms Parking Baltimore MD	37.50	Uncategorized	\N	f	{}	24f21444c5925b493868da3cb3725c105d6a4e7456b24d67ab52409419ee7d40	f	\N	\N
fcd29423-747b-4b02-962a-551599455d82	2023-11-20	McDonald's	14.05	Uncategorized	\N	f	{}	82a91861ae11839211b544a71243a5ca413706435ea96e83293ffe8ed3145ee9	f	\N	\N
3157f9d3-be54-44f2-ac4f-9f4fb5eb0840	2023-11-21	Target	11.18	Uncategorized	\N	f	{}	b45aebcb53ff5b2418bad1f693e493d4215aad05d439da4e7f91b8a8fe0a273a	f	\N	\N
bba69fed-19fc-4b05-a04c-1f5e12aa33b7	2023-11-19	Debit- XX 6114 Umb Plaza Garage Baltimore MD	9.00	Uncategorized	\N	f	{}	928bf6c96c7cc8ebd18514203b8eba917ad4975adb2b6b292a68983241860f7d	f	\N	\N
be7e330f-6936-4323-8b77-ae723e1bc0d3	2023-11-21	ATM Rebate	-8.50	Uncategorized	\N	f	{}	54a766d53239d43270134d6cb7f9cc77226e36e3a28ba7f38e3c53a5d619638b	f	\N	\N
8ee9d6df-75ed-46b6-bc61-e7bb5ac61e69	2023-11-21	Venmo Transfer	100.00	Uncategorized	\N	f	{}	8f62e1e963c03000fa3d35255640aa4ac0760f14059b8709454798aa8268d701	f	\N	\N
fa0ef55d-78eb-487a-9118-43b63682be3e	2023-11-20	Target	127.19	Uncategorized	\N	f	{}	d7929b1816a333a23cf16450ef326d974c07fa195adcbdc2a84cd758401bc54e	f	\N	\N
975125ec-b030-46a7-aead-00300e6dc616	2023-11-20	A.l.e.x	80.78	Uncategorized	\N	f	{}	6661c989fd5af07d333ab551ac3e0c305f32449f0e71806f28fcb9dedb63923c	f	\N	\N
be83bff2-30c6-4f11-b5ad-4748ef013037	2023-11-18	Debit- XX 6114 Umb Plaza Garage Baltimore MD	27.00	Uncategorized	\N	f	{}	85ff9c5f1ca6f5db2d0a454fef2d3dafb440cd7ea3abf3dfeea030d6457e67eb	f	\N	\N
8ea17030-d4cc-4b03-b1c5-d5fb2af63c0c	2023-11-20	The Great Cookie	18.38	Uncategorized	\N	f	{}	311561ff78bf9e2098f06426012520c14c51dce2ad711fe2bb7e81327bfb7a1c	f	\N	\N
ad6eb331-c055-4745-9767-5f123509b7f4	2023-11-20	Target	11.09	Uncategorized	\N	f	{}	37d9ada5e795dbf1465d590bbbc45e657bdb37edcaaa42ab6b13a816fb438bb6	f	\N	\N
a0a7a9bd-26b4-4d3b-be69-941362e67d1d	2023-11-18	Debit- XX 6114 Umb Plaza Garage Baltimore MD	8.00	Uncategorized	\N	f	{}	2644f3e73835754527ce504bdd074b60593f6cff4e9a56a0305f7a3b52ec6d93	f	\N	\N
8d1d3e1d-2a4a-4d29-bff5-61d4b859c5ad	2023-11-19	Starbucks	5.78	Uncategorized	\N	f	{}	3a4e06c2d746b7172e78b72452cac7110470ecd101d1dd30a9556807199f948d	f	\N	\N
0e13d2c6-1bac-4e15-978d-efe432b2bc8a	2023-11-19	Mamma's Pizza	3.73	Uncategorized	\N	f	{}	fadc81c27ae67ab6ece42f53358a2027f8b9bcbe0b8d30896135038e52713798	f	\N	\N
5fc4ec1f-acb6-40de-b985-70f5ebcf9b53	2023-11-21	Transfer	-3500.00	Uncategorized	\N	f	{}	c10d3df33519f3a0cc70c97562fbb98bfec4d67ed211fb60572332a07de53556	f	\N	\N
613fe6e2-0176-4e97-b786-460d7eef3316	2023-11-20	Venmo Transfer	35.00	Uncategorized	\N	f	{}	7e982b392d5b3f6c68505ca0588e57a73e6a5b5fbc40f2045aa4b8ec8f19537a	f	\N	\N
c6eef340-5ead-4b59-b854-8634bc3280d1	2023-11-19	Target	69.91	Uncategorized	\N	f	{}	f9752f8a7d8d7b09926c699f2d11b7e711bce70eebb86f5dfd3b02b37bdca1ec	f	\N	\N
5eb60e82-cd2e-445b-b521-5c689017ebc6	2023-11-19	Apple	7.99	Uncategorized	\N	f	{}	2bc75eeadb013ba64c6ce638c9852dc4700b8d81f9dcebe3676a83c35168cf3d	f	\N	\N
82d9f012-3705-4d99-88d2-04a29afd4f95	2023-11-19	Target	6.04	Uncategorized	\N	f	{}	0e330a87572c145c6224a2cc4cecaaf7dffe9d7e2312a85f5ad6a7e04e1987b9	f	\N	\N
7c44c907-7c31-4f57-a5b2-d38c23c6613b	2023-11-17	Discover Bank Credit Card Payment	288.19	Uncategorized	\N	f	{}	91aaa8d9700feeecec8d682bfcc6f61586703592b4d6da8771ae111f7736882d	f	\N	\N
1640c764-847e-4c12-8afd-6c5a53fd100c	2023-11-17	Chase Credit Card Payment	100.00	Uncategorized	\N	f	{}	9f7f605cb5b7ed241715ca00b25b26fb64ef9472fd1fbc6f4625e9792b42fd5f	f	\N	\N
cf4b2c7b-daf6-4728-a1f5-c6a3499176bb	2023-11-17	Zelle Transfer	50.00	Uncategorized	\N	f	{}	64f1fdb5d0dcbd06f479101514d45d6fbd8de4f15522d7a987b76e91b5b0513f	f	\N	\N
aa45f0e2-be34-4c5c-b4b1-800ea56eff11	2023-11-16	Toyota	900.00	Uncategorized	\N	f	{}	4818433fa14efa68932aee7f235f2587a463061bfc42514931a9742eb98a16e8	f	\N	\N
6f0a425b-8350-4c83-9e45-47183939ee4c	2023-11-16	Credit Card Payment	500.00	Uncategorized	\N	f	{}	9cb1806a278d584169b495a2ecc3c070bd8c2bf90cb47207913ba16d207e6f30	f	\N	\N
99b7099f-8b84-4bfb-9f66-99921e8c7dab	2023-11-15	ATM/Cash Withdrawal	158.50	Uncategorized	\N	f	{}	32c0b2c4845b9b6b3ac8f172cbae31a4593f6a278b59412caaa55bd2b41559a7	f	\N	\N
2ecb0468-cdc5-4438-b83b-8c29f46393ea	2023-11-15	Other Charges/Fees	1.00	Uncategorized	\N	f	{}	6caad0d6c2382ba4426a49b3db5bc393282aa2223113220abf48b1ed36296487	f	\N	\N
50a6258e-a753-4336-8008-3d474e28390e	2023-11-14	Kindred Bravely	167.70	Uncategorized	\N	f	{}	9a99e09d0df1734356f7f34e8a65e3aa178bff0b1fac8d28a8099a9b8820fd77	f	\N	\N
b9e35a95-54d0-420c-b9ee-0b99aa6b25d7	2023-11-13	Debit- XX 8678 Di Pasquales Marke Baltimore MD	8.48	Uncategorized	\N	f	{}	98c02715f5b7a48e429915423657c545856c460464ff28c9efb21834a1ee67f8	f	\N	\N
daf4d60d-609a-4144-a119-ab85354cac20	2023-11-14	Best Egg Loan	1338.03	Uncategorized	\N	f	{}	1fabc3b5251b51df8268f29333521538b806821ff6058abeef1664d67ff04d37	f	\N	\N
b9557dc4-8fa6-49b3-9fb2-efbbc90f4529	2023-11-14	Synchrony Bank Credit Card Payment	300.00	Uncategorized	\N	f	{}	5229444633f9ec6eaf21a28eeaab52dd0e51eb0a458e68cecce83732a74bdec2	f	\N	\N
8b206e36-e69b-4eaa-a675-76cb7beab5d7	2023-11-14	Verizon	79.99	Uncategorized	\N	f	{}	b07874f83416801ae0eec3ed3ca9ec4ce7b7671716c4a4a0902343dd014de92d	f	\N	\N
ed5d5290-95e7-4218-9de2-5e88ecfae330	2023-11-14	Venmo Transfer	15.00	Uncategorized	\N	f	{}	950e400333ad7755d1d4e7e1bebf5314c7345aefee0724b2faad27f572a74783	f	\N	\N
37ee819c-b50a-41f5-adf5-e776f1df2fd1	2023-11-13	LA Fitness	49.00	Uncategorized	\N	f	{}	dc0ab6abcdad6e7e6bb0ecc4bc99f508958d8d5a65d1ce082d0655a1e9adb52d	f	\N	\N
526434c7-03d8-492c-9f79-73a24e9d693a	2023-11-13	Sephora	21.25	Uncategorized	\N	f	{}	637ab731f8c26af4a77a146ca8f4f530a8bb6086391ae621944846c1fbb123f5	f	\N	\N
91a6fb5b-ae84-4faa-bda4-36ca0817b9bc	2023-11-14	Microsoft Deposit	-5160.17	Uncategorized	\N	f	{}	bbe787db435cde702d813f528040f9e951e6344a79bf9ab8e113b93e7f682059	f	\N	\N
42de6f6a-f682-4a9b-986b-b00ac6588667	2023-11-14	Adjustment - Cr Venmo*stephan Ryan New York City NY US	-98.25	Uncategorized	\N	f	{}	98da5a43aec16790cc153758079af5979ecb24e765b933e45e403af23df3ca91	f	\N	\N
c5236381-29c9-4837-a40a-1a6184082c51	2023-11-12	Transfer	100.00	Uncategorized	\N	f	{}	b5878d0497ecb45e5f307fa79d5c819910b8378a1ddf79ab7ec5f943d4e3abae	f	\N	\N
96729073-dcf3-474c-8461-6b8e4db90bd6	2023-11-11	Janie and Jack	58.33	Uncategorized	\N	f	{}	cc8e6f234c69f24a00fdebc6bb54f9735c6fe0e9dbff090f35cc734919e8f1ad	f	\N	\N
4029ecb7-2536-45f2-9c51-174f73c7053a	2023-11-12	Chipotle Mexican Grill	30.00	Uncategorized	\N	f	{}	52689fb78f2b6c2e5490e46fd432024512606678c811e8624f4e40bbc47b97cf	f	\N	\N
e0f0ff2e-01fe-45f2-9bcb-a68bb5853ecb	2023-11-10	Giant Food	26.95	Uncategorized	\N	f	{}	c39e9a2d6ad6042a88ef631911588f8dd006f7e0252586b2d7cbe45721f7ca6f	f	\N	\N
67dcfb6c-dd00-4c38-8459-849778ddb73e	2023-11-10	Target	26.69	Uncategorized	\N	f	{}	c4dd67554f04d13d52f0cdd20c0682aabf29f44e240aee56b45fd420a8331337	f	\N	\N
212f45c8-e2ce-40a2-a992-8d76fadae66d	2023-11-10	Target	15.78	Uncategorized	\N	f	{}	231dd23d9110fd21e999e632cbb8594d0cafe0271e66ac760ff746586c02e828	f	\N	\N
21496303-1a53-40e7-9bb7-8baadef6b4c4	2023-11-09	Debit- XX 6114 Umb Plaza Garage Baltimore MD	9.00	Uncategorized	\N	f	{}	9862718c82fabeeff49c13b7ceb516bb84c7348191ead8df626231486679b709	f	\N	\N
35335255-4215-4fd2-84d5-e3d695fc99c4	2023-11-09	Starbucks	7.84	Uncategorized	\N	f	{}	b775331620074c71a4d29bee35c92ec28f3b903181328375ace0042e35e9d5e9	f	\N	\N
222e6188-23ab-4c1c-a108-df6f65dc5ab8	2023-11-09	Starbucks	5.57	Uncategorized	\N	f	{}	a9b7fac01c7c35ff5dbe1f4225259fc55b818510a7123567c76396de09588475	f	\N	\N
8f11f315-6b2a-459c-887a-846a26e55aad	2023-11-12	ATM/Cash Withdrawal	63.00	Uncategorized	\N	f	{}	4216d95f649a805ca1c38cac804868acf14c4f67a6937e1f3ba5fb0212c75b66	f	\N	\N
2e874e8e-7825-433e-8cba-b824b34a7414	2023-11-12	Other Charges/Fees	1.00	Uncategorized	\N	f	{}	845daba92be4f9cbd995d432fdbf4466c27d37f95c8cb4a37093fa2a4af838f0	f	\N	\N
1d835815-cb5a-45d8-873d-c1f838352ff9	2023-11-09	Best Cleaners	24.00	Uncategorized	\N	f	{}	0e6fda80d2e7a4e1684cf17addfaba166ef409de479f3247d23fa40eba21f706	f	\N	\N
bcfa8817-bdc0-4d3f-a8e3-34eb9de6b77d	2023-11-09	Debit- XX0071 Cava Arundel Hanover MD	20.72	Uncategorized	\N	f	{}	3eb9a5e8c80c115a54a23349cd18883634be774b39264b6b71a1ef0f2f02f934	f	\N	\N
4e30bc28-5ddc-4974-9f0b-e4a0c2074745	2023-11-08	Cured	17.18	Uncategorized	\N	f	{}	a486cdc07e300040e5f0bf400215761be1c4237909fbf75710ed8ef613d46fc7	f	\N	\N
56af6a09-7043-4332-ac26-b801173ce4d4	2023-11-08	Starbucks	9.76	Uncategorized	\N	f	{}	028a89378a003fb83597f74aabe377be5075798c63fa6cf29c822513062dd649	f	\N	\N
b3ade0cf-f7cf-424b-a168-b5122205183f	2023-11-09	The Great Cookie	9.29	Uncategorized	\N	f	{}	cf6240fac6fa1343c82901cf53cec0b183dd886b3056f0e4097abd0245d99fd0	f	\N	\N
6f6739c1-009f-41a4-ac12-27bc635df005	2023-11-09	McDonald's	7.08	Uncategorized	\N	f	{}	1badbcb496ec8318378d0780a9e4aab9955267e33222f67db2412480835f9347	f	\N	\N
129cd0fa-79ff-4a0f-89ba-15be8cc769fe	2023-11-08	Starbucks	4.45	Uncategorized	\N	f	{}	9e8b4f504b84ed91652b29960fbb945113402bdcc1cfbf41074ba181bd3e4c40	f	\N	\N
749f834a-bb32-4724-8610-3bae219692e1	2023-11-07	Starbucks	10.29	Uncategorized	\N	f	{}	c492dfafe011154e3ecc86b173bdc94dc33904f6beeb7f533d4d4270e6f4067b	f	\N	\N
54a5de73-ce96-408f-8884-91cd92be085c	2023-11-07	Starbucks	6.57	Uncategorized	\N	f	{}	4e23a9d69c44c8467fcaa74e62e5763a56e11a538494ce938d8edb3727f5ec42	f	\N	\N
74b4563d-f88b-48d2-9670-211faa165c01	2023-11-07	Debit- XX 8678 Sp Lovealllittleon Httpswww.meet NY	270.30	Uncategorized	\N	f	{}	afe08c1d7ae54731c91bd88d4e93b7d81b2630fd54d8b0b406f4b8a8c4b0f0a7	f	\N	\N
2ba1ab98-fb75-4bdf-ad57-72f3592a5f91	2023-11-07	Debit- XX 6114 Mali Thai Glen Burnie MD	31.51	Uncategorized	\N	f	{}	eb67f5e8daf7550ebb041baac53606e9c5584134a67e22b6f51c3c4a90e22f25	f	\N	\N
44e95663-8cc8-44ec-ba9d-aed44d73ee5b	2023-11-07	McDonald's	2.64	Uncategorized	\N	f	{}	934426b0507f46d270a250880e5f1e4dba5f781e76194bb586b08e85d5bf5c1f	f	\N	\N
923877fb-93e8-43ab-8364-f904035fe06f	2023-11-07	TGI Friday's	34.22	Uncategorized	\N	f	{}	63ee6e7d1bf48332216bb96563948c614dfecbc8663723ca06d8bb4c5cffcbf0	f	\N	\N
31008aa9-a364-460f-aabf-773610b802bc	2023-11-06	Chase Credit Card Payment	2228.51	Uncategorized	\N	f	{}	18d43b2068b689e990abda56862db0d468c4cc3cd22375a93c3b416711a9876e	f	\N	\N
2f1b3501-6be2-4df0-a453-e0f6689968e8	2023-11-06	Lowe's	300.00	Uncategorized	\N	f	{}	70d8eb38b8bc76761b19c147da0768109f5df243d9478609eaabadae64ef0d8c	f	\N	\N
526c9152-9525-4b06-9f07-83c8d540c972	2023-11-06	Credit Card Payment	750.00	Uncategorized	\N	f	{}	7130b3e7b5527ac4894635b6afc1cdc26060ed083244c1168a75c1bb8d364e4b	f	\N	\N
f71d7a33-4530-41e3-a556-bff44cfe8488	2023-11-03	PayPal Transfer	225.43	Uncategorized	\N	f	{}	5ae8e3d8af556aeb157ed4349df4abdfa45ed1bccb50016afc822d97a5b7c34e	f	\N	\N
bfbd4533-865f-493c-8651-c159dd5ff81b	2023-11-03	AT&T	195.61	Uncategorized	\N	f	{}	8246a7ed12233fd98b0ef70f9cdcfde6a8c118302aab6fd206ef6cf04dc18f6a	f	\N	\N
1c7ddf0d-3779-48ac-b8ce-1edf78e97b69	2023-11-04	Harris Teeter	58.06	Uncategorized	\N	f	{}	4649150ae3a3f04b1ec379cf34cd872b5c548e12ed88ec8685de1e9cf2b810ac	f	\N	\N
32ad4545-b728-4e88-b7f9-040e8a487ff9	2023-11-03	Debit- XX 8678 Sq *diablo Doughnu Nottingham MD	39.79	Uncategorized	\N	f	{}	2206eaa86330ae5b96c1900da2e147033e35fe3ff777e3a4ecb7a43fca651a4a	f	\N	\N
ba066cf6-de42-479d-9a67-aaa9f8e4c479	2023-11-03	Five Guys	39.60	Uncategorized	\N	f	{}	f4c09c13230bd1484be1250594b2bdbac7408b0bbaf62f0824c0f66309fcfbd4	f	\N	\N
1761dfea-d453-44ce-a69b-e2cd72a0585f	2023-11-02	Debit- XX 8678 Tst* The Olive Tre Glen Burnie MD	37.00	Uncategorized	\N	f	{}	1f3e9cc84cf1f80e40fc3f9239c0fac09aeed1cf8fa3532f942e7109df790085	f	\N	\N
9fabd495-68a6-4d00-884e-2cf7a97b9f92	2023-11-05	la buena empa	36.03	Uncategorized	\N	f	{}	938696fdc6c0b1a73e6fdbb3708e5e293a08de118f05ecc3c1d47d6748ce94d5	f	\N	\N
85eeb689-2cbf-484f-ba9d-a6c77973eeef	2023-11-04	Cold Stone Creamery	22.10	Uncategorized	\N	f	{}	cfadb02b5e12be10634e8ee516b45090498daa71e15c159cf3d80ab50b263791	f	\N	\N
f11ef2bf-e305-45fa-aa35-a9a4952be542	2023-11-05	Giant Food	16.67	Uncategorized	\N	f	{}	0b5a933e88f7065db53e634528ac21de0e075c78fdb6708b86ceda48e87f0f74	f	\N	\N
30ca6ace-7b69-4d63-89b5-038182fd24e7	2023-11-04	The Creamery	14.95	Uncategorized	\N	f	{}	619733b0094f856c158510f7ea665e0e916ed9c520f70d831b8d11617e2241c8	f	\N	\N
569b13e3-efc8-4046-95b1-c964f6c8c28a	2023-11-02	Starbucks	11.29	Uncategorized	\N	f	{}	7f65a939423c5c107274fa8a135a63819df83221d0363fc29cf52c5f67bfeea1	f	\N	\N
8fa25ccb-a0d4-4f60-8d97-1cde3824f2fd	2023-11-04	Tax Payment	10.95	Uncategorized	\N	f	{}	1bd82a2ef428227b56930c70e221b6f5af4908e36bb874a9a7d83ec93205c279	f	\N	\N
91a076b0-7aaa-46f2-9179-87159f53ddc9	2023-11-01	Debit- XX 6114 Umb Plaza Garage Baltimore MD	9.00	Uncategorized	\N	f	{}	8bb2b3a92306094a1ce15a5c0125e1f5402e63b5aa2bc4f5c86179a51af307bd	f	\N	\N
f677604b-7971-45fe-b24b-01c0603473bd	2023-11-03	McDonald's	7.67	Uncategorized	\N	f	{}	f340b5d6b8ae1749961f3af34fa07515f24f425694220c489b2a109a5ad312d5	f	\N	\N
6cd1216c-3d5d-45f4-a303-00a0f9c305af	2023-11-03	Debit- XX 8678 Sq *diablo Doughnu Nottingham MD	7.42	Uncategorized	\N	f	{}	afaece92f2a84675b9359933d9143f674dc7011b9ac8af980fc24be10285505d	f	\N	\N
091c0f9c-bba1-449b-aae2-df5c7eee708a	2023-11-03	Starbucks	7.10	Uncategorized	\N	f	{}	db16c66485f0cfcbb1215a6899c88be4f9d286981a05b767afec3a88554ca0b6	f	\N	\N
9c415a61-98ba-4317-887b-e8e8fc772614	2023-11-05	Giant Food	4.18	Uncategorized	\N	f	{}	8b89eca80dab86c406cb0038a0ea5a45c0e587bc986523aa3a646852c0bf571e	f	\N	\N
723a0d93-6818-4798-aa2c-a0eb22778a72	2023-11-03	JPMorgan Transfer	1957.35	Uncategorized	\N	f	{}	c5603ecf724474d4291dc84758192861fb3986067ea4d9e7e3b93d58aa4eb6f2	f	\N	\N
fb7ad3ea-e92e-4484-9c91-15fff93a4b69	2023-11-03	New York Life Insurance Payment	616.54	Uncategorized	\N	f	{}	f5bc7630379e61565be42ac98b6678535bea7e012dc5ad21178caf7a1413fdd5	f	\N	\N
d7af83f3-4108-4170-be05-46d0824adc4d	2023-11-02	Target	158.99	Uncategorized	\N	f	{}	03786a41eed85e4971287ffc72bb49b4b067d023a1416f2dd24d495db503a31c	f	\N	\N
bdcf1267-15d3-4e5b-9d7b-b4f5e389214f	2023-11-02	Lowe's	113.21	Uncategorized	\N	f	{}	c45fba4fc19a885e4b4919296beccabeb370b4b91bc75d293e5f0ab67fdc1310	f	\N	\N
d8df8286-a3de-4f5c-8789-0ac0e4463657	2023-10-31	eBay	90.05	Uncategorized	\N	f	{}	d70a91c133abc3ad34a45bcd6cc74455d21d686bd4781fc451b50fc9b796853a	f	\N	\N
c2c04823-adc7-45fd-9255-0fb1a3b0bf8b	2023-11-02	Michaels	16.84	Uncategorized	\N	f	{}	2c1eb8344a6e282041aefc0e7dd68c0c301e4ac6d8e7275bcc5433d67227d0b5	f	\N	\N
ed04550d-8ba9-4e13-a6fc-5abcee57b9ee	2023-11-02	Edible Arrangements	10.59	Uncategorized	\N	f	{}	2249736da7343490f10ba0dd717955e5a0f25eca94b8a3951e2f95bc2e075920	f	\N	\N
87ec6404-5d00-468c-87b4-2eab077c84a3	2023-11-02	Best Egg Loan	537.47	Uncategorized	\N	f	{}	7c8bc4c9cbcc12fd94f25b2a973449533c7e4ce74486b30cd182b980444f177a	f	\N	\N
d5da5417-2b27-46b4-b8e1-2cfec6874e19	2023-11-01	Target	28.57	Uncategorized	\N	f	{}	728b745f23bd458784982c1eb16c6dbb67590a04680402db069b42c70b83540d	f	\N	\N
485e1910-ed4c-4f31-a550-a96118df56da	2023-11-01	Ledo Pizza	26.79	Uncategorized	\N	f	{}	f5915bf14ad43435651e33e024ff5a101bc26473a223a6dea1d61b3195a25a4c	f	\N	\N
b0c5a30a-cd52-4787-89e6-cdaccc0eeb0c	2023-10-31	Debit- XX 8678 Seoul Blues Annapolis MD	12.19	Uncategorized	\N	f	{}	9db583d77e2525de56816f865a08d75033418091aa27b5aa3e05d31f66e6a14b	f	\N	\N
a8b8418f-0ade-4271-9f6a-13a43bef89cd	2023-11-01	Rise Up Coffee	10.01	Uncategorized	\N	f	{}	aae3e5f1d6073f0f800af83eb603d176028646fc6dbac4038c311fdf846bbc3d	f	\N	\N
8a18be1a-f03b-45ea-814d-dded500de345	2023-11-01	McDonald's	5.28	Uncategorized	\N	f	{}	d4a3b679ac406ad9043a07c71d8a3bb13f9e5b9c217b3b45aa42f0f9fabe87a1	f	\N	\N
aaec3b32-77f8-4f50-a79a-8ab29d8cd014	2023-11-01	Pos Debit-    6114 6114 In *the Perfect Fi Glen Burnie MD	5.11	Uncategorized	\N	f	{}	f9d3b69c361b84a8a26ac250271b8e736cfb9b02356746b08e6d651e96c23117	f	\N	\N
399faa97-257b-4ce2-9402-577db3c01cd0	2023-11-01	Apple	2.49	Uncategorized	\N	f	{}	ccd63fcac636f51b14fc601049067e0a776ae13c1d68b54e614fecb06dbb349a	f	\N	\N
6d002941-0b66-493c-91e1-5bd8020a297f	2023-11-02	Zelle Transfer	-158.00	Uncategorized	\N	f	{}	570ace868a53e5c36ffb7fe3091e78df0d3e0b9192bb99017166c7f5b68733ee	f	\N	\N
d45376e7-a410-4027-a8f6-549193a4bf66	2023-11-01	Apple Card Credit Card Payment	500.00	Uncategorized	\N	f	{}	ea62785ff1e6fafab522f0fe4f7dbd68bca2e380057a78d2a8b60d5ddd6870c8	f	\N	\N
8d4169d5-1076-4c64-b9b5-c44dbb33b8e1	2023-11-01	Venmo Transfer	175.00	Uncategorized	\N	f	{}	0439c0544e8f6b5e88b880a1768a200e88961d54a44ad21f5cc00c52f8a21eb9	f	\N	\N
a556b37e-eb18-4e3c-9c28-c851a39a4c87	2023-10-31	Babylist	263.56	Uncategorized	\N	f	{}	4bfdc37a02ce96d77eacefe039edb13153932f2513fcd6273e3957f65278a360	f	\N	\N
7b80d0cd-cb93-4e4b-a0a5-fb59a208a8c7	2023-10-31	Target	58.47	Uncategorized	\N	f	{}	e7362cfb7c3b5d105cecd355216fef630a5e1dde04c2038eb30f6c4aac785b03	f	\N	\N
2c8ce4dd-a414-4c55-bbb6-a5943c87869f	2023-10-31	Michaels	53.60	Uncategorized	\N	f	{}	ff79e6d99844483f7d8fb9b9f7cfaf2893cc155d8e2613bc4d3116f77fdca196	f	\N	\N
6730fe4b-e3b1-45e9-a405-bc2d36a88c64	2023-10-31	Debit- XX 8678 Coopers Hawk Annap Annapolis MD	32.85	Uncategorized	\N	f	{}	a2f3cb92d1fbe5b0ce0613cba8530b7bb2b55083a7a6ddb81dea32b99cd611af	f	\N	\N
d5e53973-9a15-484b-9e0c-9c83e00e8e05	2023-10-31	Apple	15.88	Uncategorized	\N	f	{}	da65d9ff9edcc1f3aa85157cf8cab95a70d033171b8eb193703752bc56ee1f00	f	\N	\N
fe66b82a-ed16-4ddf-a193-be731bc570db	2023-10-31	Target	10.00	Uncategorized	\N	f	{}	f2ade47597ca3c2729f39495e39a197edfe393568a8bf372eaeda7d1dedb2b10	f	\N	\N
8620ab50-1c23-4f64-82c8-6426db70f198	2023-11-01	ACH Debit - Claudaya Hood Be	500.00	Uncategorized	\N	f	{}	8aaefa67ef37fd0a8aad22a5be8558058f1c77a1e54d4722e988e1bba7b37db1	f	\N	\N
f53f023c-4f5c-4086-9a78-779a3bb20d38	2023-11-01	Zelle Transfer	-35.00	Uncategorized	\N	f	{}	f5cb6420e77092c2024263f45e72bfd6ebff59348f0c37ecc7163d4284b79a98	f	\N	\N
4f3ebe1c-2298-4927-9f79-8d2d144ee8dc	2023-10-31	Dividend	-0.79	Uncategorized	\N	f	{}	5a09f7b10964636d9aa072fc8970f2d538ffdd2df74b568db262ed63d18ae0ff	f	\N	\N
7862ec86-b64c-4a6b-9407-d952ae5d0777	2023-10-31	ACH Debit - Baltimore Gas An  Billpay 9100001	197.87	Uncategorized	\N	f	{}	32e2c96fd6402def7974dfcbb1b2da03ad9c5a19ef322fdde25ffac8087f32f4	f	\N	\N
26f9bfbb-010c-45ae-9768-407f65ddaac8	2023-10-30	Pos Debit-    6114 6114 La Fitness Severn Severn MD	104.98	Uncategorized	\N	f	{}	a4226d14598bba46318d48131c1390c1406c5a214d5e32714f412a8e9ac2607d	f	\N	\N
d2f93140-4f70-4498-85e2-3ab54bf3daef	2023-10-30	Pos Debit-    6114 6114 Target        0001 Glen Burnie MD	24.23	Uncategorized	\N	f	{}	3475e47dee1504d2647d1a44e075fe1ecb051c7cb241195ce976142c1ebb7d66	f	\N	\N
6f4104dc-d7d0-4c86-be4f-32908678a49d	2023-10-30	Pos Debit-    8678 8678 Sq *rise Up Coffee Annapolis MD	5.51	Uncategorized	\N	f	{}	cb24d68134b0b3ee67f9aff292d847e0398ff5039a1cb8ae4e74a8a4e8405836	f	\N	\N
9fa2641e-4bb3-46db-8a34-63f4cb9fc29b	2023-10-30	Deposit Microsoft Edipayment	-11567.17	Uncategorized	\N	f	{}	c82ca97ec03f5368b37dd2e03706386618cb7f7576ae25d59f00d531581d4eb9	f	\N	\N
e8ba6ce9-d3b9-4a37-b6bb-0d017da9667a	2023-10-27	Returned Check Charge	29.00	Uncategorized	\N	f	{}	a8d2d0b58a163f293e030139566ccf4ca870b171a6ebb62d91f1ed9204478f47	f	\N	\N
fa0f11b4-6bfa-4502-934f-d0d316ec33d5	2023-10-25	Returned Check Charge	29.00	Uncategorized	\N	f	{}	e44050024878bca98c0a39e854780680da36b38de0a885f281bc1c403fbdaa3b	f	\N	\N
10057167-c5ba-4748-bad4-75570461ba0f	2023-10-20	7-Eleven	1.06	Uncategorized	\N	f	{}	f34b7714a9d43c09f96022ab0cbd2b239dc4e27aad4634e8a58facc8df573c75	f	\N	\N
88d78479-3e4e-4910-9f96-8a99aaceef84	2023-10-20	ATM Rebate	-5.50	Uncategorized	\N	f	{}	3c5f6a639e52b11430df774a82295520cdd252f554b641cae2387dcd37ae923a	f	\N	\N
9a5620d8-5b51-4ddd-859e-9cb77d5cd6e4	2023-10-19	Apple Cash Transfer	530.00	Uncategorized	\N	f	{}	92cc6c6e7622d14b69ab37cc623376cf3b7e4d237411cb53ee6ce7702bc48b61	f	\N	\N
5d73e52d-c837-458c-92a2-4756666a31e7	2023-10-18	Qdoba Mexican Grill	13.41	Uncategorized	\N	f	{}	162ef9a62d7f28ceae68b7b22498fc149d3d26463630c746e7afd6b4cef7b393	f	\N	\N
4e3e1367-dfe4-4589-ab6b-fd731d84ab1d	2023-10-18	Debit- XX 8678 Seoul Blues Annapolis MD	7.58	Uncategorized	\N	f	{}	47ffa05757ea819698ea5efdc282db06d4df393125c84848073633e842f7ffd2	f	\N	\N
db7c033a-4fc0-43ca-979b-e7c862fe993f	2023-10-18	Parking Authority-baltimore	4.65	Uncategorized	\N	f	{}	85ed610999ddde9975ef6674276420f26aac127e5f1fd44afb5c19870fe485be	f	\N	\N
4b6acdc5-79ee-4586-a3e2-f0dc39a5c99f	2023-10-17	Safeway Fuel	38.55	Uncategorized	\N	f	{}	ef56026c2c093531948820ba8091e0d38fcfcc10168d07974c5626e0fa8dd6fc	f	\N	\N
c6e23008-557b-4134-aa01-1055a5c2e4a4	2023-10-18	McDonald's	9.93	Uncategorized	\N	f	{}	cc181a8615e9048ce038b7c221ef66834e00c56d6c6204c48e7e2a5722d60aa5	f	\N	\N
750ea202-bfff-4edd-a4e6-55048d6c968a	2023-10-18	Apple	7.99	Uncategorized	\N	f	{}	91b3926ac9e2a56c68faa0525d227f671f7d26e78415ac1a218e3e48c6a9cb91	f	\N	\N
0f97adf6-9d2e-4931-af4e-8e09764cb415	2023-10-18	Walmart	6.60	Uncategorized	\N	f	{}	107aa1879a86d4b98c0591c63ffe5f8871a02dc713492ced11fb066a0e858a51	f	\N	\N
a867a496-6e82-4feb-b3ba-402763b35eb0	2023-10-18	Giant Food	6.48	Uncategorized	\N	f	{}	8877d1c5edd01ef96f1fe5455b7a59caed4787b4685603e717c7ac05fcec0488	f	\N	\N
664dace2-6f54-4d79-a2a6-df2875dbd647	2023-10-17	Wendy's	5.71	Uncategorized	\N	f	{}	c582825a5bd2acffdc47ffc6f02288e7778f311364e7da96984fb5126857bbc2	f	\N	\N
ccd1ad67-3c3d-4095-9f2c-bf9fc7de8bb6	2023-10-19	Transfer	-600.00	Uncategorized	\N	f	{}	a22aa659f4919cfda2d38767bfca41f841c6fbc1d9a901cfbc40e0683afe25b9	f	\N	\N
6c90c3b9-dbbf-4ee1-a469-9d1b8c7b18af	2023-10-18	Capital One Credit Card Payment	300.00	Uncategorized	\N	f	{}	6aca125acfa86742009cecd4383080a6c8278edf089ec67f7703ab7946321572	f	\N	\N
26ee6faa-fc07-4208-81ce-f1e09015a17d	2023-10-18	Discover Bank Credit Card Payment	125.35	Uncategorized	\N	f	{}	02acccc81a0da0fc6044870fb6d58ef856f68af7226aca44e97c268fc520dc6b	f	\N	\N
d3a45864-f488-4b0b-a038-f6b7cc97e624	2023-10-17	Target	10.00	Uncategorized	\N	f	{}	070e2c0db18ef65941994dbc1f877fe60ce7166ecd2cbe6f51db79a879766f46	f	\N	\N
384da10a-1e08-4507-a1b2-e0b90440a050	2023-10-17	Toyota	900.00	Uncategorized	\N	f	{}	b76813cd9549bc3f3dd9beb8fa5d4a01cd376b23e3a1f0f3ef203906af95ff7c	f	\N	\N
dc6ac309-deb4-4e1c-b73c-2961d9da05b2	2023-10-17	Credit Card Payment	418.01	Uncategorized	\N	f	{}	d05292f5c1407f52b8d6aa9e83246659a169a29b59822bc64843d1a283db3f49	f	\N	\N
b57b85ba-4227-4c01-adf8-dd8b2812a540	2023-10-16	Therapy Llc	25.00	Uncategorized	\N	f	{}	42b398a5cc43e5121724bc4db5d7d429d08cfe6646923515a60eb3c4be85280e	f	\N	\N
96e76562-09ba-4d8e-bd51-3ef0648744cb	2023-10-16	McDonald's	8.76	Uncategorized	\N	f	{}	c275cc641e460fa49e869c4cfa93c7abf6cb10dcd499e673811dd7d3a4a4d4d8	f	\N	\N
53134f61-4d11-478f-b30e-daf9fe99445a	2023-10-16	Chili's	7.24	Uncategorized	\N	f	{}	22de321e5e361d29be1bb86474a2399eed9468192c6e1851b83ea100c63f8996	f	\N	\N
3332c12c-216f-48e9-9b18-6ea320cf4ed4	2023-10-16	JPMorgan Credit Card Payment	1957.35	Uncategorized	\N	f	{}	50ce3a69747abee9ad17139170833d2f65c78dfd7747c1e05873dc9a62959543	f	\N	\N
e05ceeb5-de73-4734-b73c-ed32e202bba9	2023-10-16	Best Egg Loan	1338.03	Uncategorized	\N	f	{}	b0dd000b054b560504a3150fe8cbaff7c4d582d90b391aba6570bc8c778db11c	f	\N	\N
dcd39ce1-4e88-454c-ad3e-f5adfb7a1915	2023-10-16	Chase Credit Card Payment	500.00	Uncategorized	\N	f	{}	1f0cc1faef679ce9da40adc04ba7003cba6e5c1c1b177f5416ca4c8b4d2f98d1	f	\N	\N
0ef02ecb-534b-4577-9bcc-5fd40cdf57ff	2023-10-16	Synchrony Bank Credit Card Payment	300.00	Uncategorized	\N	f	{}	3afb108128898a781c63f0d00630a4d85f9b585fd5e2b6457c1ec2eb0cbc935a	f	\N	\N
d8392a99-671a-4bb5-a392-df34e6e9d13b	2023-10-15	Sharps	91.74	Uncategorized	\N	f	{}	31378255fc8fc0a54dffcfea9aa2bfe1f2d276472755a0dfc5232dc4d7e0de03	f	\N	\N
3f65ffce-01d0-411c-8860-373e330f0e74	2023-10-12	Pos Debit-    6114 6114 Wee-sale Consignme Arnold MD	76.32	Uncategorized	\N	f	{}	4ddd49dd3a807fbe1de6414ccd70255cc8596df7c15aab43277e0ee67fbe46a2	f	\N	\N
299b09d3-6f6b-412a-b01f-775d759e49ef	2023-10-14	Blue Moon Cafe	58.51	Uncategorized	\N	f	{}	a688613059bb2861a2146f2938dfb06f0935d42fe771ee3ce956964481893241	f	\N	\N
1fa979e8-b448-4b69-91b8-175f2a64c89d	2023-10-12	Pos Debit-    6114 6114 Wee-sale Consignme Arnold MD	54.06	Uncategorized	\N	f	{}	7dbb6e8ffcf330400d5771836bf04decf95b28e23f82bc7223eca23d7d18be3f	f	\N	\N
94766aba-be5e-4850-b93c-93e1e8ff3ce4	2023-10-13	Sunoco	42.25	Uncategorized	\N	f	{}	ea73278968d34726b81cf2e7ddb7f19085a44f5b5dd4c2aad6df447e89d11fa0	f	\N	\N
87f94198-d600-41e1-8074-4997c825cad1	2023-10-15	Target	41.98	Uncategorized	\N	f	{}	5fa3b95f30ccf4ba15cfefa190ab3583219f09b17045c7dfcdad7b45fa1328ee	f	\N	\N
4d2aac90-01a7-4ac9-8169-24ee2a174a66	2023-10-13	Maria D's Sub Shop	38.00	Uncategorized	\N	f	{}	24a02d77313a0fe87f16c4a899c14132d07e640ac6569ac8e152ba6a724090ce	f	\N	\N
3bd73b1d-11c3-4a84-81bd-ac8166009829	2023-10-13	Crabby	29.00	Uncategorized	\N	f	{}	b8d84b36932452f22b37c2c739d6d1625fead413b38d6dbf4a8f2242e5c60d60	f	\N	\N
43163f51-6bd7-40f9-8668-4fc5f1fb3000	2023-10-14	Zeke's Coffee	21.60	Uncategorized	\N	f	{}	ed737d38866d17e60e385043a4251d46315cffc7484d141ea3aafed48d2c1fe8	f	\N	\N
8495e6ad-cf44-47f0-a3af-3872d69f7d8e	2023-10-15	Debit- XX 8678 Sq *jz Pizza Marriottsvill MD	20.00	Uncategorized	\N	f	{}	9210613c03aa90442a9ffbf404c87bc05218618f0cefa18cc9b60693d3db587a	f	\N	\N
420b7d88-97cf-47b0-9d9e-998a23be9904	2023-10-15	Sharps	15.41	Uncategorized	\N	f	{}	9fca585900ced96ec8b763ac4895a6ca61c134aefef05edc1c471b6d05222a0b	f	\N	\N
3d203f7f-3f0f-40ab-be2d-beeadebc20d0	2023-10-13	Debit- XX 6114 Sq *western Maryla Cumberland MD	12.54	Uncategorized	\N	f	{}	83ca64f07910cc8e2c6763027f5697b564de685d9c4e8cd0afd9b87b9b7f3867	f	\N	\N
5012cfa1-6f32-4741-8a12-2e67b49b6950	2023-10-15	McDonald's	10.88	Uncategorized	\N	f	{}	5ee86afa077e597c791b672b07de2e571ea2f4efa2799a5a7fe0b18539f5d873	f	\N	\N
6903b753-cdc9-4afc-aa6e-3be16b7a284d	2023-10-15	7-Eleven	9.73	Uncategorized	\N	f	{}	e27ff7a931011570a7388070314d3a0177750c253d72ee72cd770a73819a6e8b	f	\N	\N
aa03ab78-20c8-4637-9df0-f315d3b9c676	2023-10-13	Starbucks	9.49	Uncategorized	\N	f	{}	a94fefaef9c9c2c123f379118561e811ea258da0fca7748232f1bf5b5797df93	f	\N	\N
9f194d47-deaf-40d7-b8c3-e855617aa7ef	2023-10-14	Parking Authority-baltimore	2.00	Uncategorized	\N	f	{}	6905b85a94751f65f3065d870cc5d7d321fcdbf6930b522cdbe68e16446588a8	f	\N	\N
01b34462-d026-4f34-8c72-a8aba69295ba	2023-10-13	Adjustment - Cr Alcove Eve* (3 Of Gabrielle@ghi MD	-250.00	Uncategorized	\N	f	{}	81fe3ede6da009ff0bf7758318ce2dc69be2e2399d749aec8fc192edaacbc94a	f	\N	\N
b15d3d5e-3dd0-434a-afb4-7d3b41d26c4b	2023-10-12	Debit- XX 6114 Pti* Westernmaryla Www.peek.com UT	169.58	Uncategorized	\N	f	{}	3e2a1cec9b4e76ce22d337e4a4171f49a94151285df40efe2b1c9b02b6455028	f	\N	\N
f89a505c-36a6-47a5-b444-0edda2c7153e	2023-10-11	Checkers	22.86	Uncategorized	\N	f	{}	4ec4b190184465e85167c3ef2e5da98414c5534873dee64973f0d03a2409fdd3	f	\N	\N
c1f3a709-5691-4ce5-9555-77cfd3e1b690	2023-10-13	Walmart	21.29	Uncategorized	\N	f	{}	21a69ce0161e75f156c73e51bbb64aae7d13bfa5e726bb346548d26645b123f0	f	\N	\N
637b0472-0822-44ad-a08f-233d83d0685f	2023-10-13	Giant Food	17.99	Uncategorized	\N	f	{}	d7132f7f0b6e9768be9d1955e35cf60023d02d660331644930679a3a4d45a2f9	f	\N	\N
65a5d9d2-21d3-45b4-8b13-540d8f472b56	2023-10-12	Maria D's Sub Shop	15.78	Uncategorized	\N	f	{}	ec81e8c4ef54841543176c4c15fc8cf1f8f6d61875cd6b4dcbea12d46a55776c	f	\N	\N
c93bee8b-ebce-48ca-bbf8-2671b199c286	2023-10-12	Bruster's Ice Cream	6.18	Uncategorized	\N	f	{}	57b784ad446910ba4ffc2679b3f9d4680c4c455bc1b2113a6221821e55715a4b	f	\N	\N
cfd8d25a-6b12-4f85-8614-a6560afc941d	2023-10-12	McDonald's	4.75	Uncategorized	\N	f	{}	c3fe83ce1c94ad6ea54861171c11b8758048d787a66555e3df452e01c299efdb	f	\N	\N
e21ab698-2973-49a5-94f1-7f7f2cd4e1f3	2023-10-12	Verizon	79.99	Uncategorized	\N	f	{}	a89945d4afa966304dcd74e7110131c07a964dda700868064eb4e7eabf94b9b8	f	\N	\N
b66d82f8-6020-48d3-aaec-bb6ac0e4dea8	2023-10-11	Franks Pizza	25.00	Uncategorized	\N	f	{}	658910e6e90775bde5cc372af4efb8e10c1eb60c02b23d7fe24cfe6b42ac8a0f	f	\N	\N
522d2256-a6f6-4d15-8ddb-fe1b727011b4	2023-10-11	Royal Farms	3.17	Uncategorized	\N	f	{}	bcd17b8d9df968e0d1e678f3e41be66775719ba9e16a67f3d1e8409997ee37f4	f	\N	\N
6d26acb3-bbff-4f87-b795-01a4c4103ed2	2023-10-12	Microsoft Deposit	-5219.77	Uncategorized	\N	f	{}	5f19b21939dbc1310f70bbae4ea283f14e3ea0eeaed0308c5b936f63cd8e7a24	f	\N	\N
628d8834-d452-4321-bd94-4ade25061ec0	2023-10-09	Chick-fil-A	11.52	Uncategorized	\N	f	{}	f155e70560b0b2b2350c4037c589a5390eb10923c870e6c28bf5e6e356b9eba9	f	\N	\N
3dfefde7-05ec-4959-b1bb-11a98c470f93	2023-10-11	Returned Check Charge	29.00	Uncategorized	\N	f	{}	8e957e64308e79bd0ca85590c61fdbd4ef14552a538ab46ba5c89984ca0b1158	f	\N	\N
1c7e693a-1c4c-426b-b088-aa3bf27ea69d	2023-10-10	Target Refund	-39.21	Uncategorized	\N	f	{}	77464b9ee239ac52e9c1af0fa55fa1423d0ce101f657779d9d0f044d739ecd18	f	\N	\N
eba3b5a8-416a-4ce8-8735-71a38ae3e11f	2023-10-09	Once Upon A Child	62.00	Uncategorized	\N	f	{}	da7ec139562c6df0f97150964db2013583349a3b8ec654720be0e0e8e47cc65b	f	\N	\N
7a16328e-4fa3-4229-8b64-31a2b17d0fc3	2023-10-09	Target	41.85	Uncategorized	\N	f	{}	9d3fb437943b56285cd1ad4f5c82fd83d404aaa5685afa45007c85562c732f76	f	\N	\N
9ba15cf0-68e1-4977-b631-73bef56f203e	2023-10-08	Giant Food	38.02	Uncategorized	\N	f	{}	39c05af82c7720c8c93323d9a243f6a49e84fbab4c4c31893d27a13f08391bff	f	\N	\N
8677e05f-9825-431a-bc08-1e16e2140ec5	2023-10-06	European Wax Center	25.00	Uncategorized	\N	f	{}	19d6e0a31592a03b1f857a9e687640a73e9ebc0bc688cc30baa9ef2f3ed3fd3c	f	\N	\N
60fe26de-ecd6-413c-8fa1-f979b4e71efb	2023-10-07	Target	6.89	Uncategorized	\N	f	{}	aa01da7d1c09e835c12af4bf6c46f343c077c1ab732d88b02cc239d3842eb1b2	f	\N	\N
e7dc644b-a639-4343-8ad7-6d607c75137b	2023-10-07	Sam's Club	2.93	Uncategorized	\N	f	{}	b42c60777ecc8fdcbb0d29145abb354201cb4de253523e8e1a3de045ea8e77ca	f	\N	\N
adff5f5d-1e67-481a-8be3-64ab00707052	2023-10-06	Target Refund	-25.54	Uncategorized	\N	f	{}	75f47a1b03b5a4f2da0cbe6abd169c3dafe9f7a77e125ef400d59b067681ccfc	f	\N	\N
0b8e76cf-ba3a-4046-b5ae-e544623c6577	2023-10-06	Venmo Transfer	18.00	Uncategorized	\N	f	{}	441fec15591c38a4e606a0b64e19b0f631f3c9805c5fe50c49c4773899c6dcdf	f	\N	\N
b1480fb3-f22b-4511-80c9-91a182bd66b4	2023-10-06	Venmo Transfer	15.00	Uncategorized	\N	f	{}	d4ce6fdf943153b4675d8c9013749a91aa6ea3510046833d646c74d3ad77d5ba	f	\N	\N
ae54e497-8d85-4fee-9bc6-79c9340606f4	2023-10-06	Venmo Transfer	5.00	Uncategorized	\N	f	{}	110088a49246c16ca42b5d057dc4e5586e93d82329b1547983f29293f656b03c	f	\N	\N
b9a9cca1-9a1e-4963-8011-5df43c35c376	2023-10-05	LA Fitness	39.99	Uncategorized	\N	f	{}	2e7908a4fc249d856683cbcad865b01b4e1912a5d4cd67cc1c3b105d023bb992	f	\N	\N
feac43dc-6cd6-40ce-88f8-b5e3e35881c3	2023-10-03	Debit- XX 6114 Umb Plaza Garage Baltimore MD	12.00	Uncategorized	\N	f	{}	cfc74da290942b8d78ba9717b3a04e4ba555d59eae7bcef628b0f13ce1bff3b7	f	\N	\N
7a970428-c324-4c41-aeea-543539730d01	2023-10-05	Lowe's	100.00	Uncategorized	\N	f	{}	6f756ec50b622a90a13d1b784fa2ef676b1345f369a9b080ef30f8fffb38efd1	f	\N	\N
174ccde2-9dfe-4a26-b7c5-b10379b9b111	2023-10-04	Debit- XX 6114 Annearundelco-util XX-1144 MD	116.64	Uncategorized	\N	f	{}	04a33537647006dd38569da659d1e239f8919b8e824f3c772e905a6960d317b1	f	\N	\N
5819192a-3be6-412e-a4d8-4b0c422a8ddf	2023-10-04	Chipotle Mexican Grill	34.40	Uncategorized	\N	f	{}	b1b5c8d518aa1c394ab4508a7fa29d1eb83e413009aa744ddd9db64ec5ea4b01	f	\N	\N
e7a20ccd-4919-4e43-a8bd-64c34729d17b	2023-10-05	Deposit	-280.00	Uncategorized	\N	f	{}	9b9ab21268cdc81054ce0ad419a3426041317d3041d4ae5d1672251c9756f238	f	\N	\N
a54a010f-0821-4862-9bf6-de82a0e53693	2023-10-04	New York Life Insurance Payment	616.54	Uncategorized	\N	f	{}	fdcd1746a5137135ea8a17a25e1b48598cd8170e97270a38e064a10270d38a3c	f	\N	\N
28358e70-968c-4273-800a-7f1d24ab7197	2023-10-03	AT&T	195.18	Uncategorized	\N	f	{}	129f8635a28d55d6b28d291d09031b4e3768957ecd16961d6a921702fb97e65f	f	\N	\N
bdd4f871-4f83-4834-856e-4541f5ef8d81	2023-10-03	Target	80.86	Uncategorized	\N	f	{}	14b364c18f009dc41aaa8dc48e056340b404c8cc94982e8e9b5af1e337ea7d0c	f	\N	\N
a431f106-12bc-4ce9-963c-977df3486d14	2023-10-03	Target	34.99	Uncategorized	\N	f	{}	aa4799f0c638a66d3718e18eddbb2bbb5859f5dceb1d5ac1b97fe20756c77721	f	\N	\N
e234197d-b690-45a9-bae1-507bde432ccf	2023-10-03	Sams Bagels	16.40	Uncategorized	\N	f	{}	3111ca6f504b7b8e982e70fba1df265ff919bfbdf756501b328ed4c7582e93c4	f	\N	\N
9176c04d-c91f-4ebd-ab2f-acf1f026d092	2023-10-03	Subway	9.99	Uncategorized	\N	f	{}	e5037bb5c9ebe3bae5b2b37b81efee144fcc9a46a525f701ed3500c82986c18d	f	\N	\N
dde6665d-f5fd-42be-9b6d-3dae6a5c9938	2023-10-03	7-Eleven	8.55	Uncategorized	\N	f	{}	091f659d8aab6e46b7ee7e66880e73d1cc7bca05264cfb66050eabe22214b583	f	\N	\N
37142f47-e6be-451d-b175-ff51d24e2aa9	2023-10-03	The Great Cookie	6.63	Uncategorized	\N	f	{}	d85db4a491c12d2decf07d509634504d53b87a824308e8d025766a6b00ea652b	f	\N	\N
74c8efa7-ca5b-4076-9fbe-088e36686006	2023-10-03	Target	2.43	Uncategorized	\N	f	{}	45a82450f645ae61e9b5ca1eb0b97bd4a19612ae8aa3735801142fba6251adb5	f	\N	\N
c5e9f137-53f6-46eb-b377-fdd0a3e4b747	2023-10-01	Papermoon Diner	80.00	Uncategorized	\N	f	{}	7ffadf52509b38991271a0dc8deb437877100036837056dfc4346ea0d292b55e	f	\N	\N
d5150997-876f-489f-809a-df34b87ce44b	2023-10-02	Target	71.24	Uncategorized	\N	f	{}	9143a835b724618a051a2539c112233b08a27fa85c3a643034a1c801cfe236d6	f	\N	\N
4a78b520-4092-4216-a524-78e239307dde	2023-10-02	Target	23.45	Uncategorized	\N	f	{}	3925bab584b5a6e16f283e79458f3c4b56143f0684c3240a5b9c5e9256f87060	f	\N	\N
d124fcf2-ace6-4ff6-943e-dab7b05c71d1	2023-10-02	7-Eleven	12.80	Uncategorized	\N	f	{}	13ebc96fd41c231d7af7c51e4ad195d41faee540569d2f6f6e90e21194d51d64	f	\N	\N
854c4f56-b3af-4a55-9229-9c0cade8e0b1	2023-10-02	Giant Food	6.01	Uncategorized	\N	f	{}	ba0f15a96c28646b757ea0464c519c9d67491a54ad977f27866ade1bfeea3623	f	\N	\N
3d90b3b4-7f5e-48d4-890e-4cabfe582f4a	2023-10-02	McDonald's	4.86	Uncategorized	\N	f	{}	ae7ac1f2e63c0d63d538de2db46870ac1f9a341bd2855fe018fb34b376af49f0	f	\N	\N
dac9804c-d44a-4919-aabd-6d0e2c941a35	2023-10-02	Apple Card Credit Card Payment	275.00	Uncategorized	\N	f	{}	6f2012d4f66643f6c1da7015ea3ec1e070b9e8a4ac7fdef38f1a9356e208321d	f	\N	\N
def434e5-4d37-49aa-af4d-742591402eee	2023-10-02	Chase Credit Card Payment	193.50	Uncategorized	\N	f	{}	3e161c5323d8cb6deaec0364ab95fdd36cde759dcc50e6fa04ed0487919e3d5b	f	\N	\N
32bc674b-c752-45cb-9025-68b9442d069d	2023-10-02	Baltimore Gas and Electric Company Utilities Payment	182.50	Uncategorized	\N	f	{}	bce00a49293f9d54bacaf6daef793ba7188771763045a5d43cc0977ce51f6756	f	\N	\N
1eb2bb57-424c-4374-bd42-4a3f8cbfc8f7	2023-10-02	Venmo Transfer	30.00	Uncategorized	\N	f	{}	19d172c35001632c3c7d66027ebbbd3c6c8160e136632fc88bdcc78a3274ce3e	f	\N	\N
2e2f0f55-82a9-465b-a5f2-c5637ccd3dd0	2023-09-29	Debit- XX 8678 Fh* Bltchefshop Baltimorechef MD	184.00	Uncategorized	\N	f	{}	7c648cc1a19a98864784e8a85243c2b26cf6772d3cf162a1fd607f20efc17f51	f	\N	\N
3c33b515-2295-4c09-995f-555f9a58f573	2023-09-29	Target	124.61	Uncategorized	\N	f	{}	079745ca6c1eefa58e98f99bb3c4b81df2e4c2c92bf52baa87e310d23cb29c9e	f	\N	\N
bec4e5df-49f3-411a-90be-ae1936e7ce2c	2023-09-29	Debit- XX 6114 Sq *nick?s Barber Baltimore MD	105.58	Uncategorized	\N	f	{}	cf23c8085894c6d721f614672e081ef16d8ab28d26fac3e717e5fa72d4d87da0	f	\N	\N
d8e5c610-75cd-4c2f-ae00-22803a1e6cec	2023-09-30	Pos Debit-    8678 8678 Sq *bhd Extensions Glen Burnie MD	100.00	Uncategorized	\N	f	{}	6f621ea565756d773a74b9d354c7f87a825bfb66b4b32417e0cdacce608195cc	f	\N	\N
d39d105c-6618-4fd3-9a5c-48d81a5c48f4	2023-09-29	Metta Wellness Insurance Payment	79.75	Uncategorized	\N	f	{}	08b8ec6f15f51367c2cbe36cd57a8f2a4328697d6d552fedaba94bf9d219d4db	f	\N	\N
84c807e5-bab4-48ac-87fe-ccd90123fe6c	2023-09-30	Weis Markets	49.90	Uncategorized	\N	f	{}	187c9d7a6620675089182ecb62b7e5c4c6eb48968015d9824490cb15d439e229	f	\N	\N
ee0aa6a6-ceb9-4673-9155-ffb4a2bbd829	2023-09-30	Debit- XX 8678 Edible.com Atlanta GA	39.21	Uncategorized	\N	f	{}	d722c57c1b8e3546d8a1c94371fd17046aa41fec781606b02ab376deb84331e5	f	\N	\N
c86f1405-2cb5-4a0c-a662-80b23193a48c	2023-09-29	Sam's Club	30.35	Uncategorized	\N	f	{}	4cefca46240c5ed02d16a3fe40717df07efbe71354ef54fdbcb5ac1203c37d98	f	\N	\N
dd7c17af-58a4-47a2-9cdf-187de72a5143	2023-09-29	Fortune Cookie	25.86	Uncategorized	\N	f	{}	b9a14dd4e42ce8846d8639f77dcbe1ecac9a3757e3243404a1cb5191928695f1	f	\N	\N
949fa2a0-bc43-459c-aa5c-b6a4267c4438	2023-09-30	Target	20.00	Uncategorized	\N	f	{}	1f6f10734017376a7fbef70198095862eea1c052fe32326795ddd9bd537152c5	f	\N	\N
1732f561-aed2-4a9a-92e3-1cc016e0e888	2023-10-01	Fortune Cookie	19.56	Uncategorized	\N	f	{}	ef10a1f644dc503962f6d53b82ed54a4edb20d37e7b975fed10c8b13e8fe0548	f	\N	\N
5157e342-cdab-4394-ad54-7a7ec82319e0	2023-09-28	Dino's Restaurant	17.00	Uncategorized	\N	f	{}	4d0444c1d368b03bea1ed410430c3fd4dc94ba99827dcb73fb57f9b86c03c780	f	\N	\N
448598b1-3ef8-46d7-9f88-44d809eeba6f	2023-09-30	Chick-fil-A	13.69	Uncategorized	\N	f	{}	9dffb3d32cb23f04577c0c73fabe26255fe713a25af9cd0d18dfa40d0f8e8ab7	f	\N	\N
62a613fa-9379-4fc9-9b85-c127ea900ef7	2023-09-29	Target	13.14	Uncategorized	\N	f	{}	74cd728bab5750b69ab4223b84a35b92b9d4a3f614ce3167cdaece99f214636d	f	\N	\N
d0451144-d12b-47ed-a71f-e1da1f022db7	2023-09-29	Debit- XX 8678 Sq *diablo Doughnu Nottingham MD	12.37	Uncategorized	\N	f	{}	a237bd072ccd5fbac786c2b1a3e3c7e94f6bb88365447447ebea04eafea5e338	f	\N	\N
43b58d18-c905-4adc-a347-10b5ddce4bcd	2023-10-01	Giant Food	10.59	Uncategorized	\N	f	{}	a9ad0c0f426e9c709efd125fc3030d46b8eaf5dd109e5531c4dc60244911e3a2	f	\N	\N
0d6da6b1-371e-42cd-833a-70625190496a	2023-09-30	Target	10.00	Uncategorized	\N	f	{}	ea1f5cbde70f81db43a6d186e13bcbf83245db0ecb27d081ffe89fadc3d0191b	f	\N	\N
d5479761-5f9a-4489-9e54-06d64b413763	2023-09-29	The Charmery	7.14	Uncategorized	\N	f	{}	9516ddc197c430fd20803b8a817951d1354b32381d5ba617226c5f7ba6875340	f	\N	\N
7a08f2cc-8903-4253-9e28-fc2b5be474a9	2023-10-01	Giant Food	5.36	Uncategorized	\N	f	{}	d1601200b08b3ea829996a6e4bc22abf8b4c870dc9fe7545fc7bc1508038f1f6	f	\N	\N
d6c56800-801a-4387-80cd-a974f4acacdb	2023-09-30	7-Eleven	4.11	Uncategorized	\N	f	{}	fd94bde2f77e9fadc1f5548f8690cc0be018e59aeb9c54eefddb138ffd888049	f	\N	\N
27463a84-f0d5-42d4-bb43-06bc31c69d87	2023-10-01	Apple	2.49	Uncategorized	\N	f	{}	2a7563c8ca5370fb90850d2b413851d7b0482f0c943cf83dc53022331c2ce423	f	\N	\N
6645c943-b18c-4afb-928e-6b9fded11a14	2023-09-29	7-Eleven	1.06	Uncategorized	\N	f	{}	807b80b4e4547c69c23d50d5f2a0480c8198ed47eccd5833be982ed308118daa	f	\N	\N
7c03c28a-6008-4016-b783-cb877b53fb85	2023-09-29	Parking Authority-baltimore	1.00	Uncategorized	\N	f	{}	e75705d5fb6489863f628f5fe21f521a5e88ad8e6e0a6b02b6412efb0fff7f1b	f	\N	\N
063dd124-4795-413d-a0be-c3e733ef3fe0	2023-10-02	Venmo Transfer	-107.00	Uncategorized	\N	f	{}	5bd2daa2a31bd4004be9c52a2bfedf85bece1e387ee65bea530897822d41f344	f	\N	\N
b18db417-6cd3-4efc-905b-ae217d911249	2023-09-29	Investment Income/Cash	-1.32	Uncategorized	\N	f	{}	4e5c57b63c5d7dd0e1dc2bbafc741dfb49086db813798eba08eb9984c550c275	f	\N	\N
43f233cd-efb5-47bb-aa9d-3713d4b3983d	2023-09-29	Credit Card Payment	507.27	Uncategorized	\N	f	{}	3a789245b7ec62024e0717c885acc05b2b97011d398385fef7d264994c3d2245	f	\N	\N
a4ad1876-9574-4d13-a07c-95264ea08a25	2023-09-28	Pos Debit-    8678 8678 Pt Solutions Of Gl Glen Burnie MD	9.00	Uncategorized	\N	f	{}	2d539c9fb216caa808686016bb1a4f027471416a3a80ef5a4a3d779b1d8346f6	f	\N	\N
a4abd868-5f6f-4571-a815-40470051ae9a	2023-09-28	Debit- XX 6114 Jhmi Parking Baltimore MD	7.00	Uncategorized	\N	f	{}	b3ae4b9024a6e30cb6871b9f4c93a3e66281ae6eed30b443aaac1168a8c334e2	f	\N	\N
838fec49-d2c7-4337-98c5-3c086d9fe2df	2023-09-28	Debit- XX 6114 Gift Shop At Jhh Baltimore MD	4.75	Uncategorized	\N	f	{}	fcdc4b7924cdf9a77de176a51d8022bb2a5539dbf51a97f369b649f03593a17d	f	\N	\N
3d6db977-2f29-48fa-9f28-b4961d97746e	2023-09-28	Best Buy Refund	-40.27	Uncategorized	\N	f	{}	a8a5ee810b90164182acb5a0ce67f62d6385eec2e276b9143b40976572c4e452	f	\N	\N
be69a013-7886-49c9-afb6-05e678870ee9	2023-09-27	Debit- XX 8678 Sq *diablo Doughnu Nottingham MD	22.26	Uncategorized	\N	f	{}	4d1e8e9677a9debf2ab45fc96e39477c1a35c3287be18f52c1f738c87d35c06e	f	\N	\N
9a1e4b3d-07a3-4071-8415-3c35fc947e1a	2023-09-27	Debit- XX 8678 Chynnea Marie Beau Chynneamarieb MD	15.00	Uncategorized	\N	f	{}	e70e977d0cdb0abdc3229b9eee56613ce3ecb1ae87e9fc8e3525a4fd85516aa1	f	\N	\N
dea34c5c-6954-42ad-bb39-a8e7184baaa1	2023-09-27	Target	14.10	Uncategorized	\N	f	{}	cdd77d108f51bc27284eba2fef113c714efa287e44c61bdc59e7ff54894d5e21	f	\N	\N
24658d66-9d82-4c29-8245-ee932de916cd	2023-09-28	Microsoft Deposit	-5219.76	Uncategorized	\N	f	{}	2673d916997c397b272c4d0194ebb1417c1c6ae58cb4c01d95fb692781b684c2	f	\N	\N
4a98e663-fcd6-4bea-a583-df025a685b48	2023-09-26	REI	182.21	Uncategorized	\N	f	{}	f49882310688124bb2ee64a967de45fe12e367494bbad94f8ba1b2ddae3136a5	f	\N	\N
2620c605-03ae-4813-95a4-ac1f340ad876	2023-09-25	Debit- XX 6114 Aaco Liquor Board XX1148 MD	50.00	Uncategorized	\N	f	{}	061dca8582584446fb9a6e6decc438414b24f0b75b004d5db5b9029268e6e134	f	\N	\N
edaded27-ad1a-4dd2-8313-1319540bfe52	2023-09-27	Returned Check Charge	29.00	Uncategorized	\N	f	{}	df534b886869abf85bffc13f8f969a4a72676db37ccbde190a1c0d716a966e06	f	\N	\N
12a37e29-45e9-45a4-b42f-6f2b7281a23c	2023-09-24	Union Jacks	108.35	Uncategorized	\N	f	{}	03c1921a39ce8b26fe17dc36bea456d5049c1b7baea9fe226845c36ca2c1e282	f	\N	\N
b8f5861a-645a-438a-a86b-f10fbdbf4e99	2023-09-18	Lowe's	300.00	Uncategorized	\N	f	{}	ee41436fd41e9fb3ff5ec656338579badebd9a456107db04a3c97afa4ee76dda	f	\N	\N
2d7361fc-ea9d-4ab6-ac15-1a6d6ab7d9ca	2023-09-24	Debit- XX 6114 Amk M&t-f&b Conces Baltimore MD	28.44	Uncategorized	\N	f	{}	d665548b21f9f1d7ef29e728302e6652b2e254281c1987e706aec3c4ab99fcd1	f	\N	\N
cd89b14f-73ac-4138-97eb-220b72b16d25	2023-09-24	Debit- XX 6114 Amk M&t- Hawking Baltimore MD	10.68	Uncategorized	\N	f	{}	3bf907c930ef521f4f32c7108f04cfb8edd9c8cfa05300a03781c59b353cb38e	f	\N	\N
84283e94-1e24-4cca-986e-54badefc269a	2023-09-24	Debit- XX 6114 Amk M&t-f&b Conces Baltimore MD	7.42	Uncategorized	\N	f	{}	9779e46eafbc599fa5d65aa497e48b26f7c1b361cc677ffbeb57001c655a68a5	f	\N	\N
b3947b2f-f614-4eb1-ad7a-c84c2ee2ee53	2023-09-25	Best Egg Loan	537.47	Uncategorized	\N	f	{}	32d4b4ca8178d0f8daec1ece20b24700e1b321ab39edfc78af0d71198e58de3d	f	\N	\N
a6cf7b23-cd58-4b31-b028-f3c66448874e	2023-09-22	Koco's Pub	105.13	Uncategorized	\N	f	{}	47463f8817a828374990410f67c51aabdffc0b963ee8450b79a1a49ea91a6356	f	\N	\N
3c243ef7-1199-4777-a469-9599d39c9bbd	2023-09-21	A L Schutzman Company	83.65	Uncategorized	\N	f	{}	bd72853fca637fd1af06786737419d1061a7320f180cd9fca2313c111dacf1df	f	\N	\N
1e22d64b-75b1-4be2-9607-071a2b985f85	2023-09-22	Debit- XX 6114 Mark Supik And Com Baltimore MD	53.00	Uncategorized	\N	f	{}	3e4fafb6588feaa4ae13b9b20aba5626c2d8d65b66486ef00fba0236f1a7c77d	f	\N	\N
731c0ff8-5d29-4404-b059-56a15c0c213e	2023-09-24	Sam's Club	41.40	Uncategorized	\N	f	{}	ad1d4d1309b33fe35818b55bc3fcb8cfc96b6494b19068182564fb019206249a	f	\N	\N
14bc4e97-24e8-4604-92ba-cd926ecee12a	2023-09-22	Debit- XX 8678 Sq *diablo Doughnu Nottingham MD	20.00	Uncategorized	\N	f	{}	3c73a2dbe6642ab96231352344cfc5bc4f694bc8ffe17028abdfaee8182f86e3	f	\N	\N
9d56bf2d-1e10-4126-adba-79e9d48c3c06	2023-09-22	Bruster's Ice Cream, Inc	16.78	Uncategorized	\N	f	{}	e83bd737a008009cbc71f2b596f537a7d1bb067843aed5201ee200afd5337a28	f	\N	\N
a016f0c4-9eb8-45f5-a64d-829ee915a1b0	2023-09-20	Raising Cane's	12.07	Uncategorized	\N	f	{}	726cf2ef3ae32a92f5e1fa53f2a34b6d2cf5f94f1a77b6b468140bc92d6704a6	f	\N	\N
6265679d-d500-42a0-871e-a965edc7d671	2023-09-24	Ledo Pizza	11.33	Uncategorized	\N	f	{}	b4acb04c3ef18f76e070b59df805bc8b714772a065e62813ff3e41847b6eba8e	f	\N	\N
57adee21-ddc0-431c-a49a-9854449eaa39	2023-09-23	BP Global	10.00	Uncategorized	\N	f	{}	ee193307b2f3ae5f50679467b8c719610b00b0f0eeb996829b4715d248125c4b	f	\N	\N
2c7e4680-0247-41b1-8721-5274f0e2714b	2023-09-24	Debit- XX 8678 Chynnea Marie Beau Chynneamarieb MD	5.00	Uncategorized	\N	f	{}	6e409004a6d28e822ba662f9458e0a2ed94c3437db41727ebb8b88dd4d290d2b	f	\N	\N
0945d486-409c-4e97-9682-cc766ed47291	2023-09-24	ATM/Cash Withdrawal	143.50	Uncategorized	\N	f	{}	6c158970cf6a5bc56dd0f76516e8084c0a5d3c8c0b4024de331291e83a85bd47	f	\N	\N
edf5fdd0-f690-4d8c-88b1-8cc9a96033fd	2023-09-24	Other Charges/Fees	1.00	Uncategorized	\N	f	{}	8cca7906d738eb3acde93123525c22f7f244b214febcf562ee5bbcdd0754f440	f	\N	\N
6bb08104-5eca-4dca-81e6-deb4796c5b98	2023-09-21	The Container Store	104.54	Uncategorized	\N	f	{}	294d0c0bf976a4902f0fdf1d0aa6576071c5ef07f0a666c735f8ee976324e2ed	f	\N	\N
39689725-a275-45b5-9db2-eb2e001d1f4a	2023-09-21	Target	72.97	Uncategorized	\N	f	{}	1c462f9d6d3a6b2a9cae10bd1ff75fe01a1b9605017e883c35ac6d7232e7c538	f	\N	\N
72956b9a-6d20-4d28-bbf1-97dd5a198ecd	2023-09-21	Debit- XX 6114 M2m*productgirlsco XX-8520 OH	44.98	Uncategorized	\N	f	{}	4c7c936dc50731e05d4de6413ad2401b831e925e80ad8237d149aa3a56c2f681	f	\N	\N
b9b7be21-ab86-418a-b752-b4bba822b06b	2023-09-21	Best Buy	40.27	Uncategorized	\N	f	{}	807e8e4003f4886a48599ff5c100395fa16cc3bb7bc7205184f61c4f0ac6b584	f	\N	\N
fc92d8c5-ac30-4f40-b903-5359ec7b26db	2023-09-21	Target	30.00	Uncategorized	\N	f	{}	f32b34e7fc585709c62222b18f3669f62fa44decced00b6d22a580480ccafcda	f	\N	\N
587699f5-e0ee-4134-a268-44090a773e67	2023-09-21	Giant Food	19.52	Uncategorized	\N	f	{}	8931d9b76799240d3dcbd85ab801ffe7dfcce1df8205f24ea24c59b80d4166f8	f	\N	\N
babc6e85-6a7c-4f67-b815-b844b2d7c6e3	2023-09-21	Rise Up Coffee	19.20	Uncategorized	\N	f	{}	c70a6b4f06a0b60a0d482f9906e1f952a8626bd1b891432999cd2b66067075a4	f	\N	\N
9d57488d-76f7-49b8-8ad1-8647d3b6a975	2023-09-21	McDonald's	10.77	Uncategorized	\N	f	{}	92fe3682f5785f9bf1fbc40963dbfd6497d18b0ce83ed5c7bc82b163ec8e965e	f	\N	\N
46f3c988-8f47-4120-b86c-1c5f796c17b9	2023-09-21	Rise Up Coffee	4.75	Uncategorized	\N	f	{}	a38b9b6d1a6121e0eacb2272ea95ff9feebd2b0d9500e617314ebed1e10910db	f	\N	\N
cdc40bb9-8d4b-4102-b13a-54c5620fac99	2023-09-21	Target	1.19	Uncategorized	\N	f	{}	75a682630a399764be0d85c5fb466d4b71d4346c6a7cd37444131eaaa9d70f22	f	\N	\N
fce42814-b3bc-4979-8053-5771f4ac6bff	2023-09-20	Metta Wellness Insurance Payment	87.00	Uncategorized	\N	f	{}	f141e815629ad88c6c838ec1851a6d725d27d92b5141b45486d88b1c27d0b1db	f	\N	\N
8f6ddf55-2172-4188-934a-7ac404122487	2023-09-20	Babylist	53.00	Uncategorized	\N	f	{}	40800be352f0ca46813a2e280c450211664a33473327420f1027d34a51b57b58	f	\N	\N
6c76237c-b835-4467-b4d8-fa2068b5be43	2023-09-19	Five Guys	7.87	Uncategorized	\N	f	{}	a0bdcfadd30166b5c010514548c355b4c8e53d93e0db92b247ff04dc5eb9b4c7	f	\N	\N
187163fb-a230-4dca-8a8f-44f5480ff9a9	2023-09-19	Chick-fil-A	5.82	Uncategorized	\N	f	{}	85dfd42b8c27b329ef8ebc5b37b0f44c12d64875863bdcfea640ccd64bc70113	f	\N	\N
f0e29e30-5a1f-451b-94f9-6487d15782bd	2023-09-19	Deckers Outdoor Corporation	159.00	Uncategorized	\N	f	{}	60a931c0400b277161d4faac0b4d47e33f7a648c9e9cfa149c6abca157fb2297	f	\N	\N
12d38fe7-df1f-4bef-a5f4-277a04ee0c84	2023-09-19	P. F. Chang's China Bistro	18.76	Uncategorized	\N	f	{}	3c496b51d0137e65b67ef30e0471b5f6a3d323928663b9b63d426835cdcae551	f	\N	\N
83d47962-38c4-43f9-bd1e-9c941eb99648	2023-09-19	Five Guys	18.62	Uncategorized	\N	f	{}	5cb2702d40ac1cec62d6338f5995351b959e8d872c6af56d8c0dd4f8c51594ac	f	\N	\N
74ec8981-1cd3-40a3-a3d3-dc892d81f05f	2023-09-19	Rise Up Coffee	8.00	Uncategorized	\N	f	{}	e01c39be785471def8f1539ef6be5c0fc277d1f2e236b43a2804785730f301a9	f	\N	\N
569b30b3-5af5-4620-8e15-ec9a28203da2	2023-09-18	Starbucks	7.42	Uncategorized	\N	f	{}	e2ffb0f5b681ab6c69b40a878ad452f20f98918c490a4cb6d46b7bebf25bee04	f	\N	\N
bbd5f982-410c-4511-b920-03bf054f72f9	2023-09-20	ACH Debit - Claudaya Hood Be	500.00	Uncategorized	\N	f	{}	5509773ed6979e3598ecc912ebf427792fd10d446a1026a8f75ed349c774306a	f	\N	\N
8b21ef6e-4ced-46ce-a16e-576181b2224a	2023-09-20	ACH Debit - Claudaya Hood Be	200.00	Uncategorized	\N	f	{}	946e3ebfbade1fe43e616bc9b15332182cd8072e385cda296abc9a28d2d675fa	f	\N	\N
efe653b5-e5c5-4089-a758-ed949659400b	2023-09-18	Transfer	50.00	Uncategorized	\N	f	{}	819540a6b7ce59ba11f4d769be1b8acb8e647798372a3ff06df9562df3106767	f	\N	\N
dc75d732-6c5c-40ea-8c59-bd1367992012	2023-09-18	Zelle Transfer	40.00	Uncategorized	\N	f	{}	4867fb2762b6f2f01efd63fa9e893d4909a7712ce4a1e73b812e45a94f86d622	f	\N	\N
3b36d028-598e-4a62-82dd-b40b64f00f7b	2023-09-18	Sam's Club	23.80	Uncategorized	\N	f	{}	7fcd7e03fa0c438d88c8ce1c927f9dfe0c7cbe08ffe58c1e22256c778695ee76	f	\N	\N
8869e53a-abf4-407e-a1f3-18e88d2d92d5	2023-09-18	McDonald's	9.50	Uncategorized	\N	f	{}	2d927f6cd4fb43e78d129019c8fafff363d6e701b4fd458e90ca6d259bdb0b40	f	\N	\N
dad3c030-96aa-4c88-8fd0-dab3bdc402d8	2023-09-18	Apple	7.99	Uncategorized	\N	f	{}	48c29d1eebb2455377d80358a9e662576ea94f8e221d7d88caeb31a2b522f7cf	f	\N	\N
5d1456b0-35fc-44d4-91fb-9ab13e5848a8	2023-09-18	- Jhulive XX0163	6620.00	Uncategorized	\N	f	{}	c43be209662689943d390d36c07cc632cea6092171c423994835721c73730329	f	\N	\N
d904faa0-3942-4bb3-ae21-b0c85eeb8d95	2023-09-18	Toyota	900.00	Uncategorized	\N	f	{}	4633b5e2f772d014a0efa106a4d08f7418a134b7dfa6eff6389084664715b4e8	f	\N	\N
7285583b-7ed4-43a2-8205-8444fa6945c5	2023-09-18	Discover Bank Credit Card Payment	500.00	Uncategorized	\N	f	{}	31127eb890277083c45232536e9c86c8417220ff1c4d5546cef1168e73c829a3	f	\N	\N
75785000-e7fc-4d83-b65a-511a6ae3e439	2023-09-18	Chase Credit Card Payment	500.00	Uncategorized	\N	f	{}	fe41cd72a9f5b67be717c3ee53b4955c1032ac362e9849020a82f8951acde94c	f	\N	\N
967fccba-efa5-4806-9400-a698baab5b10	2023-09-18	Capital One Credit Card Payment	300.00	Uncategorized	\N	f	{}	eeba360e24210bed424996eacc0eccd46e9787762b643a2c43fffc56b3778d4f	f	\N	\N
16e51d92-c458-4b48-9820-3a957651169c	2023-09-15	Debit- XX 6114 Alcove Eve* (3 Of Gabrielle@ghi MD	563.35	Uncategorized	\N	f	{}	7f339bd57530138103b9fd154568696f3ec185d4b8aecff41f04b42623a0fe2b	f	\N	\N
43951eb5-5324-4a6f-a59c-851c239a4c4e	2023-09-15	Pottery Barn Kids	396.44	Uncategorized	\N	f	{}	de5446b00a9508a38f97c9ced5c270107096c039817daf93a84b9c26e7a1f1c6	f	\N	\N
2594bc7e-f77a-42b6-b4e7-37722f81e883	2023-09-15	Costco	237.37	Uncategorized	\N	f	{}	19aa5f07afc7dff5a15a6a3187caa7fdb23cb1a3a021e2df39c361b66c165b8c	f	\N	\N
60af608b-b579-4bfb-91c2-d8dc1958b78d	2023-09-15	Zelle Transfer	200.00	Uncategorized	\N	f	{}	a860cb7acc8083aeeda50b61670515c5800bbf521a091be26e2e16f4d8054371	f	\N	\N
175c0064-f6cc-41ca-bdd4-fe66a624903a	2023-09-17	Iron Rooster	119.18	Uncategorized	\N	f	{}	a2f07d9cfc6e45ba08644671c1840c14b0b7654e33caf1a33eceb557be23f8cf	f	\N	\N
cb28340e-f4e1-481e-9e64-58263da13733	2023-09-17	Dream Baby	114.46	Uncategorized	\N	f	{}	1f779c82dbe1191f2242a77489914471590dcb31d7610aa121f3568d44d47c41	f	\N	\N
8969e04f-c7e2-4602-aa7b-658ca2cbfc6b	2023-09-16	Brooklyn Tea	81.95	Uncategorized	\N	f	{}	7e9aea0aa339a7f5f8bc513ec4c255d38788b21e0f3d702a0ee692fd04dd7a5e	f	\N	\N
40160497-0998-4dd3-aa3a-a205a140a51c	2023-09-15	calabash tea	78.78	Uncategorized	\N	f	{}	366c9ab8070e5a4de98f5c7dc3cd288f8c618dd3673470c828b5ddef683afd0e	f	\N	\N
1843660b-3743-4e54-be6a-ef4a9d0eedb6	2023-09-15	Target	71.54	Uncategorized	\N	f	{}	b3eb5f73db063252cd47eb742ae55e9cef5ba1f3ed1c41c761bf0ca61c649525	f	\N	\N
8b1b022d-4408-4a5e-b518-4f9d2d4b6244	2023-09-16	Debit- XX 8678 Blvd *nail Haven Odenton MD	65.00	Uncategorized	\N	f	{}	3893d17394dd59f436eb9ca906e7a954e062b053c8c0fba13039c8b55ebce596	f	\N	\N
0a00190c-5525-4527-a908-3b04ee49b384	2023-09-16	Etsy	34.45	Uncategorized	\N	f	{}	3157bfa80c068ad28e226eb3b3284785ffae43c6c06af2b3c7028611011ec377	f	\N	\N
67881197-9d34-4a5d-b9eb-aefeb3306ece	2023-09-15	Target	34.22	Uncategorized	\N	f	{}	82d177dc0d291008b538e8e4727e84432388080cb7f7561cf654fbd90b513168	f	\N	\N
bb9ae740-3e5a-4b95-aa7b-ec0f6babbfa0	2023-09-18	Debit- XX 6114 Shri Sai Kripa Httpstherango MD	32.64	Uncategorized	\N	f	{}	028d160893bb11652d6095319f92b3778d3446bdc0e5796291f41d54c74357d8	f	\N	\N
53ca67f5-4623-4f1f-84ad-f6172c0dfc32	2023-09-16	Pos Debit-    6114 6114 Nebula Subscriptio Httpsnebula.t CO	30.00	Uncategorized	\N	f	{}	28099eed5bffb6b2d63df58d68ef457489549d111b7ed8e747d91639d15d1528	f	\N	\N
83a2f519-5603-4d87-ace9-226382f5e059	2023-09-15	McCormick	25.00	Uncategorized	\N	f	{}	10a5a7a3196ea9d159b9f31c6d2154921351d4ef96375ba6914562bb1abcd308	f	\N	\N
88e0182b-8955-49ad-a8c9-2d40ee4cd275	2023-09-15	Costco	22.99	Uncategorized	\N	f	{}	2fdd89bf15a8d29a02e9ddb1634f351afd5d9e5a9ff71154267d3bc43beeb59b	f	\N	\N
1260dc19-5d48-42aa-a341-241b55736266	2023-09-17	Giant Food	17.54	Uncategorized	\N	f	{}	7061cd8b968e2f86da672c55d36f7aae6227342ba16ba3f3c3f2c1c6e149d6e0	f	\N	\N
0d5655cf-fe6a-4adb-b8e5-93d63690a21d	2023-09-17	Apple Cash Transfer	15.00	Uncategorized	\N	f	{}	6172773d9774d3a66b76833e1b343a4b256365554a01adbced2f031ff71f4e82	f	\N	\N
d5f1cc64-588f-488b-8156-7438ff2ebd18	2023-09-15	Quickway Hibachi	13.53	Uncategorized	\N	f	{}	b0c3e905c6331932553465ce592af83dd516a66f50149aab6bb003df142b31c5	f	\N	\N
e1a7a16e-919e-4529-a8cc-beaad9e22e7d	2023-09-15	McDonald's	12.91	Uncategorized	\N	f	{}	47b7a18bdaadf623d43c33b6584263111cef622286cf91c694f80cf97bc84870	f	\N	\N
b14308f3-1c31-433e-9d35-7baf423717ed	2023-09-14	Taco Bell	12.69	Uncategorized	\N	f	{}	bd3f423207fc57db11432f361cad42c6f5c8595609287b92273855a9231ba81c	f	\N	\N
990cc13c-d066-4f80-9580-bf65da74bc46	2023-09-15	Quickway Hibachi	10.95	Uncategorized	\N	f	{}	616cb7c738384102738d93672ee02c0f8ccd7ad721bf1e36e5e45b541632e5ed	f	\N	\N
962c1100-8fa7-4831-beae-e907bd99fd9d	2023-09-18	Transfer	-139.13	Uncategorized	\N	f	{}	726ace35e9fd4db9a6de2ba3d22dc3011ca0e3a630d62400fd67edb75491d399	f	\N	\N
e1e90e43-b65e-43be-9baf-87ee79d5e3d6	2023-09-17	Zelle Transfer	-20.00	Uncategorized	\N	f	{}	f2b98717deeb3457af7c537c236e4378a443bd9422379dab0b439839d36788d6	f	\N	\N
63eafa53-1005-4e04-a65c-5dfb4490dead	2023-09-15	Venmo Transfer	20.00	Uncategorized	\N	f	{}	8a3de3bfe80b789153722391e401df40f26a483540ea74496f77ae284024d229	f	\N	\N
a9571016-a848-4516-baaa-20f6e8e33e10	2023-09-15	Credit Card Payment	500.00	Uncategorized	\N	f	{}	509e66aa6bb806aee0a0a35f15bc5a52363b6ba6a1905faf6186fdcec2f3c157	f	\N	\N
527f44f0-5aa3-47b0-829e-a8670c43074a	2023-09-14	Debit- XX 8678 Sp Goodbuy Gear Httpskidgear. CO	142.03	Uncategorized	\N	f	{}	222f45e2324f92017402d18ff3e7bb018e5dd7d792221c5e0958afd6471b1ff4	f	\N	\N
b38a37be-684c-4764-8cc0-c05730ef8757	2023-09-13	Transfer	25.00	Uncategorized	\N	f	{}	6e3f00b0803fd2b604638d61f6abe5a44c7ea0494ea6693f2dcbb787236ad850	f	\N	\N
844314ec-c85a-41e0-a492-ba0ec3a54fa8	2023-09-13	Starbucks	8.42	Uncategorized	\N	f	{}	ce912e538bea0e7fa5532dcf4c0781109960e15d39d238ae3c1d6a0780312da5	f	\N	\N
9088b489-a79c-43f9-b726-9765b7c8fc57	2023-09-14	Panera Bread	5.82	Uncategorized	\N	f	{}	b7fdef3202f15fdf317b7a999ef85e2441acdcf6cdd86314a8271672fa007329	f	\N	\N
e7163008-242b-416e-b51f-15a7d9f0c21f	2023-09-13	The Container Store Refund	-33.08	Uncategorized	\N	f	{}	85c95cd1752b850a2a4f97b255e22e1de5c3bb494c1c7d11cd1c30e6a5db7256	f	\N	\N
a580bb67-f67a-4715-adb4-ec9d66d0a412	2023-09-14	Best Egg Loan	1338.03	Uncategorized	\N	f	{}	4aaa396da79dccece1af832856bc073b22fca37762d8d4a6d69b94dc28c490ef	f	\N	\N
b94bd041-2073-4911-af7c-77ae37abcabf	2023-09-13	Pos Debit-    8678 8678 Sq *bhd Extensions Glen Burnie MD	121.90	Uncategorized	\N	f	{}	237bf0e5bfdbe0146732a521e8cb28f901e3f3cbb5aa19f47e5ee9667cf73256	f	\N	\N
bb0a0536-f16b-4e91-b50b-e0c2b5605b46	2023-09-13	Old Navy	37.09	Uncategorized	\N	f	{}	f95815c7d0242f3719fc3e9ba527cc489896e835c17701da25e6567531f4a92d	f	\N	\N
1aca9447-7ebd-4a96-a4ff-a26b6703c198	2023-09-12	Wendy's	12.18	Uncategorized	\N	f	{}	6ec83b8f6001366529da203a6f9bb1c9cb59eb50b3a9620bbcae9b4f79c122aa	f	\N	\N
4312ac15-663f-4d2a-aaeb-30af18f82826	2023-09-14	Microsoft Deposit	-15480.22	Uncategorized	\N	f	{}	dca2613dfb0263d3204bbc872684aa8c95afe6569eee3d0ccce07edccd099c68	f	\N	\N
794488e7-3c31-462c-be32-eab3cb1a07fb	2023-09-13	Old Navy Refund	-105.98	Uncategorized	\N	f	{}	1a6ccfe3b6c1b24dade8b5c8c59b43ba4416ac761bd555f620fd67740a70ac0b	f	\N	\N
01b60649-5995-4a8d-8bd0-d2d0401d9850	2023-09-13	Old Navy Refund	-39.21	Uncategorized	\N	f	{}	178a1c95f84cfdc16acc70958e15d3befd28e89150fb2d69e5dbf2da182c942b	f	\N	\N
cea75d83-3fb1-45c9-8a24-79d5ff1b989a	2023-09-12	Debit- XX 8678 Edible.com Atlanta GA	105.08	Uncategorized	\N	f	{}	789256bf37e508cd8700b3dff07a8d2df4893676629c210af4cb60d6078858e1	f	\N	\N
fbd9d80d-634d-4808-8bb5-34609634ade7	2023-09-12	Target	11.85	Uncategorized	\N	f	{}	8190110a9d3b1c34783918129b13ef41ab21d2befed529308c1d74c94f365140	f	\N	\N
217e2923-c348-4bb7-aec2-637ee0483b43	2023-09-12	Bruster's Ice Cream, Inc	9.99	Uncategorized	\N	f	{}	26b9fce9400e0e5e31fd70ef19b5cd6808f5940697a43139b451a91606736954	f	\N	\N
f2dde8f8-e0d8-42f2-858d-42e7a75dab1f	2023-09-12	Bruster's Ice Cream	8.09	Uncategorized	\N	f	{}	b4a9d049d767f6238763a68c48d2ceb127c76fcdd65dfe2ad47de5dec514e5df	f	\N	\N
da513b48-f954-4406-9a39-a9a0ba71fe7a	2023-09-12	Verizon	79.99	Uncategorized	\N	f	{}	37afc51812c2084ba1a956a4dfcf5fe1a4dc6b792a725f85c656d5d3b41d7b5e	f	\N	\N
b4fe766d-e041-4082-9861-0f9c92c01d6c	2023-09-11	Debit- XX 6114 Shri Sai Kripa Httpstherango MD	33.79	Uncategorized	\N	f	{}	7c2bbe0466498b99df307e20ee85ee69025b4e578384722fe6877a8ce139151d	f	\N	\N
c3491b63-4466-4be6-8f3c-2bd6af7a9bfb	2023-09-11	Sam's Club	33.10	Uncategorized	\N	f	{}	99c6359146fe51dfd115bc7370ac846faac98dcfb3321ef31119f29e8f1bb3aa	f	\N	\N
840bf1e0-5d95-4b22-b2f9-faed7404deb7	2023-09-11	USPS	26.40	Uncategorized	\N	f	{}	9c2a75a135d7e2972edceda60bb6e2ca5bd77753f675682275ec5db1edee4f17	f	\N	\N
dddf65bc-2c32-4beb-a844-365d43e4ebb1	2023-09-08	PayPal Transfer	240.00	Uncategorized	\N	f	{}	b4af67cd658842cc762d1414a86b973261f185de0555ee90ac0e04e601c50146	f	\N	\N
11ba65a2-e2e3-4af1-bb74-9d924fed3bca	2023-09-09	Patriot Center	162.00	Uncategorized	\N	f	{}	5d647797cc7bb52220e29b6455d4663b8b3ee98396abf18436168c817c67199d	f	\N	\N
0fd5ea4b-d917-466b-8644-0f84ff6e810a	2023-09-11	Zazzle	61.40	Uncategorized	\N	f	{}	745094750217b97c13e919ed0b0182ce152822d6d3f384a074c05b0548c10228	f	\N	\N
4f0ef6a4-4708-4546-8d9d-29fe16049d69	2023-09-10	Ledo Pizza	49.77	Uncategorized	\N	f	{}	365af1c0c5e43cb04067c5237b6963d99bdf9d9a5766c9e3dc97c0a8ea4d6cfc	f	\N	\N
9c97ecaf-727b-48c5-9106-747399ad09ee	2023-09-08	Giant Food	44.70	Uncategorized	\N	f	{}	cb576f6c15194e94c36a12f46ae9a87e3d035802fa0af8268bbd06073ea4ad3b	f	\N	\N
7a9b145e-0e9d-4ad7-a954-9de16d0498ea	2023-09-08	P. F. Chang's China Bistro	36.91	Uncategorized	\N	f	{}	d89857f074930e84e18201eecf9fdaf94b0489224dcff9188c36e3e0be820e84	f	\N	\N
e2da15f6-dec0-422f-9728-84be4b47d350	2023-09-09	Pippos	31.97	Uncategorized	\N	f	{}	2a554a999384ac20bda3874c3916b3334d8aa1480ed1acb5f2fb6144232538a7	f	\N	\N
a645aefe-5c25-44e8-b524-9cd63ac75995	2023-09-09	Debit- XX 8678 Deggeller Foods In Palm City FL	28.00	Uncategorized	\N	f	{}	398fd97a316ffcdaebccff794256f4182628f7af922670066a95b1f516b2cb81	f	\N	\N
12a67d7b-6c82-425d-80f0-2022cc57e647	2023-09-09	The Grill	23.69	Uncategorized	\N	f	{}	4e53131e524ff76bd92b66822651a15e6ba44f51612ed3f45c2168defd39f609	f	\N	\N
83c623c5-86ef-4f3d-818b-dc140ce06b1d	2023-09-10	Target	19.06	Uncategorized	\N	f	{}	26d0dfc85f2de10e3e7ff2cc4d59d5a185bf525d2cc4b4e6f0537d21f7b3a577	f	\N	\N
e332269e-1228-4923-bf96-2d50b0f86392	2023-09-11	Giant Food	10.13	Uncategorized	\N	f	{}	8c0ddafd0b9e2386fb623a98397f2afd36baa588221bc18a2ab5e77f648a0fdc	f	\N	\N
b6f9c909-921a-4f6a-829b-48c4e520404a	2023-09-08	Pos Debit-    8678 8678 Pt Solutions Of Gl Glen Burnie MD	9.00	Uncategorized	\N	f	{}	57042cc45b57578e7a22e8356623ad6030ca5dd240c82797c76dbe6d62478e15	f	\N	\N
d63a7437-09a5-4798-a2b0-d81c9c2adb83	2023-09-08	Starbucks	6.63	Uncategorized	\N	f	{}	bae4dca6d886f05b4e28812f30d98614de62de29f535890e1b5d4517f4d6d206	f	\N	\N
a8192954-b2a9-41a9-80b9-736d44e16ff0	2023-09-08	McDonald's	3.70	Uncategorized	\N	f	{}	a1b13d1efff2f411adbd41159e5a51d9b4570eac7896e1db8cfd6c938f2d965c	f	\N	\N
78fd23aa-7635-4bfd-95fb-81b6d2e85ee3	2023-09-07	Chick-fil-A	2.96	Uncategorized	\N	f	{}	b502de20f1abcf1117da497c8ece8c8ae16aa0b55d341caffdf30ec8f9f10484	f	\N	\N
bbe748c4-182c-4dd0-8000-46110d43ecae	2023-09-07	Debit- XX 6114 Aacc-cashier's Off XX-2236 MD	504.00	Uncategorized	\N	f	{}	5bb8ff2d72156adc3c4deedce7a1240c4edd97578c5cabb9f2f789913e4b5204	f	\N	\N
66264320-3659-4af1-9664-e60bc7abce23	2023-09-07	Harris Teeter	67.76	Uncategorized	\N	f	{}	04d27d44bcf39f65fbcbe0b6f52e10af885541e3f521c846469030b1545fba03	f	\N	\N
a7fcb6fd-e41b-4713-809d-6f18fbbaca38	2023-09-06	Cengage Learning	117.66	Uncategorized	\N	f	{}	df883d8eba248fd71f48c329c4b65b85422edf653af2bed27acca5ccabef19b4	f	\N	\N
1d7fffc0-0258-4902-93a1-56c06888c34a	2023-09-06	Sam's Club	23.50	Uncategorized	\N	f	{}	0c50b02d6cbde4e453d8e68c32cf8bff292422efcb4fb02b43e0cc913f0a96d6	f	\N	\N
498b393e-0f18-4286-ab28-cca8f2509a15	2023-09-06	Chipotle Mexican Grill	15.06	Uncategorized	\N	f	{}	8b72a9f734cc835452ea4394e2afcb1799fbc35d5eccee782d484b3f5e949f27	f	\N	\N
bb33c375-3eee-47e0-bb75-5d63d73510b7	2023-09-06	aacc bookstore	12.67	Uncategorized	\N	f	{}	3699d787cdf0fda5ae6f1c8a1259cf8acd44b153d15b33615c08af25bde68c8d	f	\N	\N
4d91e53e-2895-49e3-a3e9-d45a4db1335e	2023-09-05	Starbucks	11.08	Uncategorized	\N	f	{}	cad7531bca21ceb25c28722550af3735933321c66524c34ee319e078b3aac447	f	\N	\N
e50fdc15-b426-4f7f-a20a-582c337d5375	2023-09-06	Debit- XX 8678 Hawks Nest Grill A Arnold MD	9.14	Uncategorized	\N	f	{}	6d1b0aa3620be4db4bf811654e13ea6d255ec0db63b1c68464295c7ff7577379	f	\N	\N
e272de25-79f9-4dd1-ba1a-e5034c2b2c70	2023-09-05	Chick-fil-A	2.96	Uncategorized	\N	f	{}	94cb13ed3f3e17814a112f2c1c58034263d6f7353ede910a622370ea7c80b0ce	f	\N	\N
23adf87c-f15f-4674-a9b1-a71d7a350934	2023-09-07	Deposit	-864.00	Uncategorized	\N	f	{}	f0213c8d997309de3e8e84ac469392ad52e0136e1e33b09d70cdb86bd8fe619a	f	\N	\N
ab9ebc38-8bd8-464d-9418-cd33fb410a88	2023-09-04	Buffalo Wild Wings	76.80	Uncategorized	\N	f	{}	5d6c5692f59f68ef066e8e3c749589dadfa4bdd19cee524f164927505e9c6483	f	\N	\N
06d5c480-1b65-461e-b473-56a3f41cde62	2023-09-05	LA Fitness	39.99	Uncategorized	\N	f	{}	063d28d1b6408a4daac802f9b85c7fc916b99ad06b6feb703ea153b843f90ff8	f	\N	\N
a6a103a8-c71a-448b-8c3f-9e49d4db2854	2023-09-04	Hook & Reel	35.86	Uncategorized	\N	f	{}	cd5b19b47caca31f300364d9c7e9c63472534ddfbfec9a8d7b060bf5aae1dd17	f	\N	\N
ba1f41fc-c396-419e-87cb-7a4d5b61da3e	2023-09-05	Freedom Mortgage Home Loan/Mortgage	1957.35	Uncategorized	\N	f	{}	3fec1fd0a6992b410567b08a9b12e45a8ec198454c765f0c7a3677894673da2d	f	\N	\N
6a69a075-8951-4970-bd85-131ac357719a	2023-09-02	La-Z-Boy	933.45	Uncategorized	\N	f	{}	a1a0cc68dfce280bc4fe3d0a628b83740e6b61aa3f04c0db5c3cffa26b0f5958	f	\N	\N
d3ab00dc-ed34-43bb-88ce-6fe1d8841fb1	2023-09-02	Second Chance	739.88	Uncategorized	\N	f	{}	84e08f7f35a1efaf648c58a968d07e6471686676269afbd9cf4b23830e434449	f	\N	\N
742ac3bf-b684-42e1-be38-67938d75fef3	2023-09-01	Old Navy	526.57	Uncategorized	\N	f	{}	6ac3c1b62bd9b8cb210e4614ce657d0d632d35c0009746120644c0534af29522	f	\N	\N
67d181ec-c598-47f1-a9da-6e86fba8a759	2023-09-02	The Container Store	428.67	Uncategorized	\N	f	{}	77bae63b753ac887c7d6094ecd3e61c92ebae2103cbdbd27c0612826a3fa25f3	f	\N	\N
8cc0718e-bd2b-4151-8bba-990691e7e794	2023-09-02	The Container Store	319.54	Uncategorized	\N	f	{}	5f58748bccfd22bd75aa706b113956ccb417dbda843de1e083e1d57a561d0bf3	f	\N	\N
6c0570da-c051-4404-9118-333938d1df91	2023-09-03	AT&T	195.18	Uncategorized	\N	f	{}	a6c438c38642f8db309d4b6a75a48da0dfa4bda288401bb59fc9fe67c891278c	f	\N	\N
0a7597b7-e85d-4d36-bd02-b2dbf1946d59	2023-09-02	Babylist	174.89	Uncategorized	\N	f	{}	17ecef2d6d0e6445d37a9c65005ae9a77c991d3673e856e67397852e94d52249	f	\N	\N
da2f2259-401d-4b2e-8e01-f6c2273eafde	2023-09-03	Snuggle Me Organic	119.47	Uncategorized	\N	f	{}	d0ae088fca4f11205924e24aaa7604947d1c7553a8eda408a1c626799773849a	f	\N	\N
6f89e10a-cc88-438d-a5f4-23e9df233789	2023-09-02	Dick's Sporting Goods	111.30	Uncategorized	\N	f	{}	30e1f08c36668f6087b789fa5eb319ae3bae7583c5556173f484197b5eb533d3	f	\N	\N
cb900586-978c-46fc-8377-98d7ab3300f8	2023-09-01	P. F. Chang's China Bistro	70.22	Uncategorized	\N	f	{}	57b14362c6df4544244c3f5e662a4866d1ebcc34e8cbc14b7dbcead6e0726035	f	\N	\N
9cc1fcb0-c2b0-42b9-851e-c9db9fa932da	2023-09-02	Sam's Club	37.45	Uncategorized	\N	f	{}	4021a85300749b451bf20d59f35512563305d159c46f63e5341a540b9b239ca7	f	\N	\N
872ea4d6-4b85-4de1-a3db-c8350698d182	2023-09-01	Silver Moon Diner	36.17	Uncategorized	\N	f	{}	a3c92ef1cf2ca5c162e03fa494f1e83b7553ba3a7cf2319ac253c36b0b992335	f	\N	\N
dac0b63e-4dda-4424-8728-e5a98b92152c	2023-09-03	Debit- XX 8678 Sq *diablo Doughnu Nottingham MD	30.00	Uncategorized	\N	f	{}	968b7b8e267785562881c6b95ec0e1ca2951508a103ed252519d9b52adfd2113	f	\N	\N
bf08f4f9-e065-46cc-b4fd-548e017b0108	2023-08-31	Harney Fine Teas	27.00	Uncategorized	\N	f	{}	e365e765f0116cd6dfd4a10f0cfc56a7ddf60b4c2574172cd7704feb7cbf2ead	f	\N	\N
9441ad76-e7fb-4536-8a69-92d039fb2f9d	2023-09-02	The Container Store	23.07	Uncategorized	\N	f	{}	82f15f018829be97cbfeb6d68edc92b0c5a09831aa82e7b8ea9de3f41e8cd5cb	f	\N	\N
9314357a-5717-4bcf-ba93-b493b3daf408	2023-09-01	Starbucks	21.67	Uncategorized	\N	f	{}	ddd6bca717acd376ec620f53c00e190ef2be2ff9ab69428101c74823068ec616	f	\N	\N
36137ed0-0ef1-46b1-8549-872d062da140	2023-09-02	The Container Store	20.64	Uncategorized	\N	f	{}	d38e2dba8027f862fcb817f818efd3b2de2651e88bfcc8c4804bfc1491ddc919	f	\N	\N
12205df3-1ab1-4300-982a-385777cae439	2023-09-03	Walmart	17.95	Uncategorized	\N	f	{}	724bd70699d092c9171e176641831566ceb644649a8806b5d3a822bf7b193d9d	f	\N	\N
d525cbd8-44f9-4951-9e84-585a03e56d66	2023-08-31	Debit- XX 8678 Hawks Nest Grill A Arnold MD	10.58	Uncategorized	\N	f	{}	087f3bd3b08522e50f289c54392b048a45dabcf147d6d4c03d0a4f44a46c6f03	f	\N	\N
3164f76c-f035-471e-8e2d-2a5c4a390881	2023-09-01	Pos Debit-    8678 8678 Pt Solutions Of Gl Glen Burnie MD	9.00	Uncategorized	\N	f	{}	2047362ce28ee78833c60e09e266337b247534a72ac866520f284dd8c89b343b	f	\N	\N
84d48556-3af7-4570-858c-b003703b0be9	2023-09-04	McDonald's	7.09	Uncategorized	\N	f	{}	75a0e1f97faf86823d36f55cd33f7e11904803a43f8f3e57de7660619aa6aeac	f	\N	\N
98431053-a520-40b4-888b-34fd8d402307	2023-09-03	Giant Food	2.89	Uncategorized	\N	f	{}	8bc0029a23cbe949357f22a68dac276d080985ae911df5ddc395aeceea91b697	f	\N	\N
0a054098-89f1-4105-aae5-0b83fb193091	2023-09-02	Apple	2.49	Uncategorized	\N	f	{}	7c6bac32d3cc586b69675cc933630cc338bc75a5d94034d2def8523fca6a6544	f	\N	\N
c0e93a42-e1d2-4b2e-895c-a1d95d4202fd	2023-09-02	The Container Store Refund	-332.83	Uncategorized	\N	f	{}	aee66f4a9b662537c0038b5142a1aa4117a23d7d9610672159bce7ceb320c4f9	f	\N	\N
1fc8eaef-e1b4-4baf-b217-2045936c3392	2023-09-01	Chase Credit Card Payment	3481.48	Uncategorized	\N	f	{}	46a4beacf9c3a2371d11a224019b23aa86e19f221d0c83625310499310544cb8	f	\N	\N
206c27d1-f99e-492f-bccc-97d6eba142bb	2023-09-01	Apple Card Credit Card Payment	1099.77	Uncategorized	\N	f	{}	4522ea1659482fb57e1d1dfdff5c10f3a38cad56606e84c639717410c0d50a81	f	\N	\N
e202391d-5880-43bf-a103-3d57e19ba25e	2023-08-31	Harris Teeter	203.64	Uncategorized	\N	f	{}	5c62763b768f0bf1ef40dbbe8d196ce11329a653b1fa7f786679c01e849119fa	f	\N	\N
e5baa122-c526-4339-ac17-53c8afeee8fc	2023-08-31	aacc bookstore	31.75	Uncategorized	\N	f	{}	39b2f8d286af97b3928714f17e6d181ece721981248b3d8afa3f0e4211939610	f	\N	\N
da2c3d46-210c-49a3-bc6b-b21b7623364f	2023-08-31	Giant Food	23.43	Uncategorized	\N	f	{}	40c8d337448c3b211877b42737f463eba62a1dcebfce8bb32b307111904f8794	f	\N	\N
fb7e4c80-6a41-4c4f-a9f8-b9022bb1cb8e	2023-09-01	ATM/Cash Withdrawal	400.00	Uncategorized	\N	f	{}	e35e56b63bf1c37e355d848d44c714f7545780d95a66543ea17853f9e2ccf77c	f	\N	\N
632053e7-488e-41c3-802f-094fbc28d5e1	2023-08-31	Investment Income/Cash	-1.90	Uncategorized	\N	f	{}	2bcc2dd65f99caed1c1e36eea5cbaf27270bf69baa4996040dc06cf4c16cb5b5	f	\N	\N
10bd6385-5505-410c-a928-61f4efedd7b2	2023-08-31	Baltimore Gas and Electric Company Utilities Payment	198.00	Uncategorized	\N	f	{}	86e7c3e60277fd75268cb2fdac0fee72e9b284ae24881a4b64f928466325c481	f	\N	\N
ff51d39c-fec9-4d90-a029-769d36243cb6	2023-08-31	Credit Card Payment	1000.00	Uncategorized	\N	f	{}	f92fc5d89e201c2bb2a39b058c22e40b555143c7952e9a5814ed75bbbed2343c	f	\N	\N
de86d209-4f86-4d95-aeee-c3e68ebc381d	2023-08-28	U-Haul	56.84	Uncategorized	\N	f	{}	bd3b3252ab8a73d72ce4bacc8c43ecf2f5bf38eb4a221f157c45e311ba37d43f	f	\N	\N
014efc60-f4c5-4ee9-b25b-fb0177eef33a	2023-08-30	Giant Food	46.61	Uncategorized	\N	f	{}	bdd9e932379a5d2138b6560d898b5adc8068beb1ff0bae7f84c6700c055b8d65	f	\N	\N
a97c4a70-23b3-4e67-8ec3-2a5a5afd0c1b	2023-08-30	Amazon Marketplace	44.95	Uncategorized	\N	f	{}	ca3ccc84b0eab2546f3ed347987317d52bb20841d2499ea2fb8ffb7cc1740cab	f	\N	\N
eb5a7612-8851-4023-b624-e2ceeeb79c12	2023-08-29	7-Eleven	36.75	Uncategorized	\N	f	{}	fbced56a778e3488d5fde8e73b096cdd38de9e3b6c5edd0c2fbaf5f9d8942fb0	f	\N	\N
2ca8ff44-3ecc-4df6-a2a7-c1bdb0377805	2023-08-29	Taco Bell	7.94	Uncategorized	\N	f	{}	539489ae6fd2229173743f1021885674201dff6e7e8162c49a9115c12506354e	f	\N	\N
233c879f-a508-4e46-9d10-21fef3028576	2023-08-29	Giant Food	18.02	Uncategorized	\N	f	{}	948ff820df609c5868a95749a96f594175a9a665b26f997d12a68faf0140b4a1	f	\N	\N
cec3c484-845e-41f9-91c0-94e45ea11df8	2023-08-28	Pos Debit-    8678 8678 Pt Solutions Of Gl Glen Burnie MD	9.00	Uncategorized	\N	f	{}	592aae62b58ec55ab068c1b0f3001c46f29c04d51d7c4537e8e6a19e4e4b5b12	f	\N	\N
af7a7de6-6d45-43f2-90c9-4597a3cc8fe9	2023-08-30	Giant Food	3.87	Uncategorized	\N	f	{}	40b1d9f8d009e310951f8eec74bd6a4db6532f020fb011e751ca63c683ce611d	f	\N	\N
9307572b-2d08-4702-a0e0-59d15e898122	2023-08-30	Microsoft Deposit	-4852.12	Uncategorized	\N	f	{}	429356e8006aaba1682c7a2e2091c3a93cc98e4a556aba7a8b7fa263067a351a	f	\N	\N
c134eb74-0c4b-4ab2-bf9c-a9907d5e5c95	2023-08-28	Zelle Transfer	540.00	Uncategorized	\N	f	{}	ff303262153ea63520d71fb46148cc2ae3aeadde9da6ad61c7ceee48e4585ff2	f	\N	\N
590c053a-189a-46df-8e67-b0c25843bf1e	2023-08-28	Debit- XX 6114 Food At Fortunecoo Menufy.com KS	52.09	Uncategorized	\N	f	{}	538abc922b960cad39691a9086127aa2ff895790c6849621981bfb5c5ab30b02	f	\N	\N
055e0958-4866-4f82-a5e6-6725b97e9868	2023-08-28	Ledo Pizza	38.00	Uncategorized	\N	f	{}	ca84b6cf77d31920662c7aa4e5226863b01f9425cbb2a7b1f87168a3228cf338	f	\N	\N
99e47749-4148-4966-9e28-d7b99326852f	2023-08-28	aacc bookstore	34.40	Uncategorized	\N	f	{}	06c3a6c5bf59b346b4cd23eba95ad4cc43772d2cdb78dd000e82732bdd5fd076	f	\N	\N
fb8fd6fd-5b00-4451-8f83-4cc768d7981c	2023-08-27	Naval Bagels	32.01	Uncategorized	\N	f	{}	cf519eb553f93a85a3ade6d74d2579ae3dd0eb2c087bf1eebe06660677abf74b	f	\N	\N
44497181-24a7-4105-a2cf-42587c98922c	2023-08-28	Office Depot	31.89	Uncategorized	\N	f	{}	2a8cc2a08cfba8c27634e288b206d87b45670da33a7c183d1825c89a3e804fa8	f	\N	\N
187925ba-a3f4-4c4b-a3bf-50685e015004	2023-08-27	Starbucks	21.14	Uncategorized	\N	f	{}	8c923289795e6c2620131412f0938c2308944b17a397d2dff134dfcd44db99e1	f	\N	\N
f394c62e-b55b-42bd-8cc1-6ac0256a345d	2023-08-28	Shell	18.09	Uncategorized	\N	f	{}	f8f01796c1dd427f5cda52fc58c5b1e66eacf3428d7e87f50b06c1a36af3ddfa	f	\N	\N
ab6dc03f-965c-48d0-9ada-6911c382561d	2023-08-28	Debit- XX 6114 Aa County Landfill Severn MD	11.90	Uncategorized	\N	f	{}	cef2c044d027a272a9c59f41864f39fd2e758bc1fdbafdee4e0ab87b1e7ec381	f	\N	\N
15de0422-42e8-436e-959e-18c3f0b632ba	2023-08-28	New York Life Insurance Payment	616.54	Uncategorized	\N	f	{}	d8d346e8449c26f93304cb496489a485e5b98aec4030affa86c966a5e6d0b7bf	f	\N	\N
af5c4a5e-eb5c-4d33-b890-f3ebdc70e576	2023-08-27	Debit- XX 6114 Freestate Gun Rang Httpsfreestat MD	250.00	Uncategorized	\N	f	{}	30c728e137ae12b03495b659638da626015229eeb2c8dbdf9649ef2cb20c9aea	f	\N	\N
9c7c6970-a7aa-42ea-abba-d6d1879fab77	2023-08-27	Target	108.45	Uncategorized	\N	f	{}	4ea8fac95b9d6864e62f01c255e65d64a3350cf7dc004145c4973acc8b27ef9f	f	\N	\N
c2d02737-f421-46d3-86e8-9fde3d4f76b5	2023-08-27	Giant Food	53.48	Uncategorized	\N	f	{}	ddca4c3ac5621a51ab234dd608c4cd45046edada2643053bb8f677b79cd3f1b7	f	\N	\N
04ac9646-2728-42a9-a00a-47975863d252	2023-08-26	Debit- XX 8678 Hair Q Georgetown SC	52.99	Uncategorized	\N	f	{}	122ff0bbe4df4c8fc9bc8318200857e3547c9d86a5a0f492ee7c04fb68d9cf90	f	\N	\N
09ab5296-4345-4e41-bbed-391aa95d1b72	2023-08-26	CVS Pharmacy	24.72	Uncategorized	\N	f	{}	aa784c7361aa2e0ba28b0920f05a966664631cdbfcba8ad2b8542f3a96d22891	f	\N	\N
13e71363-6c1e-4a70-b48b-7eb1bef5c3cf	2023-08-25	Debit- XX 8678 Sq *carolina Natur Pawleys Islan SC	24.33	Uncategorized	\N	f	{}	4ef413c31a08f5dd8dbc9186d2d074035b6e233026811be9cea503087d95a0f9	f	\N	\N
3c2b644f-3cd2-4644-b000-b082f21d797c	2023-08-26	Publix	22.18	Uncategorized	\N	f	{}	3ab6f1d7dbc426583da8e62889f1149b645abc89fe84eabddb47138ab3178762	f	\N	\N
814a5960-8ba2-4abe-95ed-7bac376bbe4d	2023-08-28	Giant Food	12.48	Uncategorized	\N	f	{}	c48c35fe01f9ccca0ce03b6ba6e339dbb8f5284a57ac0811df056312f0a2fd77	f	\N	\N
83ba4aec-e375-431f-a248-09df3b3caa68	2023-08-26	Starbucks	5.83	Uncategorized	\N	f	{}	fb1a3deca254281aa673ad8cfc069793a5f89522d8ce716df9d0f4e4e5172f59	f	\N	\N
2cb96bf3-3294-40dd-a49f-8f82dd9cf754	2023-08-25	Credit Card Payment	1000.00	Uncategorized	\N	f	{}	4f78f296ab0642323e1cd2ea87fbf85eb4a9fa8dff945445c16c061673084a88	f	\N	\N
f9169b6e-121e-4829-b438-edb2edb14b4c	2023-08-24	Cabana Cafe	88.03	Uncategorized	\N	f	{}	3c1f5db8dbe3e63787330633b290d323ec0754d3bd2e8bd5ab5a57ac774a877e	f	\N	\N
b184b7b6-1839-4e06-984c-8353f9716264	2023-08-25	Nintendo	61.99	Uncategorized	\N	f	{}	98d6da975b453d72b2594066c9e2c057e7d2ae38331ec0b63a3627c1b30e5718	f	\N	\N
8b8e966a-e7d6-4994-92cd-67555872df8d	2023-08-24	Nintendo	23.30	Uncategorized	\N	f	{}	87b309938973f03440908c355093d5c3085e2304e5ab0f9053ab564ead7b3827	f	\N	\N
ba2185bb-b052-474e-94de-529a88ab5e77	2023-08-23	Seatgeek	384.02	Uncategorized	\N	f	{}	98a13cba3fdc0ada69cf1a4dc2271a32bd81171898410f8547f321caa6425918	f	\N	\N
750b032c-5a40-4615-9821-d435f1d51f6a	2023-08-23	Publix	27.03	Uncategorized	\N	f	{}	9a4351c866f92330418ceccbb8cd138d8b3255b05e014d5797034a38ebc72b79	f	\N	\N
78230997-5b2f-44f2-8cd5-1403188feb78	2023-08-23	Best Egg Loan	537.47	Uncategorized	\N	f	{}	b9c97e37b724ee458d953e1f8fb969870d1cd68e8a251fdbd6d9ba8f72c2f846	f	\N	\N
a31c76c1-4e00-413d-a68b-8177bb00f04a	2023-08-22	Capital One Credit Card Payment	300.00	Uncategorized	\N	f	{}	69f1086f6e6bc2282ae94cc89d6e3f1c74996a7bc6eff1ddee1ad6d8b70a6ad5	f	\N	\N
497b5901-dfab-4e2a-bf7c-0055e8dcce6d	2023-08-21	Debit- XX 6114 Alcove Eve* (2 Of Gabrielle@ghi MD	393.75	Uncategorized	\N	f	{}	7b60ba88832bf1c80a71faaf8185a2abf1be7e2e0ca362e639a096defa58856f	f	\N	\N
14eff192-89f2-48e2-81d5-28ae2b5a4592	2023-08-22	Publix	309.05	Uncategorized	\N	f	{}	b91616c1de5bd0b56cc5b91aa0ec2ed8239fa7e7f8fe60f21659459841d68179	f	\N	\N
b50bb106-e784-4d39-8ef1-4be202a5a01c	2023-08-21	Walmart	146.12	Uncategorized	\N	f	{}	3d7cf80320acc7bf3785a06d551f01b89ee8ad417cc1defc5987ad760e37021a	f	\N	\N
d1ef32e9-9a02-44f3-8dac-990ca9b492d5	2023-08-20	Pappas Restaurant	65.00	Uncategorized	\N	f	{}	4c2ab949606b83783fcdb830908036a3e7c1e061ebbcfdb4b079789849155faf	f	\N	\N
6aeeae46-51b1-471a-bc41-adfe24a72bf4	2023-08-21	Cracker Barrel	46.74	Uncategorized	\N	f	{}	aa3dec9a2945fbbc51b339c017037a227738769f34d86f8ecea4b0062fac3852	f	\N	\N
b712a41e-8ad0-44e0-82f3-dba22c268ccb	2023-08-21	BP Global	41.40	Uncategorized	\N	f	{}	0d1d9bfbb620f5006fc8ecc67009acd4a3f87d7d45d36bb1a2f516a08f253e65	f	\N	\N
f94fbbca-b5bb-4e2b-b8d2-09a6a4499fc1	2023-08-21	Nintendo	4.76	Uncategorized	\N	f	{}	5c2ebd8195f0389ab113ad8ac8b9f208804eed819ecc24b66c0cd2015d0b6868	f	\N	\N
22b37d9f-3b1b-413c-a66c-a49372918a6a	2023-08-21	Nintendo	3.80	Uncategorized	\N	f	{}	c14bb0abc2c6dddf7436407975b0b48ef3243240473514b02f7be5526fe01494	f	\N	\N
10093e35-223b-4db8-901b-6d611d810a07	2023-08-21	ATM Rebate	-7.00	Uncategorized	\N	f	{}	74b869a9ed90d7ffb92bdf9136b574bb18c5314282eea8ee127b44bcc9fd3f63	f	\N	\N
2e7a1a9d-ecb3-44ef-8265-de4e11bf42b5	2023-08-21	Venmo Transfer	225.00	Uncategorized	\N	f	{}	aa69f1cde2b8d80c1e7bb94e90a071d1be77e185fab953f2d55993ce44895ffc	f	\N	\N
82c225fe-3107-440e-aa7f-ea0e10fa9bf5	2023-08-21	Venmo Transfer	33.00	Uncategorized	\N	f	{}	f4b7494c11f798c7831f575c6d3a43722b473cb7e4fcc3c8e678cfccd31b2f5c	f	\N	\N
6ff1b2f2-5dbd-4bc7-bf81-142cd8df213d	2023-08-21	Venmo Transfer	1250.00	Uncategorized	\N	f	{}	ea109470b1fb7450409c61f3186a1b951c9d7730a831be62fd3afd7dd8b4d230	f	\N	\N
74c28ee3-22c4-456e-aafd-25900081e347	2023-08-17	Debit- XX 8678 Blvd *nail Haven Odenton MD	160.00	Uncategorized	\N	f	{}	67900c6c373ed429e5fd4d414a9917d9532ecc055686c29aede2b1ee0e166a2c	f	\N	\N
30eced12-7c61-4aa4-8fdd-174689b550c3	2023-08-20	Sam's Club	106.84	Uncategorized	\N	f	{}	80dff8ca1cf6b4e39a21d33abe9c2d32c816b8e0da331e5c202ca656f188ea17	f	\N	\N
550124c5-b09c-4eb7-bc64-23ffcc01d5ed	2023-08-18	Target	80.46	Uncategorized	\N	f	{}	94fda692464a69cd5472b85cab6cdbfed99885468d1c9a657fe8486ff1c22684	f	\N	\N
68dac1d8-27a0-4940-8cfb-b865d34e98cb	2023-08-18	Sam's Club	54.66	Uncategorized	\N	f	{}	052194fa3278ec3b8e65aa99d08be12e543d0368241763d9be6e01653eee01a9	f	\N	\N
aeb7fcf7-9342-4820-ad72-b17d097279af	2023-08-19	Dunkin' Donuts	51.35	Uncategorized	\N	f	{}	20e5fea42c2554e930aec8dd1b1e0f8d90c5f01375478516887f838c76d97e3e	f	\N	\N
7516df4c-e296-415a-a0c0-a29548039740	2023-08-18	Best Cleaners	42.80	Uncategorized	\N	f	{}	f22442d210ed196fbbbb7d3e6a28846b7e4d8f563b0156da5f25dfb2d250ac0d	f	\N	\N
c93e3fa6-13a9-4eaa-a191-802f2d0a79c3	2023-08-20	Ledo Pizza	20.00	Uncategorized	\N	f	{}	18e24f76dcf4d70252cfd3a914815fd168cfff26677a04f37caff088d880f737	f	\N	\N
ebd83075-9df0-42c4-9196-b4933c236dc2	2023-08-20	Sam's Club	14.30	Uncategorized	\N	f	{}	a0cd66baa6c5df7574311f6c011a355eff7623fe970e0deaaa72fc950191f2f8	f	\N	\N
cf303bb4-93ac-4ee7-bd10-00da2a8aa3ff	2023-08-20	7-Eleven	12.58	Uncategorized	\N	f	{}	01b4cb11c0970df708973467938051cbabe6889a5f00bf0202950941d546d449	f	\N	\N
aa23becc-1e1e-4188-9b10-ed48b3127c58	2023-08-18	Target	11.87	Uncategorized	\N	f	{}	49e02fe8e3633124605833691bb23d81476bc95b094415399488d34d3177b834	f	\N	\N
b1249bcc-5ca1-42f8-b8cc-cfab5d4717b7	2023-08-18	Chick-fil-A	9.17	Uncategorized	\N	f	{}	8d1406195dc34ce285054f5f9273339dd65aa60d8d585383b2354e28285f0912	f	\N	\N
064c3285-1d08-4f5d-b094-da68ac0ed087	2023-08-20	Walmart	8.85	Uncategorized	\N	f	{}	d5f881161560abb3b2189ee4bdad4159714f788676fe08ff5c0c60e6d1393446	f	\N	\N
fb523773-9232-4c04-9c5b-f15bd5e9c85e	2023-08-19	Apple	7.99	Uncategorized	\N	f	{}	222968f5e3ca50fa247af8c075549bbf7f35c2c594b2122cd23de3251fb6d575	f	\N	\N
300d2966-1ff5-496b-a64a-ce853a1c9137	2023-08-21	Transfer	-13587.00	Uncategorized	\N	f	{}	241b7c115a578a7e8f91848fab6c0e61baebce71bea6007b64b8f16722205538	f	\N	\N
b0aae420-64e1-457b-a80d-f1846e3f95d9	2023-08-17	Grammarly's	152.64	Uncategorized	\N	f	{}	e9a5c4b32571b38e0124bf062d1e17b155286ccccb283d1f32b538b7a21149b8	f	\N	\N
8fe1a056-d34c-42a9-a97f-69e25b60644a	2023-08-17	Sam's Club	31.60	Uncategorized	\N	f	{}	ffc7161a52cf245e8f4322711f589bbc8c1c6e1b82cf9a295e5b79a718e87ffc	f	\N	\N
3959178c-b798-4ef9-bdea-e7b4ddfc248f	2023-08-17	Panera Bread	6.72	Uncategorized	\N	f	{}	0ce2edb3bbe2351970a6a311f0baff399f133d1110ca2ec30e839b8ec00c20b9	f	\N	\N
7cae0792-8021-4546-a690-17530901e479	2023-08-18	Deposit	-1750.00	Uncategorized	\N	f	{}	653c13913eecb4ea1b10f9c15c588834e0b30e60ba39244f7f87799ee44fb731	f	\N	\N
78f86b5a-369c-4ccd-a9de-5d3aa10bf0d5	2023-08-17	Discover Bank Credit Card Payment	98.75	Uncategorized	\N	f	{}	54a75133f482ec8ddcf7f0be79798e808ff2816bd026a382ec203350f2bccfe7	f	\N	\N
7b46cb48-27b2-486d-9ad1-c8bcc38a1c30	2023-08-17	Venmo Transfer	500.00	Uncategorized	\N	f	{}	1e24fad255e70a024115fa205e768dbd397bc46c8dcfebe64e5d9d10ecac45bf	f	\N	\N
6fb613d6-daa5-45ce-8aea-8708ddf2ec67	2023-08-16	Debit- XX 8678 Sq *blue Iris Flow Catonsville MD	433.65	Uncategorized	\N	f	{}	1da7ac28c982625919e12d013f7eb3eaec3b02fcb60856eb5936eb8c487d37be	f	\N	\N
e3b62357-14b3-4830-b6b4-50964b6eba6c	2023-08-16	Zelle Transfer	200.00	Uncategorized	\N	f	{}	2f8babf17ef1b2faeae2d4ab0b421fb8ad50bf01c439ddb60e3b888e19d217fb	f	\N	\N
d1fd5a8c-d3e3-40a8-9a54-2d9e7c254936	2023-08-16	Bagels 'n Grinds	31.98	Uncategorized	\N	f	{}	6fe83ca50f9edc0bfce9220ae2ba6c5bba129c7667b3a9ffe64dd975f8ac335d	f	\N	\N
d1dfddfd-594f-49fa-88ec-9d3c60311f26	2023-08-16	Chipotle Mexican Grill	18.08	Uncategorized	\N	f	{}	19631c00f3e30f5fd7ae03a6526184c552657a614f2e7cef44b65015ac04b1ea	f	\N	\N
a4906a1e-7578-46e4-b6d5-359cb14226eb	2023-08-16	Toyota	900.00	Uncategorized	\N	f	{}	822574f65c41b241d091812c1e326ef8e09a48f1e1f9a07e34d56000a6c80f53	f	\N	\N
09f95a48-fd12-44f5-8e2f-363ecd344fa8	2023-08-15	Gianni's Pizza	23.09	Uncategorized	\N	f	{}	ef21f2a2a6b103accf30cb53067b8b7e9ba0997cc95b9c31698fea0be19d653b	f	\N	\N
35d92e03-8aa5-43f2-bdba-2905d11b430f	2023-08-15	Debit- XX 6114 Pp*superstar Card Baltimore MD	21.20	Uncategorized	\N	f	{}	6e464e4e195f5805a6981bf47ee746b8e5122541343d938f73bebbada6ba870c	f	\N	\N
aebb4f5b-35fd-4a04-9a63-2bd3a255f5f5	2023-08-15	Bagels 'n Grinds	15.26	Uncategorized	\N	f	{}	313ab5adc0f2d5eb21af2b86530cf51db13c78a92371e0ec700e3123b0634c0e	f	\N	\N
0f9b03df-c659-4410-9c49-79ac2af5daae	2023-08-15	Bagels 'n Grinds	11.11	Uncategorized	\N	f	{}	046399101923e6ccf65bf4b0ead3c1008f77121ce7b10a920bfea000a92c642b	f	\N	\N
d7169ed4-fa92-4278-af2e-b4386efed180	2023-08-15	CVS Pharmacy	7.65	Uncategorized	\N	f	{}	ad4475494d447e375089e254f55afaaf4abb1f2eb58b9a99c4228c31ff893ab2	f	\N	\N
7c13646f-8a8e-4357-8611-ba6e082911fd	2023-08-16	ATM/Cash Withdrawal	400.00	Uncategorized	\N	f	{}	0717f0cfcd5569b55d50ce0a975412a2f41b7483b4e664728183454851d02f41	f	\N	\N
15253ee4-8ec2-4d3a-b7ff-639e2e59fe10	2023-08-16	Payment by Check	125.00	Uncategorized	\N	f	{}	d911b212ddde968310665962129d74e34e306a4379f28209b917cc8ad4baf9f0	f	\N	\N
84b2c6ea-7d38-4871-91d6-302c5cacb7de	2023-08-15	ACH Debit - Best Egg  Payment 9100001	1338.03	Uncategorized	\N	f	{}	3a79a38974cfdab0f76e16a51b4df8a2383712833b705fd4ec4ffb1ea40399d5	f	\N	\N
90548b28-88cf-4206-989b-8d486d4ab0f8	2023-08-14	Verizon	49.99	Uncategorized	\N	f	{}	d7ee624fb95292724f01f5dc4b45e77bdc1bbe96c4a57706766675ddd067c174	f	\N	\N
3ddd93e4-0923-48e0-9b91-814e9b2b6334	2023-08-12	Costco	154.24	Uncategorized	\N	f	{}	25410b72bbd9b8770641235fc47c4376bbb0c5cb8b6b8d4c512c43fc154d504d	f	\N	\N
7a3c0f0f-df2e-4475-8e84-68d9c113986d	2023-08-11	Kate Spade	94.34	Uncategorized	\N	f	{}	7ff01f341920b0c14045a4de7bfa6b017314aadb02a5eda603c6d33418e432e4	f	\N	\N
2c968400-696c-4d06-b013-cbda95a11dc3	2023-08-11	Sam's Club	30.43	Uncategorized	\N	f	{}	6e6388fc4358882cb94f8897e5413b894615c5556d83c4c8f51599dfcb770789	f	\N	\N
b36d8afc-1f58-40cb-8a9e-97d55c9e6f1d	2023-08-13	Nintendo	10.59	Uncategorized	\N	f	{}	e11136c3ef2908eccdbf1c2c8a58a14516cb1c4be08e9e6365423f6fee65d659	f	\N	\N
976fcdf9-8fe1-49d3-aafe-74fe213157c6	2023-08-12	Premium Parking	2.00	Uncategorized	\N	f	{}	81e19c73e8c8c4c0ef2d3e1b38cbe50d0be7e1c073b3090a6c19f72a5e1c9777	f	\N	\N
f7fe2c51-9278-4e85-bfe4-b052c030731c	2023-08-14	Microsoft Deposit	-4809.17	Uncategorized	\N	f	{}	e77cd31ca10ec27551ac5e389205b403a71857fbae329b3f81808cb1a5027942	f	\N	\N
a2662d91-4a54-459e-8879-424adfe11fad	2023-08-14	Deposit	-396.95	Uncategorized	\N	f	{}	0e6d7f0225658c3bf1a04d1d98937b4f0d08bbc6b53f2acbf6737995bb7b0883	f	\N	\N
2d1c8db2-9265-45f5-ae68-8f53f221e279	2023-08-11	Old Navy Refund	-154.98	Uncategorized	\N	f	{}	346d877c82ef3ed55031f7c8656daad0ef8482c59ded1c87e977e157989a84c8	f	\N	\N
00ab7b0d-3ba9-455c-af86-81f47477562a	2023-08-10	Rita's	5.71	Uncategorized	\N	f	{}	acb737641f78e383ce3237d547060053140e0fdf5f11055b6a6e2bea22a98c1f	f	\N	\N
00f7809f-c020-42c1-8e46-a2a2bc02025b	2023-08-07	Starbucks	11.71	Uncategorized	\N	f	{}	c26f9cd621d318bd7fe36e2df305019992c08e4a850c6e067b48a8982a8efd2b	f	\N	\N
a1e93c51-fdca-457d-aefe-2cd1dd7b1cff	2023-08-08	Premium Parking	8.00	Uncategorized	\N	f	{}	a594e27919704f4b382c66e35825c0b363af125bfaea18161a6e68218b17a89f	f	\N	\N
a4673271-6bfa-4567-888a-3cfc1e0a0396	2023-08-09	Giant Food	6.88	Uncategorized	\N	f	{}	a78b3347b3f96fd36fe67fb98e6768ac0c5c7e51bf263bc2be575c500fc78f83	f	\N	\N
447c4db9-7606-4de3-8e75-843edc3e9564	2023-08-06	Debit- XX 6114 Wisecare Urgent Ca Pasadena MD	109.27	Uncategorized	\N	f	{}	cc569685b146d04c0b0a0c6c0ecd8528570f01b45b70c2c1fe582f299a01724c	f	\N	\N
8083768a-2cec-4340-b908-8748e18c5f0d	2023-08-06	Debit- XX 6114 Tst* Conrads Crabs Parkville MD	68.50	Uncategorized	\N	f	{}	9c75a77b0ce8cd73e47d44732c6cbc39ed6bcb5b68e6dee3f6e0217b358066fc	f	\N	\N
083abe88-9c34-4213-a9a7-0a337b5440b2	2023-08-07	Ledo Pizza	23.03	Uncategorized	\N	f	{}	cbd89a6cdfca3e3b76ebd939d821cf16612a3a7f86e49685b210a7f636356723	f	\N	\N
b7ccfb4f-b1aa-4bcf-8bdc-601c45398960	2023-08-07	7-Eleven	15.57	Uncategorized	\N	f	{}	18c409e82c42e999076faf7f2c62e863f054ef2ea015264fd43273c25010d84c	f	\N	\N
538df6ac-12dc-48a0-8491-02ee272d87a4	2023-08-07	7-Eleven	10.63	Uncategorized	\N	f	{}	fb0a9344d6af685bda39ae9be8b0d90e98c96ccfa4c56874a24990aea0da3180	f	\N	\N
34ecc63d-190e-4f0c-b54c-4c8ce0e389f4	2023-08-07	Venmo Transfer	70.00	Uncategorized	\N	f	{}	dd77d813c9b329e70566dfb20ecf5529fbbd4daa04e419b7262ec604dc1c3924	f	\N	\N
9c71714b-d0ae-4063-8136-7feeba626a60	2023-08-07	Venmo Transfer	10.00	Uncategorized	\N	f	{}	f2b1e5555f20b37e8fe48122ca3eeb88b4daf21a4962487a07f163e126d81430	f	\N	\N
ab334845-fe2c-448b-a1dc-b9742935c0c6	2023-08-04	Sunglass Hut	361.16	Uncategorized	\N	f	{}	842386142608169c1def479941ebea36b7eee79f790a3ac660dbb5f87388ae37	f	\N	\N
8d7064cc-7aad-4fbb-b42e-4b38168403ad	2023-08-04	Kate Spade	341.21	Uncategorized	\N	f	{}	a5a48781849be4d04d0b7ae71201ccc631453b4d618e115798683453d5f1ffd7	f	\N	\N
fc7b29e5-cc5d-493b-87d4-14a4554391ac	2023-08-04	Old Navy	143.60	Uncategorized	\N	f	{}	3d40e1e3718e48973e6c4dbce8389e46e7842014726d8306d69fb0e21879cbcd	f	\N	\N
b41e4b0b-3381-4cdd-993d-3a62ffa66740	2023-08-04	Target	94.63	Uncategorized	\N	f	{}	02c63bcd28b24ea19917880cc78d29ee32d8d518c461313a8cb71db80380902d	f	\N	\N
280db273-7272-4de4-8441-9696ff4f6de2	2023-08-04	Debit- XX 8678 Ls Shepherdstown L XX9780 WV	89.48	Uncategorized	\N	f	{}	6ee7db5f5574863ab82ddf354709db7d95295b0dce5d283d5de4beee864d06cc	f	\N	\N
9d946e1e-8464-45cf-8561-de65e9aba06c	2023-08-04	Old Navy	50.88	Uncategorized	\N	f	{}	0fa7249d858546818e2598f94b5557c797d45e3b761ef114632dfa3328049900	f	\N	\N
79954a5c-0e12-4b79-b5f9-5fe5cb32990a	2023-08-05	LA Fitness	39.99	Uncategorized	\N	f	{}	1f645fee55526496a4fcfcc1b2bb90ecda51e84f1ba0790d600c9879c42e468a	f	\N	\N
1721c0ed-eac2-4f71-a063-dbe719e8b957	2023-08-06	Popeyes Louisiana Kitchen	29.96	Uncategorized	\N	f	{}	5dbe6548a979f1b72fb1f775cf453206b1d15e4182a40721207df0f86e6c5d98	f	\N	\N
f2c0f740-c12e-4366-a207-c837c0560632	2023-08-04	Sam's Club	18.15	Uncategorized	\N	f	{}	f4741af8f2cbe94e409578b4b15295993e7a6c3bd41f63fb0645bc9adcb34081	f	\N	\N
500bffc5-9f3e-4960-87a1-27d1ab8a399f	2023-08-03	KELSEY'S	18.02	Uncategorized	\N	f	{}	a9a56bc8a8fdd41889166aef9f5e577e2a2ffa8c71ff4358fedf82b722f80952	f	\N	\N
3997dd29-cd3c-4a79-96ca-382d3ad0be8e	2023-08-06	European Wax Center	18.00	Uncategorized	\N	f	{}	e8b2977ace3b0fee3d06a742c3cb38b22b942856b36bf78e76743e4c05531e56	f	\N	\N
da7f4807-bf0b-4be2-910e-f2f60a7e421f	2023-08-04	Canton Car Wash	16.00	Uncategorized	\N	f	{}	0b67878b6740d2d27d01575ddec79c41378a94871cdc5f9a4dfee670b1cb7748	f	\N	\N
cc555f1c-0828-412a-a0f9-df368eee6599	2023-08-05	Buffalo Wild Wings	15.71	Uncategorized	\N	f	{}	effcaaa5c0388326a2bfb6998385f7892c322395ee334763bd2ad8e0f8f69fb3	f	\N	\N
575d8d03-7a16-41af-aaca-1abb273cb8a8	2023-08-04	Ulta Beauty	11.91	Uncategorized	\N	f	{}	bd0490ebedfb0cf905a0bd847168c545f76a85b93f11f91bf63b878f4b860d55	f	\N	\N
cf1eca8a-c898-4ed5-ba8a-5caf91ac0c78	2023-08-05	Pos Debit-    6114 6114 Franks Den Glen Burnie MD	8.47	Uncategorized	\N	f	{}	3ffff5111ab2e9f8285e28497a1c05cce8cd14776924e62e3fd7ffcda21ebe13	f	\N	\N
49cc2d3c-759a-4086-8991-b19408eb9249	2023-08-04	Starbucks	5.35	Uncategorized	\N	f	{}	f12c5b9614f6aa0b8316ca7865b58e5ec6833bcb64955553dc6f9edfe3611629	f	\N	\N
aba0cc3e-a4d4-4679-9a43-5371fa654928	2023-08-04	Chick-fil-A	3.49	Uncategorized	\N	f	{}	1b629304778f47dfa90ed01d52d2c48ebe1f7ed7aebc87ec4b806ca194da5933	f	\N	\N
ea49735e-d501-4595-bc34-619822f9b925	2023-08-04	Old Navy Refund	-34.11	Uncategorized	\N	f	{}	c1e9613015e1fd47876a964b449560e5a27b1d8da9116bff9fcb43669d5e7abb	f	\N	\N
4194176e-07de-497a-9e24-84cc0438b253	2023-08-03	Old Navy	205.54	Uncategorized	\N	f	{}	f8f0f0c7e273e11880b39a62fb136ecb2f8cfdb0a4cfff27171b4a9741883a20	f	\N	\N
788b7219-36db-4432-afdc-61fb7e8c9ce2	2023-08-03	AT&T	195.18	Uncategorized	\N	f	{}	7615752a48d68919610051877792a0df0cad86aff5c9c32cc2817c6d1d09a712	f	\N	\N
b0550015-56ce-451f-a21d-7ffc718a923c	2023-08-02	Dell	45.00	Uncategorized	\N	f	{}	49e8b86f7d317a5fd47f3051d873f2841a09cd5f62718e4a43bd75571dee925b	f	\N	\N
008797bb-c422-4172-8eef-32da73679c9f	2023-08-03	Chili's	35.20	Uncategorized	\N	f	{}	4c635047a1a554669c037c93ceaa5cd7166e1e1caf68ff15ccf083ecc38d991c	f	\N	\N
8d7f8dc0-c380-4175-a4ca-5e4bbe303f81	2023-08-03	Bruster's Ice Cream, Inc	25.01	Uncategorized	\N	f	{}	d318e1e1885e47d13f647e9671281c2600c9337dfd1715d6d67330a7eb7aefed	f	\N	\N
3e58db0f-e0c3-42da-a9ab-d700544eb381	2023-08-02	Target	13.78	Uncategorized	\N	f	{}	f57b38aba45359c753d891f3439139bbcf716e89e545bd3197b16732c8bfd31a	f	\N	\N
5d16ca56-36a4-47c7-b51a-141842594905	2023-08-02	Target	0.92	Uncategorized	\N	f	{}	7c8a5babe33bdc213684806a261e4cff4cfa4de4129869ce3dcfb82271b3a1a8	f	\N	\N
6d68deef-2f69-4d6a-889a-8f58ddca7033	2023-08-03	Freedom Mortgage Corporation Home Loan/Mortgage	1957.35	Uncategorized	\N	f	{}	df96bcb771e1a607d8981a862b0a5681bdf1834b20151e48871311e00733691f	f	\N	\N
30707f4c-4698-40a7-9c58-ab8e4f2bb4ed	2023-08-03	- Annearundelcctf Web Pmts XX2468	505.45	Uncategorized	\N	f	{}	1ace14ba5e99574dec2380c35f0102bf4ca20995e649e8cf0db5a88bb08ea030	f	\N	\N
0975925c-5a87-4052-bddc-2a91b17de96c	2023-08-03	Lowe's Credit Card Payment	501.32	Uncategorized	\N	f	{}	f634c2d0ed33220b87f89adc04a6bb48a17b0978cbed06ec52b2d5dd05ebbe45	f	\N	\N
964a8b3e-b3d3-4809-a98f-0a52a2865fac	2023-08-03	Zelle Transfer	250.00	Uncategorized	\N	f	{}	2febc65294c5435bb222bcc0b4c56279c1b7e764db7dd897df22aa80d9a581d4	f	\N	\N
ee3a299c-85b1-40e0-a82b-49cbc42d7fd7	2023-08-02	Sam's Club	43.44	Uncategorized	\N	f	{}	e7c95037d17eb305c91eef02dfb2ca03a9236608c109025569212e900540380d	f	\N	\N
b53f79c9-7a20-424a-a5b8-2d255b55f54d	2023-08-02	Robeks	20.16	Uncategorized	\N	f	{}	29f859d6181c2b03b41d333318167e33d43692516144af0923fe1f607e688da8	f	\N	\N
ad73a710-a872-4fed-95f1-4bd563b25415	2023-08-02	Debit- XX 6114 Chois Chicken & Tr Baltimore MD	18.53	Uncategorized	\N	f	{}	085d030da08c215d9b092e154bc3d6a77bad04158678f271e3e4833d4b28c586	f	\N	\N
e2869527-493b-430c-973e-e41585e27654	2023-08-02	Robeks	4.55	Uncategorized	\N	f	{}	1a193ef57cbb28d7127b7be4d387b327f2c48447df5a97e2f128baff19613b95	f	\N	\N
61801916-f354-4128-a0d5-c0f00656d219	2023-08-02	Apple Card Credit Card Payment	2000.00	Uncategorized	\N	f	{}	70dc424527d559ac42d6516455022432a27cdb4a4896594961ad6937a9f987a0	f	\N	\N
54118436-3bb3-41ce-955e-8c3aef8336d4	2023-08-02	Chase Credit Card Payment	450.00	Uncategorized	\N	f	{}	1a33292eeaf212679c3e3a25e7645175ef9ec1c80c89a22c3998236a3f13b1d7	f	\N	\N
c94a8ec6-931b-407a-8fe0-58655d31f9ac	2023-08-02	Chase Credit Card Payment	100.00	Uncategorized	\N	f	{}	370a9504bf3440746bb0f801fb1cd7df740d9436af918b1e3ae929a8f047f67d	f	\N	\N
62c4a321-94e3-4f26-846c-e9251eb7f7e8	2023-08-01	Debit- XX 6114 K & G New Carrolto New Carrollto MD	95.39	Uncategorized	\N	f	{}	3de78da82b7269a9f9e9d9d8b05d6e218b7d0638d9ce6e5584acf533d8603613	f	\N	\N
a83e17a2-34c9-41fa-ab9d-b3149c7f7c38	2023-08-01	Men's Wearhouse	31.73	Uncategorized	\N	f	{}	47b8b477ddee5c35fdc1b2cd4492f1f017465eb22ea5f35128bf544995e11dfa	f	\N	\N
b86ae5d6-2e70-4cc9-9976-73392ceaa95b	2023-08-01	Rise Up Coffee	13.80	Uncategorized	\N	f	{}	005951414f10c29b2fd70e6c71298695b088ca20ad093b879f5c5acce6707413	f	\N	\N
8225451f-b62c-4792-bd4d-7c20ccef201f	2023-08-01	Bojangles' Famous Chicken 'n Biscuits	9.37	Uncategorized	\N	f	{}	2bca3d7dc10b301612234072305ae625dc03a6158d0f277477132b062677a6ea	f	\N	\N
2bc9b634-a73b-401c-b8ff-1ecd8d49a045	2023-08-02	BP Global	5.00	Uncategorized	\N	f	{}	de6aed04e19a5e5a226eee3a5e2c24c4086f2a30de9318646aabe1f8c1c1b2fb	f	\N	\N
932a680f-dcf7-487c-a863-f264072d0142	2023-08-02	Apple	2.49	Uncategorized	\N	f	{}	1f2cae8b8c186bd9875505a48c96b9de972bb2768f88f2691c129df318a39af5	f	\N	\N
7dab0b2c-480a-4124-b7d0-393139f26cf9	2023-08-01	Baltimore Gas and Electric Company Utilities Payment	198.00	Uncategorized	\N	f	{}	0299259b468c9a047388696589ae77bd0f07abad15b9bfb3f968b2461a8b29aa	f	\N	\N
e61c46a0-3890-4f91-9362-87a77c1fa653	2023-08-01	Credit Card Payment	500.00	Uncategorized	\N	f	{}	46d26bd45a464bc971755cd994e42e759d19e999ea79b8e9f70cb30e7fe8af6e	f	\N	\N
3cb5b554-3107-4473-8df0-e83ecd265e0c	2023-07-31	Venmo Transfer	400.00	Uncategorized	\N	f	{}	0908cc1d7d5d0eb55f760d737ea3805394e300be821cb167541d3697a13fc63b	f	\N	\N
5f872c02-da0d-4abb-a8cb-bb16bb161a0e	2023-07-31	Zazzle	222.97	Uncategorized	\N	f	{}	70d43d0838bc31673ae32c8553b7bcb7ae99d0d81513415ab7a1db7b20360820	f	\N	\N
4433bd80-3b82-4d92-abe9-b881bb82a098	2023-07-31	Popeyes Louisiana Kitchen	111.87	Uncategorized	\N	f	{}	563a409edc9cd06f5b6a69ff74d9cf3fa4fcaceca52a762d89893a35e57ca0df	f	\N	\N
7691a53e-929d-4553-bd9f-5fe570fb6a4a	2023-07-31	Dunkin' Donuts	39.12	Uncategorized	\N	f	{}	13b573f67f58af0c31ed68a0f2a2c72099aac6fb330563b31d16d6fd22b77659	f	\N	\N
cfdebadb-54c1-4559-9fe9-78e4950e30fa	2023-07-31	Debit- XX 6114 Hiphop Baltimore MD	27.54	Uncategorized	\N	f	{}	34c025d38b71598da4db83a5a2f31b67f7f3b9539ba92ec6d4a31b09cce53c77	f	\N	\N
652620c1-ee37-4ea2-84f4-087242caf94e	2023-07-31	Dunkin' Donuts	21.09	Uncategorized	\N	f	{}	284139f93f79e9d6ec39b2a1e98d8939a18c1e8b9e2e222375568d635715e5ea	f	\N	\N
8ea0b410-2eee-40ec-9e69-0ae71f4c9425	2023-07-31	Debit- XX 6114 Security Cmf Gwynn Oak MD US	20.05	Uncategorized	\N	f	{}	af1c2eaf7ddd6bd2da02ed8af5787409c3915f496bdfae26c7f436fac9bf41e4	f	\N	\N
db1a0454-e483-498c-9a81-c5571f4b7b45	2023-07-31	Interest	-1.33	Uncategorized	\N	f	{}	34dcd619bdd197983722e6f4a478c80de7c5888f1306c90c35f772c5f2c6353b	f	\N	\N
82313fbf-1ad3-4dd9-8e30-0d0d0f3d8f7e	2023-07-30	Halfmoon Yoga	220.10	Uncategorized	\N	f	{}	801c6b9f3b145008a8508954f53cda7e1844da7bb5326542b9dad050ef7a054b	f	\N	\N
7067b0f7-f949-49d5-94ff-fc668dc7d567	2023-07-27	Debit- XX 8678 Mva Eservices XX7299 MD	135.00	Uncategorized	\N	f	{}	1c90b51309ad5902a4bca2d0267c44018c330f5cfe51866eadb8fb865f49c4c8	f	\N	\N
3f188588-cde0-4b7e-b2e5-ef2c4ad5803d	2023-07-30	Lakes Jam	109.00	Uncategorized	\N	f	{}	62daee7ae15bc80bc70ddd33fcc9d5e2d2d0c606037a875ad0956128c2197949	f	\N	\N
70d7a6c3-a46a-4ec0-9cab-df39d2d95e8b	2023-07-30	Mi Pueblo	51.00	Uncategorized	\N	f	{}	536d0d5fc3f7de3c38c39ea5d633585e2b63bceea3e12d4a5d59516e4c8a8c43	f	\N	\N
36bafbf3-50ba-4573-951b-96c24f2cf33c	2023-07-30	Regal Cinemas	37.00	Uncategorized	\N	f	{}	249f7e33992871ef4d72d07877544b6eef1b3e43b595ebc41c7b699db4953d4a	f	\N	\N
36ccdaab-32a0-43da-b38c-a47b64b4a021	2023-07-30	Regal Cinemas	26.79	Uncategorized	\N	f	{}	ffda91fdcaa639637755a14105aed82eac04500f974618cdfe10cbb60a76f14e	f	\N	\N
ac0af6bb-32d3-4f2b-a78f-f90cdec9a5bd	2023-07-30	McDonald's	2.75	Uncategorized	\N	f	{}	f6600fe9e5a3267fbff771cf31b852ac0cf82024811946364a2af06a104ae34b	f	\N	\N
009c0d26-a390-434b-8793-003ce74edd43	2023-07-30	Other Charges/Fees	2.20	Uncategorized	\N	f	{}	b7bc555d29eb810580b8e22571f960770d3f6fabeda86dda8542d20faadc7041	f	\N	\N
515c4527-42bc-4b34-ab42-4cff8c3226ef	2023-07-27	Ulta Beauty	122.11	Uncategorized	\N	f	{}	a6a79eddbf3388820391dcf72952fcd5e39badcfe5c918ee349cdc08c8a2b2f1	f	\N	\N
1b721309-4e07-415d-8a48-4a764477e628	2023-07-27	Sephora	51.94	Uncategorized	\N	f	{}	db2e3d73905c4e78204bb11255f1e03185212b9f9acafad293d05081ec477df9	f	\N	\N
57e602de-6e5d-4d8a-8686-8987dd05421d	2023-07-27	Nordstrom Rack	41.72	Uncategorized	\N	f	{}	7e98ee23881b6d8d49a60b89f9ca9dd5db8660bb028831dba4c3936a1cdd629c	f	\N	\N
afcf544f-19b6-4844-8169-ef5582de6da2	2023-07-26	Starbucks	18.49	Uncategorized	\N	f	{}	0dd56ffa991d63f8ee8dd8a5d3bde13cc1e4096080c2d86e496d9e927330f867	f	\N	\N
17dc7f0d-a4cf-4bcd-9dcb-85c67b9c335a	2023-07-26	Royal Farms	7.73	Uncategorized	\N	f	{}	bcd8c28a9ffaa9c1ab72838473d3ab72c6a19869a0e52cfd5ed20bcf71afe8cf	f	\N	\N
4ed645f4-73f4-4234-94b3-15d9611612bf	2023-07-28	Microsoft Deposit	-10675.43	Uncategorized	\N	f	{}	20d67fb6e95bf69a64ba50cce2a9c18f7657a2e45e22e0439f59013075f7629a	f	\N	\N
a4a0ed3b-faa9-4af1-9e31-6f930ae92de9	2023-07-26	Target	46.81	Uncategorized	\N	f	{}	36af42a627a6b046768e1449f55c59a52da3207a75aa167909118d4abfa79042	f	\N	\N
f61dc601-b968-42cd-bf20-ceaf3eff7157	2023-07-25	Love & Salt	17.49	Uncategorized	\N	f	{}	4982cc7029987074309a7399a10d2d185d39a3b9ce650d07846aee90d17df596	f	\N	\N
12411acc-bf3b-4db8-85d4-21a82ba02281	2023-07-26	Weis Markets	11.79	Uncategorized	\N	f	{}	4f9d4652dc906553e921b9661c4a88e3cc53c2a4bd8f5e7b02a19c402b587234	f	\N	\N
d3bb6f54-9e4c-43a7-9905-a35d7b3b3802	2023-07-26	Pos Debit-    8678 8678 Pt Solutions Of Gl Glen Burnie MD	9.00	Uncategorized	\N	f	{}	1352d12c9f852a52373a523145b384078c0764d6dcf21248c34bcffcd75ba9b8	f	\N	\N
c71178c8-2e44-4321-98ff-574c220811b5	2023-07-26	Rita's	6.46	Uncategorized	\N	f	{}	8bc4b47dd70cca02d9fef12dab4d77233a00ced396d153aa8e18017f54084e76	f	\N	\N
e657d655-f5ef-4b5d-a623-1d806c2b5f95	2023-07-25	Auntie Anne's	5.82	Uncategorized	\N	f	{}	e13673867ffe470f319a345158d6cfd8bcbe93429a5a35e17968c257b5a959c8	f	\N	\N
f5d725fa-1f7f-4d0f-9b8b-e5dd5ebf9239	2023-07-26	Target Refund	-24.38	Uncategorized	\N	f	{}	a13e5788f4519aaa7474002e71a63e947dc86a0ab61896132f86bed5258b2135	f	\N	\N
19efed87-cc85-464f-b7a1-840832ade0f0	2023-07-26	New York Life Insurance Payment	616.54	Uncategorized	\N	f	{}	3519b507110c2ef6d65b5f4412ce8ca92987992cab63a3ae7e4bb8c1e09b061b	f	\N	\N
6e1bd3f7-cbb1-4534-b42c-0e53db8aefc1	2023-07-25	Sam's Club	45.95	Uncategorized	\N	f	{}	7382944d436bca5d2e0130c72213cf5f2316ee0b8840a81d8c404df7aef2993b	f	\N	\N
fb7bf45b-e9b5-420f-8a0c-d25fca84a38a	2023-07-25	Tropical Smoothie Cafe	10.99	Uncategorized	\N	f	{}	221bd650a228e266517d16fbf5fe8dc154d8ae7e6bd3a0ddb2ed3f8faa55a627	f	\N	\N
844d9dff-aff8-455b-9264-123818c6b7a6	2023-07-25	ATM/Cash Withdrawal	101.50	Uncategorized	\N	f	{}	5ff9a8d27cb0f4c7909c6879c488c4dd3ead4c207e2865128a85dd31d00e8e5f	f	\N	\N
7233a69a-83a2-4e94-a5b6-fbd6fc15f0ba	2023-07-25	Other Charges/Fees	1.00	Uncategorized	\N	f	{}	3d1d1281e961415969a20ec5b117bc6af16fde1f9db0c21db0616fe70e59e9bd	f	\N	\N
7a17d900-49e2-4e0c-b4f1-9591c12b7d66	2023-07-26	Zelle Transfer	-20.00	Uncategorized	\N	f	{}	2336fbe0bc0f500e5f2e70cf59fffd54b9bbf3e23820f0988888d48bc2e2c331	f	\N	\N
ab638b7d-86e8-4c14-8983-4227fab7b3c4	2023-07-25	Best Egg Loan	537.47	Uncategorized	\N	f	{}	8e9b327cbf1d05d213a835440c4516cd61d19fdf7668209049b8e63f2767705c	f	\N	\N
9cd0418d-a568-42a7-8535-252be8e90987	2023-07-25	Regal Cinemas	37.00	Uncategorized	\N	f	{}	e05cb07ebe3b35a8871b2ad80ebae668c11c3b978a9a627d4db877786b536b70	f	\N	\N
f071b503-878f-4a8d-bcf7-a7c86578f8e6	2023-07-24	Regal Cinemas	25.94	Uncategorized	\N	f	{}	5dd5ecf7b244ad66e544983b3e7c70c492db16f20a19791a119714b0a70a9412	f	\N	\N
003eae16-734b-41a7-a950-01dbddcf557f	2023-07-23	Giant Food	42.41	Uncategorized	\N	f	{}	67ee4f6583c3074fb07534c1eab662d864a435dc8ebec88c9b637da38d7d69b1	f	\N	\N
31c47fe2-ee4a-403a-a8af-dd31ebf0076a	2023-07-22	Gianni's Pizza	18.00	Uncategorized	\N	f	{}	bd96b75f79fcb944923311aacba73e8cf9ad19d2662f80f6948b95da24a78f69	f	\N	\N
0f4ade8e-76cb-448a-a51b-d167e968a9fa	2023-07-21	Pos Debit-    8678 8678 Pt Solutions Of Gl Glen Burnie MD	9.00	Uncategorized	\N	f	{}	02b736005efd95d88a32081bf18c856348b1d7caea2f7c4b3ae769affc790b22	f	\N	\N
6d479dd4-2cfc-47d2-9004-3e947b94d2e9	2023-07-20	Chick-fil-A	4.86	Uncategorized	\N	f	{}	a139f5c3455ab6f06cbc450fa9d174fbb469a511e38dd25b73ba08e55a08d93a	f	\N	\N
06131a29-0be6-43d9-b8c2-3bef2e9b37e7	2023-07-21	ATM/Cash Withdrawal	23.50	Uncategorized	\N	f	{}	b22f2fbe0755bc6b42c1f3ae98dc6f02438daec7d4baa10c5b1ad03bd01a5dba	f	\N	\N
835fda9a-2891-4283-8604-9858bce23330	2023-07-21	Other Charges/Fees	1.00	Uncategorized	\N	f	{}	2a4b40ee4403205cd428a706cabfa2454d1af3ff9de4e4947b0013374715d483	f	\N	\N
19b2912a-4108-4083-b2c4-134593e9ebfe	2023-07-21	ATM Rebate	-9.00	Uncategorized	\N	f	{}	2b176f75fec861d06db300a1ede7290335688e48deb7645ac8da5374504c9492	f	\N	\N
a40c75aa-c76e-411f-86ff-da127a0948e9	2023-07-20	Debit- XX 8678 Tst* Conrads Crabs Nottingham MD	177.30	Uncategorized	\N	f	{}	d46320737a39999ca0051403a19e0dd333570f572f993339b97c88c603e8afd8	f	\N	\N
c243bfa1-8b22-4526-a241-fec2339270d7	2023-07-20	Harris Teeter	176.42	Uncategorized	\N	f	{}	9389799af2140c2b9b0bd1231a44f0274ca796cb452b3bda588949dae5ac8dfb	f	\N	\N
7176a8cc-0a62-41a8-8cfb-f3f484da3d79	2023-07-19	Debit- XX 6114 Tst* Island Quizin Gwynn Oak MD	27.77	Uncategorized	\N	f	{}	dcf02ff7d93bd6f6c9b7b8fb65b8b374524128058b595edef05c7901ed3de9b4	f	\N	\N
66f4f0fe-607b-4082-b639-0303c458ce37	2023-07-19	Chick-fil-A	14.45	Uncategorized	\N	f	{}	4ee2309ede2fbade776549db6e1f2f3e2db7d1224ae06e1e627b509c13c1daf1	f	\N	\N
ead61b8c-cd73-4a47-9218-7ae5c20a3970	2023-07-20	Credit Card Payment	700.00	Uncategorized	\N	f	{}	845ecff137fbaa8b229d8b9814e7a4dacc20ff23f6676a6649fd2d0e9132d8f2	f	\N	\N
61d1a3a3-48a6-4273-ba2d-d63b6fc9f921	2023-07-19	Sam's Club	41.75	Uncategorized	\N	f	{}	de868c831ae754a291f4ce0c751fe9ad2b330681becc953ba24c1d935aa10d7e	f	\N	\N
fcb1c80a-be0c-494a-9bd0-beabf7de8218	2023-07-18	Debit- XX 8678 Tst* Island Quizin Gwynn Oak MD	20.10	Uncategorized	\N	f	{}	ab9b8716fe235804b3e8f251d34f79e76e74c900210e9fe0ac6b6398e2d4a634	f	\N	\N
f753d6e7-738a-4706-9cb4-9ef76f9c2b88	2023-07-18	Debit- XX 8678 Sp Sun & Lace Httpssunlace. WI	103.00	Uncategorized	\N	f	{}	4f76c8d8221aee4d94d6df2c9b172b5730cd444efc0b7496a7c93bf2deec4331	f	\N	\N
59539e4c-f54a-42f3-9858-d72db06f3a5e	2023-07-18	Giant Food	18.42	Uncategorized	\N	f	{}	0d127adb05a4d13970a87320de8b869d72d08467e04a852de6307361ba38c8ca	f	\N	\N
f7692508-bd0d-4e3a-b7bc-40e4304f5469	2023-07-18	CVS Pharmacy	10.48	Uncategorized	\N	f	{}	266cb07fea2749a0ab32dfbd571332e0e4ff578d17d8791e7c433dc932165ebe	f	\N	\N
7fbcd926-34e5-4a18-b98c-f5e31c049aff	2023-07-17	Chick-fil-A	8.11	Uncategorized	\N	f	{}	d0ce5903390179de910d90436f279fdc379321b2f35870810a616b25e7983f6f	f	\N	\N
5aad5c52-f450-4306-b606-58c0b6c9b9b1	2023-07-18	Apple	7.99	Uncategorized	\N	f	{}	5921479f0df189960315e4150c63bee5647ab3f2c281314d2375576eb29e309b	f	\N	\N
c767df47-6a01-44bd-a81e-91ed788ebc82	2023-07-17	Parking Authority-baltimore	6.00	Uncategorized	\N	f	{}	d708a2c125933f0518cc76ed990292394898d2393976bd19f4b2ad2e4a8181d9	f	\N	\N
ce9d3213-1b2f-4cb8-9dc0-0699be9c0502	2023-07-18	Toyota	900.00	Uncategorized	\N	f	{}	71b55f91fc9bc8d73498a06d34c92bdce3536a3b449016a2888ea34ee3e113d6	f	\N	\N
d5fa481e-9003-4dad-b416-48b2e22a3f39	2023-07-18	Capital One Credit Card Payment	300.00	Uncategorized	\N	f	{}	854c6d3f757bb3464c8443fdc8c4211c07a3fc09710148c35079592810dcf41c	f	\N	\N
0ca87c98-f947-4a60-bc6b-6b8e2d83078b	2023-07-17	Giant Food	40.72	Uncategorized	\N	f	{}	d87205ea0593a1bd6fab9ffbd11edbb2a2b1380e4242f5e55f8fb365c7785055	f	\N	\N
8c365055-f66a-4183-92e0-de8fca4402e5	2023-07-16	Georgia Peach	37.05	Uncategorized	\N	f	{}	9eed6026b34bb4ef4bb8115c0c9c1b3756c6effa873d04d12f2437baff3462e6	f	\N	\N
cb52b307-fb5e-4f5f-8fb1-bb5af0a88711	2023-07-17	Pos Debit-    8678 8678 Pt Solutions Of Gl Glen Burnie MD	34.00	Uncategorized	\N	f	{}	199171c1c60fcbef46045377eb025f65fdae2d75f28b5a70cf75ec1c88a9a702	f	\N	\N
545c2dbe-997f-4730-8472-5a64ca928ce2	2023-07-17	Rite Aid	20.90	Uncategorized	\N	f	{}	acfc22f637992b55266945b88f9d33360fdcbb1ea7842cfbaee9d153d55daa57	f	\N	\N
914061b4-1689-44b4-92ec-db9d9ad0dd7e	2023-07-17	ATM/Cash Withdrawal	200.00	Uncategorized	\N	f	{}	c74a48bd7464488796deaa6679d8bea7d157b2b2e93927f5dcdd9b3a6b547363	f	\N	\N
a8ea18fa-0301-40bf-9c36-c6079b503da0	2023-07-17	Discover Bank Credit Card Payment	600.00	Uncategorized	\N	f	{}	616d25e58181c73afd977c0763ea35d336e8db30d5bbd31bac27324302fc88f1	f	\N	\N
beb47668-ecfa-45cb-8d16-bed019b1b4b2	2023-07-17	Venmo Transfer	62.00	Uncategorized	\N	f	{}	10a505cc2623e125fd390ca797d4bf56970a5f4390ab2a541cb68fa730345df7	f	\N	\N
50669903-f0db-4f1a-aa25-06b214d07d0a	2023-07-16	Debit- XX 6114 Zelle*leslie Geat Visa Direct AZ US	200.00	Uncategorized	\N	f	{}	f4a46ec8e5622f6efbaceeb38387c6b90831af0c31d44af4a9b344f4b99d7e67	f	\N	\N
acf0f34a-ba64-4fb0-b2f0-97b24d6b0ee4	2023-07-16	Target	112.46	Uncategorized	\N	f	{}	3d87d5183ea1aeb35312947a0a1c3d28bffe38aa67a9b7cd780747fea7ed29e0	f	\N	\N
f95bb13b-1045-42d5-807b-9f206e62532a	2023-07-15	Whole Foods Market	62.34	Uncategorized	\N	f	{}	07025d12a720e14b82056411e93b4bb6e001e1fc75643df5ac56c4b22cf51add	f	\N	\N
cd09faf1-1cfe-4e3f-b0a6-14df5305f0f8	2023-07-15	Target	59.08	Uncategorized	\N	f	{}	47134027901fcb7244207d0bd70cd903348c18291d7977b7b2b16acc49683b8c	f	\N	\N
fb272296-dd7e-4bc8-bc85-84dd4dce7ccf	2023-07-15	Debit- XX 6114 Tst* Conrads Crabs Parkville MD	48.50	Uncategorized	\N	f	{}	59a2cb762bcb38cf07c149bfaedaf3c64a1cd4dc16aa8d9e0cdf3648947179f6	f	\N	\N
05030d05-623e-4e34-8fb9-2f87e4ea866f	2023-07-13	Debit- XX 6114 Greenspring Cafe Baltimore MD	43.07	Uncategorized	\N	f	{}	a0faf93ff0d0e0e70ffad9fdaba2879ab12b19c19b8176c60add086a695d6818	f	\N	\N
ea80502f-06aa-4fe3-b58c-35eb8185f01d	2023-07-16	Sam's Club	35.85	Uncategorized	\N	f	{}	5f8a86d04ee5892bb8cfde458daaf1b9a74377b2e56b157117cac67a73629907	f	\N	\N
f4f71096-7801-40c8-b0af-99ee7eddd78a	2023-07-15	European Wax Center	20.00	Uncategorized	\N	f	{}	576f5b4c059d002e8a086644ab065fba3b1bafa9b3901848e2abe35f1d2b66f5	f	\N	\N
f79a2569-e536-4fc2-8909-52cb44704627	2023-07-15	Debit- XX 8678 Sq *pure Green Col Columbia MD	13.72	Uncategorized	\N	f	{}	24852a4c558cbee4a4fa96fd6033cf37bd1c9dd01d478b67d0bed68f4a81daab	f	\N	\N
87fa20db-2c9d-44a1-804f-563129178499	2023-07-16	Popeyes Louisiana Kitchen	12.18	Uncategorized	\N	f	{}	e548e700a80e7bf14e5c0f21610fdf49c3c0fe787da93d74809917862c41f012	f	\N	\N
09a76748-9e65-48fa-a4cb-6ac86262f8bf	2023-07-13	Debit- XX 6114 Greenspring Cafe Baltimore MD	11.44	Uncategorized	\N	f	{}	007ef92d92eabacc1efbb99e4f326191e03da90983ba94f13c5092fbadf280de	f	\N	\N
1bb25393-2e19-4558-a058-1d4bc51a10da	2023-07-16	McDonald's	7.55	Uncategorized	\N	f	{}	3b87bdfc05ed93c8cfb85774ca282e86910bca261f0d343844d866c34e72f745	f	\N	\N
c46b5116-5f7b-4a52-808f-f64da9abdd5d	2023-07-14	Best Egg Loan	1338.03	Uncategorized	\N	f	{}	20fbc96ee6778e89d4dce1119432db2c629e5e3c8fd20660360e343b3f2f518d	f	\N	\N
51e69839-b6ff-40b4-8014-4e4504d784e9	2023-07-13	Peking Court	35.46	Uncategorized	\N	f	{}	5e2624b10929289a0dbc82b8198110c09233cf594fda0cb5916f722174763b64	f	\N	\N
fdeecff3-7f14-4afd-94cc-e32ad0229c0a	2023-07-13	Debit- XX 8678 Fsp*sinai Hospital Baltimore MD	14.00	Uncategorized	\N	f	{}	e6458b1d71a73199301e90f907889fff41b130d2235c6fbfae0a3baef113d362	f	\N	\N
dfcbaa03-b07c-4e47-9837-53abfdd5f4bd	2023-07-13	Debit- XX 6114 Fsp*sinai Hospital Baltimore MD	5.00	Uncategorized	\N	f	{}	4110e267fda4f908f8a3e0825bd335ea3ad52ba3045e571da41de36f7dc2e6d8	f	\N	\N
bfd12a13-9102-4347-8b08-0919be5c87c0	2023-07-13	Debit- XX 6114 Fsp*sinai Hospital Baltimore MD	4.00	Uncategorized	\N	f	{}	c170d4bd6b6cfea175f6c74c8d54acf99e53f557f4893b813e0c38f06bef971c	f	\N	\N
82f03c67-d1fa-4d9d-af2e-0347acc87789	2023-07-12	Bella Roma	136.01	Uncategorized	\N	f	{}	170c5ed3b6e257080e670a789588736ae90f69041f478b7e74c83c71270d2fdb	f	\N	\N
cec98318-9dc4-41f1-8beb-c0d8812a403c	2023-07-12	Target	80.55	Uncategorized	\N	f	{}	ae260224b37544b55fe7c3b967799cee3d12dae487ab3faf23d9076c6a31f91a	f	\N	\N
791cf1dd-38fa-4167-a330-d8904b02c3f7	2023-07-11	Chick-fil-A	17.11	Uncategorized	\N	f	{}	f41b263c21c4304b4b2b769bda39d48a7bb3c6a52e5b081a8db1d1d9d483a203	f	\N	\N
9929e08c-79d1-4fc6-851f-c9f569fa5ffa	2023-07-12	Target	16.64	Uncategorized	\N	f	{}	7fb1124c0ebefd5625c3e5d0a5d5961c90669f1c5fc2ce2fec328adeba6672df	f	\N	\N
17fdf7cc-08f8-4bd9-a0fe-039710d6d5eb	2023-07-13	Subway	12.37	Uncategorized	\N	f	{}	01a953cae9ab6e4df0614f6ddc611252387819148cd1669dce81ebbd18b0c09b	f	\N	\N
075ba7b2-465c-4611-96c3-aba6f69eeee9	2023-07-12	Target	10.86	Uncategorized	\N	f	{}	5fc4255d156c7651b2d512e9cd8935e1eadca6d3fb44a97ecd8e6aa90d1e95f9	f	\N	\N
6a360674-1ddd-46a7-8f0f-6b7fdb19ef31	2023-07-11	Debit- XX 8678 Fsp*sinai Hospital Baltimore MD	10.00	Uncategorized	\N	f	{}	18e4ba5e9f96dcab80924873898c3f1c734ae19c32a3b3efb2bd994e7e4c14fa	f	\N	\N
d88deaf2-cb23-47a8-aeae-d619b7886172	2023-07-13	Quickway Japanese	9.49	Uncategorized	\N	f	{}	217d43cbdfa86eba5a181371ce6f43f28ca8b50889b0bfdb8905423b85352902	f	\N	\N
56a5e63d-65b6-4657-9c7a-ce392ce52454	2023-07-11	Chick-fil-A	6.30	Uncategorized	\N	f	{}	4941164d9294c5e32314bdcba6b37b6c3124ac19cb044014b166b46f6dd254f8	f	\N	\N
ee976b1f-cf6b-443a-a43b-2baf9b8b012d	2023-07-13	Quickway Japanese	2.49	Uncategorized	\N	f	{}	2878c43458b27bb4965004be4b6ed6fd9a159ed9a0474073f12baabfb210a9d7	f	\N	\N
b7692489-bd97-4dbf-9a45-b3733ccc2edd	2023-07-12	ATM/Cash Withdrawal	100.00	Uncategorized	\N	f	{}	42ed01e0c7399849c82b2268e1c2998d6a59c94bed8400b9b3226a18349932c8	f	\N	\N
392e0005-c42b-4462-afb7-4f0bf69045e5	2023-07-13	Microsoft Deposit	-4809.18	Uncategorized	\N	f	{}	06c3216a61cfc8844a05423a627f48b83241739021a173a00b4197ee6ceb626e	f	\N	\N
eac0ff7d-e9ef-40a7-a815-cc4a39428641	2023-07-12	Verizon	49.99	Uncategorized	\N	f	{}	677bc33b9ad1feb32fb27b3a2921f2de2f053166dbd51eaad3ffe99d3d16fb8d	f	\N	\N
5606b828-2393-4e9a-a720-e5c793bb9c74	2023-07-11	Sam's Club	37.85	Uncategorized	\N	f	{}	9b8c3396f1feca5e283946d0cadeea394f74aafcc783b908e16fa6483fbfd49b	f	\N	\N
2aa0ccf1-ebf7-4754-a66b-2d4c8a7db0fe	2023-07-11	McDonald's	35.09	Uncategorized	\N	f	{}	93d66c4c7481af44b0a250442c7702c6d7278519e4415eca15e458b16f47e2df	f	\N	\N
e36885ee-94dd-4879-8fec-09e413eeafa0	2023-07-11	Target	32.83	Uncategorized	\N	f	{}	1e8351efcb33a059bc38759cb982af95942856dc224444b997fb184907a47d19	f	\N	\N
4b1fb5e6-1812-4508-a272-86c64dfcbfa2	2023-07-11	Ulta Beauty	30.00	Uncategorized	\N	f	{}	a2f232477d6d8df70fe7b74d8bc389563b662addacef11a3c60935231d7c1be5	f	\N	\N
9a70fc8a-7722-4e1f-a6cb-826251cbe4e7	2023-07-11	Sandy Pony Donuts	11.20	Uncategorized	\N	f	{}	7e896d2735f1fbf6f1d5c689bbae4f49effbab0aa75c4313011b1414a10a9404	f	\N	\N
6e81aa3b-1d68-41d3-aef6-165f0510fd4d	2023-07-11	Rise Up Coffee	10.74	Uncategorized	\N	f	{}	24d91edba8ae525b955198d6da9c0076a8de055b7b4c47d0eb6c3b78c24fdc0e	f	\N	\N
615852d2-658f-49a1-aaa8-c4f9bd947a70	2023-07-10	Debit- XX 8678 Philadelphia Style Pikesville MD	53.59	Uncategorized	\N	f	{}	a42eb6174d06028960f6e276caec82287e04e2883056cd0693510f4dbd5e7c3f	f	\N	\N
077f4937-977e-4346-9910-c6177870d359	2023-07-10	Peking Court	40.81	Uncategorized	\N	f	{}	790e6370701dc0697b195fa46a336dab3e37c8c9da8cba7f4f0a469ada957033	f	\N	\N
a595e120-0ae0-4f3f-8b0d-f2ed422acf7a	2023-07-10	Dunkin' Donuts	32.89	Uncategorized	\N	f	{}	a7e8e45b0a74c278613881ed12e949276ef44dcf354657af449fd4ead5fe49d0	f	\N	\N
5f248216-8295-4283-9f1c-28dd8dded54d	2023-07-10	Dunkin' Donuts	7.99	Uncategorized	\N	f	{}	ab890b343dd5b3dfa11b452a7f57d9316b61672c4098d698559e66f72f1bd3d8	f	\N	\N
af731aa5-faa4-4cd0-bf3e-d777b8a38463	2023-07-10	McDonald's	7.37	Uncategorized	\N	f	{}	985bd1a5d8d69921b86666f530405c5574405a6c560d34ad1e459358787bc494	f	\N	\N
a10d6421-5ffb-455d-96a1-4dca4a2c7d79	2023-07-09	Debit- XX 6114 Greenspring Cafe Baltimore MD	6.68	Uncategorized	\N	f	{}	4c4cf2761d0820b72329ca8f19f20213a6db6957409026c6fc19ebc393c5f4dd	f	\N	\N
2b2bbac7-ba24-4d29-af79-1b0b5a225ca3	2023-07-09	Debit- XX 6114 Greenspring Cafe Baltimore MD	3.77	Uncategorized	\N	f	{}	1c673cc323fd3540fc51660e379bfbdf9731fae8a20273e7f23c0f8bc84ea1dd	f	\N	\N
d8b35dec-9966-42f1-8999-7241fd89f5ff	2023-07-07	Zelle Transfer	125.00	Uncategorized	\N	f	{}	9d2cf5e5ed7b372e9cc6e8c2e5d0c91abf32eb775f6e1275f1378f8cbc4482c4	f	\N	\N
6c1f81bf-9178-4f2a-b699-9ca2de7cd9ab	2023-07-09	Zelle Transfer	60.00	Uncategorized	\N	f	{}	da951819e7d73d22ae93073a4ab200b7391fd7e8a11cfa2f170e7b4ea7a21884	f	\N	\N
b29d1425-8488-4974-9984-f6148d74334e	2023-07-09	Bella Roma	41.61	Uncategorized	\N	f	{}	136a70722812d70a86d961d71916e0653fe84d3c73b11c7a7d0dbe673151d4a3	f	\N	\N
ebc42e17-9948-4a25-bee7-fb796b6da535	2023-07-08	Chick-fil-A	38.40	Uncategorized	\N	f	{}	d4c13cbf8c4dec433d74714312a8ea7f9008e5e5f467d010738a60c5e254e862	f	\N	\N
403278b4-6006-4383-a5f1-c45bf4fc3a66	2023-07-08	Target	22.88	Uncategorized	\N	f	{}	5cf350b15c4d4dadebc0064bce592c0e2bea4e6cdbb6db07b796c0455ba5fbb4	f	\N	\N
9199711e-735a-4cc2-aa95-d3fe609bff06	2023-07-07	Bella Roma	22.27	Uncategorized	\N	f	{}	2302febc7a3e6c374491f5f25325b99b54f9d04b364aff62c68615a4e839006f	f	\N	\N
e48fbcfd-c553-4dd3-a507-0c5201febc59	2023-07-07	Target	15.74	Uncategorized	\N	f	{}	0aea21ee7391b3786f1cd57094cde72bb54b0f6808ec71f4a1f714a47411967d	f	\N	\N
42049556-ba98-469f-b9db-af7f7ed40c14	2023-07-08	Subway	13.91	Uncategorized	\N	f	{}	26ba52a4cae98e3eef5acb94e4e0a2d58b9a562722dd5fe1a20e6efaf26c52ad	f	\N	\N
6d9d97e6-42e5-4122-a719-6c535eb08937	2023-07-08	CVS Pharmacy	13.84	Uncategorized	\N	f	{}	f09f20b7bf3e5000cb9a8e35a1fcf58f2f801c6ddfc15df73fae8795eafda8c2	f	\N	\N
109c4ad1-205b-4ba0-93ce-33194760540b	2023-07-09	7-Eleven	13.58	Uncategorized	\N	f	{}	82ef4d5082484130db4f243da869537028d436bc397abfb9a20e6d9db1a828f2	f	\N	\N
5f6cdc31-874a-4c71-bab3-16fc326b4766	2023-07-07	Rise Up Coffee	12.51	Uncategorized	\N	f	{}	26d057477d9b48d1ae31bf9c9bb75ec8b0dc441b70dbff6e3dfab4dc8daa4fe3	f	\N	\N
158a7118-90bf-4a3b-9f1b-adf0da9e0a0e	2023-07-07	Debit- XX 6114 Fsp*sinai Hospital Baltimore MD	10.00	Uncategorized	\N	f	{}	cefce96aca914a1e3a38e63f5f6d8830d9779d8ca137cd294541abb8b48a12b5	f	\N	\N
f16e126c-f40f-42c0-b514-5300030913af	2023-07-07	Panera Bread	9.78	Uncategorized	\N	f	{}	f84c5c6dc0f9103a9b4dd004e1bb8a680eaeb8beb3a73ad09949a329afce5d52	f	\N	\N
c41ed274-fe3d-4d9e-b7b8-ae50e1896bfb	2023-07-09	Subway	9.41	Uncategorized	\N	f	{}	26774442691bb0e34bda3b7b82e41b624747e28eacaa5caebc60bbe4c798bb0e	f	\N	\N
b53534ae-c3ba-447b-a9ed-94c8acaf605c	2023-07-07	Pos Debit-    8678 8678 Pt Solutions Of Gl Glen Burnie MD	9.00	Uncategorized	\N	f	{}	36589187d55c12b956c97a71ea2411591cdd67b6a142c521a9a4cb0df7d910d1	f	\N	\N
a6f6c487-0a5a-4aa2-8e03-413b8061a351	2023-07-07	McDonald's	8.67	Uncategorized	\N	f	{}	e35495e2e50bc81ffc8854fc4b809b103807bf83a69d8fa9495ba42e4254a31b	f	\N	\N
023e5cd1-0381-4922-8352-c8a147b6f89d	2023-07-06	Debit- XX 8678 Uppababy Uppababy.com MA	794.99	Uncategorized	\N	f	{}	1c4626bf5efdb50ea13974fd4718c81d089447328b9042ea5722784711268315	f	\N	\N
971b2d66-0bae-4ace-8d75-cc49050f1f60	2023-07-06	Rise Up Coffee	20.00	Uncategorized	\N	f	{}	9081ce4ae93cbd58c379e7d496e9b0cce2421baf7e49f015fef8b84d1164d43d	f	\N	\N
823d9cce-c5bc-4bd9-9c90-ea44228d9532	2023-07-05	Debit- XX 8678 American Wings & P Baltimore MD	13.65	Uncategorized	\N	f	{}	6ff5535348f9362cafebb0bd15ed8e365eb5cbca5e824ee2a5588d172efd6b8c	f	\N	\N
2e7681d5-5727-47d1-ab9d-6f3d09f7223b	2023-07-05	Starbucks	8.64	Uncategorized	\N	f	{}	1f26f9849d5babba54790d94936f4f19eb23e1f16f3d4a179f99431c4a0935d4	f	\N	\N
473438fa-3029-4077-961a-a183237af0b4	2023-07-07	Bruster's Ice Cream, Inc	7.12	Uncategorized	\N	f	{}	420f57aa726295b83be97545d1bbb13197120ecab9c44024bdaa80120c50552d	f	\N	\N
f0dbcea8-61c3-4aa7-93f9-1d4698d79674	2023-07-06	McDonald's	5.39	Uncategorized	\N	f	{}	017417b7b591c85d8c968ecc14b770cf81c6bcb0bb6181cd7b34e11e17c8c725	f	\N	\N
31a9c73b-33a5-4f7a-aaeb-d4b0e8441a9d	2023-07-05	Debit- XX 8678 American Wings & P Baltimore MD	1.25	Uncategorized	\N	f	{}	5ef78a47e1317b15019f88f527519a9afc4ebfa909fbca9ac732e495efb1e366	f	\N	\N
0a62d143-99bd-41de-8e68-b81e78dcb987	2023-07-05	Parking Authority-baltimore	1.00	Uncategorized	\N	f	{}	3b5348ed0f1d88a59ba5a3e9c901a7e6b3ffa67faef4e72cc83f548e4053d3e1	f	\N	\N
a3abe75c-e7d4-4784-a446-ca374534f01c	2023-07-07	Deposit	-605.52	Uncategorized	\N	f	{}	49cc2216143489f149f90ceefe87fb49722e48ccd766bc97b1608aeebf75d492	f	\N	\N
061edeb6-4260-4253-b7ac-f3eeff858fd5	2023-07-05	BJ's Wholesale Club Gas	41.50	Uncategorized	\N	f	{}	22b6c2fee4eef34cfc2e9e4fa7f4b33e58edb7cafe9fd45beb904a8e74b41b50	f	\N	\N
1218a414-ee02-4466-a73a-40fcb0c339ac	2023-07-05	LA Fitness	39.99	Uncategorized	\N	f	{}	686c5c25d0b3a63a8c490e4f045a4995fe809c9597832c747998156f46807c50	f	\N	\N
388a385d-89d8-47af-9c40-f8eda6954319	2023-07-06	Debit- XX 8678 B1 Korean Bbq Baltimore MD	10.91	Uncategorized	\N	f	{}	178385e3e2b18c51a4b1fd59231bd0dd377ba5fe28444113eee68c3d1bdd6b22	f	\N	\N
22eff86c-778a-49ea-b960-92414f992bac	2023-07-05	McDonald's	5.28	Uncategorized	\N	f	{}	36a8c0cbf54296c398df7e860e6e24d0d45818e6df2720fff6f8b82279e1c3da	f	\N	\N
6e65e64e-9880-4331-9c43-ab607f8e6631	2023-07-06	Deposit	-3191.82	Uncategorized	\N	f	{}	6a9a5f927577e37985acf78b49b1cfa75accd9153fbea8b46e6e837783fd4548	f	\N	\N
c2eb86e0-e53b-4e98-9b80-0aef8a7a6ecb	2023-07-05	Chase Credit Card Payment	392.00	Uncategorized	\N	f	{}	a89b3270e8d47ff062dfb63b3a938f29e464dd633464545c48aa0c7d574e64c2	f	\N	\N
900c9d1e-d457-422b-8fd7-e1913fbe5f96	2023-07-05	Chase Credit Card Payment	79.00	Uncategorized	\N	f	{}	7d7856765a180a786d559b8a912f402bf75d0dc74ba1885004b4490c8d3520a1	f	\N	\N
51519987-4f68-41f3-ac5e-a4cd1c0ede44	2023-07-05	Credit Card Payment	497.08	Uncategorized	\N	f	{}	c977a14e3c8a944a2a8b69017e3316187b78fa3d89baad94454007b38048eb47	f	\N	\N
65c4941b-151d-4988-a7a7-136e7ff31ba6	2023-07-03	AT&T	195.23	Uncategorized	\N	f	{}	83f018ccbd2c3e8695c86291b0912aaa63da9cf52d1ba8f902853fc42c13b1ce	f	\N	\N
461d7340-d2c2-4a38-883e-0c6adda41d2e	2023-07-04	Hanna Andersson	177.99	Uncategorized	\N	f	{}	35047a305a863d91a975ee886d2bf5e1d8f06a021171a6538eb48ba77308378b	f	\N	\N
685fb5bf-d082-46ac-89f0-fef9ed1e07e3	2023-07-03	Pos Debit-    6114 6114 Franks Den Glen Burnie MD	34.86	Uncategorized	\N	f	{}	b10dc1b7b2faf9dc0842829af1945ade9e87691b8a11196f683c51da06ec3f82	f	\N	\N
ee6c74f6-51df-4266-b923-73ac8d750950	2023-07-04	Giant Food	20.26	Uncategorized	\N	f	{}	eedb04555855b8aa485ad7014ac70e72160d7f559b00b616eb4387412a3f9b3a	f	\N	\N
8913a194-3700-4891-aa08-e40226824c64	2023-07-03	Target	14.59	Uncategorized	\N	f	{}	e71a1c82dedb33edb879590a9d9b1161959928db8a0a90f56ac9a79edaed4fdc	f	\N	\N
0614b1f5-e719-45e9-b2e5-7f617d412bb9	2023-07-04	Five Guys	11.69	Uncategorized	\N	f	{}	182477c09b89d5d5f7cbff5b89a1f5c1d5bc95d390a3294ac29fbd0dfbfbfb12	f	\N	\N
b192ddae-31d7-4e01-9dae-9519ec9ce2bc	2023-07-03	Wendy's	10.91	Uncategorized	\N	f	{}	8460758e60feafe0d8829e9da7b1dc64d73fadea8b9fc3321602e71a36862774	f	\N	\N
18e4e08e-ef82-4c30-89fa-d4a0e773d467	2023-07-05	Transfer	-1000.00	Uncategorized	\N	f	{}	9da21fcc4632005f3100799182ff2a190287a6796509c27d6c3ef1b3a3c22619	f	\N	\N
01b73091-9c26-4547-9c53-175604f3226f	2023-07-03	Target Refund	-60.18	Uncategorized	\N	f	{}	fe626d3fbfda6d3bcec936faba1508be6d2e36a4a97f28e2f7826148b6aaa5ad	f	\N	\N
ba07f5e4-9367-4df9-a7a5-e82a0f91a8c6	2023-07-05	Zelle Transfer	-3.00	Uncategorized	\N	f	{}	fc3e3dddd71641f34726b2927b4989ed1f587a6117e85c74f8a77bd1f0a11f25	f	\N	\N
53298e65-bc40-4258-9c52-818991b13526	2023-07-03	Freedom Mortgage Corporation Home Loan/Mortgage	1957.35	Uncategorized	\N	f	{}	d9857297abf19935db8534021158754d9b9d3bef55f5cf9f0886b28e7a7dba8e	f	\N	\N
333c759f-0281-4686-8f94-df831b0de334	2023-07-03	Apple Card Credit Card Payment	572.40	Uncategorized	\N	f	{}	d565cf54e3ee5ff4e5e88ad8a570ef62f54764d22e4d7bede2a54cd9c421f4a9	f	\N	\N
dce8cda2-61c8-4e40-baa5-d599c41d0b3f	2023-07-03	Baltimore Gas and Electric Company Utilities Payment	187.98	Uncategorized	\N	f	{}	e346f775904480dce8a97d7fac68a5d2746316f8e12400188ca72bbfe9c21ec8	f	\N	\N
24a917d5-032b-4a7f-9e02-a7d6b2dae96f	2023-06-30	Venmo Transfer	400.00	Uncategorized	\N	f	{}	787323bcebff9faa5c327d25b4d7715dba9530c8e86b66e7fbc6b7b6359ed90f	f	\N	\N
2c68fa51-cb89-4ef1-9b3c-1ad5cb4143e9	2023-07-02	Debit- XX 8678 Sp Goodbuy Gear Httpskidgear. CO	179.13	Uncategorized	\N	f	{}	a6e9dcb374936b0c5d43fb1569610349538e1922c82e69252a56b93923222b2e	f	\N	\N
e96a1adb-f6bb-4f9d-985a-a6a1784e00a1	2023-07-02	Debit- XX 8678 Annearundelco-util XX-1144 MD	112.60	Uncategorized	\N	f	{}	fda2f7682550f5bcbe69ed5aef7095051e14c671f296a819d8e331feab9eb62f	f	\N	\N
d31d63e5-a7e3-416f-a46b-74890936803b	2023-06-30	Chili's	68.01	Uncategorized	\N	f	{}	27ca0d5b3b599d17d9e30c2d5bd99e09b4e1ac1f2ce44165d2f2a2fd9663ccb6	f	\N	\N
705c339e-f467-4a24-90cf-b7bd90c7384e	2023-07-02	Debit- XX 8678 Sp Newton Baby, In Staging.newto NY	64.00	Uncategorized	\N	f	{}	96021cb3cd9eda669346764de77fa93830237667f32065ac4dcc8ff7797f01d7	f	\N	\N
ddba6d26-ff52-4828-97dd-cf439c68f870	2023-07-01	Debit- XX 6114 Jacks Fine Food & Baltimore MD	58.86	Uncategorized	\N	f	{}	bc4e80e4fa70b617003af5912f561d01dddba7360d752163af516de9f0552d6e	f	\N	\N
e26ddfdc-fe50-454d-80a2-d61ba48c7c7d	2023-06-30	Debit- XX 8678 Tst* B-all Thai Ll Baltimore MD	43.46	Uncategorized	\N	f	{}	21ef022de376250125ec74b892e194a2f7a5279a5c2563514e8fd0b29a0b5b01	f	\N	\N
29ad4800-0980-4730-8be5-c5fab9abe747	2023-07-02	Target	22.27	Uncategorized	\N	f	{}	bdb61e4b10419ea846ab25a473feb3b0479e2a7ac5f9b2cc6c5e68e5da71cb8f	f	\N	\N
b0ee300e-4763-4f4e-a8ca-18309baa15b1	2023-07-02	Giant Food	20.13	Uncategorized	\N	f	{}	6a6d10344640b7092b7737f1d075e88f7714acd7b795faf93ed3416b03e7dc84	f	\N	\N
5ea8f293-19c8-40e4-8399-d05dc52edf80	2023-06-30	Pos Debit-    8678 8678 Pt Solutions Of Gl Glen Burnie MD	18.00	Uncategorized	\N	f	{}	9b6602b04a5879beaf135466b894ca76d23047f964c084e952214c67a32813be	f	\N	\N
9e123e45-8047-4192-a174-d108b6700aa6	2023-06-30	Sam's Club	17.90	Uncategorized	\N	f	{}	17f64bad11230302ebd1905e9b5dd556e581052cc32144c81a9f3c97c39497a3	f	\N	\N
0c33d621-af4d-4c18-bf54-5df4e55e87b9	2023-06-30	Target	11.35	Uncategorized	\N	f	{}	f01ac2168767472c5fb136f9bd6672160427febfd607b0a6dd795d7f8398a5fd	f	\N	\N
c169de2c-4133-4e09-8823-a6d1a3cbde2d	2023-07-02	Apple	2.49	Uncategorized	\N	f	{}	75d8303abdbb2bf21472876e355ffbc3e87b5fcc12e35bacf8e16dfef6fdbd89	f	\N	\N
88013d85-e7eb-4c55-a720-126de5c4df5b	2023-06-30	Interest	-0.62	Uncategorized	\N	f	{}	ea55d9d4b5d434f7db7245164e0e25af49a010172b0b2f879369c0b6f880ad73	f	\N	\N
00170272-d6e2-4696-bb41-848199a79726	2023-06-29	Giant Food	19.28	Uncategorized	\N	f	{}	c20c40e5b1e204e7607d13d758f050e30542a18937fbc189a89900a52b44a861	f	\N	\N
05d6b56a-f9ce-4601-a0d4-0b73baaa4f72	2023-06-27	Debit- XX 6114 Tst* The Olive Tre Glen Burnie MD	45.40	Uncategorized	\N	f	{}	6e5529dcda9a183603eb02934e2ba8a1a3ef883c2ff710ee7b5f8efbb6945772	f	\N	\N
2e62cde7-31f4-46cf-a4ea-0cd218b5d327	2023-06-28	Rangoli Restaurant	43.97	Uncategorized	\N	f	{}	c396b4d10e1561cac5ed3cb70336caed7017e9f16fd2e8f8154f7c83cee69383	f	\N	\N
eebfa9de-0649-4e50-9cd3-2a3d5ac594a8	2023-06-28	Ledo Pizza	15.00	Uncategorized	\N	f	{}	8c2a7b4da9496f2f6c6ce2aaafd82b935c3197bfdc679d3665801f4372737d45	f	\N	\N
d1a72279-84d6-444b-aaab-b76480ac0e7c	2023-06-28	Krispy Kreme	11.58	Uncategorized	\N	f	{}	e6df47eacd447ef67792de3a4658de46094ec00917a508220e10335c15149997	f	\N	\N
7e5737d9-7659-460a-b044-c67fde922e97	2023-06-29	Microsoft Deposit	-4809.18	Uncategorized	\N	f	{}	f6d718a6b45f617964dbc24543714ac090b0e43f002109da606cf30d600223a2	f	\N	\N
aed56d2e-91bc-40eb-839b-56da472de777	2023-06-27	Target	93.97	Uncategorized	\N	f	{}	9bb22abd229db4e56f9fd4591454d101452ba7487df64492d203f31348a44a41	f	\N	\N
3f4e2ef8-9442-4a78-a77e-cd0a8669ce93	2023-06-27	Target	4.58	Uncategorized	\N	f	{}	18968ba1b30e364e0d81f0a9e2a03404c64940970daa50cdf45140921283fd18	f	\N	\N
77513436-f404-4dcb-bf77-03a58b1b27cb	2023-06-27	Target	0.92	Uncategorized	\N	f	{}	76b0e7a54e4688c757871e5ac8555a8ad429cbe9e0c8c8444f675e540f7e13cc	f	\N	\N
8018f219-72a1-412e-8308-f18ce044aea2	2023-06-26	Giant Food	40.68	Uncategorized	\N	f	{}	95d92f8669f8813670b74ba04261494b6032047a10789f851d6b2374f8233a43	f	\N	\N
692fa634-9dd7-4aee-8c1e-683137395c94	2023-06-26	Rangoli Restaurant	24.98	Uncategorized	\N	f	{}	bc35c5c35146a74687caa3b28b859df86c3e0e339438014cb80856ca3b5d0b6a	f	\N	\N
cafa7c40-543f-4957-8950-2896d33a9206	2023-06-24	Five Guys	28.41	Uncategorized	\N	f	{}	5339da76ee9289f28c462b5d29e3b0012e1737b9d5a9ffe68e9198fea94d8601	f	\N	\N
7063bfed-e967-4547-bdae-fe712226fa64	2023-06-25	Debit- XX 6114 Mali Thai Glen Burnie MD	19.00	Uncategorized	\N	f	{}	63cd680aadc9948f301692267f53af477f76a495cf9100a0c3778f8990c923fb	f	\N	\N
280927b5-032c-4fa5-b189-8e0badbb317a	2023-06-25	Bruster's Ice Cream, Inc	12.04	Uncategorized	\N	f	{}	af5deda42c921cf319d0e9e72f3127669b81598b54f1816a4f47cfaef58e874e	f	\N	\N
065c6c6d-7941-4e92-b1b5-67e7a17562e5	2023-06-23	Five Guys	9.86	Uncategorized	\N	f	{}	7bc3bcc87d01e0a5b7ab22fd2c40041c0705f83a9bb7b1d77ef2d97a43b11514	f	\N	\N
cf9d5086-67ad-418f-a699-8ab279f7bca6	2023-06-24	McDonald's	9.71	Uncategorized	\N	f	{}	694652130503248750df7523e41b64ff908ada98a570bb0afd8629d4d08b168b	f	\N	\N
a70c5462-09a9-4e56-952c-02a19a04f220	2023-06-23	Starbucks	7.31	Uncategorized	\N	f	{}	080a05d3f5e976d44fa7d3f30a9eba34245aa97e56363cc1ef6e7d57fdb622c2	f	\N	\N
dd558ff6-62ae-433b-91ce-e74f71996abd	2023-06-22	Safeway	3.38	Uncategorized	\N	f	{}	a9f39c8f4f52ebe05a7fdc112ac1d3ca4122724b785e90c6742f236ae30c7203	f	\N	\N
81c1e268-7cd1-4df3-be0f-0f14b25d0f44	2023-06-26	Transfer	-1000.00	Uncategorized	\N	f	{}	d6fa87ceab7a645753cde32b235ea6e3acbe43182ce533e513ed9da9e730ccf3	f	\N	\N
1c2a89fd-2f9a-4428-a873-62e34ca49546	2023-06-23	Best Egg Loan	537.47	Uncategorized	\N	f	{}	d44ea39d607ab49072ff4130903266592d3916c484eebc2a25166fb544daeeb9	f	\N	\N
a85d43ce-1dc7-4f1e-b0ae-8b36032624b1	2023-06-22	Zelle Transfer	75.00	Uncategorized	\N	f	{}	521e3c9202c85f15171a2577e03792039812030666371f7498158a40f69af2fc	f	\N	\N
54a6290d-db90-4c40-a180-acaf69c77be5	2023-06-22	The Home Depot	21.16	Uncategorized	\N	f	{}	4a44f72aaf904251c3fe056413447e3388cb734274dc09a01011535988a87da0	f	\N	\N
e3e0b3ac-cae2-4569-a78a-7cadd4de0e37	2023-06-23	Giant Food	13.04	Uncategorized	\N	f	{}	b763a1def3bc881751ba7eff359300476b9be57fac5e56a06f532c4e6f1b5f2d	f	\N	\N
9710530e-50f4-4f96-ad22-3f36ee1325a4	2023-06-22	Yum's Asian Bistro	9.49	Uncategorized	\N	f	{}	79295129a184be026c20c22df354590b0ac71b454d862adc4083bc5c72e997c2	f	\N	\N
ba811c37-6607-4b4b-81ff-dc7c52d3683a	2023-06-21	Chick-fil-A	5.71	Uncategorized	\N	f	{}	d4835cb787bd628704938c3a90c251bb67b083ae025639d31609ce7fd050bb0d	f	\N	\N
4caf6525-f6f4-4dbe-a6f6-e6bc552abef2	2023-06-22	McDonald's	5.70	Uncategorized	\N	f	{}	a8b442a102e8855162891991d2b9d0721cacd06220d4502ee4bb4b77180ad98f	f	\N	\N
4f2a94d6-f322-4723-a44d-5deeeb4b7d99	2023-06-21	Debit- XX 8678 Chynnea Marie Beau Chynneamarieb MD	20.00	Uncategorized	\N	f	{}	f0580edf4167dea7bc64c44737fda1fd7209984878c6e72ee1f43aba48bf4471	f	\N	\N
4113da85-23d3-4b37-b0f7-8af9a9f41d15	2023-06-21	ATM/Cash Withdrawal	203.50	Uncategorized	\N	f	{}	37b51a21eb82de8ccc2fe46a5721c801edc330d42f3eaae03a050d98aebaa03b	f	\N	\N
67483d4e-9cb1-4d39-9cf8-199f896cf193	2023-06-21	ATM/Cash Withdrawal	43.50	Uncategorized	\N	f	{}	eb17a9bf92dc2bfa3459f2c665cbfb3b4ebbfec12739c8e6ff9e492a782ebf4b	f	\N	\N
900d6924-15b4-45be-a101-40fa18059286	2023-06-21	Other Charges/Fees	1.00	Uncategorized	\N	f	{}	175a65bc973becf0b4e50f4ef0ff19ed5440a10907b47455a31f62ad6fa19d3a	f	\N	\N
e5a856bc-2347-4e4e-9c3b-ebfb9deb28b8	2025-11-11	Walmart	47.30	Groceries	\N	f	{}	3b3950888ae7a6a9f565200cc1c95478e6b2a7f91cdec3ef57ede7cad21d81f8	f	\N	\N
9d0e201f-5dd4-4d3e-878e-f68212fe850f	2025-11-06	ALDI	40.50	Groceries	\N	f	{}	c296c3cb34686cbb29a6b8eab78e0ab36d261d28ff8c721081b2177fcb56bd4c	f	\N	\N
347b8304-5108-42ea-9f7e-41023bad7517	2025-11-02	Walmart	6.33	Groceries	\N	f	{}	a66ba5b9d64c2acd6a151cd552d37fdbd511303f685e897214615b855ec6b80a	f	\N	\N
1f399711-f39a-4414-87c6-f8c47bbee875	2025-11-08	Michaels	28.06	Hobbies	e176d0db-e4e5-4164-b0fc-828ca23085f6	f	{}	adce1bab001075a9a6a582e830b1152cdbf1b8c13f51ba8195fd3ac38bd62118	f	\N	\N
89c9a790-fb22-4138-b7b5-4e893a16d6c8	2025-11-03	Michaels	8.63	Hobbies	e176d0db-e4e5-4164-b0fc-828ca23085f6	f	{}	a2781dcd307e78505808dc7cdc608dddceefe36eed699c48b53431e093fc0415	f	\N	\N
ebb20d87-12d0-478a-9a5e-67b5e6188a28	2025-11-14	DEBIT-DC 4581 WWW.LUMINISHE* LUM LUMINISHEALTH MD	78.00	Medical	\N	f	\N	f36f81bba53378aa582a984cfcfeec75cfbdd837b8efebba14cfe14f6f7bd64e	f	\N	\N
38234f13-9443-47da-993d-07272a8d9da5	2025-11-14	Transfer To Credit Card -8715	253.81	Cards	\N	f	\N	ac49d70ef50f626a7ce6c43be636e35ad7d586fcb1227a86003a5871868c5da5	f	\N	\N
1962d83a-3334-45c1-9b31-789da9d218fb	2025-11-15	DEBIT-DC 4581 LONGWOOD GARDENS I XX5460 PA	180.00	Events	\N	f	\N	5b15c518d1f0ace27459e20bc79822762bd4913d2a350b3c7885fe77168df7a6	f	\N	\N
b3cf8007-bdc8-4d91-9a57-8d8a72deefbd	2025-11-15	Hersheypark	130.65	Events	\N	f	\N	880fa0ba44492a9aa9b467d927a6a22457bb82e690cabd2e555b16732e2aaac9	f	\N	\N
a1f7fb0f-293d-4537-b4ee-b1fece384951	2025-11-15	DEBIT-DC 8678 TST*SOUTH BLOCK - WASHINGTON DC	26.38	Eating Out	\N	f	\N	b5096f07eead6fe2a09485af483113ef734e819e220e19cc39911076cf705155	f	\N	\N
5caa3443-df68-4b4c-9cf6-6027903988a8	2025-11-15	DEBIT-DC 8678 ALOHA NAILS LOUNGE WASHINGTON DC	157.00	Personal Care	\N	f	\N	ecd0779f5d1270db5de3b4da1ba6cbe9f1525eab18ee9b91420bf5a420c5876f	f	\N	\N
417d6995-fb27-4577-9f4d-2e2ea0249a8a	2025-11-15	7-Eleven	1.90	Eating Out	\N	f	\N	2d4122dbd40562523f1ed8ae25f35d8fc59f0aaabff9269ebdb06a1573d8e1ef	f	\N	\N
4480463f-7a9c-412c-a445-612e34db648a	2025-11-15	Adjustment - Cr Politics And Prose Washington DC	-100.69	Hobbies	\N	f	\N	053f9e5cc5a2c68584b4269e5089da7e8a9eddeb8a1d2d4fa70f71d32bd27363	f	\N	\N
4048a454-f7ab-489e-bec9-61056d56b66f	2025-11-16	Chipotle Mexican Grill	13.57	Eating Out	\N	f	\N	1acb545119c511d2231c65217913602743dd9e94cdac4b7fbaedab131d9ef965	f	\N	\N
4035b940-a76e-45c3-8592-ba9bf1951a22	2025-11-16	DEBIT-DC 4581 SQ *DOLCI GELATI A ALEXANDRIA VA	6.31	Eating Out	\N	f	\N	ba0672e16ce56798044ff4c0e001a35e80df8a89f8089253b4af003a170b1bdd	f	\N	\N
bb7d685f-4fb4-462f-9655-29f4ebcb29fd	2025-11-16	Sheetz	16.50	Eating Out	\N	f	\N	79e8c3bca7b19229dff43f31d6e9aa6deb49ff8176d2e6510236479e1f1e2c4b	f	\N	\N
60daf3b2-7e6a-4456-a406-77bb7c230934	2025-11-17	Payment to The Guardian Life Insurance Company of America	164.80	Insurance	\N	f	\N	586eb7e9aae13e8f8252e3b714c06e71acc0f7fece003e6274ebe3b4ab440fa5	f	\N	\N
37591219-8322-4375-827b-9166887f34ec	2025-11-17	The Great Cookie	17.78	Eating Out	\N	f	\N	8d61d29d207f6698ee961db4e11b456f11764fc343d0245b4bd4916f43223665	f	\N	\N
15c065db-5dea-4678-9721-464f3083a68b	2025-11-17	Payment to New York Life	616.54	Insurance	\N	f	\N	0e87edf98c0dbfe4ff6296bdde04cb4f9ad82d5bf7966e5a179471b7aa677ed1	f	\N	\N
c51c9264-8e7f-4956-8e98-72e60228c63e	2025-11-17	Amazon	-15.89	Misc	\N	f	\N	37fb67ad5bef76ad0b6099d3247fae5439b6bb6a27e7bfc3003ec12ba66d6575	f	\N	\N
011a4849-a114-4823-86a5-c93092ecf3b3	2025-11-17	Payment to Discover Bank	295.00	Cards	\N	f	\N	1752c5d283c42d56a6518da2ef850514839e6b1bbc3471b5b40ee57ba17b8a58	f	\N	\N
a8d256f7-708f-48b0-89c3-65a70d686f2b	2025-11-17	ALDI	21.10	Groceries	\N	f	\N	12680601582facf35c6bfa641ceaa9271e18ce3c92913f32ead87091b62365e0	f	\N	\N
7f836a14-7a31-4f64-90f9-1f9f60eb83b3	2025-11-18	Payment to Volvo Car Financial Services	485.88	Car Loans	\N	f	\N	7b5da2ef991a3b9640bfc0137ae32c4f39348c175226cc03a6d2baa8be446a44	f	\N	\N
8ab82a38-8b2e-4a0c-92bf-5aec49dbbf5e	2025-11-18	Toyota	900.00	Car Loans	\N	f	\N	93c85a1745cf8c4a055ae832003cb2eb29cc6f1205f9884125fa49ac4e4274b3	f	\N	\N
01f3e66a-648d-4402-b624-1eb16cd17697	2025-11-18	Payment to ECSI	100.88	School	\N	f	\N	9e9db9e19cc62fc4a9037d3d91aa6edc3790dfde833f4dd7a26bc96d8ddd7fee	f	\N	\N
393915f1-281f-4253-8565-1364dd07d5d5	2025-11-18	Tax Payment to IRS	388.00	Taxes	\N	f	\N	ea91d1ca4c32e32026185bca13a719f8ad7f65dbe19474f7c2228d60460cbe12	f	\N	\N
d48c230e-31d8-4dfc-b8e4-37bde1022c9f	2025-11-18	DEBIT-DC 4581 NURTURE LIFE NURTURELIFE.C IL	36.90	Medical	\N	f	\N	805a4fb5c97355291b8408e9ecde79b5aecb66aaec8c00d4d6fd19195cee5194	f	\N	\N
af1335ef-bd33-4bb0-8fc1-c60d2e2d8fce	2025-11-14	DEBIT-DC 4581 UMB PLAZA GARAGE BALTIMORE MD	8.00	Car Stuff	\N	f	\N	09f81c79d1ec822940500e40aa11cd79c3a7fc87d9fa6b0a15b25f1af0888593	f	\N	\N
8fa69502-6cc2-4440-9687-5150562c6d88	2025-11-14	Transfer To Checking -2740	70.00	Transfers	\N	f	\N	450a3c360935178ac4109532c958577232ced0e65c586405b03bf7536fc0f36c	f	\N	\N
c648dc67-a13a-49c3-876f-3e12c577d5c1	2025-11-14	Transfer To Savings -3298	25.00	Transfers	\N	f	\N	c01fa097f9db8777a535edb2d788814a175c5b86bd6e46316e6bdb984e233277	f	\N	\N
577f9e95-afc1-4d58-8564-8cfd54dd9e6d	2025-11-14	Transfer From Checking -5873	100.00	Personal Spending	\N	f	\N	df2df8c8e6b0f0e9035a3fc1134b08f0e6519a16b4738fce4a6315cb9ae4ebcf	f	\N	\N
431e169e-5715-4555-8670-7df5bc2d67f7	2025-11-19	POS DEBIT-DC    8678 APPLE CASH SENT MO 1INFINITELOOP CA	39.41	Uncategorized	\N	f	\N	674deef9042573c25f1b51b22b9e884043a53bf588dd76eb759209a17939b90e	f	\N	\N
dd6722b5-d773-448e-b673-a941a95ba628	2025-11-22	Giant Food	2.64	Groceries	\N	f	\N	584a2784156869cf273808335963f7e7aaf9534d321529723e515074d0d4b42c	f	\N	\N
526efe6d-ba1f-4ab0-a3a5-8995303df231	2025-11-22	ATM Withdrawal Coop 7eleven-fc Glen Burnie MD US	100.00	Personal Spending	\N	f	\N	7f45a54fd6c271f1518dfd4854a906a3b8979d681894ecc7e8eff6b5fbe9c13e	f	\N	\N
f12607c5-0348-4ef9-8b8f-cdd45a425f84	2025-11-22	Netflix	8.47	Subscriptions	\N	f	\N	a095281c6db99732797880ca16341cea457487ed0a27f68d909e713e6b848dca	f	\N	\N
5febbe4e-1d64-4c31-a571-d9539a663cd9	2025-11-23	Target	60.71	Pets	\N	f	\N	2d8c7cf607047910fb8a40b39cc46baf1f2b7fafb13e8e18e04d68a5616116d3	f	\N	\N
bfb583be-53a6-4b4c-b279-272156339797	2025-11-23	Harris Teeter	42.23	Groceries	\N	f	\N	0151ef9b5b067f880baae651d124a515f5fc83856e38093c4a5a47207a28b890	f	\N	\N
12417e68-f5cd-44f5-bb2f-c2f65fcdd2bc	2025-11-24	Transfer to Zelle	40.00	Transfers	\N	f	\N	289b6f18a325db6f0a829f75f7f066f998a91ade340c2f91254151d60d5d233a	f	\N	\N
9cb59729-571f-41c0-b18a-d4ebd6796a52	2025-11-24	Transfer From Savings -0387	-250.00	Transfers	\N	f	\N	bfc152d25b1babf4faa80e50731875e77966a02b2f88ac4402c858096bfa691b	f	\N	\N
d48b90f4-f074-4581-ab04-385d2f90a97d	2025-11-24	Transfer From Savings	-189.38	Transfers	\N	f	\N	107eb53d7a7a757cb1e0f97ba2be179df6821f5d3e3a26c62eedbb95b0d8b9fd	f	\N	\N
5d6eab45-7870-46c5-a878-3d6cbc833f1d	2025-11-24	Payment to Liberty Mutual	260.08	Insurance	\N	f	\N	71dd2bbc09eacdf3c55fc7ed36adf9483d2061378e59564da04b156eb5ddb1ab	f	\N	\N
36bcb0d0-3303-4e50-a3b4-31e9ba67aeed	2025-11-24	Transfer from Zelle	-100.00	Transfers	\N	f	\N	facfa03c0b1ac3e6995ab607f02d13c3eac23b28950b79795639b4d71f3892de	f	\N	\N
12196ae4-d1bc-49b4-a35f-73b333268c84	2025-11-18	POS DEBIT-DC    4581 APPLE.COM/BILL 866-712-7753 CA	7.99	Subscriptions	\N	f	\N	39ba397bd3e2c5d7224f27a42b25449d4a5cb8b131dc4c0160ba647a8bea12bb	f	\N	\N
b4762530-5058-452d-b463-0e008d86a9b2	2025-11-18	POS DEBIT-DC    8678 WEGMANS CROFTON #6 GAMBRILLS MD	155.34	Groceries	\N	f	\N	6ee6c1504ebca2d0ea4465f7d0397012dbe5d0956942e56814f14c58fe220a47	f	\N	\N
da7fb110-c331-4fbc-ac45-54e5ea10b1cd	2025-11-17	POS DEBIT-DC    8678 UMB PLAZA GARAGE BALTIMORE MD	9.00	Car Stuff	\N	f	\N	b13367ac3b4c6b238f9d84ba067269bdbb711a00ca9c06c656c03c8cf2ee71cd	f	\N	\N
f5a47035-c65c-4b62-a96e-e3e4706e520d	2025-11-17	POS DEBIT-DC    4581 UMMC MIDTOWN - PAR BALTIMORE MD	3.00	Car Stuff	\N	f	\N	ecc86f1159da75cb10b3e79cff5a07f703a19148e64c2b6db97fb6e7f993f17c	f	\N	\N
\.


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: r
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (name);


--
-- Name: goals goals_pkey; Type: CONSTRAINT; Schema: public; Owner: r
--

ALTER TABLE ONLY public.goals
    ADD CONSTRAINT goals_pkey PRIMARY KEY (id);


--
-- Name: groups groups_name_key; Type: CONSTRAINT; Schema: public; Owner: r
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_name_key UNIQUE (name);


--
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: r
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: r
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Name: idx_transactions_fingerprint; Type: INDEX; Schema: public; Owner: r
--

CREATE UNIQUE INDEX idx_transactions_fingerprint ON public.transactions USING btree (fingerprint);


--
-- Name: transactions transactions_category_fkey; Type: FK CONSTRAINT; Schema: public; Owner: r
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_category_fkey FOREIGN KEY (category) REFERENCES public.categories(name) ON DELETE SET NULL;


--
-- Name: transactions transactions_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: r
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

\unrestrict mb7qvmVLYwrVyOBvpcbascDzhv8wNXglcA62DLUizEzC7NOIJGeBxf66R7Y3TYw

