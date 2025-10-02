# Intranet Acqua

Repositório da Intranet corporativa **Acqua**, desenvolvida em Flask com integração de Bootstrap 5 para o frontend.

---

## Status do Projeto

- Projeto ativo
- Estrutura modular com rotas públicas e privadas.
- Controle de autenticação e permissões por roles (Admin / Comunicação).

---

## Alterações Recentes

### Terceira Alteração

**Data:** 02/10/2025  
**Descrição:** Correção de layout e link de comunicador oficial.  

**Detalhes das alterações:**

1. **Layout Responsivo:**
   - Ajuste das seções de **Links Rápidos**, **Aniversariantes** e **Compliance** para usar a mesma estrutura de cards.
   - Remobido o `overflow-y: auto` nos cards **Aniversariantes** e **Compliance**.
   - Estrutura agora consistente e responsiva, mantendo a posição dos cards e imagens intacta.

2. **Alterado Fale com a TI para Rocket.Chat**
   - Implantado o Comunicador Oficial da Unidade.

---

## Tecnologias Utilizadas

- **Backend:** Python 3, Flask
- **Frontend:** HTML5, CSS3, Bootstrap 5, Font Awesome, Bootstrap Icons
- **Banco de Dados:** MySQL
- **Outras:** Jinja2 para templates, HTMX para interações parciais

---

## Estrutura do Projeto
```
intranet_acqua/
│
├─ app.py
├─ models/
├─ static/
│ ├─ img/
│ └─ css/
├─ templates/
└─ venv/
```
---

## Instruções de Deploy

1. Clonar o repositório:
```
git clone <URL_DO_REPOSITORIO>
```
2. Ativar o ambiente virtual:
```
python -m venv venv
source venv/bin/activate  # Linux/Mac
venv\Scripts\activate     # Windows
```
3. Instalar dependências:
```
pip install -r requirements.txt
```
4. Executar a aplicação:
```
flask run
```
