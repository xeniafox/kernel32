+++
title = 'Tentativas de jogar MELTY BLOOD via GSocket'
date = 2024-05-30
draft = false
+++

Tentei jogar [MELTY BLOOD Actress Again Current Code](https://play.meltyblood.club/) com um amigo essa madrugada e, após levarmos timeouts do servidor da comunidade, começamos a experimentar com serviços de tunelamento para jogarmos em modo LAN. Nada funcionou por ora e ele foi dormir. Continuei acordada e, bom, acho que encontrei uma possível solução.

<!--more-->
---

## As primeiras tentativas

A primeira coisa que veio em mente foi tentar encaminhar a porta do servidor LAN do jogo via [SSH-J](http://ssh-j.com).

```bash
(eu) $ ssh necoarcgames@ssh-j.com -N -R meltybloodactressagain:4444:localhost:4444
(ele) $ ssh -L 4444:localhost:4444 necoarcgames@ssh-j.com meltybloodactressagain
```

Foi então que descobrimos que SSH-J não permite port forwarding... Haha

A segunda coisa que pensamos foi [ngrok](https://ngrok.com/), mas ai notamos que o networking do jogo é via UDP, que o ngrok não suporta.

Foi ai que finalmente tivemos um estalo... "*Porra, vamo usar GSocket!*"

## Rede de Sockets Globais (GSocket)

[Global Socket](https://gsocket.io) (GSocket) é um conjunto de ferramentas, cortesia da [The Hacker's Choice](https://github.com/hackerschoice), que permitem dois ou mais usuários se conectarem mesmo atrás de firewalls e CGNATs, desde que eles compartilhem de um mesmo **segredo**.

Este "segredo" atua como uma senha ou palavra-passe e deve ser tão sigiloso quanto uma.

GSocket pareceu a solução perfeita para o nosso problema por suportar UDP, permitir tanto port forwarding quanto um de nós agir como um servidor SOCKS4, não exigir um cadastro, além de ser simples, prático e fácil de usar.

Foi o que pensavamos...

## Um buraco na minha alma

Tentamos encaminhar a porta do jogo via GSocket...

**Eu**:

```bash
(tty1) $ gs-netcat -s segredo -l -d 127.0.0.1 -p4444 -u
(tty2) $ wine64 ./cccaster.v3.1.exe 4444 # launcher do jogo
```

**Ele**:

```bash
(tty1) $ gs-netcat -s segredo -p 4444
(tty2) $ wine64 ./cccaster.v3.1.exe 127.0.0.1 4444
```

Esperamos e... Timeout!?

Neste momento ficamos atonitos, nos perguntando como isso era possível. Fizemos alguns testes só pra ter certeza que não ficamos insanos:

```bash
(eu) $ nc -lunvvp 4444
Bound on 0.0.0.0 4444
Connection received on gsocket 51190
AAAA^C

(ele) $ echo "AAAA" | nc -u 127.0.0.1 4444
```

Estranho... O tunel UDP está funcionando normalmente, mas o jogo não conecta...

Tentamos de tudo depois disso, até desistimos temporariamente do GSocket e tentamos até mesmo conectar um no outro via IPv6 (mas o jogo não faz resolução de IPv6 KKKKKKK).

Foi ai que tivemos outra hipefania.

## O jogo usa TCP também

Quando ele tenta conectar seu cliente do jogo em meu servidor LAN, há duas mensagens de conexão, indicando dois diferentes estágios de networking: "Conectando no servidor..." e "Estabelescendo tunel UDP..."

Foi percebendo isso que tivemos a hipótese de que o jogo primeiro tenta passar informações (metadados, cabeçalho do protocolo ou algo que o valha) primeiro via TCP, antes de estabelescer uma conexão UDP, onde os dados da partida em si trafegam.

GSocket não permite encaminhar uma porta para TCP e UDP ao mesmo tempo (isso nem faz sentido), mas há uma solução --- WireGuard!

## WireGuard-via-GSocket

WireGuard é um software e protocolo de VPN aberto, implementado, inclusive, diretamente no kernel Linux. WireGuard roda encima de UDP, mas é capaz de enviar pacotes TCP encima de seu tunel UDP, além de ser suportado oficialmente pelo GSocket. Bastante conveniente, não?

Bom, neste ponto ele foi dormir, e continuei tentando com ajuda de outro amigo.

Peguei uma configuração de servidor e cliente WireGuard direto do [repositório de exemplos do GSocket](https://github.com/hackerschoice/gsocket/tree/master/examples/wireguard) para não perder tempo, subi o servidor com

```bash
$ sudo wg-quick up ./wg0-server.conf
$ wine64 ./cccaster.v3.1.exe 4444
```

e ele subiu seu cliente com

```bash
$ sudo wg-quick up ./wg0-client.conf
$ wine64 ./cccaster.v3.1.exe 10.37.0.1 4444
```

Esperamos um pouquinho e... funcionou! EUREKA!

## Enfim...

Acabou que não jogamos ainda porque o primeiro amigo foi dormir e o segundo tá ocupado, haha, mas foi divertido fazer esses experimentos todos e chegar finalmente em uma solução satisfatória.

Valeu a pena.
