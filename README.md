# 💸 Financy App — Simulador de Carteira Digital

**Status:** 🚧 Em desenvolvimento  

O **Financy App** é um projeto pessoal desenvolvido em **Flutter**, com o objetivo de **simular o funcionamento de uma carteira digital** — apresentando ganhos e perdas de ações de forma visual e interativa.  
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
- [ ] Dashboard com **dados e gráficos simulados**  
- [ ] Perfil de usuário com informações personalizadas  
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
