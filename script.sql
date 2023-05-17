--Criação do banco de dados uvv;
DROP DATABASE IF EXISTS uvv;
CREATE DATABASE uvv;
\c uvv;

--Cria tabela clientes e suas colunas;
CREATE TABLE public.clientes (
                cliente_id NUMERIC(38)  NOT NULL,
                email      VARCHAR(255) NOT NULL,
                nome 	   VARCHAR(255) NOT NULL,
                telefone1  VARCHAR(20),
                telefone2  VARCHAR(20),
                telefone3  VARCHAR(20),
                --Cria chave primaria da tabela clientes;
                CONSTRAINT clientes_id PRIMARY KEY (cliente_id)
);

--Adciona restrições às colunas da tabela clientes;
--*ADCIONAR*

--Adciona comentarios às colunas da tabela clientes;
COMMENT ON TABLE  public.clientes   		 IS 'Tabela de registro de clientes';
COMMENT ON COLUMN public.clientes.cliente_id IS 'Id de registro de clientes, chave primaria da tabela, recebe apenas numeros';
COMMENT ON COLUMN public.clientes.email 	 IS 'Email de cadastro dos clientes';
COMMENT ON COLUMN public.clientes.nome 		 IS 'Nome dos clientes';
COMMENT ON COLUMN public.clientes.telefone1  IS 'Telefone principal dos clientes';
COMMENT ON COLUMN public.clientes.telefone2  IS 'Telefone secundario dos clientes';
COMMENT ON COLUMN public.clientes.telefone3  IS 'Telefone terciario dos clientes';


--Cria tabela produtos e suas colunas;
CREATE TABLE public.produtos (
                produto_id 	     		  NUMERIC(38)  NOT NULL,
                nome 		     		  VARCHAR(255) NOT NULL,
                preco_unitario   		  NUMERIC(10,2),
                detalhes         		  BYTEA,
                imagem           		  BYTEA,
                imagem_mime_type 		  VARCHAR(512),
                imagem_arquivo   		  VARCHAR(512),
                imagem_charset   		  VARCHAR(512),
                imagem_ultima_atualizacao DATE,
                --Cria chave primaria da tabela produtos;
                CONSTRAINT produto_id PRIMARY KEY (produto_id)
);
--Adciona restrições às colunas da tabela produtos;
--*ADCIONAR*

--Adciona comentarios às tabelas produtos;
COMMENT ON TABLE  public.produtos 				   			IS 'Tabela para registro dos produtos';
COMMENT ON COLUMN public.produtos.produto_id 	   			IS 'Id dos produtos, chave primaria da tabela, recebe apenas números';
COMMENT ON COLUMN public.produtos.nome 			   			IS 'Nome dos produtos';
COMMENT ON COLUMN public.produtos.preco_unitario   			IS 'Preço unitário de cada produto';
COMMENT ON COLUMN public.produtos.detalhes 		   			IS 'Detalhes de cada produto, recebe apenas BLOB';
COMMENT ON COLUMN public.produtos.imagem 		   			IS 'Imagem de cada produto';
COMMENT ON COLUMN public.produtos.imagem_mime_type 			IS '*N SEI AINDA, COLOCAR DPS*';
COMMENT ON COLUMN public.produtos.imagem_arquivo   			IS 'Recebe o arquivo da imagem do produto';
COMMENT ON COLUMN public.produtos.imagem_charset   			IS '*N SEI AINDA, COLOCAR DPS*';
COMMENT ON COLUMN public.produtos.imagem_ultima_atualizacao IS 'Data da ultima atualizacao da imagem do produto, recebe apenas data';

--Cria tabela lojas e suas colunas;
CREATE TABLE public.lojas (
                loja_id 				NUMERIC(38)  NOT NULL,
                nome 					VARCHAR(255) NOT NULL,
                endereco_web 			VARCHAR(100),
                endereco_fisico 		VARCHAR(512),
                latidude 				NUMERIC,
                longitude 				NUMERIC,
                logo 					BYTEA,
                logo_mime_type  		VARCHAR(512),
                logo_arquivo 			VARCHAR(512),
                logo_charset 			VARCHAR(512),
                logo_ultima_atualizacao DATE,
                --Cria chave primaria da tabela lojas;
                CONSTRAINT loja_id PRIMARY KEY (loja_id)
);

--Adciona restrições às colunas da tabela lojas;
--*ADCIONAR*;

--Adciona comentarios às colunas da tabela lojas;
COMMENT ON TABLE  public.lojas 						   IS 'Tabela lojas que receberá informações a respeito das lojas parceiras.';
COMMENT ON COLUMN public.lojas.loja_id 				   IS 'Id das lojas parceiras, chave primeira da tabela, recebe apenas números';
COMMENT ON COLUMN public.lojas.nome 				   IS 'Nome das lojas parceiras';
COMMENT ON COLUMN public.lojas.endereco_web 		   IS 'Endereço para o site das lojas parceiras';
COMMENT ON COLUMN public.lojas.endereco_fisico 		   IS 'Endereço físico das lojas parceiras';
COMMENT ON COLUMN public.lojas.latidude 			   IS 'Coordenadas geograficas latitudinais das lojas parceiras';
COMMENT ON COLUMN public.lojas.longitude 			   IS 'Coordenadas geograficas longitudenais das lojas parceiras';
COMMENT ON COLUMN public.lojas.logo 				   IS 'Logo das lojas parceiras, recebe apenas BLOB';
COMMENT ON COLUMN public.lojas.logo_mime_type 		   IS '*N SEI AINDA, COLOCAR DPS*';
COMMENT ON COLUMN public.lojas.logo_arquivo 		   IS 'Recebe o logo das lojas parceiras';
COMMENT ON COLUMN public.lojas.logo_charset 		   IS '*N SEI AINDA, COLOCAR DPS*';
COMMENT ON COLUMN public.lojas.logo_ultima_atualizacao IS 'Datas da ultima atualizacao das logos das lojas parceiras, recebe apenas data';


CREATE TABLE public.envios (
                envio_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                endereco_entrega VARCHAR(512) NOT NULL,
                status VARCHAR(15) NOT NULL,
                CONSTRAINT envio_id PRIMARY KEY (envio_id)
);
COMMENT ON TABLE public.envios IS 'Tabela de registro de envios';
COMMENT ON COLUMN public.envios.envio_id IS 'Id dos envios, chave primaria da tabela, recebe apenas numeros';
COMMENT ON COLUMN public.envios.loja_id IS 'Id das lojas parceiras, chave estrangeira, recebe apenas números';
COMMENT ON COLUMN public.envios.cliente_id IS 'Id de registro de clientes, chave estrangeira, recebe apenas numeros';
COMMENT ON COLUMN public.envios.endereco_entrega IS 'Registro de endereço para entrega dos pedidos';
COMMENT ON COLUMN public.envios.status IS 'Status atual do envio dos pedidos';


CREATE TABLE public.pedidos (
                pedido_id NUMERIC(38) NOT NULL,
                data_hora TIMESTAMP NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                status VARCHAR(15) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                CONSTRAINT pedido_id PRIMARY KEY (pedido_id)
);
COMMENT ON TABLE public.pedidos IS 'Tabela de registro dos pedidos';
COMMENT ON COLUMN public.pedidos.pedido_id IS 'Id dos pedidos, chave primaria da tabela, recebe apenas numeros';
COMMENT ON COLUMN public.pedidos.data_hora IS 'Data e hora da realizacao do pedido, utiliza apenas TIMESTAMP';
COMMENT ON COLUMN public.pedidos.cliente_id IS 'Id de registro de clientes, chave estrangeira, recebe apenas numeros';
COMMENT ON COLUMN public.pedidos.status IS 'Status atual do pedido';
COMMENT ON COLUMN public.pedidos.loja_id IS 'Id das lojas parceiras, chave estrangeira, recebe apenas números';


CREATE TABLE public.pedidos_itens (
                pedido_id NUMERIC(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                numero_da_linha NUMERIC(38) NOT NULL,
                preco_unitario NUMERIC(10,2) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                envio_id NUMERIC(38),
                CONSTRAINT pedido_id_produto_id PRIMARY KEY (pedido_id, produto_id)
);
COMMENT ON TABLE public.pedidos_itens IS 'Tabela de registro dos itens dos pedidos';
COMMENT ON COLUMN public.pedidos_itens.pedido_id IS 'Id dos pedidos, chave primaria da tabela e estrangeira, recebe apenas numeros';
COMMENT ON COLUMN public.pedidos_itens.produto_id IS 'Id dos produtos, chave primaria da tabela e estrangeira, recebe apenas números';
COMMENT ON COLUMN public.pedidos_itens.numero_da_linha IS '*N SEI AINDA, COLOCAR DPS*';
COMMENT ON COLUMN public.pedidos_itens.preco_unitario IS 'Preco unitario de cada produto';
COMMENT ON COLUMN public.pedidos_itens.quantidade IS 'Quantidade de itens dos pedidos';
COMMENT ON COLUMN public.pedidos_itens.envio_id IS 'Id dos envios, chave estrangeira, recebe apenas numeros';


CREATE TABLE public.estoques (
                estoque_id NUMERIC(38) NOT NULL,
                loja_id NUMERIC(38) NOT NULL,
                produto_id NUMERIC(38) NOT NULL,
                quantidade NUMERIC(38) NOT NULL,
                CONSTRAINT estoque_id PRIMARY KEY (estoque_id)
);
COMMENT ON TABLE public.estoques IS 'Tabela de registro do estoque';
COMMENT ON COLUMN public.estoques.estoque_id IS 'Id do estoque, chave primaria da tabela, recebe apenas numeros';
COMMENT ON COLUMN public.estoques.loja_id IS 'Id das lojas parceiras, chave estrangeira, recebe apenas números';
COMMENT ON COLUMN public.estoques.produto_id IS 'Id dos produtos, chave estrangeira, recebe apenas números';


ALTER TABLE public.pedidos ADD CONSTRAINT clientes_pedidos_fk
FOREIGN KEY (cliente_id)
REFERENCES public.clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.envios ADD CONSTRAINT clientes_envios_fk
FOREIGN KEY (cliente_id)
REFERENCES public.clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.estoques ADD CONSTRAINT produtos_estoques_fk
FOREIGN KEY (produto_id)
REFERENCES public.produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pedidos_itens ADD CONSTRAINT produtos_pedidos_itens_fk
FOREIGN KEY (produto_id)
REFERENCES public.produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.estoques ADD CONSTRAINT lojas_estoques_fk
FOREIGN KEY (loja_id)
REFERENCES public.lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pedidos ADD CONSTRAINT lojas_pedidos_fk
FOREIGN KEY (loja_id)
REFERENCES public.lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.envios ADD CONSTRAINT lojas_envios_fk
FOREIGN KEY (loja_id)
REFERENCES public.lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pedidos_itens ADD CONSTRAINT envios_pedidos_itens_fk
FOREIGN KEY (envio_id)
REFERENCES public.envios (envio_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.pedidos_itens ADD CONSTRAINT pedidos_pedidos_itens_fk
FOREIGN KEY (pedido_id)
REFERENCES public.pedidos (pedido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
