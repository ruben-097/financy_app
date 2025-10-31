# 💸 Financy App — Simulador de Carteira Digital

**Status:** 🚧 Em desenvolvimento  

O **Financy App** é um projeto pessoal desenvolvido em **Flutter**, com o objectivo de por em pratica os meus conhecimentos e **simular o funcionamento de uma carteira digital** — apresentando ganhos e perdas de ações de forma visual e interativa.  
Toda a simulação ocorre no **front-end**, enquanto o **Firebase Authentication** é utilizado para **login, cadastro e exibição do nome do usuário logado**.

## 🚀 Tecnologias utilizadas

- **Flutter** — desenvolvimento multiplataforma  
- **Firebase Core** — inicialização dos serviços Firebase  
- **Firebase Authentication** — autenticação e exibição do displayName  
- **Dart** — linguagem principal  
- **Material Design 3** — para o design moderno e responsivo  

## 🧩 Funcionalidades

- [x] Tela de **login e cadastro** integrada ao Firebase  
- [x] Exibição do **nome do usuário logado (displayName)**  
- [x] Interface de **simulação de ganhos e perdas** no front-end  
- [x] Página Statistics com balanço baseado em transações fictícias (não dinâmica)
- [x] Página Profile com informações básicas do usuário (nome, email e avatar) 
- [ ] Melhorias de UI e microanimações  

---

## 📦 Dependências principais

```yaml
dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^3.15.2
  firebase_auth: ^5.7.0
  cupertino_icons: ^1.0.8
  meta: ^1.16.0
  test_api: ^0.7.6
  lints: ^5.1.1
  flutter_lints: ^5.0.0
  characters: ^1.4.0
  material_color_utilities: ^0.11.1



⚙️ Como rodar o projeto

Clone o repositório:

git clone <URL_DO_SEU_REPOSITORIO>


Entre na pasta do projeto:

cd financy_app


Instale as dependências:

flutter pub get


Configure o Firebase (crie um projeto no Firebase
) e adicione os arquivos de configuração correspondentes (google-services.json para Android e GoogleService-Info.plist para iOS).

Execute o app:

flutter run

📝 Observações

Todas as transações são fictícias e o app serve apenas para estudo e prática de Flutter e Firebase.

Projeto recomendado para quem está começando a aprender Flutter.

O app ainda está em desenvolvimento e melhorias na UI, microanimações e funcionalidades serão implementadas futuramente.

📚 Licença

Projeto criado para fins educativos. Sinta-se à vontade para estudar e contribuir, mas não há garantia de uso comercial.
