+++
title = 'Estou Oferecendo Serviços de Engenharia Reversa'
date = 2024-12-07
draft = false
+++

Decidi começar a fazer freela como engenheira reversa/analista de malware. Este post é uma divulgação do meu trabalho, uma vitrine dos meus serviços. Espero que goste.

<!--more-->
---

## Por que contratar um engenheiro reverso?

A engenharia reversa é essencial em diversos cenários, como:
- Entender uma funcionalidade não-documentada de algum software
- Realizar auditoria de segurança em aplicações em busca de vulnerabilidades
- Análise de malwares
- Documentação de software legado
- Análise de competidores (para fins legais, apenas)
- Forense digital
- Etc...

Cada um destes casos requer expertise técnica e ferramentas adequadas para garantir resultados precisos e confiáveis.

## Serviços Oferecidos

- **Análise de Malware**
    - Análise estática e dinâmica de malware
    - Desofuscação e Desvirtualização
    - Investigação detalhada do comportamento
    - Reconhecimento de padrões de rede
    - IoCs (Indicators of Compromise) + Recomendações de mitigação (quando possível)
    - Entrega de um relatório completo dos achados em PDF

- **Engenharia Reversa de Software**
    - Análise de executáveis X86/X86-64
    - Investigação detalhada do comportamento
    - Documentação de protocolos proprietários
    - Reconhecimento da API (se houver alguma)
    - Recuperação de algoritmos e estruturas de dados
    - Entrega de um relatório completo dos achados em PDF

- **Documentação de Código Legado**
    - Análise do código-fonte
    - Documentação de funções e subrotinas
    - Recuperação de algoritmos e estruturas de dados
    - Sugestões de refatoração, se assim for desejado
    - Entrega de um relatório completo dos achados e sugestões para refatoração em PDF
    - Entrega do código-fonte com comentários que explicam seu funcionamento

- **Auditoria de Segurança**
    - Investigação de executáveis X86/X86-64 em busca de vulnerabilidades
    - Verificação de proteções *anti-tampering*
    - Análise Estática e Dinâmica da aplicação (exceto *fuzzing*)
    - Documentação das vulnerabilidades encontradas com sugestões de correção
    - Entrega de um relatório completo dos achados e sugestões de correção
    - Entrega de *exploits* Prova-de-Conceito (PoC) para demonstrar possível impacto das falhas encontradas

## Ferramentas/Tecnologias utilizadas

**Disassemblers/Decompiladores**
- IDA
- dnSpy
- JD-GUI

**Debuggers**
- x64dbg
- WinDBG
- GDB

**Análise Estática de Binários**
- CFF Explorer
- PE Studio
- Detect It Easy
- angr
- Binwalk
- BinDiff

**Análise Estática de Código-Fonte**
- CScope
- CodeQL

**Análise Dinâmica**
- Process Monitor (ProcMon)
- Process Hacker
- Conjunto de ferramentas Windows SysInternals

**Instrumentação de Binários**
- Frida

**Análise de Rede**
- Fakenet-NG
- Wireshark
- NetworkMiner

**Reconhecimento de Estruturas e Padrões em Arquivos e Memória**
- Kaitai Struct
- Yara

**Utilitários**
- HxD Hexadecimal Editor/Dumper
- FLOSS (Flare Obfuscated String Solver)
- Capstone Framework
- Unicorn Engine
- Ferramentas próprias feitas em Python

## Portfólio

> Ainda não tenho relatórios prontos para pôr de portfólio. :(
>
> Mas estou preparando algumas análises para servirem de portfólio, as publicarei e listarei aqui conforme estiverem prontas.

## Metodologia

Meu processo de trabalho é estruturado nas seguintes etapas:

1. **Análise Inicial**
    - Reunião para entender objetivos
    - Definição do escopo
    - Identificação de requisitos específicos
    - Avaliação inicial do binário/sistema

2. **Planejamento**
    - Definição de *milestones*
    - Estabelecimento de uma linha do tempo para o projeto
    - Criação do ambiente de análise

3. **Execução**
    - Execução da engenharia reversa em si
    - *Feedback* diário ou semanal sobre progresso da análise (ou conforme acordado)
    - Documentação em tempo real de operações e achados
    - Emissão de *snapshots* regulares do ambiente de análise
    - Ajustes na direção da análise quando necessário

4. **Entrega**
    - Preparação e entrega de um relatório técnico detalhado em PDF (ou outro formato conforme sua necessídade)
    - Apresentação de recomendações técnicas (quando aplicável)
    - Preparação e entrega de documentação de apoio (quando aplicável)

Já para a análise em si, sigo a metodologia [CREATE (Collect, Recover, Explore, Analyze, Transform)](https://hackmd.io/@mrexodia/create-methodology).

## Confidencialidade e Segurança

### Proteção de Dados

Todo o processo de análise é feito com máximo cuidado com seus dados. Nossa comunicação acontece exclusivamente por canais criptografados (Signal, E-mail com PGP, ou outro de sua preferência).

As amostras de código-fonte do cliente são armazenadas em volumes criptografados VeraCrypt, em máquinas com discos criptografados usando LUKS2, em ambientes isolados da Internet. Cada projeto recebe uma máquina virtual (VM) dedicada, garantindo isolamento total entre diferentes análises.

Após a conclusão, os dados são removidos usando a técnica de sanitização DoD 5220.22-M, garantindo que nenhum dado residual permaneça nas máquinas de análise.

### Acordos Legais

Ofereço um modelo de Non-Disclosure Agreement (NDA) padrão que cobre todos os aspectos essenciais para proteger seu projeto. Este acordo inclui:

**Escopo de Confidencialidade**
- Definição clara do que constitui "informação confidencial"
    - Código-fonte e binários
    - Documentação técnica
    - Protocolos e algoritmos
    - Resultados da análise
    - Comunicações sobre o projeto
    - Dados de negócio relacionados

**Obrigações e Restrições**
- Uso permitido apenas para os objetivos definidos no projeto
- Proibição de compartilhamento com terceiros
- Medidas de segurança obrigatórias durante o manuseio dos dados
- Processo de notificação em caso de vazamento acidental
- Devolução ou destruição de dados após término do projeto

**Propriedade Intelectual**
- Todo código produzido durante a análise pertence ao cliente, incluindo ferramentas desenvolvidas especificamente para o projeto
- Documentação e relatórios gerados
- Descobertas e *insights* técnicos

**Duração e Término**
- Vigência do acordo (geralmente 2-5 anos após término do projeto)
- Condições para término antecipado
- Obrigações que persistem após o término

**Aspectos Legais**
- Jurisdição aplicável
- Processo para resolução de disputas
- Penalidades em caso de violação
- Indenizações aplicáveis

**Termos de Pagamento**
- Estrutura de pagamento
- Condições para reembolso
- Cronograma de pagamentos
- Custos adicionais (se aplicável)

**Processo de Assinatura**
1. Envio do modelo de NDA para revisão
2. Período para ajustes (se necessário)
3. Assinatura digital via DocuSign ou similar
4. Arquivamento seguro das cópias assinadas

Posso ajustar o documento de NDA conforme suas necessidades específicas. Também aceito incluir cláusulas adicionais que você considere importantes para o projeto.

### Ambiente de Trabalho

A infraestrutura de análise inclui:
- Uma máquina dedicada rodando NixOS.
- VPN (com kill-switch ativado) para transferência de dados
- Backups criptografados com PGP
- Máquinas virtuais para cada projeto, isoladas entre si e sem acesso a Internet
- Firewall configurado em modo deny-all
- Sistema de anotações onde detalho todas as operações

### Relatórios e Documentação

A entrega de toda documentação...
- será através de canais criptografados de ponta-a-ponta (Signal, E-mail com PGP, etc)
- incluirá assinatura digital de todos os arquivos, verificavel pela minha chave pública PGP

Os relatórios incluem:
- Metodologia utilizada
- Ferramentas e versões específicas
- UNIX Timestamps de cada operação
- Resultados encontrados
- Recomendações técnicas (quando aplicável)
- Evidências e artefatos relevantes

### Transparência

Mantenho registros de:
- *Hash* SHA-256 de todos os binários/arquivos analisados
- Ferramentas utilizadas e suas versões
- Todas as modificações realizadas
- Documentação de todas as decisões técnicas
- Histórico de comunicações relevantes

---

Posso adaptar qualquer um destes protocolos conforme necessidades específicas do seu projeto ou requisitos de compliance da sua organização.

## Preços e Tempo Médio de Entrega

Mantenha em mente que geralmente trabalho de Segunda à Sexta (exceto feriados ou quando há imprevistos), 8 horas por dia. Tenho rastreio das minhas horas trabalhadas.

**Projetos pequenos** (até 24 horas de trabalho):
- Preço-base: R$ 45 / hora
- Entrega em até 5 dias úteis

**Projetos médios** (entre 24 e 80 horas de trabalho):
- Preço-base: R$ 50 / hora
- Entrega em até 12 dias úteis

**Projetos grandes** (mais de 80 horas de trabalho):
- Valor e tempo de entrega negociáveis

## Contratação

1. Discussão inicial do projeto
2. Definição de escopo
3. Assinatura de NDA
4. Proposta comercial
5. Início dos trabalhos

## Contato

```
Email: lavinia@kernel32.xyz
Signal: sybil.09
Telegram: @XeniaTales
```

Para assuntos sensíveis, favor utilizar E-mail + PGP (chave pública abaixo) ou Signal.

**Horários**

Disponível para contato inicial de Segunda a Sexta, 09:00 -- 19:00 (GMT-3, fuso horário de Brasília)

Tempo máximo de resposta: 24 horas.

**Chave pública PGP**

```
-----BEGIN PGP PUBLIC KEY BLOCK-----

mDMEZ1T+txYJKwYBBAHaRw8BAQdAOLT5wkH/Pmy0uN4sOa0cLm12gkDS4IaP7DgW
462/P2+0MkxhdsOtbmlhICJYZW5pYSIgUm9kcmlndcOqcyA8bGF2aW5pYUBrZXJu
ZWwzMi54eXo+iJMEExYKADsWIQSEkf3qe2QqTUjxnbcR/bgD/N0h5AUCZ1T+twIb
AwULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIXgAAKCRAR/bgD/N0h5GUIAP0dfCKQ
WWMwYqsL64giz4zw48shZmOcq6B4whIO0PnaGAD+JdyyE/mJMPPhtwCf8s2oCqtj
7eXb775dSvMRqC3Pjgu4OARnVP63EgorBgEEAZdVAQUBAQdAPFPbqszaQLHqBfao
CxGUXJANQLItV7/UxhtZV/dV/FIDAQgHiHgEGBYKACAWIQSEkf3qe2QqTUjxnbcR
/bgD/N0h5AUCZ1T+twIbDAAKCRAR/bgD/N0h5IccAP45uCBZqpPBpqRJZQ++Cn06
Tho9riwvfMpxHHdBL7OHNAD/WH3TG1LBCWqjgzR9SsT7ytT5o8cG9f7zpGzxJEdk
/wE=
=tHvr
-----END PGP PUBLIC KEY BLOCK-----
```

## FAQ

### P: Você tem CNPJ e pode emitir nota fiscal?
R: Sim, tenho CNPJ (51.616.292/0001-22), e sim, posso emitir nota fiscal.

### P: Como garantimos a segurança da comunicação inicial?
R: Primeiro contato pode ser feito via Signal ou e-mail criptografado com PGP.

### P: Aceita pagamento em cripto?
R: Sim, aceito BTC, ETH e XMR.

### P: Como receberei os feedbacks?
R: Feedbacks diarios ou semanais via canal seguro escolhido, com relatórios detalhados de progresso.

### P: Trabalha com análise de malwares ativos?
R: Sim, em ambiente controlado e isolado.

### P: Fornece suporte após entrega?
R: Sim, 30 dias de suporte para esclarecimentos.

### P: Como é feita a precificação exata?
R: Baseada na complexidade técnica, urgência e escopo do projeto.
