PGDMP         0                x            Practica_01    12.2    12.2                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                        1262    16427    Practica_01    DATABASE     �   CREATE DATABASE "Practica_01" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';
    DROP DATABASE "Practica_01";
                postgres    false            !           0    0    SCHEMA public    ACL     )   REVOKE ALL ON SCHEMA public FROM PUBLIC;
                   postgres    false    3            �            1259    16428    tb_clientes    TABLE     �  CREATE TABLE public.tb_clientes (
    cli_id integer NOT NULL,
    cli_documento character(12),
    cli_nombre character(30) NOT NULL,
    cli_apellido character(30) NOT NULL,
    cli_direccion character(40) NOT NULL,
    cli_telefono character(20),
    cli_celular character(20),
    cli_fax character(20),
    cli_sexo character(1),
    cli_cumple date,
    CONSTRAINT tb_clientes_cli_sexo_check CHECK ((cli_sexo = ANY (ARRAY['M'::bpchar, 'F'::bpchar])))
);
    DROP TABLE public.tb_clientes;
       public         heap    postgres    false            "           0    0    TABLE tb_clientes    ACL     5   GRANT SELECT ON TABLE public.tb_clientes TO rg_wcrf;
          public          postgres    false    202            �            1259    16432    tb_clientes_cli_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_clientes_cli_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.tb_clientes_cli_id_seq;
       public          postgres    false    202            #           0    0    tb_clientes_cli_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.tb_clientes_cli_id_seq OWNED BY public.tb_clientes.cli_id;
          public          postgres    false    203            �            1259    16434    tb_facturaciones    TABLE       CREATE TABLE public.tb_facturaciones (
    fac_id integer NOT NULL,
    fac_numero numeric(8,0),
    fac_fecha date,
    fac_cliente integer,
    fac_total numeric(12,2),
    CONSTRAINT tb_facturaciones_fac_total_check CHECK ((fac_total > (1000)::numeric))
);
 $   DROP TABLE public.tb_facturaciones;
       public         heap    postgres    false            �            1259    16438    tb_facturaciones_fac_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tb_facturaciones_fac_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.tb_facturaciones_fac_id_seq;
       public          postgres    false    204            $           0    0    tb_facturaciones_fac_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.tb_facturaciones_fac_id_seq OWNED BY public.tb_facturaciones.fac_id;
          public          postgres    false    205            �            1259    16440    vw_clientes_00    VIEW     �   CREATE VIEW public.vw_clientes_00 AS
 SELECT cl.cli_documento,
    cl.cli_nombre,
    cl.cli_apellido,
    cl.cli_telefono
   FROM public.tb_clientes cl
  ORDER BY cl.cli_nombre DESC;
 !   DROP VIEW public.vw_clientes_00;
       public          postgres    false    202    202    202    202            �
           2604    16444    tb_clientes cli_id    DEFAULT     x   ALTER TABLE ONLY public.tb_clientes ALTER COLUMN cli_id SET DEFAULT nextval('public.tb_clientes_cli_id_seq'::regclass);
 A   ALTER TABLE public.tb_clientes ALTER COLUMN cli_id DROP DEFAULT;
       public          postgres    false    203    202            �
           2604    16445    tb_facturaciones fac_id    DEFAULT     �   ALTER TABLE ONLY public.tb_facturaciones ALTER COLUMN fac_id SET DEFAULT nextval('public.tb_facturaciones_fac_id_seq'::regclass);
 F   ALTER TABLE public.tb_facturaciones ALTER COLUMN fac_id DROP DEFAULT;
       public          postgres    false    205    204                      0    16428    tb_clientes 
   TABLE DATA           �   COPY public.tb_clientes (cli_id, cli_documento, cli_nombre, cli_apellido, cli_direccion, cli_telefono, cli_celular, cli_fax, cli_sexo, cli_cumple) FROM stdin;
    public          postgres    false    202   j                 0    16434    tb_facturaciones 
   TABLE DATA           a   COPY public.tb_facturaciones (fac_id, fac_numero, fac_fecha, fac_cliente, fac_total) FROM stdin;
    public          postgres    false    204   N        %           0    0    tb_clientes_cli_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.tb_clientes_cli_id_seq', 1, true);
          public          postgres    false    203            &           0    0    tb_facturaciones_fac_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.tb_facturaciones_fac_id_seq', 1, false);
          public          postgres    false    205            �
           2606    16447 0   tb_clientes tb_clientes_cli_documento_cli_id_key 
   CONSTRAINT     |   ALTER TABLE ONLY public.tb_clientes
    ADD CONSTRAINT tb_clientes_cli_documento_cli_id_key UNIQUE (cli_documento, cli_id);
 Z   ALTER TABLE ONLY public.tb_clientes DROP CONSTRAINT tb_clientes_cli_documento_cli_id_key;
       public            postgres    false    202    202            �
           2606    16449    tb_clientes tb_clientes_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.tb_clientes
    ADD CONSTRAINT tb_clientes_pkey PRIMARY KEY (cli_id);
 F   ALTER TABLE ONLY public.tb_clientes DROP CONSTRAINT tb_clientes_pkey;
       public            postgres    false    202            �
           2606    16451 7   tb_facturaciones tb_facturaciones_fac_numero_fac_id_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.tb_facturaciones
    ADD CONSTRAINT tb_facturaciones_fac_numero_fac_id_key UNIQUE (fac_numero, fac_id);
 a   ALTER TABLE ONLY public.tb_facturaciones DROP CONSTRAINT tb_facturaciones_fac_numero_fac_id_key;
       public            postgres    false    204    204            �
           2606    16453 &   tb_facturaciones tb_facturaciones_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.tb_facturaciones
    ADD CONSTRAINT tb_facturaciones_pkey PRIMARY KEY (fac_id);
 P   ALTER TABLE ONLY public.tb_facturaciones DROP CONSTRAINT tb_facturaciones_pkey;
       public            postgres    false    204            �
           2606    16454 2   tb_facturaciones tb_facturaciones_fac_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tb_facturaciones
    ADD CONSTRAINT tb_facturaciones_fac_cliente_fkey FOREIGN KEY (fac_cliente) REFERENCES public.tb_clientes(cli_id) ON UPDATE CASCADE ON DELETE RESTRICT;
 \   ALTER TABLE ONLY public.tb_facturaciones DROP CONSTRAINT tb_facturaciones_fac_cliente_fkey;
       public          postgres    false    202    2706    204            �           826    16494     DEFAULT PRIVILEGES FOR SEQUENCES    DEFAULT ACL     O   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES  TO rg_wcrf;
                   postgres    false            �           826    16493    DEFAULT PRIVILEGES FOR TABLES    DEFAULT ACL     ]   ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT SELECT,INSERT,DELETE ON TABLES  TO rg_wcrf;
                   postgres    false               �   x�u��j�0Eף��(��zy��H)���fH��rq�@���c<�V:�;s*�O�9pl/C���W.c+����a�r�?�+_�d<��N�	�a����;P+C���Y?���E\�ᓻK�� �oMV7g�.��w�M���q��9Cdȫ
B����2�%����-yl%����u�3I˻�M������`�0ޠ56��N)��yc"         P   x�M˻�0���%9�`����K�
ݓ(4@F�F4�b��P+�_)�K�Զ���(��ly�S�4�B\�ӻ��ӗ|     