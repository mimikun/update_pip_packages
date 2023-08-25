function Invoke-PueueUpdateCargoPackage() {
    $outdated_pkgs = pip freeze | ForEach-Object { $_ -replace "=.*", "" }
    foreach ($i in $outdated_pkgs) {
        pueue add -- "pip install --upgrade $i"
    }
}
