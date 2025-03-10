---
title: "Ferestre"
sidebar_position: 2
---

![Versiune stabilă de lansare](https://img.shields.io/badge/dynamic/yaml?color=c4840d&label=Stable&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2FLinwoodDev%2Fbutterfly%2Fstable%2Fapp%2Fpubspec.yaml&style=for-the-badge) ![Versiune lansare nocturnă](https://img.shields.io/badge/dynamic/yaml?color=f7d28c&label=Nightly&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2FLinwoodDev%2Fbutterfly%2Fnightly%2Fapp%2Fpubspec.yaml&style=for-the-badge)

## Cerințe minime de sistem

* Windows 10 sau mai mult.

## Binare

<div className="row margin-bottom--lg padding--sm">
<div className="dropdown dropdown--hoverable margin--sm">
  <button className="button button--outline button--info button--lg">Stabil</button>
  <ul className="dropdown__menu">
    <li>
      <DownloadButton after="/downloads/post-windows" className="dropdown__link" href="https://github.com/LinwoodDev/butterfly/releases/download/stable/linwood-butterfly-windows-setup.exe">
        Configurare
      </DownloadButton>
    </li>
    <li>
      <DownloadButton after="/downloads/post-windows" className="dropdown__link" href="https://github.com/LinwoodDev/butterfly/releases/download/stable/linwood-butterfly-windows.zip">
        Portabil
      </DownloadButton>
    </li>
  </ul>
</div>
<div className="dropdown dropdown--hoverable margin--sm">
  <button className="button button--outline button--danger button--lg">Noptez</button>
  <ul className="dropdown__menu">
    <li>
      <DownloadButton after="/downloads/post-windows" className="dropdown__link" href="https://github.com/LinwoodDev/butterfly/releases/download/nightly/linwood-butterfly-windows-setup.exe">
        Configurare
      </DownloadButton>
    </li>
    <li>
      <DownloadButton after="/downloads/post-windows" className="dropdown__link" href="https://github.com/LinwoodDev/butterfly/releases/download/nightly/linwood-butterfly-windows.zip">
        Portabil
      </DownloadButton>
    </li>
  </ul>
</div>
</div>

Citește mai multe despre versiunea nocturnă a Butterfly [aici](/nightly).

## Instalează folosind winget

```powershell
winget install LinwoodCloud.Butterfly
```

Pentru a upgrada pachetul winget, executați:

```powershell
winget upgrade LinwoodCloud.Butterfly
```

Pentru a dezinstala pachetul winget, executați:

```powershell
winget uninstall LinwoodCloud.Butterfly
```

### Versiunea nocturnă

```powershell
winget install LinwoodCloud.Butterfly.Nightly
```

Pentru a upgrada pachetul winget, executați:

```powershell
winget upgrade LinwoodCloud.Butterfly.Nightly
```

Pentru a dezinstala pachetul winget, executați:

```powershell
winget uninstall LinwoodCloud.Butterfly.Nightly
```
