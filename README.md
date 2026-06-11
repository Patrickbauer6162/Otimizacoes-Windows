# 🚀 Otimizações Windows — Coleção Completa

> Coleção de scripts `.bat` e arquivos `.reg`
> Foco total em **mais FPS**, **menos input lag** e **melhor desempenho** em jogos.

---

## ⚠️ AVISO IMPORTANTE

- **Crie um ponto de restauração do Windows** antes de aplicar qualquer tweak.
- Execute os arquivos `.bat` sempre como **Administrador**.
- Alguns tweaks requerem **reinicialização** para surtir efeito.
- Faça um **backup do Registro** antes de aplicar os `.reg`.
- Estes tweaks são de **uso por sua conta e risco**.

---

## 📁 Estrutura do Repositório

```
Otimizacoes-Windows/
│
├── bat/
│   ├── CpuPriority.bat              # Configura prioridade de CPU por executável
│   ├── OtimizacaoCompleta.bat       # Script all-in-one de otimização
│   └── LimparRam.bat                # Limpa memória RAM em uso
│
├── regedit/
│   ├── 01_NetworkThrottling.reg     # Desativa throttling de rede
│   ├── 02_SystemResponsiveness.reg  # Prioridade de CPU para jogos
│   ├── 03_GPU_Priority.reg          # Prioridade de GPU para jogos
│   ├── 04_DisableDynamicPstate.reg  # GPU em estado de clock máximo
│   ├── 05_DisableHDCP.reg           # Desativa HDCP para mais performance
│   ├── 06_DisableMPO.reg            # Desativa MPO (reduz stutters)
│   ├── 07_MouseInputLag.reg         # Reduz input lag do mouse
│   ├── 08_KeyboardInputLag.reg      # Reduz input lag do teclado
│   ├── 09_SvchostSplit.reg          # Ajuste de divisão de svchost por RAM
│   └── 10_AllTweaks.reg             # Todos os tweaks em um único arquivo
│
└── docs/
    ├── COMO_USAR.md                 # Guia completo de uso
    └── VIDEOS_REFERENCIA.md         # Lista de vídeos do HSRoficial usados
```

---

## 🎯 Tweaks Disponíveis

### 🗂️ Scripts BAT

| Arquivo | Descrição |
|---|---|
| `CpuPriority.bat` | Define prioridade de CPU para qualquer `.exe` via registro |
| `OtimizacaoCompleta.bat` | Aplica todos os tweaks de uma vez com menu interativo |
| `LimparRam.bat` | Libera memória RAM ociosa |

### 🗂️ Regedits

| Arquivo | Chave do Registro | Efeito |
|---|---|---|
| `01_NetworkThrottling.reg` | `Multimedia\SystemProfile` | Desativa limite de rede durante jogos |
| `02_SystemResponsiveness.reg` | `Multimedia\SystemProfile` | CPU 100% para foreground |
| `03_GPU_Priority.reg` | `SystemProfile\Tasks\Games` | GPU Priority 8, Priority 6 |
| `04_DisableDynamicPstate.reg` | `Control\Class\{GPU GUID}` | GPU sempre em clock máximo |
| `05_DisableHDCP.reg` | `Control\Class\{GPU GUID}` | Desativa proteção HDCP |
| `06_DisableMPO.reg` | `Control\GraphicsDrivers` | Elimina stutters causados por MPO |
| `07_MouseInputLag.reg` | `Services\mouclass\Parameters` | Reduz fila de dados do mouse |
| `08_KeyboardInputLag.reg` | `Services\kbdclass\Parameters` | Reduz delay do teclado (~30ms) |
| `09_SvchostSplit.reg` | `Control\svchost` | Otimiza divisão de processos por RAM |
| `10_AllTweaks.reg` | Múltiplas chaves | Todos os tweaks de uma vez |

