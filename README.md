# MS Tech - Supabase Integration

Este projeto agora suporta sincronização remota de estado com Supabase, mantendo fallback local em `localStorage`.

## O que já está implementado

- `index.html` carrega o cliente Supabase via CDN
- Configuração de `SUPABASE_URL` e `SUPABASE_ANON_KEY`
- O objeto `state` do app é salvo localmente e também enviado para Supabase
- No carregamento, o app tenta sincronizar o estado remoto
- Se Supabase não estiver configurado, o app continua usando `localStorage`

## Como configurar

1. Crie uma conta gratuita no Supabase: https://app.supabase.com
2. Crie um novo projeto
3. No painel do projeto, copie:
   - `URL do projeto` (algo como `https://<PROJECT_REF>.supabase.co`)
   - `anon public` key
4. No arquivo `index.html`, substitua os espaços reservados:
   - `https://<YOUR_PROJECT_REF>.supabase.co`
   - `<YOUR_ANON_KEY>`
5. Salve o arquivo e abra o app no navegador.

## Validando a configuração Supabase

- Verifique se o app exibe `useRemoteStorage` como verdadeiro no console do navegador.
- Se estiver usando o modo `localStorage` apenas, confirme que as variáveis `SUPABASE_URL` e `SUPABASE_ANON_KEY` estão corretas.
- Não compartilhe a `anon key` publicamente; use o arquivo local apenas em ambiente de desenvolvimento.

## Criar as tabelas necessárias

Execute este SQL no editor SQL do Supabase:

```sql
create table if not exists users (
  id text primary key,
  data jsonb not null
);

create table if not exists products (
  id text primary key,
  data jsonb not null
);

create table if not exists sales (
  id text primary key,
  data jsonb not null
);

create table if not exists expenses (
  id text primary key,
  data jsonb not null
);

create table if not exists goals (
  id text primary key,
  month text not null,
  data jsonb not null
);

create table if not exists cash_flows (
  id text primary key,
  date text not null,
  data jsonb not null
);

create table if not exists pricing_settings (
  id text primary key,
  data jsonb not null
);

create table if not exists pricing_products (
  id text primary key,
  data jsonb not null
);

create table if not exists pricing_history (
  id text primary key,
  data jsonb not null
);
```

## Validando as tabelas

1. No editor SQL do Supabase, execute o script acima.
2. Em seguida, abra o painel `Table Editor` e confirme que as tabelas existem.
3. Caso o app não carregue dados remotos, verifique se cada tabela foi criada corretamente.

## Testando a sincronização entre dispositivos

1. Abra o app em um navegador no dispositivo A.
2. Adicione ou modifique algum dado no app.
3. Abra o app no dispositivo B (ou em outra guia/navegador) e atualize a página.
4. Confirme que o dispositivo B carrega os dados inseridos no dispositivo A.
5. Se os dados não aparecerem, tente limpar o cache do navegador e recarregar.

## Como funciona

- O app continua salvando dados em `localStorage` para uso offline e fallback local
- Quando Supabase estiver configurado, ele também sincroniza os dados em tabelas separadas
- Diferentes dispositivos que usam a mesma URL e `anon` key irão compartilhar o mesmo banco de dados

## Publicação no GitHub Pages

- Este app é estático e pode ser publicado pelo GitHub Pages.
- Já há um workflow em `.github/workflows/pages.yml` que faz deploy automático quando você envia para `main`.
- Após ativar o Pages em `Settings > Pages`, a URL provável será:
  `https://mstechoficiall-prog.github.io/MS_Tech`
- Certifique-se de que `index.html` contenha sua `SUPABASE_URL` e `SUPABASE_ANON_KEY` antes de usar a versão pública.

## Observações

- A sincronização remota agora usa tabelas por entidade, em vez de um único JSON global
- Isso torna o modelo mais preparado para escalar com `users`, `products`, `sales`, `expenses`, `goals`, `cash_flows`, `pricing_settings`, `pricing_products` e `pricing_history`
- Se quiser, posso adaptar ainda mais o app para usar autenticação Supabase completa e regras de segurança (RLS)
