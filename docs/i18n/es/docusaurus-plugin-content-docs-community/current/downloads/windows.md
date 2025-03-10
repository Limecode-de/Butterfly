---
title: "Ventanas"
sidebar_position: 2
---

![Versión estable](https://img.shields.io/badge/dynamic/yaml?color=c4840d&label=Stable&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2FLinwoodDev%2Fbutterfly%2Fstable%2Fapp%2Fpubspec.yaml&style=for-the-badge) ![Versión de lanzamiento nocturno](https://img.shields.io/badge/dynamic/yaml?color=f7d28c&label=Nightly&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2FLinwoodDev%2Fbutterfly%2Fnightly%2Fapp%2Fpubspec.yaml&style=for-the-badge)

## Requisitos mínimos del sistema

* Windows 10 o superior.

## Binarios

<div className="row margin-bottom--lg padding--sm">
<div className="dropdown dropdown--hoverable margin--sm">
  <button className="button button--outline button--info button--lg">Estable</button>
  <ul className="dropdown__menu">
    <li>
      <DownloadButton after="/downloads/post-windows" className="dropdown__link" href="https://github.com/LinwoodDev/butterfly/releases/download/stable/linwood-butterfly-windows-setup.exe">
        Configurar
      </DownloadButton>
    </li>
    <li>
      <DownloadButton after="/downloads/post-windows" className="dropdown__link" href="https://github.com/LinwoodDev/butterfly/releases/download/stable/linwood-butterfly-windows.zip">
        Portable
      </DownloadButton>
    </li>
  </ul>
</div>
<div className="dropdown dropdown--hoverable margin--sm">
  <button className="button button--outline button--danger button--lg">Noche</button>
  <ul className="dropdown__menu">
    <li>
      <DownloadButton after="/downloads/post-windows" className="dropdown__link" href="https://github.com/LinwoodDev/butterfly/releases/download/nightly/linwood-butterfly-windows-setup.exe">
        Configurar
      </DownloadButton>
    </li>
    <li>
      <DownloadButton after="/downloads/post-windows" className="dropdown__link" href="https://github.com/LinwoodDev/butterfly/releases/download/nightly/linwood-butterfly-windows.zip">
        Portable
      </DownloadButton>
    </li>
  </ul>
</div>
</div>

Lea más sobre la versión nocturna de la mariposa [aquí](/nightly).

## Instalar usando winget

```powershell
winget install LinwoodCloud.Butterfly
```

Para actualizar el paquete winget, ejecute:

```powershell
winget upgrade LinwoodCloud.Butterfly
```

Para desinstalar el paquete winget, ejecute:

```powershell
winget uninstall LinwoodCloud.Butterfly
```

### Versión nocturna

```powershell
winget install LinwoodCloud.Butterfly.Nightly
```

Para actualizar el paquete winget, ejecute:

```powershell
winget upgrade LinwoodCloud.Butterfly.Nightly
```

Para desinstalar el paquete winget, ejecute:

```powershell
winget uninstall LinwoodCloud.Butterfly.Nightly
```
