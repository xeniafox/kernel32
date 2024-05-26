+++
title = 'Como gravar uma ISO do VMware ESXi em um pendrive'
date = 2024-03-05T02:09:35-03:00
draft = false
+++

Depois de resolver voltar com [*homelabbing*](https://www.reddit.com/r/homelab/comments/8q1sz7/what_is_a_homelab_and_what_does_it_do/) como um hobby, pensei em experimentar com um hypervisor diferente do que normalmente uso (KVM / Proxmox). Minha escolha foi o VMware ESXi 6.0.

O motivo de ser o 6.0 é simples --- é uma das ultimas versões que têm drivers para a placa de rede do meu home server, uma Realtek. Mas logo me deparei com um problema --- a ISO do instalador não apresenta uma tabela de partições, o quê me impede de gravá-la em um pendrive e dar boot.

```bash
$ fdisk -l ./vmware-esxi-6.0.iso
Disk ./vmware-esxi-6.0.iso: 360.56 MiB, 378071040 bytes, 738420 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
```

Bom, fui capaz de achar uma solução. Escrevo isto aqui mais como uma nota para eu mesma no futuro, do que um tutorial propriamente dito.

Enfim, vamos ao que interessa.
<!--more-->
---

## A solução

### Requisitos

Você vai precisar de

- [SYSLINUX](https://en.wikipedia.org/wiki/SYSLINUX);
- alguma ferramenta para gerenciar partições (eu gosto do `cfdisk`);
- `sgdisk` ou alguma outra ferramenta que te permita configurar atributos à partições;
- e uma ISO do VMware ESXi (obviamente).

### Passo-a-passo

1. Formate seu pendrive

O dispositivo de bloco do meu pendrive agora é `/dev/sdc`, vou usá-lo como um exemplo.

Você só precisa de uma única partição, usando todo o espaço do pendrive. Recomendo que use esquema GPT. Também deve funcionar com MBR, mas você vai precisar trocar o arquivo do *boot code* na etapa 2 de `gptmbr.bin` para `mbr.bin`.

Depois de particionar, crie o sistema de arquivos FAT32 na partição recém-criada (no meu caso, `/dev/sdc1`) e dê a ela o atributo de "Legacy BIOS bootable".

```bash
$ sudo mkfs.vfat -F32 /dev/sdc1
$ sudo sgdisk /dev/sdc --attributes=1:set:2
```

2. Instale o SYSLINUX no pendrive

Você pode fazer isto com o comando

```bash
$ sudo syslinux /dev/sdc1
$ sudo dd bs=440 count=1 conv=notrunc if=/usr/lib/syslinux/bios/gptmbr.bin of=/dev/sdc
```

onde `/dev/sdc` é o dispositivo de bloco do seu pendrive, e `/dev/sdc1` a partição.

3. Monte o pendrive e a ISO

```bash
$ sudo mkdir -v /mnt/{usb,iso}
$ sudo mount -v -o rw,uid=1000 /dev/sdc1 /mnt/usb               # montando o pendrive
$ sudo mkdir -v -o ro,loop ./vmware-esxi-6.0.iso /mnt/iso       # montando a ISO
```

Substitua `1000` pelo UID do seu usuário. Você pode checar isso com o comando `id`.

4. Copie o conteúdo da ISO para o pendrive

```bash
$ cp -vr /mnt/iso/* /mnt/usb
```

5. Desmonte tudo e ejete o pendrive

```bash
$ sync
$ sudo umount -v /mnt/{iso,usb}
$ sudo eject /dev/sdc
```

6. *Boot*e o servidor no pendrive, instale o ESXi, e seja feliz! :)
