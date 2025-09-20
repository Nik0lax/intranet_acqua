# Intranet Acqua

Repositório da Intranet corporativa **Acqua**, desenvolvida em Flask com integração de Bootstrap 5 para o frontend.

---

## Status do Projeto

- Projeto ativo
- Estrutura modular com rotas públicas e privadas.
- Controle de autenticação e permissões por roles (Admin / Comunicação).

---

## Alterações Recentes

### Segunda Alteração

**Data:** 20/09/2025  
**Descrição:** Correção de layout e modal de imagens.  

**Detalhes das alterações:**

1. **Layout Responsivo:**
   - Ajuste das seções de **Aniversariantes** e **Compliance** para usar a mesma estrutura de cards.
   - Uso de `overflow-y: auto` nos cards, garantindo scroll interno apenas dentro dos cards, evitando scroll global na página.
   - Estrutura agora consistente e responsiva, mantendo a posição dos cards e imagens intacta.

2. **Modal de Imagem:**
   - Corrigido bug que abria múltiplos modais ao clicar várias vezes.
   - Instância do modal criada uma única vez.
   - Clique em uma imagem atualiza o modal e o abre.
   - Clique fora da imagem fecha o modal.
   - Comportamento: **um click abre, outro fecha**, evitando empilhamento de modais.

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
