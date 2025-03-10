---
title: "Janelas"
sidebar_position: 2
---

![Versão de lançamento estável](https://img.shields.io/badge/dynamic/yaml?color=c4840d&label=Stable&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2FLinwoodDev%2Fbutterfly%2Fstable%2Fapp%2Fpubspec.yaml&style=for-the-badge) ![Versão de lançamento noturna](https://img.shields.io/badge/dynamic/yaml?color=f7d28c&label=Nightly&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2FLinwoodDev%2Fbutterfly%2Fnightly%2Fapp%2Fpubspec.yaml&style=for-the-badge)

## Requisitos mínimos do sistema

* Windows 10 ou superior.

## Binários

<div className="row margin-bottom--lg padding--sm">
<div className="dropdown dropdown--hoverable margin--sm">
  <button className="button button--outline button--info button--lg">Estável</button>
  <ul className="dropdown__menu">
    <li>
      <DownloadButton after="/downloads/post-windows" className="dropdown__link" href="https://github.com/LinwoodDev/butterfly/releases/download/stable/linwood-butterfly-windows-setup.exe">
        Configuração
      </DownloadButton>
    </li>
    <li>
      <DownloadButton after="/downloads/post-windows" className="dropdown__link" href="https://github.com/LinwoodDev/butterfly/releases/download/stable/linwood-butterfly-windows.zip">
        Portátil
      </DownloadButton>
    </li>
  </ul>
</div>
<div className="dropdown dropdown--hoverable margin--sm">
  <button className="button button--outline button--danger button--lg">Noturno</button>
  <ul className="dropdown__menu">
    <li>
      <DownloadButton after="/downloads/post-windows" className="dropdown__link" href="https://github.com/LinwoodDev/butterfly/releases/download/nightly/linwood-butterfly-windows-setup.exe">
        Configuração
      </DownloadButton>
    </li>
    <li>
      <DownloadButton after="/downloads/post-windows" className="dropdown__link" href="https://github.com/LinwoodDev/butterfly/releases/download/nightly/linwood-butterfly-windows.zip">
        Portátil
      </DownloadButton>
    </li>
  </ul>
</div>
</div>

Leia mais sobre a versão noturna da Borboleta [aqui](/nightly).

## Instalar usando o winget

```powershell
winget install LinwoodCloud.Butterfly
```

Para atualizar o pacote da parede, execute:

```powershell
winget upgrade LinwoodCloud.Butterfly
```

Para desinstalar o pacote da winget, execute:

```powershell
winget uninstall LinwoodCloud.Butterfly
```

### Versão noturna

```powershell
winget install LinwoodCloud.Butterfly.Nightly
```

Para atualizar o pacote da parede, execute:

```powershell
winget upgrade LinwoodCloud.Butterfly.Nightly
```

Para desinstalar o pacote da winget, execute:

```powershell
winget uninstall LinwoodCloud.Butterfly.Nightly
```
