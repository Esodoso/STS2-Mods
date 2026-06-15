# STS2 Modpack

## Installazione

1. Clonare la repository:

```bash
git clone https://github.com/Esodoso/STS2-Mods.git
```

2. Aprire PowerShell nella cartella della repository.

3. Eseguire:

```powershell
.\install.ps1
```

4. Quando richiesto, inserire il percorso della cartella `mods` di Slay the Spire 2, ad esempio:

```text
C:\Steam\steamapps\common\Slay the Spire 2\mods
```

Se la cartella non esiste, crearla manualmente.

Il percorso verrà salvato automaticamente e non sarà più richiesto.

---

## Aggiornamenti

Quando esce un aggiornamento:

```bash
git pull
```

poi eseguire:

```terminale
powershell -ExecutionPolicy Bypass -File .\install.ps1
```

---

## Nota

Le mod vengono installate automaticamente nella cartella del gioco tramite lo script.
