```markdown
# Nula SDDM Theme

<p align="center">
  <img src="preview.png" alt="Nula SDDM Preview" width="800">
</p>

A sleek, minimalist login theme for Linux. Built for the **Nula Linux** ecosystem, it features a fluid user avatar carousel with smooth transitions and optimized session controls.

## 🛠️ Installation

### 1. Clone the repository
```bash
git clone [https://github.com/l7p3x/Nula-SDDM.git](https://github.com/l7p3x/Nula-SDDM.git)
cd Nula-SDDM  

```

### 2. Install the theme

Move the internal `Nula` directory to your system's SDDM themes folder:

```bash
sudo cp -r Nula /usr/share/sddm/themes/

```

### 3. Set as default

Edit your SDDM configuration file (usually at `/etc/sddm.conf`) and set `Current` to `Nula` under the `[Theme]` section:

```ini
[Theme]
Current=Nula

```

## 📄 License

This project is licensed under the MIT License.

```

---

### 🛠️ Passo a Passo para colocar a imagem no ar:

1. **Tire o Print:** Abra o seu tema em modo de teste com o comando `sddm-greeter --test-mode --theme /usr/share/sddm/themes/Nula` e tire uma captura de tela bem limpa.
2. **Nomeie a Imagem:** Salve a imagem com o nome de `preview.png`.
3. **Organize na Pasta:** Crie uma pasta chamada `assets` na raiz do seu repositório local e jogue a imagem `preview.png` lá dentro.
4. **Envie para o GitHub:** Use os comandos Git para subir as mudanças:
   ```bash
   git add .
   git commit -m "Add theme preview image to readme"
   git push

```
