# 📖 Como Usar — HSR Otimizações Windows

## Antes de Começar

### 1. Crie um Ponto de Restauração
1. Pressione `Win + R`, digite `sysdm.cpl`
2. Aba **Proteção do Sistema**
3. Clique em **Criar...** e dê um nome (ex: "Antes do HSR Tweaks")

### 2. Backup do Registro
1. Abra o `regedit` como Administrador
2. Clique em **Arquivo > Exportar**
3. Selecione **Todo o Registro** e salve

---

## Usando os Scripts `.bat`

### CpuPriority.bat
Define prioridade de CPU para um executável específico (como um jogo).

1. Clique com o botão direito → **Executar como Administrador**
2. Digite o nome do `.exe` (ex: `fortnite.exe`)
3. Escolha o nível de prioridade:
   - `1` = Idle (mais baixa)
   - `2` = Normal
   - `3` = High ✅ *recomendado para jogos*
   - `4` = Realtime ⚠️ *pode travar o sistema*
   - `5` = Below Normal
   - `6` = Above Normal

### OtimizacaoCompleta.bat
Menu interativo com todas as otimizações. Execute como Administrador e siga as instruções na tela.

### LimparRam.bat
Libera memória RAM ociosa. Use antes de abrir jogos pesados.

---

## Usando os Arquivos `.reg`

### Método Simples
1. Dê dois cliques no arquivo `.reg`
2. Clique **Sim** nas confirmações
3. Reinicie o PC

### Método Manual (para tweaks de GPU — arquivos 04 e 05)
Esses dois tweaks exigem o **GUID específico da sua GPU**:

1. Abra o **Gerenciador de Dispositivos** (`devmgmt.msc`)
2. Expanda **Adaptadores de Vídeo**
3. Clique com botão direito na sua GPU → **Propriedades**
4. Aba **Detalhes** → Selecione **ID de instância do dispositivo**
5. Copie o valor (algo como `PCI\VEN_10DE&DEV_2204...`)
6. Abra o `regedit` como Administrador
7. Navegue até: `HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}`
8. Expanda as subpastas (`0000`, `0001`...) até encontrar uma que contenha o ID da sua GPU
9. Adicione o valor DWORD 32 bits conforme o arquivo `.reg` correspondente

---

## Tweaks de GPU Específicos

### Desativar Dynamic Pstate (04)
- **Chave:** `{GUID-GPU}\0000`
- **Valor:** `DisableDynamicPstate` = `1` (DWORD 32)
- **Efeito:** GPU sempre no clock máximo

### Desativar HDCP (05)
- **Chave:** `{GUID-GPU}\0000`
- **Valor:** `RMHdcpKeyglobZero` = `1` (DWORD 32)
- **Efeito:** Remove carga da proteção de conteúdo digital

---

## ✅ Ordem Recomendada de Aplicação

1. `01_NetworkThrottling.reg`
2. `03_GPU_Priority.reg`
3. `06_DisableMPO.reg`
4. `07_MouseInputLag.reg` + `08_KeyboardInputLag.reg`
5. `09_SvchostSplit.reg` (ajuste o valor conforme sua RAM)
6. Tweaks manuais de GPU (04 e 05) se quiser
7. **Reinicie o PC**

Ou simplesmente use o `10_AllTweaks.reg` para aplicar tudo de uma vez (exceto os de GPU específica).

---

## Reverter Tweaks

Para desfazer, use o ponto de restauração criado anteriormente:
1. `Win + R` → `rstrui.exe`
2. Selecione o ponto criado antes dos tweaks
3. Confirme e aguarde a restauração
