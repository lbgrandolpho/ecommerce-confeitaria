# Projeto de Confeitaria

Este projeto é uma aplicação web para gerenciar uma confeitaria de bolos.

## Funcionalidades

Este projeto conta com uma interface onde usuários podem fazer pedidos de bolos, escolhendo sabores e pesos para cada um deles, e visualizar comentários deixados por usuários para cada sabor.
Os comentários podem ou não conter imagens e qualquer um pode visualizá-los, porém apenas usuários autenticados podem deixar novos comentários. Assim sendo, o projeto também conta com um sistema de autenticação e controle de acesso, onde o usuário pode se cadastrar para poder deixar seus comentários.

## Requisitos

- Docker
- Docker Compose

## Instalação

1. Clone o repositório:

```sh
git clone https://github.com/lbgrandolpho/ecommerce-confeitaria
cd ecommerce-confeitaria
```

2. Inicie o container do docker:

O projeto está completamente dockerizado, portanto basta executar o comando abaixo para fazer o setup e executar o projeto: 


```sh
docker compose up -d --build
```

3. Acesse a aplicação no seu navegador:

```
http://localhost:3000
```


## Portas Utilizadas

- Aplicação web: `3000`
- Banco de dados: `5432`

## Testes

Para executar a suíte de testes, utilize o comando:

```sh
./scripts/test.sh
```
